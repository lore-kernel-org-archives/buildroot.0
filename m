Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC2EC47074
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C13DC40A62;
	Wed,  3 Jan 2024 00:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C13DC40A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5A_HEziaKWA; Wed,  3 Jan 2024 00:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D915C40A8A;
	Wed,  3 Jan 2024 00:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D915C40A8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69AC11BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50685416D8
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50685416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gixatH0CSepl for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:05 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD795416CA
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD795416CA
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-28be8ebcdc1so5043542a91.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240004; x=1704844804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNuYms0H5fDPPiQzJ0x9wW1usPbGwGweeSBf8eHpENo=;
 b=deq6uxzUeaLEgb2JdA/+6lquXu7yaMNghZJt/wBUJJANLZcl0ApfCyZ2ouizdChv+o
 VZPc3dv51k0CRAKfvPJqJbrTGtAp7RqDKF0ub79J+1wDdbbyPEuqNIJnILpmkMHPGyVX
 nvEtrqC9F/QC9EwSXBm88qesb7yHll6sgH+lASmk1XPbUDRpHPfE/zzCqbOriZPxtle8
 /xSPi+o/ipI6XaXVNM2MfsuDg3bV9K2ogXZRNoufbdEmVv8vsDUI5/s14JF/0X4tAo7U
 3jYHF8bhRt20772oGXfTZTf+F+rISCCUbUeQM4XyYIaO1hJCkXJwnCnjSuF03oI5spJz
 CCIA==
X-Gm-Message-State: AOJu0Yzf23RSia9HEFFKTMeB6f3lAWZge8rgApxV0G5p9N1wJ8a19Ofh
 Zw5L/9i54OEWDWWARYHTPycaOOnxSEBtK+klZMpVNcsBYWo=
X-Google-Smtp-Source: AGHT+IETZ5H4cPdjBFp0RKvIkcl3Je2yegrSqQ7mS3S+RdJVyAezyMRA81rdcwVEu4WMBGB0k/VDdg==
X-Received: by 2002:a17:90a:2a4b:b0:28b:d83d:29a7 with SMTP id
 d11-20020a17090a2a4b00b0028bd83d29a7mr5908867pjg.6.1704240003884; 
 Tue, 02 Jan 2024 16:00:03 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:03 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:23 -0700
Message-ID: <20240102235957.3072102-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240004; x=1704844804;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNuYms0H5fDPPiQzJ0x9wW1usPbGwGweeSBf8eHpENo=;
 b=ftYZmSYvyOwu7L0g56DReRAleerchLYvFJzvgRLZvoY0Mrcscs+esrgw/26h/jn/c2
 y4xj1grjSiDZ4ZdcW+IelUtnYnHLy4pLkGnFlRrErFCSpcUDBB228DY2FiBB3f810/Y4
 OdZPIO8UhphFuT42oVJrFvKixwcYdeeTp6TvU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ftYZmSYv
Subject: [Buildroot] [PATCH v3 01/11] package/Config.in: move flutter-pi
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

package/flutter-pi was place erroneous under the "Graphic libraries"
section of the menu "Graphic libraries and applications (graphic/text)"
menu. However, as flutter-pi is an application that runs graphic applicaitons
it is better suited to be placed under the "Graphic applications" section.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index d5d89c50aa..9ec185f16c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
@@ -348,7 +349,6 @@ comment "Graphic libraries"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
 	source "package/flutter-gallery/Config.in"
-	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
