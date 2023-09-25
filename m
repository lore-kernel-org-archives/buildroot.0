Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06795CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F5160F1D;
	Mon, 25 Sep 2023 12:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F5160F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSMihVM95LUm; Mon, 25 Sep 2023 12:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A1561018;
	Mon, 25 Sep 2023 12:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11A1561018
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE77B1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A764681FF7
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A764681FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MkVfSG8gDKc for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C897B81FCF
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C897B81FCF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B323187748; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:58:46 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 226616fec125ada6d54e5dc7ef88ceeba3c20cc7
X-Git-Newrev: 54496cbcdc3cc58af2626c1682789ec55227063f
X-Patchwork-Hint: ignore
Message-Id: <20230925120252.B323187748@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/python3: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=54496cbcdc3cc58af2626c1682789ec55227063f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
