From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 12 Jun 2019 16:39:32 -0700
Subject: [Buildroot] [PATCH 0/2] lmbench patches
Message-ID: <20190612233934.14805-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We recently stumbled upon two lmbench issues, one being discovered
while investigating the other.

- lmbench's scripts/build script is declared as /bin/sh script, but
  uses bash only syntax which can lead to errors

- lmbench's install routine doesn't install the lmbench script itself

Here are two patches to address both issues.

Markus Mayer (2):
  lmbench: mark scripts/build as bash script
  lmbench: install the lmbench script on the target

 package/lmbench/0001-build_use_bash.patch  |  8 ++++++++
 package/lmbench/0002-install_lmbench.patch | 11 +++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/lmbench/0001-build_use_bash.patch
 create mode 100644 package/lmbench/0002-install_lmbench.patch

-- 
2.17.1
