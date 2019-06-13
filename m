From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 13 Jun 2019 12:50:45 -0700
Subject: [Buildroot] [PATCH v2 0/2] lmbench patches
Message-ID: <20190613195047.24870-1-mmayer@broadcom.com>
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

Changes since v2:

- used GIT to generate the lmbench patch files, so they contain a
  description and a signed-off-by line
- no changes to the actual code

Markus Mayer (2):
  lmbench: mark scripts/build as bash script
  lmbench: install the lmbench script on the target

 ...-scripts-build-use-bin-bash-as-shell.patch | 28 ++++++++++++++++++
 ...e-add-lmbench-to-list-of-executables.patch | 29 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch
 create mode 100644 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch

-- 
2.17.1
