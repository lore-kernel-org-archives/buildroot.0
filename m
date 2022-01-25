Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE98C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D64CB4027F;
	Tue, 25 Jan 2022 18:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7KFwCRrqetT; Tue, 25 Jan 2022 18:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C37C40256;
	Tue, 25 Jan 2022 18:53:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8601BF2C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4625440256
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90HaFqmytEhZ for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:53:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 276C24013B
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:53:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l25so21589462wrb.13
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 10:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cdq4E5xAzgiYDsfr9pWqR0/Z0ZQxsnD5466vzn8V3DQ=;
 b=Mfao3rOdi5Yutred5MZOoMKTRMayvit/NUn0dTql1U1L8r6wtCNKc3Ca4HqipqyfZd
 aMrTaCQQCKMb29381HUb96LQzSeeDsu+YR8Nda2mkR202GCx/DyDnrE7oOTdQwhqNNky
 zR21KVndK5xT04lXNm1+uUOi//P08RR+svlQZo7g6GlS1JClVkQM/QJP6p6yKkL79MTr
 cZgEUSK94hO/X27FnCYWpXwMyuZrQs9G0GlGKILbn8KPuggL/c/ryY3yyTUEoux4pVNJ
 5o0e5Ul64KlMd0R4EPb4Bx3NQSrfsE1K1y7+a/cTrtIviuYVGZ4TlHD1ZC3ah2MdvYRg
 plUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cdq4E5xAzgiYDsfr9pWqR0/Z0ZQxsnD5466vzn8V3DQ=;
 b=W/L5YbpT6RNsI8w7u49n/mGe8+csClT31zoCtVdeyLXL3Ymt3MzghhV8f6krlohs/N
 OH/P2s6OHd2UI1jGAqoC4YFBpoNW+noia3GnyuGjOOKTlWC1TwBHTWQB78AqMjEMEoy2
 xbwaCKzDAECc4nOiZAVxJrR21e9k9bB5a2UEGRRHYqtl6tR/8NqF+L0iaLVdPbiU4kzq
 E6bcA0tSVfuALz1MT9r5QYja1MhHbF1YKhq5hNpedY3ii8et2Wfpt9CScCjZKdf4mqAn
 LzUYYWktpQnGT6vgXoXwS4vcqtgp7hv90aTo5xzbawQLVOgybDmiX00ppGmztkcMFpNh
 cQGA==
X-Gm-Message-State: AOAM5324ijXkf1LXDeJ0WICI7xCftRkfHkNBjb7qmpQ3IfvEQHV8fplx
 rEITGvAZPif3/LB3jYI3iZ7BV/FUE+M=
X-Google-Smtp-Source: ABdhPJzPK/KL2DN+k2suCVLVTIQbwUpP2iWDaMA3iV0GCtEMpbj/6iJojBpbtdB9boBk16cuAfDIVw==
X-Received: by 2002:a5d:670b:: with SMTP id o11mr11659481wru.655.1643136797107; 
 Tue, 25 Jan 2022 10:53:17 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p16sm1287308wmq.20.2022.01.25.10.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 10:53:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:51:26 +0100
Message-Id: <20220125185126.52194-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gupnp: bump to version 1.4.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.4.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index cc78be7d5d..cc5e2b5775 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.2.sha256sum:
-sha256  bcad92f2ee09d02f55e0f6ea480c475ed8a7523529263f7ce28013d3c263bacc  gupnp-1.4.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.3.sha256sum:
+sha256  14eda777934da2df743d072489933bd9811332b7b5bf41626b8032efb28b33ba  gupnp-1.4.3.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index aebf9225a8..dca747f064 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.4
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).2
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).3
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
