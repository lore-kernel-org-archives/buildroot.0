Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944D5C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6FB81BF5;
	Sun, 14 Aug 2022 19:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C6FB81BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8_6hXbsxitL; Sun, 14 Aug 2022 19:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 511018145A;
	Sun, 14 Aug 2022 19:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 511018145A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEACD1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888DA40E46
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888DA40E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2Ri1SNmq0dp for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:25:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E9D40A7A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E9D40A7A
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E7F9587581; Sun, 14 Aug 2022 19:11:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:25:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10aab0aaf62ab73014fb77d47105ff09acdba403
X-Git-Newrev: 0b5710ae3b256924fe0fb5c8c9dc06fb3ac34179
X-Patchwork-Hint: ignore
Message-Id: <20220814191126.E7F9587581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-service-identity: drop
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b5710ae3b256924fe0fb5c8c9dc06fb3ac34179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
