Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D74C433EF
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 23:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97A4E40CDD;
	Fri, 29 Apr 2022 23:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IVgr7biirWn; Fri, 29 Apr 2022 23:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4F9E402EB;
	Fri, 29 Apr 2022 23:04:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55A121BF28A
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 23:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42446402EB
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 23:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTWfnq915-kf for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 23:04:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9342940142
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 23:04:24 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id f2so10977439ioh.7
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 16:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GMZmETMUj9j7WtmB4HMAL/rIw7VL45hZCTyAqkNL8H0=;
 b=pV7MXl/XKyo8+/0AEECBRGf/IsQhbuDJvO1E0n28DnN44FSssLHVW117gl/PzBk+gN
 CWW/7sjpGJHsKH9vfAqDnsJAIVTZJPa/q+v+AYNuq7282ZP01HPmzyn7cAs3pWCjICAU
 byTrI7hza767NfG5QjIbd33CNaMjlHcWeAuvNcbK8sYjMdPSlDjf9Zao/PgX4/nGahZk
 Z1sLmQ+SfjTfZPKzY8+QmG1YFlE9O6sDtXguwHYXzBL+cBfg9WYk1oD7ckIarfvFj4sq
 BGF3AFYzz+JX25b8afHFeAW0DMxXBt/pmddyagDQWNG9u3SY4XLyzb2DNOarnYfDSKIF
 4M8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GMZmETMUj9j7WtmB4HMAL/rIw7VL45hZCTyAqkNL8H0=;
 b=bM+WyL3UxZc75G4SZ5LwxEfd4gpMNzbr6rn294XGtoYZkLNrc36+6SQZW4RzS55Q/+
 uYmByDXtvfzUpY4zc9Id3AaqbEED9rAR1gvXRlLl80JSoMdRiZ3VMyynPDgjsVT4SU+5
 dCqgTDXAl0jMGJ4jOGOwQzc5ynmGxedE+nvpQetIcpcWd5KRXK4N/8fQV6RZRURUrdds
 G2mM1HVhETNIrBowx0C6NFGkTBeoCNbjY6jwLIK/8ASIxLvazdYHvPnujPOd3zWjuRJP
 IXD6XUhKp+D5/z/AyRTOT0C8l1q/v3xJSJXm4dAqnhylymXwPB9Y5gm8FlmSlQ9ciEkM
 49Lg==
X-Gm-Message-State: AOAM532k6JHqGRRTXQYgCIJPKkBcdWnk0UncNaO3N7Mv2OhBf2f8tO81
 Yt7+cUGcwHA0xxy7bY9h0uSllBbiUsQ=
X-Google-Smtp-Source: ABdhPJxgN681h5YSiqtQut+k/CapIW0PazSzu7Fj58YqRdEdZzAIsSKU1lImVQBsonHAqqGwyP9Vmw==
X-Received: by 2002:a05:6602:2f04:b0:654:a89b:c529 with SMTP id
 q4-20020a0566022f0400b00654a89bc529mr642323iow.128.1651273463495; 
 Fri, 29 Apr 2022 16:04:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 l18-20020a922912000000b002cde6e352f4sm860620ilg.62.2022.04.29.16.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 16:04:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Apr 2022 17:04:11 -0600
Message-Id: <20220429230412.788645-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkg-python: fix flit-bootstrap
 python-installer dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We should not exclude the host-python-flit-core dependency when
building host-python-installer as it will be needed when migrating
host-python-installer to use flit-bootstrap.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e9de5cb8d3..7aff3b745c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -243,8 +243,9 @@ ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
+$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)
 ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
-$(2)_DEPENDENCIES += host-python-flit-core host-python-installer
+$(2)_DEPENDENCIES += host-python-installer
 endif
 endif # SETUP_TYPE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
