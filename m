Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D8ECD8CA9
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2AB61424;
	Tue, 10 Oct 2023 17:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2AB61424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38MrQHda0Syh; Tue, 10 Oct 2023 17:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9286141F;
	Tue, 10 Oct 2023 17:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E9286141F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABCEB1BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93502822CA
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93502822CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97WbJquqBgFL for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:48 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F16182283
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F16182283
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso5458166b.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957306; x=1697562106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q89RZaKmHIBdKrc1dXj8KvRuK6Ib0S1gxXOKhsUGE1k=;
 b=KrxCSkY+LeYlpFeJTLn+l9XFMX+AITHmSDn6nY7/B62uPcXI3dY94/xY6526tDduCz
 hASmzuiL1FavvDLjDKHuXb2MZvOHEFRdOyKI73xhzl2/ORRXM3EIYvxfYc6qA2S/NXvP
 BgkxLAy+UoqWQWBKPkA7THAFWwtC7JfNqIO4JWOkAOdiInshOd/fnyJqZrr+QdozyrQu
 zBZ49sJU62k0/uFfCCEKpT9c0ultE0zoifdLbionnUHh/R9v5aZSL6hzhp8I4Zb2PlGL
 90ew3q2iCgKeuq0k0mdgoYo5EcPxgtx8V5TQDj/NpWjx5Uu/w/pJ1E2PnK0f9PVBk+Ks
 gMgA==
X-Gm-Message-State: AOJu0YxoF1XxxJO4rkAH/KZf+Pu+9R/jakgp4ZYHYHiFXD0Pj/S9QC/6
 l1MP6cXs1mWdIM0TxHD/dKGIsjSul5TJfvMpwAn/ew==
X-Google-Smtp-Source: AGHT+IHhUjK9R1KuevdfnOBhGraCbplPZddsnTRFuoPKAF4RePrZ5YwvfJCYRbenBt6Ga/rVQPqqaw==
X-Received: by 2002:a17:907:75d6:b0:9ba:8ed:ea58 with SMTP id
 jl22-20020a17090775d600b009ba08edea58mr8148447ejc.30.1696957304186; 
 Tue, 10 Oct 2023 10:01:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:43 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:25 +0200
Message-ID: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957306; x=1697562106;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q89RZaKmHIBdKrc1dXj8KvRuK6Ib0S1gxXOKhsUGE1k=;
 b=ocTeo2jQ/eC/kqetWC5LGwGhrDsOsTmU6Dq1gT5BbWetmA+dSdwQbsKwGg10DgYX/5
 vzOCKvlAyxCAQ+Xe91WjJlNYJemmxYvUXvAdIl5+MyJOoG6iOPSmu813i2nHs/39gjd7
 5IY3jbdRseczO0sDYoIgTRErfuHBVOOasaAwo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ocTeo2jQ
Subject: [Buildroot] [PATCH 1/9] package/dhcp: enable selinux module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/dhcp/dhcp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 7be40191c8..9d0bcf001f 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -7,6 +7,7 @@
 DHCP_VERSION = 4.4.3-P1
 DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
+DHCP_SELINUX_MODULES = dhcp
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
 DHCP_DEPENDENCIES = host-gawk
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
