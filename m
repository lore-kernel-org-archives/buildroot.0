From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 22 Oct 2014 18:20:09 +0200
Subject: [Buildroot] [PATCH 0/2] apply-patches.sh: be quiet when "make -s"
	is used
Message-ID: <1413994811-19452-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To reduce further the noise when "make -s" is used, silence the
"apply-patches.sh" script.

v7:
 - rebased
 - add review tag by Yann
 - apply also to the recently added package "netcat-openbsd"
v6:
 - fix code that detect the use of the "-s" flag to be able to detect:
   -s --warn-undefined-variables -i
   the previous version was not able to detect correctly the use of multiple
   short flags.
v5:
 - add review tag on the first patch
 - use filter function instead of substring function on the second patch
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

 Makefile                                 |  2 ++
 boot/at91bootstrap/at91bootstrap.mk      |  2 +-
 boot/at91bootstrap3/at91bootstrap3.mk    |  2 +-
 boot/barebox/barebox.mk                  |  2 +-
 boot/uboot/uboot.mk                      |  2 +-
 linux/linux-ext-rtai.mk                  |  4 ++--
 linux/linux.mk                           |  6 +++---
 package/Makefile.in                      |  2 ++
 package/cvs/cvs.mk                       |  2 +-
 package/gcc/gcc.mk                       |  4 ++--
 package/input-tools/input-tools.mk       |  2 +-
 package/mii-diag/mii-diag.mk             |  2 +-
 package/netcat-openbsd/netcat-openbsd.mk |  2 +-
 package/pkg-autotools.mk                 | 12 ++++++------
 package/pkg-generic.mk                   |  6 +++---
 package/setserial/setserial.mk           |  2 +-
 package/sysvinit/sysvinit.mk             |  2 +-
 package/thttpd/thttpd.mk                 |  2 +-
 support/scripts/apply-patches.sh         | 17 ++++++++++++++---
 19 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.1.1
