Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E14C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C9881374;
	Mon,  7 Feb 2022 17:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hMwVTKe_CrO; Mon,  7 Feb 2022 17:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE4D6812EA;
	Mon,  7 Feb 2022 17:29:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B50491BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A316F401F7
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OuQ9lDoQf6Ap for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:29:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE0C3401EE
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:29:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m14so26077588wrg.12
 for <buildroot@buildroot.org>; Mon, 07 Feb 2022 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8YWyoeN2t4wK8H3ZSGNlzC61t7jWB5xU8rtq9K85Gk=;
 b=aZWG0X4IlYKz/Z++KI23kqSxuFdHpzC6gc31eDup047NeEm8PL5gyf3JzI7IuLs6y0
 4Q1MOm9bgNN1fS5ncV5EhLZQoVJ2MJUQEzP5WAZWcMu1CMakIIoIquLVyoFh6pk/6BH/
 JNGruIMyK/cEU9vZU4hvYKrMyNFVgzBkhsa/2gh6RGeXWSvmAsnrrkba8Kayde+hGlhz
 lbi96sSRy0lJ7Zxc7Ix+PoEMaR0DVavys8KRB0YEn5fuD38X1uUe2pLvWjBFzfo3qFmF
 soqT86jzUKT8+5NbTy7g/MNNdT7GAxb3KtaazBj60j+EyM4JIedrXt+AdIPnP1CvjPCz
 9t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8YWyoeN2t4wK8H3ZSGNlzC61t7jWB5xU8rtq9K85Gk=;
 b=6qt2TCZt0IkHgeK30PbVvL2cQNDAbY7P8NwVv4MJTDajGuW233w9we40wgTolAc1VK
 OVTTXZDLU9ujS149CEfSpqCtE6LWSItv6X1PtFwCc8HYIsIdQmbmOQ8mCFOUhJcn952n
 NNArd8qR5IeCzy8JQ2G6QaDweQX0Ba5NPC8SsWKP2E9Ruyc3G/kC/zJalyQD8FVup9sO
 tyRzpOMDgO6nNZzzXOrytmjtAnXBskxdYP7HpYUalpbCLXf/Z2j3Vtzl0MafBb9XYRvX
 uj9uFHNr8QkjMflV+B3KF9Zn4iHMUTM0/Izdj2nxqOTyTq+0p0yCC98ETsBVp7j7UX9j
 a2xA==
X-Gm-Message-State: AOAM5301EZYbeMHWO0MrfPDzJVnf0p7aBIgyqMraAJKm1MXRPIY06swA
 0S9wNrUB0UNahKo8qIMtg+IaMR++6sM=
X-Google-Smtp-Source: ABdhPJxw8P+XhoUqRjwtw+mmorpAUiBYYQAR8O6uY6dIZsfHVzXI2aWKED0YC/QIzRehWsd4jbWDug==
X-Received: by 2002:a05:6000:16c8:: with SMTP id
 h8mr364595wrf.693.1644254954609; 
 Mon, 07 Feb 2022 09:29:14 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id y15sm14857845wry.36.2022.02.07.09.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 09:29:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Feb 2022 18:26:49 +0100
Message-Id: <20220207172649.3041300-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: pgsql needs wchar
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

Commit b429dce6f8e2ee162b79fe2a3ebb1bd179f462e3 forgot to add wchar
dependency resulting in the following build failure of postgresql:

configure: error: C compiler "/home/buildroot/autobuild/instance-2/output-1/host/bin/arm-linux-gcc" does not support C99

Fixes:
 - http://autobuild.buildroot.org/results/e4b59fecd2a5bcda8103ddf4eae3dbd78fe3b896

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index aa18c13171..6f0c927319 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -92,11 +92,13 @@ config BR2_PACKAGE_LIGHTTPD_PCRE
 config BR2_PACKAGE_LIGHTTPD_PGSQL
 	bool "pgsql support"
 	depends on BR2_USE_MMU # postgresql
+	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable postgres support for lighttpd mod_vhostdb_pgsql.
 
 comment "pgsql support needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIGHTTPD_WEBDAV
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
