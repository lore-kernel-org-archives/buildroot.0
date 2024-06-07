Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2A3C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 14:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA935606B9;
	Fri,  7 Jun 2024 14:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Av5Z4zhLGHBg; Fri,  7 Jun 2024 14:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EA56152F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12EA56152F;
	Fri,  7 Jun 2024 14:29:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2341BF47E
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 14:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 145FF406F7
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 14:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebJ4JsA8VHXQ for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 14:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.177;
 helo=mail-yw1-f177.google.com; envelope-from=q@qdot.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2721D406CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2721D406CC
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2721D406CC
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 14:29:12 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-62a082730c0so2378237b3.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 07:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717770551; x=1718375351;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9qVN7P5x6OAl/uSNhCgBt+4X4I7MYWb+zmuYQQ7PFeU=;
 b=P1JsgxwBDcDTXfvEULwBFvA82cZInOhjNY57pG1R3D1Iun4hLgtbgn5Jfc+yMPFQ/f
 8dgPlwqaV/xYxuluQIYdSX/Ni7mywV68Z2r2+5V9PEWiAFyP4MjDkXyY9j9FIs0wONzO
 C0YC8lqpJj91zJ6ykAuvCVcHBhjZk3jHNNP00fJxY3UdpfJF+a34JGsWcoP+n9Nsa6rn
 ovE4raQPEBKss6qzI/7Htndzur5OwGf5UY83tWVlD/cXd/2lv3L0GrtG0Ca2GlX9fjzJ
 RhzZh2jz+t9m4INzEJ3Wwxa+rUsTAqG00OQjW6eBXtQjfLPCNRj+h8jE4ULStGYI9xzu
 tbbQ==
X-Gm-Message-State: AOJu0YyYQ3F0VNwxkxHX4IiCj8LHcBtD64ZPfRfBLFTDKlUkbYUPEZt6
 wKFISRM1JcbnM8b6rUeqWtIL1m1KeHzeNcNt+o6pOdbQn7grKnZ22YQXiFL0Pk8bmXoocGgyHye
 hZTMzkLG73lqBQvXDRV+mYtjDY4fsjAMUxCdCQ3fMSmddSPexYtE=
X-Google-Smtp-Source: AGHT+IFy62c0UUKovymAs6T8sTtWot3HLwZXmXFxUG1vm0R4h5lcew+9/LT0CaCJaPamRUeY1FNyk/ak52nbPkJD34Q=
X-Received: by 2002:a05:6902:4e9:b0:df8:3484:770f with SMTP id
 3f1490d57ef6-dfaf66987bemr2268689276.5.1717770550537; Fri, 07 Jun 2024
 07:29:10 -0700 (PDT)
MIME-Version: 1.0
From: Tom Mloduchowski <tom@mloduchowski.com>
Date: Fri, 7 Jun 2024 07:28:59 -0700
Message-ID: <CAEpun2apyLPnG=4WcF6H_u9J28rCJTVXCKQXxAUujspi4aqoAg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=mloduchowski.com
Subject: [Buildroot] [PATCH] Provide hooks for host python sqlite support -
 for diskcache support in LLM/AI/ML
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

I have a need to add sqlite support on the host-python3 side (to
support diskcache, for some embedded LLM work I'm doing for kscale.dev
- separate external repo).

Hope it's acceptable to provide such hooks for package developers.

Thoughts?

Tom

Signed-off-by: Tom Mloduchowski <tom@mloduchowski.com>
---
 package/python3/python3.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5d9d77af50..385186a217 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -19,7 +19,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 HOST_PYTHON3_CONF_OPTS += \
  --without-ensurepip \
  --without-cxx-main \
- --disable-sqlite3 \
  --disable-tk \
  --with-expat=system \
  --disable-codecs-cjk \
@@ -66,6 +65,12 @@ else
 HOST_PYTHON3_CONF_OPTS += --disable-openssl
 endif

+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SQLITE),y)
+HOST_PYTHON3_DEPENDENCIES += host-sqlite
+else
+HOST_PYTHON3_CONF_OPTS += --disable-sqlite3
+endif
+
 PYTHON3_INSTALL_STAGING = YES

 ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
--
2.39.3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
