Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6674C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 15:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59CBF80AE9;
	Sun, 21 Jul 2024 15:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNw61JuXcj5D; Sun, 21 Jul 2024 15:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7304F80AF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7304F80AF0;
	Sun, 21 Jul 2024 15:00:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 922C41BF2BE
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 15:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F64A4027C
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 15:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BPcsPnD0PfY for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 15:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C2254027B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C2254027B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C2254027B
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 15:00:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4266dc7591fso24446895e9.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721574018; x=1722178818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vStRyNAw6ha9uxfsVoChuFlql/KEaGQU1cYOGVSQIF4=;
 b=f8dycNucUDP2WNQckGWipjPJVFBnI4bDqI+F83vBzU36TfsxnzMVXzwEcqO/3FkiIT
 m9Jq+Z4huMY65Vy30x2zTmz5eDUEQVTzbjlZrxOrG37C35YoJPMowe/eQKJsL0d9JJ04
 IjjlgJElvCX0lQ1WKKWF/Pl2Ir+jwc7f3jBSb775qL1q5q154b/KKieqtpXxMPi29yzb
 9e9V+rP6JaXjWLt2dCYm509ZNktKNwwv+Z6vSxxajLDmhRhfyvL3tSQEPcscjpU1awEg
 mIqECmxJzuhkbPC/6J0g3Y39aDiXPvKAOCKd8GP7yfItMfRowYBWBDV7l5lo1bYBZ7OT
 c2Ig==
X-Gm-Message-State: AOJu0YxUWh7LJGy+SdXNGpHDMVnyHlXOgvP1l6ZhHLsUr0ERvaDseThP
 LppZUFr4GmkCtJ8k/WvxHChZbH7rTLgVstzdAaXQHbvQ2kEhcoZ70c/6PA==
X-Google-Smtp-Source: AGHT+IGnUBpmfbnxzy4q/SNF9w6loN0MJjGnWIwPVSrWaXIomNQTryk4tXOFosIOcsIf20NA5jK4hQ==
X-Received: by 2002:a05:600c:3547:b0:426:6c70:dd9c with SMTP id
 5b1f17b1804b1-427dc58f1f3mr27841925e9.31.1721574017476; 
 Sun, 21 Jul 2024 08:00:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6936e1esm94068605e9.44.2024.07.21.08.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 08:00:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 17:00:11 +0200
Message-ID: <20240721150011.1437080-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721574018; x=1722178818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vStRyNAw6ha9uxfsVoChuFlql/KEaGQU1cYOGVSQIF4=;
 b=fV8kGtfgoJCQqPmjTqS2ZEm6l/eRSmsWA1xdAP9zANwJ2ouOqwwebxRrx8uU9ZUaEA
 RCGoxmymPRBDJkKmZgIoikMBRDxl8phEtwuUH9Xt/8Sv7bjEFGKD7yX+EkKSsih1RJjf
 7EVmXv3OH+TPb+og2AhvgesQJFeBIOjZ18zf7PBYoP4UYbEuPO0zUyjzSbGT3pRqQo8Q
 2izPPyoKQNXuYMyIsnQ5VxiMStMVWAaT1NHZ4XANC92JeLn1T54vgDOph9UqM+ZZwh76
 RGQIbY1VriIhdQW0XywRMYnQR1kKKcSdOgiMvlBF1pwdfRju/lbw2UuftukngRkZ7l1N
 vRMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fV8kGtfg
Subject: [Buildroot] [PATCH 1/1] package/unbound: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

unbound unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

sldns/keyraw.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
      |                                   ^~~~~~~~~~~~~~~~~

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/b7782f5ba54543df53a835552632f58d4ad6c082

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unbound/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/Config.in b/package/unbound/Config.in
index ae2ebfd975..c8d697113c 100644
--- a/package/unbound/Config.in
+++ b/package/unbound/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UNBOUND
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Unbound is a validating, recursive, and caching DNS resolver.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
