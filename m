Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27835C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7F561051
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD7F561051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7B3381D3A;
	Mon,  6 Sep 2021 14:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RsDY9QOJy8Q0; Mon,  6 Sep 2021 14:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BE481D0C;
	Mon,  6 Sep 2021 14:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5766F1BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B0D401FC
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2PyKLNRXekY for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07CAE4022F
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:50:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 78A35886B4; Mon,  6 Sep 2021 14:49:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 15:23:22 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: ade32dc250eb86b42186e2fd11b8e4ccc25d47ce
X-Git-Newrev: 4dea3daafae14969b9d5ed00983eee086b626988
X-Patchwork-Hint: ignore
Message-Id: <20210906144908.78A35886B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/openvmtools: fix
 time_t build failure on 32-bit platforms
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4dea3daafae14969b9d5ed00983eee086b626988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Add upstream pending patch[1] to fix time_t on 32-bit platform.

[1]: https://github.com/vmware/open-vm-tools/pull/387

Fixes:
http://autobuild.buildroot.net/results/eb3dfe679536b578a0f16762312a96ada7162095/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75b02d6f3d2ce2478ffd41a856b24dde353583b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
