Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70D3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 21:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F062401C2;
	Sun,  6 Feb 2022 21:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SGdDS_gLW2YC; Sun,  6 Feb 2022 21:28:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65605400E3;
	Sun,  6 Feb 2022 21:28:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46CF21BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 310CE4026D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1KTda52pR6n for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 21:28:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E93140269
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:28:27 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id w7so14496336ioj.5
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 13:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dosYrQ+iNCt8OPzyJMGxy7CxzupqDwI6Ly6NMYJ4F6M=;
 b=C4llxWEw7/528R9v+iQkkKa4KJu0581PYPtILfMicqxW6U/H/a1Ui+VvPzc4UKAh0t
 u1+ntSCed+pjHx6/DhUI2Fqa0F4EqPDoZyw16D/718GxFzaJIeuK37OlTTqVGIjE2aQ4
 6nWKg8rGh0LM80KG8PviBTLR4oFmhv6djGxZVTa+WDTuNbOo591hWArbkBZJHu8QcwoX
 mjPjiWZ0LTziGCbydgTjWYFZZze6hSXWp4DvQHKjBVJLKvpNgHOTFQ5TF5m7RIgWCusx
 fhxFo90F68UUA6vDAGfmpSciKDrjp040L1MkfzvyTgZbjDinx+/dJhERYIByHgx0Un0A
 Gz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dosYrQ+iNCt8OPzyJMGxy7CxzupqDwI6Ly6NMYJ4F6M=;
 b=btdpue/eOXHOq4WwS8DmS5p3VXNKwb/+K8CKj1kbjPpJgtK8QipJx1eD3doVn/2iuu
 E012pnSnJ74Jiz3RGybil5wIEKleqPmlPb4Fk3PsVJD3xyYIeNHeaiLZexHuz4gc0X2Q
 MjIE9TSfAJpht6VZIAJ3KHiM9R5v903BZwK7c1z2yaA1mseQ3QaawjZLPWt5B4LCIZux
 3gBkYgJzrIjkVyvp6202/50vhExfibSO5jwukraP3qSXtNUs9gml0t9p0PwTwhOzsR29
 sMl5sTpv/TTECX0xcIp4OqNNJrO+zKmH6UndPyasuZVTEMlA5/foSHgSqjLXjOW1PsAd
 RuiA==
X-Gm-Message-State: AOAM530TMWdp5omeTKMLFR5IKrzSq13wX0H15jqYEseaGcL5sOpmZTLU
 GX710Ljpip+mqHhIgYXmx43yvBkqKEyr3Q==
X-Google-Smtp-Source: ABdhPJwC8ouL9m/scC0nrSMqrVuZM22Zrg1CBqQg/P+jgBGR2fhVjU1eImKjUgmT8F3+H5gp1cyflw==
X-Received: by 2002:a02:b80c:: with SMTP id o12mr4357943jam.279.1644182906448; 
 Sun, 06 Feb 2022 13:28:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id l12sm4310092ilh.36.2022.02.06.13.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 13:28:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 14:28:24 -0700
Message-Id: <20220206212824.1790375-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5wayland: bump to version
 ce2caf493a1343fbd9f8e4c85baf6a61c057f242
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt5wayland/qt5wayland.hash | 2 +-
 package/qt5/qt5wayland/qt5wayland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 1a7400de67..2acdd1643c 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a29d52c7b12987ed56d922455e0776e161075392969f7c6a8b141b00bd3dd46b  qtwayland-b6d85c2a75f5618e87267f5b5c361455be257a17.tar.bz2
+sha256  f43c8ce9070249dfa91b94c09bcbf7c4fa881daf5eecdb9ff93c0eed43a3b7b0  qtwayland-ce2caf493a1343fbd9f8e4c85baf6a61c057f242.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index bcc4915022..61182f611c 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WAYLAND_VERSION = b6d85c2a75f5618e87267f5b5c361455be257a17
+QT5WAYLAND_VERSION = ce2caf493a1343fbd9f8e4c85baf6a61c057f242
 QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
 QT5WAYLAND_DEPENDENCIES = wayland
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
