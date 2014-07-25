From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 25 Jul 2014 18:38:36 +0200
Subject: [Buildroot] [PATCH v2 0/3] apply-patches.sh: be quiet when "make
	-s" is used
Message-ID: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To reduce further the noise when "make -s" is used silence the
"apply-patches.sh" script.

v2:
 - move the second patch as first to easy up merging
 - split the first patch in two (Yann)
 - add BR_SILENT variable (Yann)

Fabio Porcedda (3):
  package/Makefile.in: fix coding style regarding the '=' sign
  apply-patches.sh: Use the "APPLY_PATCHES" variable to call the script
  apply-patches.sh: don't print anything when "make -s" is used

 Makefile                              |   2 +
 boot/at91bootstrap/at91bootstrap.mk   |   2 +-
 boot/at91bootstrap3/at91bootstrap3.mk |   2 +-
 boot/barebox/barebox.mk               |   2 +-
 boot/uboot/uboot.mk                   |   2 +-
 linux/linux-ext-rtai.mk               |   4 +-
 linux/linux.mk                        |   6 +-
 package/Makefile.in                   | 150 +++++++++++++++++-----------------
 package/cvs/cvs.mk                    |   2 +-
 package/gcc/gcc.mk                    |   4 +-
 package/input-tools/input-tools.mk    |   2 +-
 package/mii-diag/mii-diag.mk          |   2 +-
 package/pkg-autotools.mk              |  12 +--
 package/pkg-generic.mk                |   6 +-
 package/setserial/setserial.mk        |   2 +-
 package/sysklogd/sysklogd.mk          |   2 +-
 package/sysvinit/sysvinit.mk          |   2 +-
 package/thttpd/thttpd.mk              |   2 +-
 support/scripts/apply-patches.sh      |  17 +++-
 19 files changed, 119 insertions(+), 104 deletions(-)

-- 
2.0.2
