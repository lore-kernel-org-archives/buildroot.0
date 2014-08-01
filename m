From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri,  1 Aug 2014 13:24:56 +0200
Subject: [Buildroot] [PATCH v4 0/2] apply-patches.sh: be quiet when "make
	-s" is used
Message-ID: <1406892298-9460-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@telit.com>

To reduce further the noise when "make -s" is used, silence the
"apply-patches.sh" script.

v4:
 - remove use of [[...]] construct to easy up accepting this patch set
v3:
 - Remove the already merged patch
 - Use double $$ inside hooks (Yann)
 - Add patch to use [[ ]] construct
v2:
 - move the second patch as first to easy up merging
 - split the first patch in two (Yann)
 - add BR_SILENT variable (Yann)

Fabio Porcedda (2):
  apply-patches.sh: Use the "APPLY_PATCHES" variable to call the script
  apply-patches.sh: don't print anything when "make -s" is used

 Makefile                              |  2 ++
 boot/at91bootstrap/at91bootstrap.mk   |  2 +-
 boot/at91bootstrap3/at91bootstrap3.mk |  2 +-
 boot/barebox/barebox.mk               |  2 +-
 boot/uboot/uboot.mk                   |  2 +-
 linux/linux-ext-rtai.mk               |  4 ++--
 linux/linux.mk                        |  6 +++---
 package/Makefile.in                   |  2 ++
 package/cvs/cvs.mk                    |  2 +-
 package/gcc/gcc.mk                    |  4 ++--
 package/input-tools/input-tools.mk    |  2 +-
 package/mii-diag/mii-diag.mk          |  2 +-
 package/pkg-autotools.mk              | 12 ++++++------
 package/pkg-generic.mk                |  6 +++---
 package/setserial/setserial.mk        |  2 +-
 package/sysklogd/sysklogd.mk          |  2 +-
 package/sysvinit/sysvinit.mk          |  2 +-
 package/thttpd/thttpd.mk              |  2 +-
 support/scripts/apply-patches.sh      | 17 ++++++++++++++---
 19 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.0.3
