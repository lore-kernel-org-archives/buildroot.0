Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D02C6FA89
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 14:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A1A41846;
	Thu, 15 Sep 2022 14:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14A1A41846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qMAiKGbyU2k; Thu, 15 Sep 2022 14:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF74440386;
	Thu, 15 Sep 2022 14:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF74440386
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7208B1BF2FB
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AB2360FAE
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB2360FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRsmstphDXnn for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 14:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79BDF60BC7
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 14:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BDF60BC7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 67AB183C6B; Thu, 15 Sep 2022 14:02:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 12:00:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2a66954390163df510adbc8bc54e16844fbe785e
X-Git-Newrev: 5a1139a58bdeb0f9bb24a93a55d47e5a99d2550a
X-Patchwork-Hint: ignore
Message-Id: <20220915140244.67AB183C6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/python-service-identity: drop comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a1139a58bdeb0f9bb24a93a55d47e5a99d2550a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0b5710ae3b256924fe0fb5c8c9dc06fb3ac34179)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-service-identity/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index aa6d0fe715..7c513fa489 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
 	# python-pyopenssl -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	# python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
