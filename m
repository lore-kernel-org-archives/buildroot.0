Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B508C83F17
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 063D340FF1;
	Thu, 29 Aug 2024 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZZYwY3ye8Aa; Thu, 29 Aug 2024 13:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2974D40FD7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2974D40FD7;
	Thu, 29 Aug 2024 13:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9D121BF8B4
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B45BA41883
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gha7N7G9gjdd for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 13:12:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.51;
 helo=mail-wm1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7939F41307
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7939F41307
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7939F41307
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 13:12:46 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-429ec9f2155so5731575e9.2
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724937164; x=1725541964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2vNhLM1B94noVoqoBv7XVz3mtIXTx9Z95IRiU5hPZ0=;
 b=kEPCnCocyEie/bjiDPh+waYi284XKqUV4jGwQvjUsy86VhqdIvzRw49XKumdCi0wDU
 9cRccRzuNkpgqEFkUPi6+1aCZfhNVoXp8o2amMKT0LqtqAV/ymtQY+OxUeDpg7xmyWL5
 qLXKTfUCshddQ6lkVP9t9WclBuxTZl3KS0BG4BTbu/6oDyFUyfrj8WEReKANfdYctL4g
 bwJgV7XGmd/QRIsd/zwgn8TbyxRA8TrbJwr8mYcrxqak1aEmO+UUrfxINoiZulINOgCo
 yO/vgdoJTIm4GNxP3/DfDoE/TJz3Aew4S7aJ1iO+LLHiiu0GxRANmNtmGOWkMbxNC06D
 73RQ==
X-Gm-Message-State: AOJu0YyZaw+8Q3zsxtsBjXu4SBzUr7YA1RVcf7t/X466KJICAn92SrFy
 ajhq3nvnbLjF0LAFeo/aVoVS7xDoyLen/suWGGciKbw30PAjeEgeQuI4VQ0w
X-Google-Smtp-Source: AGHT+IGnkIDlNeGqqIo6XwZs6S58orcRluZfUENy8VwlwZgBHOzkCSyKrC78BXkPvOXUOjG3hVK/NQ==
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-42bb029371cmr25961165e9.9.1724937163736; 
 Thu, 29 Aug 2024 06:12:43 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e273bcsm17119455e9.31.2024.08.29.06.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 06:12:43 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 15:12:30 +0200
Message-ID: <20240829131232.2132854-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829131232.2132854-1-thomas@devoogdt.com>
References: <20240829131232.2132854-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libgtk4: fix cairo-pdf compile error
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

../gtk/print/gtkprintoperation.c:26:10: fatal error: cairo-pdf.h: No such file or directory

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libgtk4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index af7f57b80e..2fcae311d7 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBGTK4
 	# https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_ZLIB
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GRAPHENE
 	select BR2_PACKAGE_LIBEPOXY
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
