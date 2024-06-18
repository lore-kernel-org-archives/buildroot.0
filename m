Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67D6C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9D304039F;
	Tue, 18 Jun 2024 21:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cx_H7Uxay0pd; Tue, 18 Jun 2024 21:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 140CA4004E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 140CA4004E;
	Tue, 18 Jun 2024 21:28:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55DA31BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F3B1413DF
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O14REpxbcmaH for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A838410C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A838410C5
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A838410C5
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:12 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so71696551fa.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746030; x=1719350830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TQZdR3rgNALMznLtPfCIXMpuUhTyUUWDpEn2e3WYH8=;
 b=CqA3maU9tnYLgPH0kSfQ8qj66f+REMtORqBxhYgWiGD5OGxW3FJMG28OqO2bgvtMNR
 jXKgrxXrDtgYJKt7/YjIEfSHzWb48H3m8S2u0evksJkQFMU+vvFL0jnKKgnzd4/+t/vy
 pp/0u4N0QpfZMMW4gmo82gxhg9jIE/rPjzWTPjmkUaw0wsRoXQuIyDJa99XwkY7P7Qm/
 pGyVuTr0aRbWMjP+AuLVWgih3liRDRsl+qe5SnvRonUAlPNutNX0CmmXWB5+qQn/GZ4b
 +6no9LWkiIZhmZvUhWl88eOJZMgG8gnBtMP3z+hMLcamHjCYpGjF8MIgznhqGvIYgsnH
 vdfA==
X-Gm-Message-State: AOJu0Yx5O+y4evq+Cye+s6cSZ7IJEFrgTmqdffc0qVr9pk6xItQZuntZ
 NpghKnW6EoDuhb20tAwxVxKaxP533aZ8B9lDMrA5rc4oCOw55cYVO5VFag==
X-Google-Smtp-Source: AGHT+IFJUk1ePyqCk2OgHNYsn2PLNNqgsgpNp6mLrlj/EVtx+KL3afdZaii/p/1ySLBKBy0kUAJ+9g==
X-Received: by 2002:a2e:8191:0:b0:2ec:f68:51dd with SMTP id
 38308e7fff4ca-2ec3cea5796mr7344541fa.6.1718746029931; 
 Tue, 18 Jun 2024 14:27:09 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:09 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:26 +0200
Message-ID: <20240618212646.4154474-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746030; x=1719350830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TQZdR3rgNALMznLtPfCIXMpuUhTyUUWDpEn2e3WYH8=;
 b=nghDIfQYszyP8Zq6wmjBcTg2eITHdjMJzqNP35I/qpq2UMjOpXCEFaB7DdGZor/3xe
 RqCHwJtIal86MOs3nxdMiqBD6Xm19yotvgNZjR3M/uUmr3G2+4veWO0WX3dY7L6+Z6Pg
 OvSj/OvSSE+MvN1P95YczyScdc6QoDsuriwjTgO5EaM8EPRdAgymxnBONP45qX8U0skb
 ZOivaJfb/52xSBLDjiNK4EMK6WUNsatDRSahFlCT4t5+bcUW14F6FBUFTFKek3UCDGtN
 X2251MvAEBCjUzNqFILvkYsAIZRmlBCIAw4QUvS41A/VSIfyCR3DJaX6TWXK4LpTS8HI
 XCpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nghDIfQY
Subject: [Buildroot] [PATCH v8 03/14] package/qt6/qt6base: add blind option
 to enable Network support on host
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

The Network module is explicitly required by qt6tools.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 326c06278e..286da0ff03 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -2,3 +2,8 @@
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Network module
+# (e.g. Qt Tools).
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a229c62844..509c6b0066 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -87,7 +87,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -105,6 +104,13 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+# The Network module is explicitly required by qt6tools.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
