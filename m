Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028F2EEAA6E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA43761036;
	Thu, 14 Sep 2023 20:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA43761036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyDdsQ7Ht83n; Thu, 14 Sep 2023 20:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E39ED60FD9;
	Thu, 14 Sep 2023 20:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E39ED60FD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF3D01BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5DBF80C68
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5DBF80C68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9xOwrVALfbM for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:28:35 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1FEC80C22
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1FEC80C22
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40434d284f7so12638565e9.3
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 13:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694723312; x=1695328112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ApXMVFjIBwSb/nue9ZmWcIgPIf0HB5ix1jhmaUsLlRY=;
 b=sT+wNJpQx/vvLn8k+t2lLqZe2IBIqdbYNy2swnV7WVVEpnN1q5BFwNpGB6yAQbe2Wy
 oiNLl3eMXYD0i6ygKk3dTuWMycFDQqbHx2nmZZKXEsubnnjOjcG+1oEfNYW+Sd9jE9qP
 mfb+2nVD2GtX9uD1XqfJlJys4Hjo+9kYpfXlsx8TGXzrXA71SGOALYo82arbPgeCas7a
 29NbGWAlZxCiCx7zjYfEhjkYuVM3OAq+D4IcbBbx4zwskRMNjaQcD0TLlIMh4spPFLbj
 sgddYVCpIleOnpab2jOPhCSP6vdxkwNdPe1H++ZGbc1WXDWhPY38Nj3cOkaOIBaDAg6m
 coMg==
X-Gm-Message-State: AOJu0YyHeS5HIh+pv1jceS2a6in06/wvy654Du7H527brVV+X2BOaN0q
 ylaYU4EhR4DwkxmBfNklFb4qFCgfDS0=
X-Google-Smtp-Source: AGHT+IEzQ2PQTtKNgvp7W44VH5uO+fbZRH+1rcxQqQN7T6Ig6JhHb54Wka1Fvz7bGx9Hb0aYz/0MQw==
X-Received: by 2002:adf:e7cd:0:b0:318:70:a4ac with SMTP id
 e13-20020adfe7cd000000b003180070a4acmr5477414wrn.17.1694723312535; 
 Thu, 14 Sep 2023 13:28:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x12-20020adfdd8c000000b0031912c0ffebsm2624191wrl.23.2023.09.14.13.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 13:28:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:28:25 +0200
Message-Id: <20230914202825.399940-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694723312; x=1695328112; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ApXMVFjIBwSb/nue9ZmWcIgPIf0HB5ix1jhmaUsLlRY=;
 b=l+ObZm/2RhS+63oJBE34S4AE4v+jolQh3eHqcfCU38SqP6FkPMR9fH2wf40HKxmLFf
 k/+oDwUlcVE8957pcQ0SNKwFjuQ/gb0dvI510SctwJteIIUaezrA8I6mPtk6oTCqyIZc
 vI27XzgkUQCxk/OypcjjnD3oeE8ffiaZgTRyWCit3jz70opIeMO7svV0J1SqkW/iyE5v
 iJ6xD5pirBt13GzH61TfEZvForwtzG1jtnSGcpBrQm1XbQTvP63iJzYOz3Q2+2GwmCeZ
 2/jFh357CqJPaKv1CXSrHotMN87K5tjhRaocMnnmPMgDrDkvZElOjFGetX3B7+eORQfn
 Okpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=l+ObZm/2
Subject: [Buildroot] [PATCH 1/1] package/libheif: add LIBHEIF_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:struktur:libheif is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astruktur%3Alibheif

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libheif/libheif.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 9c6c2829cf..65e64a02f7 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -8,6 +8,7 @@ LIBHEIF_VERSION = 1.16.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
+LIBHEIF_CPE_ID_VENDOR = struktur
 LIBHEIF_INSTALL_STAGING = YES
 LIBHEIF_CONF_OPTS = \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
