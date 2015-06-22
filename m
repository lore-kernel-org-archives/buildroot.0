From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 00:23:47 +0200
Subject: [Buildroot] [PATCH 5/6] gdb: bump 7.9 series to 7.9.1
In-Reply-To: <1434292411-5003-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Jun 2015 16:33:30 +0200")
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87pp4n7570.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Note that both gdb 7.9 and 7.9.1 fail to build in a chroot without
 > texinfo, due to the infamous makeinfo issue. This should be fixed
 > separately.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/gdb/{7.9 => 7.9.1}/0001-gdbserver-fix-uClibc-whithout-MMU.patch | 0
 >  .../{7.9 => 7.9.1}/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch | 0
 >  .../0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch            | 0
 >  package/gdb/Config.in.host                                              | 2 +-
 >  package/gdb/gdb.hash                                                    | 2 +-
 >  5 files changed, 2 insertions(+), 2 deletions(-)
 >  rename package/gdb/{7.9 => 7.9.1}/0001-gdbserver-fix-uClibc-whithout-MMU.patch (100%)
 >  rename package/gdb/{7.9 => 7.9.1}/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch (100%)
 >  rename package/gdb/{7.9 => 7.9.1}/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch (100%)

 > diff --git a/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch
 > similarity index 100%
 > rename from package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch
 > rename to package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch
 > diff --git a/package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch b/package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 > similarity index 100%
 > rename from package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 > rename to package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 > diff --git a/package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch b/package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
 > similarity index 100%
 > rename from package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
 > rename to package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
 > diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
 > index 6b0ca9b..b0046b5 100644
 > --- a/package/gdb/Config.in.host
 > +++ b/package/gdb/Config.in.host
 > @@ -53,4 +53,4 @@ config BR2_GDB_VERSION
 >  	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 >  	default "7.7.1"    if BR2_GDB_VERSION_7_7
 >  	default "7.8.2"	   if BR2_GDB_VERSION_7_8 || !BR2_PACKAGE_HOST_GDB
 > -	default "7.9"      if BR2_GDB_VERSION_7_9
 > +	default "7.9.1"      if BR2_GDB_VERSION_7_9

Committed with the white space trimmed so this aligns up with the other
lines.

-- 
Bye, Peter Korsgaard
