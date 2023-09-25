Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45319CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D830B61221;
	Mon, 25 Sep 2023 12:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D830B61221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cF4Etjvm9r6D; Mon, 25 Sep 2023 12:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD5161203;
	Mon, 25 Sep 2023 12:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD5161203
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E239F1BF947
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABB5B4157F
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB5B4157F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-I2tQoCUPY7 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:04:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9B55415A4
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B55415A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7630987771; Mon, 25 Sep 2023 12:04:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:58:51 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2a385a7625c070040594aed098720319b9a15c75
X-Git-Newrev: d2ed3df411c653778bf7aedbfd35fbaa09340f2d
X-Patchwork-Hint: ignore
Message-Id: <20230925120414.7630987771@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python3: drop
 CVE-2022-45061 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2ed3df411c653778bf7aedbfd35fbaa09340f2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

CVE-2022-45061 affects python <= 3.7.15, 3.8.0 through 3.8.15,
3.9.0 through 3.9.15, 3.10.0 through 3.10.8
The mentioned patch was removed in c38de813 when bumping to 3.11.1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 43dbfe4670c3283ea1b2f9a884a09ea6f8f9dcb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5f8fa5b58d..cfe5e1ee6e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,9 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
-PYTHON3_IGNORE_CVES += CVE-2022-45061
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
