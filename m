Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF194C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EEC961152
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EEC961152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4DA607AD;
	Sat, 11 Sep 2021 08:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSmLWclsdoWv; Sat, 11 Sep 2021 08:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67FE160667;
	Sat, 11 Sep 2021 08:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6DDE1BF3C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6BCB4048C
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V223Q4Gs8P22 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 08:22:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E8BE40444
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:22:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7BC8E88EF2; Sat, 11 Sep 2021 08:20:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 10:22:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c5d4a3ba2dd240e5049a8991f0b0bb47249f81e
X-Git-Newrev: 8b2befcd7475c62f312d6d3b9a9d76f8de6fb062
X-Patchwork-Hint: ignore
Message-Id: <20210911082056.7BC8E88EF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssl: fix spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b2befcd7475c62f312d6d3b9a9d76f8de6fb062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openssl/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index f69e85978f..f79bac28fa 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -55,8 +55,8 @@ config BR2_PACKAGE_HAS_OPENSSL
 
 config BR2_PACKAGE_PROVIDES_OPENSSL
 	string
-	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
-	default "libressl"  if BR2_PACKAGE_LIBRESSL
+	default "libopenssl" if BR2_PACKAGE_LIBOPENSSL
+	default "libressl" if BR2_PACKAGE_LIBRESSL
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
