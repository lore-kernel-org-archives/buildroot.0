Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ED8C2BA18
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8245060EE9;
	Tue, 18 Jun 2024 13:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEIGtsqGN3B9; Tue, 18 Jun 2024 13:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CCDF60EE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CCDF60EE1;
	Tue, 18 Jun 2024 13:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 267181BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E1B81779
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opqiN4C6FLxZ for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3240A81774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3240A81774
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3240A81774
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:19:59 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52c819f6146so7264851e87.1
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716797; x=1719321597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHP2ySsKeNM3ESiKUCHE7DISVeuo3mfuK9VTk/LtBvI=;
 b=mcDFqJsn9FAwsiER9Wm84EsF3thtyrake6hbwWqjw2lI/P9bxzE8sFGP2YJa8wPYZD
 FK1fz7Oa4J6AWqQRg6wm7wuxc/pWkXneC4EUNr/qrFQtHDYzkVqxGJ0IciINKnQx10Br
 r+RCJytf1Yrj87GT5DMbcFFp+fj/+oDvupZk6mhKy36SJtkYRPD0HU3ZJB/XnC7xJV2L
 +bZLtmVzPTRd93XAUcdkrsGGGGnGvdNo/1VRuOPWzFmXR9/kg6FgS113fnZ09BB9RJOP
 WvuakhK6Th00LRn4BgKbiUSygeFhaHHQ48MaO8eXv+k2mvNEMvYj3PrgkV9ISAo67rtP
 McwA==
X-Gm-Message-State: AOJu0YwqjQsQ5k6EpGKV6KOsquoTJ+Xds0vpATv1n9czukA/w9m7YjGS
 GxK1zmBiIZ5XwxTQ/1kW0WSWuN6rUh5RxqVqRmTLq+EjZdUZpUVz4NRPVQ==
X-Google-Smtp-Source: AGHT+IHm9TnM5oJzjJjg/FE9Pmuxj/5VdU4IO/tLGn2EBK/Jx9MoeKVw1MMOPwSGGQuuMFs5MuOhig==
X-Received: by 2002:a19:914a:0:b0:52c:897b:4c5a with SMTP id
 2adb3069b0e04-52ca6e6bf36mr7387745e87.34.1718716796764; 
 Tue, 18 Jun 2024 06:19:56 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:19:56 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:26 +0200
Message-ID: <20240618131902.2912459-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716797; x=1719321597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHP2ySsKeNM3ESiKUCHE7DISVeuo3mfuK9VTk/LtBvI=;
 b=nFqoqReMofrjWOpRIr3JPNH7XLtBwI1avPUVX6gbHGfUAq+vzrKMsKtHqp5K3Y8Vlj
 04xcVogHugIiPbJKv+D9xY50TTU9mfrwSD2r7XLhECpyQLlT7lOJyE86vvm7HoKm3aeb
 HxqiEG3p9Wk0tS7vg2OOEKCjiZUc6lb6Li3tMgIUEmHPXEJzlG87rHKAGYNgke8P6QQ7
 2pUzLS5GUV71/hHWMS6FKOjktDTfWxxaJP8vxnIdrMZeF8rmeGIx+/p85QXfm9loh8s4
 G9x9sbUrciXEqcQn9UHwfQoEiyCa5lJPn2Xk4FaefcYZ4eesNBBeiZxdcJ27750mcWeF
 PIAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nFqoqReM
Subject: [Buildroot] [PATCH v7 05/14] package/qt6/qt6base: add blind option
 to enable Sql support on host
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host qt6base with Sql support for host-qt6tools to generate the
qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
available.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host |  5 +++++
 package/qt6/qt6base/qt6base.mk     | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 80bc13c7dc..46fb668817 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -12,3 +12,8 @@ config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Sql module
+# (e.g. qhelpgenerator).
+config BR2_PACKAGE_HOST_QT6BASE_SQL
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6b9f425255..d8d68e5254 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -85,7 +85,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
-	-DFEATURE_sql=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -110,6 +109,15 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+# We need host qt6base with Sql support for host-qt6tools to generate the
+# qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
+# available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
 # We need host-qt6base with Testlib support when building host-qt6declarative
 # with QuickTest support. QuickTest support is further required for building the
 # qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
