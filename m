Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B6DCE7A95
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEC2611F0;
	Mon, 25 Sep 2023 12:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEC2611F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWOPpmaMOiRL; Mon, 25 Sep 2023 12:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF7D611F5;
	Mon, 25 Sep 2023 12:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF7D611F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 129561BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECBF340864
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECBF340864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbxWXlbLr0TU for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7187F41910
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7187F41910
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FA7A87771; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:58:37 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: f93719851202e26853da59076690439996185d08
X-Git-Newrev: f461cbde021c156c695baa24b7de0c967c2e2ea7
X-Patchwork-Hint: ignore
Message-Id: <20230925120415.5FA7A87771@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/python3: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=f461cbde021c156c695baa24b7de0c967c2e2ea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
