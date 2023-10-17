Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBBBCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 11:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6573641B85;
	Tue, 17 Oct 2023 11:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6573641B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OVHgkMc5Exv; Tue, 17 Oct 2023 11:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFD441A32;
	Tue, 17 Oct 2023 11:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FFD441A32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9C421BF215
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 11:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A22AD41A32
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 11:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22AD41A32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LjE5CDQ4BWI for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 11:08:23 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E22C74192D
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 11:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22C74192D
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4064867903cso61926545e9.2
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697540900; x=1698145700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1H6Hox5tsf04TIfydZg9EIbjBwHPLVmXOobLmYSQThs=;
 b=Ka3KL6GDq+f8MZjQC2l2BfceBrA+dvSiQ8rOPB/OoN+Fr8feXxFwzp8TdMbgXGHK9o
 Q7ZO4Q0wOSj/ypRlS+RzWig5plZihHALHzpxNZdOeRo/rZU/9d7zdaOVQcrSlQ8XYyFG
 84NK6m7d5kImYQgweTjHPOn6rIaLWzjiNnoceAZFTZ6tsnTaTLicm8SYx8XOKvo7NdMx
 MLEkwd3saK9aiIdN5IUaDwS86NvXefIRTmK7tpot6Ntv2OIs10tsfHuxFA3jRlIvnE1+
 huKhuJxbgrwYk1l0dlXhshAOwRe75fIJDBRWKJEzFyunh2ZEqL8VOiEEGxnna6pyCqEB
 QezQ==
X-Gm-Message-State: AOJu0YxAVkt4LcvpbgQtF2hHvl/R8X3g25ApmL9MB77luuGAb6U5D1iw
 Pwyno2HCK+E4Gs7gDU/g6Om8AIEKJqq0rm/yNH7EoIY+U5EIHw==
X-Google-Smtp-Source: AGHT+IExAUUUskVkhoRjPxXQ4twc/+6vbjDxfkDj01OvFsbQk6KTauQLmSuH+gMXwfot0Fj+IaVE9w==
X-Received: by 2002:a5d:508f:0:b0:32d:8469:4f64 with SMTP id
 a15-20020a5d508f000000b0032d84694f64mr1550596wrt.18.1697540900380; 
 Tue, 17 Oct 2023 04:08:20 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 j17-20020adfb311000000b0032d9382e6e0sm1458840wrd.45.2023.10.17.04.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 04:08:19 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 13:08:08 +0200
Message-ID: <20231017110809.1766057-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
References: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697540900; x=1698145700;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1H6Hox5tsf04TIfydZg9EIbjBwHPLVmXOobLmYSQThs=;
 b=WeojamU1nF3HvIcjaexw+WS4w2Vu5djLdHw5zQnPyMlhRrpCfKAg4XGBSeQmKlwxhh
 +J12lwlUscje3v1SFE3kj4/5k1Bs5VPqZq3TFx2g5TYQjr/zGUoo0TMwX5F24i+3seCU
 Vcyrp5U6VgwsshtBHbcrdfkfvqF0Fcp2eZT5Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WeojamU1
Subject: [Buildroot] [PATCH v5 3/4] package/openrc: add bash-completion
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
index 908b44190a..e3f51d45d1 100644
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
