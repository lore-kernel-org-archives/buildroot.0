Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A0ECD80A3
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2723440971;
	Tue, 10 Oct 2023 10:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2723440971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuyI6giZ9SaJ; Tue, 10 Oct 2023 10:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF924092D;
	Tue, 10 Oct 2023 10:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEF924092D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB8921BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C25BE4154A
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C25BE4154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oh7m5x1PoT6B for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:52:18 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 708694098F
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 708694098F
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-532c81b9adbso9603868a12.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696935136; x=1697539936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFPrkHvkU6NHEGDruRNzoBNTJPA2RCBFaT2DUvT9FxE=;
 b=B4vYr7WcLkZ62xHfzPKWeR2HmnzF2evWxikY+sJ72IlYIBK1/W0te2JuHxyZkzjTCv
 eXpjRaiOAlMyICj5YjxC4AmCFfVEUXYqjdlYFQMFWScsa4Wz6DLkp5PPDUuxPzEoA3Fu
 KDYMNZn7uKDfQBql/UKX068/7y+vh1OZDEVobMnVGc20/h5/SjYcBunerO6E6QNU6t8A
 spVgcAA3zndzgSSMw+OAzc/OBmneJyVRNN6eEdOpAxHSQjeFsI9I8ijeL9Zq6PmPTGm4
 oeTD1SNgqOWE38A7SDigorsO1hzJbX9ZEQmW4l3IRtgGSG6M3OdZqf6tJISAdPV5HsEH
 n/wQ==
X-Gm-Message-State: AOJu0YxtdHyqIS+YBpfIufE9r7vaLbHvjU+zwLqvBmxHnzJn0kFm50hK
 a2BDUs1a5V5xDec0oroIxADqzUfTSkuI82mBFbjEiw==
X-Google-Smtp-Source: AGHT+IFhQnQFJNbOLnVQT8r9PiGDHmHDRSIzbe0/559hiuhBpwZoLeYvnUvrzlv5DU+bXwkGaPesBw==
X-Received: by 2002:a17:906:cc0b:b0:9ba:3f5c:1eb3 with SMTP id
 ml11-20020a170906cc0b00b009ba3f5c1eb3mr884652ejb.38.1696935136393; 
 Tue, 10 Oct 2023 03:52:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090671c800b009a198078c53sm8216961ejk.214.2023.10.10.03.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:52:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:52:02 +0200
Message-ID: <20231010105203.883450-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010105203.883450-1-adam.duskett@amarulasolutions.com>
References: <20231010105203.883450-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696935136; x=1697539936;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFPrkHvkU6NHEGDruRNzoBNTJPA2RCBFaT2DUvT9FxE=;
 b=GX5I2WRPN8Qc1NZYmrIdGIFvZqHg3akY4BZPVWAnICSr8xa9Wh6Fc8alkco9c3jd+c
 xRmWhX8lmHXDs64r0U9L2pJ4mlHmxlw7e4ct6IgjfLpE0LbWuK+XbfWpUd9DzrWwQEg2
 BOfd+0wq0iGj70FmyZ1co8VMrZUsJEEnwW+PQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GX5I2WRP
Subject: [Buildroot] [PATCH v4 3/4] package/openrc: add bash-completion
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index e55057249d..9682296807 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -20,6 +20,12 @@ OPENRC_CONF_OPTS = \
 	-Drootprefix=/ \
 	-Dbranding="\"Buildroot $(BR2_VERSION_FULL)\""
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+OPENRC_CONF_OPTS += -Dbash-completions=true
+else
+OPENRC_CONF_OPTS += -Dbash-completions=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 OPENRC_CONF_OPTS += -Dselinux=enabled
 OPENRC_DEPENDENCIES += libselinux
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
