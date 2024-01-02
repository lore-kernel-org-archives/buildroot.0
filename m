Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C7FC46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E47B404DD;
	Wed,  3 Jan 2024 00:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E47B404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0QDTX_i4KUJ; Wed,  3 Jan 2024 00:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 998FA40A5F;
	Wed,  3 Jan 2024 00:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 998FA40A5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1CA41BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 965CD40192
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 965CD40192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANPgHJVyxI6y for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:06 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C790F40A62
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C790F40A62
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-28ce6eeb4easo342669a91.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240006; x=1704844806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKpTi3roq3IlK0z2lSW3ADqjpq1BBsO3oDz4rAof/X8=;
 b=H+j1phHM/gPB93ioRZ1XX27PulA2Sr/VH0TlJnMWs1AWCFgreMWde7LoNQ+FX96XSE
 zkDtfU4AbqMh6JV8g9cndspWatbWKAAWJG2/tVmYW5leBVrnAeEzZil8bkf9zxscBoTP
 qbdifREaXMZwWbZbyDRyIwKFDhwYZsKkp0LQHgj+1lNpb6JVbKKrbQdPhq9OfYYfD04L
 O4jcFIjziFrNCqrCKXh2v5OWIpVYhqfD1rKVny3lZsNej8cpxVFROPwVmJn/ueQ8/YQM
 j+z1BZYvYPv1Z7v/d3j1X+nNGtnlFTFlMd+Cu5up32/MXJaPOVLhOuCMfBtco3MPo3pI
 PkrQ==
X-Gm-Message-State: AOJu0YxN6zNApXYzRGaK9YZJ7bj8tNSoS7ZKIByj/aIY5XSdlxnKaWy/
 h2PHoP6Z/xaPKUzzFqgUdpOsP/mWAvXX4G5z2sBy9TvZJ50=
X-Google-Smtp-Source: AGHT+IHgGPt8wZueP8LQnYUpzbGHDj1jqRH5J6Nt/5O1+RwmCZYEBBoCIO7pPXkaBosfFCuclhBwNg==
X-Received: by 2002:a17:90a:a516:b0:28c:bced:5e64 with SMTP id
 a22-20020a17090aa51600b0028cbced5e64mr1526644pjq.34.1704240005617; 
 Tue, 02 Jan 2024 16:00:05 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:24 -0700
Message-ID: <20240102235957.3072102-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240006; x=1704844806;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FKpTi3roq3IlK0z2lSW3ADqjpq1BBsO3oDz4rAof/X8=;
 b=VxeyGrbOWDocGtTQ6yVFZmAFCC5o/szuw+jRWqSc0fYpS3itK12kU4g3q7/dPLxUCx
 ZGOYOxvzyhNl72UDylzvKaAiaKxmhCZtqNzoIQgpC5/KqqTJTJei3puZqx4GRWzyy291
 yzX2VsqBYRvoup0BxhCM4ABSpLR4zeC9Goung=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VxeyGrbO
Subject: [Buildroot] [PATCH v3 02/11] package/Config.in: move
 flutter-gallery menu entry
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

package/flutter-gallery was place erroneous under the "Graphic libraries"
section of the menu "Graphic libraries and applications (graphic/text)"
menu. However, as flutter-gallery is a flutter-based graphical user interface
(GUI) application, it is better suited to be placed under the
"Graphic applications" section.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 9ec185f16c..a03415546a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
+	source "package/flutter-gallery/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
 	source "package/fswebcam/Config.in"
@@ -348,7 +349,6 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
-	source "package/flutter-gallery/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
