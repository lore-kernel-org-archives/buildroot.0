Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD268CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 21:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F1CA410C0;
	Sun, 15 Oct 2023 21:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1CA410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZPdpfsnIjGE; Sun, 15 Oct 2023 21:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBF0410C7;
	Sun, 15 Oct 2023 21:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EBF0410C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 261371BF573
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B83A81973
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B83A81973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CmQB_o3Jqhv for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 21:22:49 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 008DE817BD
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 21:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008DE817BD
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so3551590f8f.2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 14:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697404967; x=1698009767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myaUsAwOCCmxQqdclqKRscvVOpvTnhcSMqnN5vkRpto=;
 b=FLJGb7z0GbgjDVGcTUL9qvpvzfagDNLDQOVrscUT3juogmJjz0OsF0bSankNC2e+6G
 KYXX5mpqgwWwt16HcI1H/fBOirEGTwl/XXlN8SHTgV3eemBHCtJ2Rlaodjw/uu0c3ogN
 lpPaF/Y7qcCaD4aPNqSlw4Z5Fsi4OGi6vQaFosa8WCbgJmtuFCF+QZ6AkPBataSHrZdn
 W0EpgM1TRhZUmKWTNgpM8SmNhe5ovZo9qf9oBxOVBXqLaNiw3diYyoZPj3fnHCYzspce
 gKpnrzgFiZ9Cvv5ALpLX6dQLKX54++25hyKl2vvf/6QlFj48ZHXNy8nYPCYlOd4/+PTg
 Tdvw==
X-Gm-Message-State: AOJu0YzZvzDfgOHZkuN+3FSm2DNvDepT02q3rN97hDTqvDPsGXWy5/TR
 sBL12TmjCiUMyWSKZhx5q5LaFyPwizM=
X-Google-Smtp-Source: AGHT+IEqf3/ErGulfj/wS7DBJKfc+8tdn/3s1pW154s9c58tBV5Xhi7Z9J8JQwxtXstkQAooKVrVbQ==
X-Received: by 2002:adf:a34b:0:b0:32d:857c:d546 with SMTP id
 d11-20020adfa34b000000b0032d857cd546mr11004767wrb.64.1697404966582; 
 Sun, 15 Oct 2023 14:22:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 dh13-20020a0560000a8d00b00327cd5e5ac1sm11313374wrb.1.2023.10.15.14.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 14:22:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 23:22:42 +0200
Message-ID: <20231015212242.1600362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697404967; x=1698009767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=myaUsAwOCCmxQqdclqKRscvVOpvTnhcSMqnN5vkRpto=;
 b=QF9YTfGhxCkgYvhy8yLQwzJhwJvsl4Lvb/s/agq/0p7wCMUgusoC9d+69NQ06yfAjS
 DDgtjPaXL49kwdj7+W3NyflCe7r8NLL+ufjBZ162Jz+sG/Dp2nkrD+aNQTmro2yf5It7
 pYXvwTnMOWsVCzSDoI6nIn8xx3UtJWqlGNod1Ed2/0MnryIMpBUF41BCFIJGZT3uoIuW
 b1pX6+EYV0FZzlpyxKqHz1d+xEiLPVHRySWTzeAnujCQRliuOk771E5DIg5lQLTco/jN
 BN5Ti8dqS9IX067dvIG9RR0rZ7ApFnLrHkAkU6BZCr8Lhh6cIot26XHZwlCfh7Gq2OFZ
 EeKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QF9YTfGh
Subject: [Buildroot] [PATCH 1/1] package/zabbix: add missing
 BR2_OPTIMIZE_FAST
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add missing BR2_OPTIMIZE_FAST dependency to BR2_PACKAGE_ZABBIX_SERVER
to avoid the following build failure raised since commit
e702a05d8998a1f2416225eb62b43b6585738fe9:

checking for Zabbix server/proxy database selection... error
configure: error: No database selected for Zabbix server/proxy. Use --with-mysql or --with-oracle or --with-postgresql or --with-sqlite3.

Fixes:
 - http://autobuild.buildroot.org/results/ab403b45761c82f49a9380564bf10d3e7ae935f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zabbix/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 377c0ff692..af677f782e 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_ZABBIX_SERVER
 	depends on BR2_USE_MMU # mysql, postgresql
 	depends on \
 		(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS) || \
-		(BR2_USE_WCHAR && !BR2_STATIC_LIBS)
+		(BR2_USE_WCHAR && !BR2_STATIC_LIBS && !BR2_OPTIMIZE_FAST)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBEVENT
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
