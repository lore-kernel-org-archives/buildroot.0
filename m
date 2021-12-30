Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE0FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 10:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 770EF40448;
	Thu, 30 Dec 2021 10:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPhRwlOdh3B0; Thu, 30 Dec 2021 10:17:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9519340420;
	Thu, 30 Dec 2021 10:17:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E71A11BF420
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 10:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD62840420
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 10:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XyhQJJfGH4od for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 10:16:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FF9640164
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 10:16:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so13077614wmd.5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rGwDab8zlrDIfp7F85JQD+Z09DAMJu03mvUH/Oy/+AI=;
 b=ek6k1yP5U4gXintm0VDCk2NxhJyMHjT8UTjC6YfQ4OAklCKvtaU4bWvPVDmTygz4TS
 tm2KRhaS50gmS7SLmIeVZBnouQyN4V8RhriWW/D9QNyzljABVwUyAJDaFWjI550dVAHQ
 8LxRrIy2oCQQ2geCyu+aHtDcpI++igWzc8tUrlrvBFCwUIRCwBZmLIiMzgnyxDcouKKa
 mS/evC2Kcm5Ilbm7nirTq9BMKJDQQx1YLDVefc1KL2QwH9FMmlh6grV+NSIfahBB/pJI
 zi8qGwfZIcS13PVpXwa46R8ujOBUSJxNVt/RBJkCusf+1cEHCg5zMEy68W5gvTAfYRk/
 zC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rGwDab8zlrDIfp7F85JQD+Z09DAMJu03mvUH/Oy/+AI=;
 b=5DV5kBOTbCnRDYalOlAhE+GOO19hrii/LWwyrKuERzLyl5u3ZAQ71p6M5MrShdCgUt
 5hbRNeW3cCh7IXQrBEIfnoXq3BxAK4K9QoQetq2PJWrvRlYJnJGmx+dCaINs9ha3r+q3
 t7K8rHMuNGhsLvBWXjhRNtq6izcElrSKJvIzGLVwG6AyP0sb7DEFUux1ExzlyPOg3dlG
 jPObEuS5DjKrzsNOAtTOG7hVIjR+pxxT/LajoA4MsvU5KIOT7hOfv69Fob9Hbjw2rb+F
 N3pxv8Y2dlTF2og77E59LTWLGdljwH3rbaRZqb5wU7mjB7NcHoGhoV5EzariC23B0f1j
 ccaQ==
X-Gm-Message-State: AOAM530biswmKnQhTRRTFYxeuwnfOg+MZLuKUEK9vzINlULysaymw4sh
 P3yy3aZ1meoyXe0JosZNmFlzI9sZz50=
X-Google-Smtp-Source: ABdhPJzhC3B+bOUpLyJL4h+gLYZA7vgL2KqI79gnn0YhQSwTH9srTWS0FfjRwDmb8rHS3sfpLsrqGg==
X-Received: by 2002:a7b:cd88:: with SMTP id y8mr23555260wmj.123.1640859415622; 
 Thu, 30 Dec 2021 02:16:55 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id u9sm25890278wmm.7.2021.12.30.02.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 02:16:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 11:16:11 +0100
Message-Id: <20211230101611.1850035-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mcelog: bump to version 180
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/andikleen/mcelog/compare/v172...v180

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mcelog/mcelog.hash | 2 +-
 package/mcelog/mcelog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index 49f29e2445..598aa648fd 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d21dfddaaa8e6f4ebd59ce353165c8d8079d0d5ed563492a0415af2248d8b3a5  mcelog-172.tar.gz
+sha256  e9c82b565da06673c2630f9e6bc668634ad7d2c7f13c70db1900cce110ae62dc  mcelog-180.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 9245825430..da7785ca91 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 172
+MCELOG_VERSION = 180
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
