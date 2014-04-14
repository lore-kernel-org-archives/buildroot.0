From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Apr 2014 23:05:47 +0200
Subject: [Buildroot] [PATCH 0/5] Python fixes
Message-ID: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Since the host-python2 series [1] got merged, a couple of build failure have
been triggered implying host-python interpreter (I'm too lazy to list the fixes
already merged, check the git log ;-]).

So, to avoid wanting for the autobuilder turning red, here is a series cleaning
and checking most of the packages (all, I hope) depending on host-python wrt:
- for what python is used;
- if python2/python3 can be indifferently used;
- misc. build issues.

Note that the patch [2] (not yet merged) also fixes a similar build failure.

Regards,

Samuel

[1] http://lists.busybox.net/pipermail/buildroot/2014-March/091570.html
[2] http://patchwork.ozlabs.org/patch/338685/


Samuel Martin (5):
  nodejs: use the standard configure/make options
  nodejs: force python interpreter
  omniorb: force python interperter
  host-python-pyrex: use the HOST_*_NEEDS_HOST_PYTHON infrastructure
  openpgm: make its build system python2/python3 friendly

 package/nodejs/nodejs.mk                           | 38 ++++++++++++++++----
 package/omniorb/omniorb.mk                         |  4 +++
 ...on_generator.py-make-it-python3-compliant.patch | 42 ++++++++++++++++++++++
 package/openpgm/openpgm.mk                         |  1 +
 package/python-pyrex/python-pyrex.mk               |  2 +-
 5 files changed, 80 insertions(+), 7 deletions(-)
 create mode 100644 package/openpgm/openpgm-0001-version_generator.py-make-it-python3-compliant.patch

--
1.9.2
