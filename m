Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE51C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2FA641916;
	Fri, 22 Jul 2022 08:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2FA641916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUCCO48J0jRW; Fri, 22 Jul 2022 08:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 754B9410E7;
	Fri, 22 Jul 2022 08:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 754B9410E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10FD41BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E001E847C9
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E001E847C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LvoaaJS4bV23 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:33:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B9384803
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37B9384803
 for <buildroot@busybox.net>; Fri, 22 Jul 2022 08:33:43 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 38CCF4407B0;
 Fri, 22 Jul 2022 11:33:11 +0300 (IDT)
To: buildroot@busybox.net
Date: Fri, 22 Jul 2022 11:33:17 +0300
Message-Id: <4a323dc9772af9a5b5295ae2d1a65f0d314765d3.1658478797.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658478791;
 bh=ga888dB0UKoGJEAnWTKnOtq/pvjEQDxr4FRihYBlzIU=;
 h=From:To:Cc:Subject:Date:From;
 b=mPngo2TG6T0FzzWjrg8M6N/z7TwfIIzTQqxVynpHG2dFeEyIFbAhEfhfcWZt3WQVW
 RlmT3zPvO/U9f6jP6CitJF0kJ+a2QmIvNOmItxV/qoyPS6aUeqhzrYGhjbdf4bKLwJ
 Te+9HuBF5yJ+JcanEahT7S9I55NJLhU/VUuuqzrvBMAARYNdG8EGwO3fPf+Cde4lc1
 4jyIQ8HW3G9EBTfoTVy281b2Q/GFouIu2BHt5JJkofisEgmnW09YF1vu2rmxu3UfP+
 BN8ssNaC+AMWt1QZMQItaJYANig7plzZywbT7s3jr1nkbFSpyZW2XY1IwunoE/Qj6M
 IATqkOeXEzcPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=mPngo2TG
Subject: [Buildroot] [PATCH] package/libcurl: fix dependency symbol typo
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 6d07e2618c0 ("package/uacme: requires TLS support in libcurl")
mistyped the BR2_PACKAGE_LIBCURL_FORCE_TLS dependency making the fix
ineffective.

Fixes:
http://autobuild.buildroot.net/results/56ea6cb146df63d1575da9dae3035b3220de875f/
http://autobuild.buildroot.net/results/280b0ed7f9cdb424917373f98c3e4e6b593c6d21/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index bc2f8f47f21d..218309ed56ff 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -83,7 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
-	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
+	depends on !BR2_PACKAGE_LIBCURL_FORCE_TLS
 
 endchoice
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
