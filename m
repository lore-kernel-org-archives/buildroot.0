Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889D2E7070A
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41B2783C4E;
	Thu, 21 Sep 2023 10:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41B2783C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vM-PQcWqiQRP; Thu, 21 Sep 2023 10:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F78083C3C;
	Thu, 21 Sep 2023 10:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F78083C3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 413D61BF990
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B90A60BAD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B90A60BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJMiK546nkbR for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5648760BA9
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5648760BA9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 407DC87423; Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 12:30:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f71c7940210420e156530e0993756f9c41e66f4a
X-Git-Newrev: 43dbfe4670c3283ea1b2f9a884a09ea6f8f9dcb9
X-Patchwork-Hint: ignore
Message-Id: <20230921103102.407DC87423@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: drop CVE-2022-45061 from
 IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43dbfe4670c3283ea1b2f9a884a09ea6f8f9dcb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2022-45061 affects python <= 3.7.15, 3.8.0 through 3.8.15,
3.9.0 through 3.9.15, 3.10.0 through 3.10.8
The mentioned patch was removed in c38de813 when bumping to 3.11.1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
