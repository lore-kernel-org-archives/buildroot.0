Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FE2EDE99C
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E456961242;
	Thu, 14 Sep 2023 09:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E456961242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdqELvgTAGIl; Thu, 14 Sep 2023 09:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BCDB60F8E;
	Thu, 14 Sep 2023 09:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCDB60F8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5A81BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49F6B60D72
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49F6B60D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Di3W-Vt_3dvM for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F268261229
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F268261229
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF26A86F2A; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:49:36 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: efca66f637649bb1c9cc584123571fe786505a30
X-Git-Newrev: 6540e3d1cc203a6425925444a837ddc654ab95ef
X-Patchwork-Hint: ignore
Message-Id: <20230914095229.EF26A86F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pixman: ignore
 CVE-2023-37769
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6540e3d1cc203a6425925444a837ddc654ab95ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 19921699b3aaed330343e65418ddca6833bb3cd1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 6e6d787d27..37eb974c46 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -24,6 +24,13 @@ PIXMAN_CONF_OPTS = \
 	--disable-loongson-mmi \
 	--disable-arm-iwmmxt
 
+# Affects only tests, and we don't build tests (see
+# 0001-Disable-tests.patch). See
+# https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
+# "not sure why NVD keeps assigning CVEs like this. This is just a
+# test executable".
+PIXMAN_IGNORE_CVES += CVE-2023-37769
+
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
 # the HW doesn't support it. The only case where the ARM SIMD code
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
