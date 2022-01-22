Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07954C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F8E340192;
	Sat, 22 Jan 2022 22:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WMmcQSNt7Nr; Sat, 22 Jan 2022 22:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAE5840104;
	Sat, 22 Jan 2022 22:51:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B79D1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C50140104
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcnFW3Eqk0kD for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:51:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00DED40019
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:51:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v6so6606062wra.8
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=or3XfqLOWhsNkSL5JL8NgoFPR9d9AyPeoyvQQ1g6cfI=;
 b=ScfY0tnPqpKKxTrUQ28eCIzQr8yF+2eZqDsu8fE1oUsYeXGudX4VuSyTJhMTnXK+Cz
 /sD9XwTEHgqrcTd2ibHOUkN1iHQD/mlq4va1fnv9itzVFQoFoBUPWSzkGoeJ1WvOu84p
 7I1ooQPGNi6ytjBzJ9zCyZRi6SruAzeigxonrxrNXkrwjRWYQeRBc4GKVBDKAEemefsd
 FTLkNgNYnPHtX+/nHMCAs6yee5Xkvm7jncxVbQo481h7jRoYiPJPTCtZXJ3RfqcA2o4y
 itBQUtEgjFlV45Nux6/4jnIqdVBBUsrHMQYqVhWrSKUZQCq9Ge9Y2HhfzKrd+ye/tv3g
 Lm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=or3XfqLOWhsNkSL5JL8NgoFPR9d9AyPeoyvQQ1g6cfI=;
 b=hdXiJjQ9dnulpikikuyFCnxtsn//HF+lVyp6+LabruTpiAMMeuiV3zJdoPaRyAJQHt
 SGHYs1OlXFFq+lC58sUVII7Mb9whYUiuFztXLSVbmTWP759tsiB+5KSqpD0iYuqPlqnf
 pUrDIT8MuKK69DuSW04d863UbPJ9pmsnEVfGfJOklm9r+9e5WdWqFuAOyhStEgIMBCo0
 s3BnrHmoHlx7+3mAbZG7QkwECAHfpIgzcFSbTV/7goHmMMHKIPly+Q+wFf7zGbRhIRwY
 Ha51zAVnoLG8FuzIJH5LB9lc05a/s/K1fwtluKTGewzwlmSNKleWASC9mfjG0XpHbSAB
 eEyw==
X-Gm-Message-State: AOAM532sQCOLcxRiP2oUDOVrB+tSGEREECM0Ixs0yq5AkMymKRtXkVG9
 iDJt7uB/ayPFLvZJB9aVR6ZAP+KqiCk=
X-Google-Smtp-Source: ABdhPJxy1/VxqlkN/hgy4RD2Y2FptLtqqNGNMceMox6VkLvt2OgTclTR7NFci8CQ7WKK6xSK19Y5zQ==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr8934622wri.470.1642891876998; 
 Sat, 22 Jan 2022 14:51:16 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id x4sm10644489wrp.13.2022.01.22.14.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 14:51:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:49:35 +0100
Message-Id: <20220122224935.310100-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: replace mod_compress by
 mod_deflate
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mod_compress has been subsumed by mod_deflate since version 1.4.56 and
https://github.com/lighttpd/lighttpd1.4/commit/dab212b5f5ee468b632f40f28699efc810f27210

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index ed674a9227..99a09e9766 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -38,13 +38,13 @@ config BR2_PACKAGE_LIGHTTPD_ZLIB
 	bool "zlib support"
 	select BR2_PACKAGE_ZLIB
 	help
-	  Enable zlib support for lighttpd mod_compress.
+	  Enable zlib support for lighttpd mod_deflate.
 
 config BR2_PACKAGE_LIGHTTPD_BZIP2
 	bool "bzip2 support"
 	select BR2_PACKAGE_BZIP2
 	help
-	  Enable bzip2 support for lighttpd mod_compress.
+	  Enable bzip2 support for lighttpd mod_deflate.
 
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre support"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
