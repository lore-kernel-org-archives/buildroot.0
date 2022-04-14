Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63293C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30A341941;
	Thu, 14 Apr 2022 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hj0fj5k-Y8GF; Thu, 14 Apr 2022 20:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB304193E;
	Thu, 14 Apr 2022 20:33:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F87F1BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B33D60FD6
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7g6dlce-KqhU for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49DF860FD5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:32:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w4so8402619wrg.12
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4vziKk3/OkcLHv+kPDZY4CF+4sdxbPm1/NH3TH8anw=;
 b=o368StB5mKTOtXHE8YGTxsliWH+jPYFqjueK/BSVYBOoLg6LsiOWEyRCCbRSq8qNKX
 l2ai2mS4QYg7cnpLIVTbf7JRdlp/XQRZTWTsIY5r0fPfalYJoLeR/DSCBQEupGeLTnxy
 6lVvEB8dOGlp5ZrgPot8y1GfkfA2ke0mhMQKb4Y9NLqngTDb51fU8mwjeFKxc91P/F2N
 UFK1WxzqIZdP302kQdKixwpxHr6o10+t8iFTwSYFs/HpuY6f9fwois+ftj8vZt5sPEQ5
 8lqK/GKyoVCe7mXSHFYmHEFfy/bjsWNn9Zj2Qo7oJ3wJMMiHJkYqieuUYzG6KmT4G5d6
 1OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4vziKk3/OkcLHv+kPDZY4CF+4sdxbPm1/NH3TH8anw=;
 b=3txZiaDoFrAM2k83phb/FRV/JkTGhvIg8yH1DHfi4ut2bpYAwqCF3uvEKB/dJDmklw
 trOOvZCvw8NSwWMaPBw9Z6QWiRrlV39cpeelaDEgbOQtxbhE7n0suZ1yU23Qzui+s+G5
 3Ha19RrVt3skUGULmoK/l50yFFDYEWmuEKQWJ6/68tYa7IZ7pgNvFbAwhlLK0o39EnR5
 HnRzq95/gGg2ymPrRaxBgFsPTzhaV/NeRUtfsIuY2iMVWquxJ3lnx4s8nFTxKJ7OscwV
 DiZCdQVnICr+nzxByea0ycxjIJPl6UbaWJE20RsRGtwFKLeFR9RYEZOvcNadaZjbU2Et
 wEkA==
X-Gm-Message-State: AOAM5316MZIi7DOvOAK8vJTdnuWogSAE/+2EC9IiPeBREUE72AEyQ+EU
 V5v3XG4XpTIlc+jhukLbeUb9XHsFJAU=
X-Google-Smtp-Source: ABdhPJzp2ruKA7MYsOX+suE0JYI67r68urj/v1KFOTmjiseHy11i4GzY4ZEsXBH01EbzJAnNYd0SOQ==
X-Received: by 2002:a5d:45ce:0:b0:207:9e7e:9a4b with SMTP id
 b14-20020a5d45ce000000b002079e7e9a4bmr3294447wrs.559.1649968377210; 
 Thu, 14 Apr 2022 13:32:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm6268068wmb.15.2022.04.14.13.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 13:32:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:30:59 +0200
Message-Id: <20220414203059.1818820-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php-apcu: needs threads
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

php-apcu needs threads since its addition in commit
8ddeeffa186d8bce875ac713c1e71483c618842a:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/php-apcu-5.1.20/apc_lock.c:20:
/home/buildroot/autobuild/instance-3/output-1/build/php-apcu-5.1.20/apc_lock.h:41:11: fatal error: pthread.h: No such file or directory
   41 | # include "pthread.h"
      |           ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/314405423aeece5ee55d76ec5c4fa1919e7ee853

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-apcu/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php-apcu/Config.in b/package/php-apcu/Config.in
index 6338980222..f8e1eb17bb 100644
--- a/package/php-apcu/Config.in
+++ b/package/php-apcu/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PHP_APCU
 	bool "php-apcu"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  APCu is an in-memory key-value store for PHP.
 
 	  https://pecl.php.net/package/APCu
+
+comment "php-apcu needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
