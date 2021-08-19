Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A3CC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C438E6108E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C438E6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969BD613D4;
	Thu, 19 Aug 2021 20:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGTeZehq_Cex; Thu, 19 Aug 2021 20:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06ED5613D7;
	Thu, 19 Aug 2021 20:48:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0B111BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E046F42513
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaR_g04OmVLz for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:48:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1814404AB
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:48:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B0DD68D5B8; Thu, 19 Aug 2021 20:47:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:47:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8831c0db9e81db6f53e44597b7b4e74bff43d0cf
X-Git-Newrev: 75b02d6f3d2ce2478ffd41a856b24dde353583b5
X-Patchwork-Hint: ignore
Message-Id: <20210819204716.B0DD68D5B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: fix time_t build
 failure on 32-bit platforms
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=75b02d6f3d2ce2478ffd41a856b24dde353583b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream pending patch[1] to fix time_t on 32-bit platform.

[1]: https://github.com/vmware/open-vm-tools/pull/387

Fixes:
http://autobuild.buildroot.net/results/eb3dfe679536b578a0f16762312a96ada7162095/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nvertFromNtTimeNsec-aware-of-64-bit-time_.patch | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
new file mode 100644
index 0000000000..dbe2c29a2b
--- /dev/null
+++ b/package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
@@ -0,0 +1,80 @@
+From 3f0580f2546de8be7acf1bc78a55a257bc638ebe Mon Sep 17 00:00:00 2001
+From: Bartosz Brachaczek <b.brachaczek@gmail.com>
+Date: Tue, 12 Nov 2019 14:31:08 +0100
+Subject: [PATCH] Make HgfsConvertFromNtTimeNsec aware of 64-bit time_t on i386
+
+I verified that this function behaves as expected on x86_64, i386 with
+32-bit time_t, and i386 with 64-bit time_t for the following values of
+ntTtime:
+
+UNIX_EPOCH-1, UNIX_EPOCH, UNIX_EPOCH+1, UNIX_S32_MAX-1, UNIX_S32_MAX,
+UNIX_S32_MAX+1, UNIX_S32_MAX*2+1
+
+I did not verify whether the use of Div643264 is optimal, performance
+wise.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ lib/hgfs/hgfsUtil.c | 34 +++++++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
+
+diff --git a/lib/hgfs/hgfsUtil.c b/lib/hgfs/hgfsUtil.c
+index cc580ab8..49b10040 100644
+--- a/lib/hgfs/hgfsUtil.c
++++ b/lib/hgfs/hgfsUtil.c
+@@ -110,23 +110,21 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
+ 			  uint64 ntTime) // IN: Time in Windows NT format
+ {
+ #ifdef __i386__
+-   uint32 sec;
+-   uint32 nsec;
++   uint64 sec64;
++   uint32 sec32, nsec;
++#endif
+ 
+    ASSERT(unixTime);
+-   /* We assume that time_t is 32bit */
+-   ASSERT_ON_COMPILE(sizeof (unixTime->tv_sec) == 4);
+ 
+-   /* Cap NT time values that are outside of Unix time's range */
++   if (sizeof (unixTime->tv_sec) == 4) {
++      /* Cap NT time values that are outside of Unix time's range */
+ 
+-   if (ntTime >= UNIX_S32_MAX) {
+-      unixTime->tv_sec = 0x7FFFFFFF;
+-      unixTime->tv_nsec = 0;
+-      return 1;
++      if (ntTime >= UNIX_S32_MAX) {
++         unixTime->tv_sec = 0x7FFFFFFF;
++         unixTime->tv_nsec = 0;
++         return 1;
++      }
+    }
+-#else
+-   ASSERT(unixTime);
+-#endif
+ 
+    if (ntTime < UNIX_EPOCH) {
+       unixTime->tv_sec = 0;
+@@ -135,9 +133,15 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
+    }
+ 
+ #ifdef __i386__
+-   Div643232(ntTime - UNIX_EPOCH, 10000000, &sec, &nsec);
+-   unixTime->tv_sec = sec;
+-   unixTime->tv_nsec = nsec * 100;
++   if (sizeof (unixTime->tv_sec) == 4) {
++      Div643232(ntTime - UNIX_EPOCH, 10000000, &sec32, &nsec);
++      unixTime->tv_sec = sec32;
++      unixTime->tv_nsec = nsec * 100;
++   } else {
++      Div643264(ntTime - UNIX_EPOCH, 10000000, &sec64, &nsec);
++      unixTime->tv_sec = sec64;
++      unixTime->tv_nsec = nsec * 100;
++   }
+ #else
+    unixTime->tv_sec = (ntTime - UNIX_EPOCH) / 10000000;
+    unixTime->tv_nsec = ((ntTime - UNIX_EPOCH) % 10000000) * 100;
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
