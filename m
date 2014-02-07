From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Feb 2014 08:30:47 +0000 (UTC)
Subject: [Buildroot] [Bug 6842] Checking external toolchain for eabihf
In-Reply-To: <bug-6842-163@https.bugs.busybox.net/>
References: <bug-6842-163@https.bugs.busybox.net/>
Message-ID: <20140207083048.4FF599C8AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6842

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-07 08:30:47 UTC ---
Thomas Petazzoni, could you shine your light on this patch?
Copy/pasted here for convenience:

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index faa9d90..c41d757 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -284,8 +284,8 @@ check_arm_abi = \
         echo "External toolchain uses the unsuported OABI" ; \
         exit 1 ; \
     fi ; \
-    EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
-    if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q
"Tag_ABI_VFP_args:" ; then \
+    EXT_TOOLCHAIN_LIBM=`LANG=C $${__CROSS_CC} -print-file-name=libm.so` ; \
+    if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_LIBM} | grep -q
"Tag_ABI_VFP_args:" ; then \
         EXT_TOOLCHAIN_ABI="eabihf" ; \
     else \
         EXT_TOOLCHAIN_ABI="eabi" ; \

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
