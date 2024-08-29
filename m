Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A077C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3CB5419DA;
	Thu, 29 Aug 2024 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4LjIDfTEsw9; Thu, 29 Aug 2024 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD0EE419D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD0EE419D9;
	Thu, 29 Aug 2024 14:50:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA581BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97B2C419D9
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIuU0xg2xpfR for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72EC64078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72EC64078F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72EC64078F
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42808071810so7208655e9.1
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943022; x=1725547822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvSvHyDBi6/yEJFasTU85msTLoP6xJkrnblZ1Bbb0yQ=;
 b=EoW8mY30Uu0EExWNllfbvrk6n2wDfu/ATbLS9CPKKVz8GPRPrR9ZWERD7TqiWLMq6f
 YvOnjSacSWpVtra5RkHxiu9NcyDitcdaSQ2pGzBSt2ZnWOsBeaUYodGStWeU6rwwpn/4
 kNlVFamETpOVv8aok96MUWegMIG0cHrJIVq8j73a/dFdiw1sEKHWlzltyjZc9RfCMrAB
 WvaWVo8JAScisYQFCjul4wb8qVd8ST3/lMfCRhvH4eKgwPqg81s3ieBlB0PnnvKdA/sQ
 JLSJ9Aioq/FMnsYaGHVL9Zp1UuRr+aTJCskPlijaLK8Drja2tMDgXyYzTqmgQfYliU2b
 bvTA==
X-Gm-Message-State: AOJu0YxljqdzSlFhuxFQZdBBtphY8EFB5c8t6TD2YcAltYIYV8tioM3j
 S5Z0IjDddVz25nQqCHSmcRr7cUaXaDttkp+4hUfqVxMbV6JGpo0zNwG0TA==
X-Google-Smtp-Source: AGHT+IE1joyYsWFCREEQh8Rp2RhyLwayKfacw2WqfzxklAuYaESP9YkpLef56DVpQ0Y8UD5V2iL3IQ==
X-Received: by 2002:a05:600c:4685:b0:428:150e:4f13 with SMTP id
 5b1f17b1804b1-42bb27bc4cbmr25497175e9.33.1724943021595; 
 Thu, 29 Aug 2024 07:50:21 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:21 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:22 +0200
Message-Id: <20240829144940.209964-7-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943022; x=1725547822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvSvHyDBi6/yEJFasTU85msTLoP6xJkrnblZ1Bbb0yQ=;
 b=OhnkYWX9fPi1CmwtuSf5hyJPxxQzbanoUNxDQYSeb4M39D91uVCYJEam9J1dOUL3VU
 1zYoxE9KQ9XYZ7Vm/CbAehLIbp1DBviN1TzZYIIpxdxuN8isl9w9RH7AyiojZmP6K5pn
 sp7V8P3Vb1MkPT6zqApGJlsJ1optkMRhmzq90WY+Q1gLk9I3JB8OG1LPstYddKgSDNMm
 A7Yh7fcfzWsXSAmP6MHdZ5enp6vo0lwT34SUdisrKr868Gr22M5WzrBQysLC07wiXSoR
 65Hxz22izFA295aEE93lrMaZY2CRsHxaZq1+vWEVw7CVzEpermx9wp9rVS/imNrDH6XC
 G9Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OhnkYWX9
Subject: [Buildroot] [PATCH v2 06/23] package/erlang-xmpp: bump version to
 1.8.3
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-xmpp/erlang-xmpp.hash | 2 +-
 package/erlang-xmpp/erlang-xmpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-xmpp/erlang-xmpp.hash b/package/erlang-xmpp/erlang-xmpp.hash
index 703b610800..df509886f8 100644
--- a/package/erlang-xmpp/erlang-xmpp.hash
+++ b/package/erlang-xmpp/erlang-xmpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c227e3a32af4973308120aa726b945c2d3ab7187d47343fe65eb30e95bade0b0  erlang-xmpp-1.6.2.tar.gz
+sha256  2a099bdfb129c416fae6f7e713d94ad39153cf2e7bf6b277a970136190a28ff2  erlang-xmpp-1.8.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-xmpp/erlang-xmpp.mk b/package/erlang-xmpp/erlang-xmpp.mk
index 76f3d31b64..66d7223346 100644
--- a/package/erlang-xmpp/erlang-xmpp.mk
+++ b/package/erlang-xmpp/erlang-xmpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_XMPP_VERSION = 1.6.2
+ERLANG_XMPP_VERSION = 1.8.3
 ERLANG_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_XMPP_VERSION))
 ERLANG_XMPP_LICENSE = Apache-2.0
 ERLANG_XMPP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
