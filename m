From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 28 Nov 2011 18:19:02 +0100
Subject: [Buildroot] PATCH 1/1 Use same format for kernel patches as used
	for custom u-boot patches
Message-ID: <277D6F26B72346398DDD3663006F3C3B@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi

It may be nice to use the same file name formatting for the kernel patches
as for custom u-boot patches.
This will allow you to have patches of different kernel versions in the same
directory.



diff -ruaN buildroot-2011.11/linux/linux.mk
buildroot-2011.11js/linux/linux.mk
--- buildroot-2011.11/linux/linux.mk	2011-11-27 11:15:49.000000000 +0100
+++ buildroot-2011.11js/linux/linux.mk	2011-11-27 14:31:38.000000000 +0100
@@ -108,7 +108,7 @@
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
 			support/scripts/apply-patches.sh $(@D) $(DL_DIR)
`basename $$p` ; \
 		elif test -d $$p ; then \
-			support/scripts/apply-patches.sh $(@D) $$p
linux-\*.patch ; \
+			support/scripts/apply-patches.sh $(@D) $$p
linux-$(LINUX_VERSION)-\*.patch ; \
 		else \
 			support/scripts/apply-patches.sh $(@D) `dirname $$p`
`basename $$p` ; \
 		fi \


Kind Regards,

Sagaert Johan
