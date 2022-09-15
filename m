Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E304C6FA89
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 14:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4CF683E1A;
	Thu, 15 Sep 2022 14:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4CF683E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peMlTqMdYvt0; Thu, 15 Sep 2022 14:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E6583E16;
	Thu, 15 Sep 2022 14:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E6583E16
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DEE01BF2FB
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDB776102A
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB776102A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyJFVvjeNFkD for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 14:01:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3012860BC7
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 14:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3012860BC7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1809283C5F; Thu, 15 Sep 2022 14:01:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 12:00:26 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 55f2627f2d4e65bda1f28a791d5d3a6064b3b8c9
X-Git-Newrev: fe5d402bd79bb7a217382061f8cdb1da7a244b8a
X-Patchwork-Hint: ignore
Message-Id: <20220915140133.1809283C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe5d402bd79bb7a217382061f8cdb1da7a244b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0b5710ae3b256924fe0fb5c8c9dc06fb3ac34179)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-service-identity/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index 09ebd97a65..278900971e 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
 	# python-pyopenssl -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	# python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
