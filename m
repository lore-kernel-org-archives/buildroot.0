Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6957CC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1944A6083F;
	Thu, 17 Sep 2026 20:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Lv3W7AeAZJp; Thu, 17 Sep 2026 20:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2FC1F607CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789675741;
	b=LCjbGiputb7DQywzOYcQcUlDfoWSE3UCLslZOgJsKNKACKhTp0HTaf42Njj1PagnKOT6
	 fajWhAel+0o9n2Eutb/nK+Amw7BDcJNb21YbtO/lrzf4QW/npB2gKNZw6jG6xDEQLUq1K
	 d9KHdKKIeTvWhbty0SQ/XKZhtxVu+jwp6m7joPZAplsuKmgmkMYBuYDoV4y+18ClXamLT
	 FgT/nu18WdujBtx5zbzrZVv3RKilSqHqAItKKPsdJNRhW0CZYwOBvinbkxEjdB95jyEzc
	 G3/y+DKu+KJcVhEB//SHCo3ZX2QVjwC9FmP5of9p1tiWiR1yWbXyzn6CqZNXaZiRF7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789675741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D9CuJHMEL2pR7DRpLMw/Xj8AL5seeYx9JI0lu5uAU3w=;
	b=Oqc+8HG4OWuAGeAs59eJ+hooNxmlPQhDy0GTYqlkgHRFoTT8lpzwYYY0gInqTNbz9NzD
	 nLTnlOHU5nW0C+nFsg9XePItNduymE2FBsmLMMMbjcq+bMxRyZXvSiaCgCrR2MvmPW1ja
	 FMlwqM+maJMmLvhDoHF51JoYsCb+w3F1Ill6mgsBSPyKphwnPSYjmAPV3zfzlLKF+ZqKB
	 XbZ0XYbarnbLL2Y3MTaFyhbwLyAHKlhr75alDsIAG2aEqZETb2vtgPS5ncJeYJs7mfPCV
	 6prN+T9B67e9iNgsCZPItwm6LWUatiQHIBl/FNOs0m/m14BrbU572oadCyD+U10vEgw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789675741;
	bh=D9CuJHMEL2pR7DRpLMw/Xj8AL5seeYx9JI0lu5uAU3w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKmvqXzPNOzKjBcki1YxzUN3iK/XqXMKOq4vp+/4pmEfMW2LGk2fjOzN6GTLxVgXP
	 8WOtOp2MZL5322p5olPgE+Va5VN2h+L/Qaq1MUIAvY2he3ETyBml1bvGQLgQpwypmo
	 WWHg3ISuYWksjxyWAhwc1Ji+AtqK/5bIRie30oirme7Yf7W7SxIxWQtj9EmHDa83r5
	 hZC//jCuvLddPrbFjNT/3uoH6OpbyXPxy7UAygb0INlFMeqguvg2LB0JNLkT3j+euR
	 De/1Io4NSfhvPBDQA8oqhIi/BDkI3eGCCa7n7pWuqsn8YKJbhl/NRy/8DLBfMRMN7F
	 briU9EXbiTX4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC1F607CE;
	Thu, 17 Sep 2026 20:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C4523AF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DE6C40856
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qxM7dbRyx9n for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:08:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5541640852
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=74.125.225.141
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789675738;
 b=Xry2mHk34ujlQ/Ui+K2SSlH6SLm9mbZS/wPN7uhqzRo2M6GCfo/XZ0YN5hlQbHzqYrbU
 ld4O3eJ/usbw6MJXMBGQN9J+H62jTmlFr17olTr1A6MGRkQqbbwuHpFWXb7+/JzWlm4uJ
 Yc/Y36jsCv1ILW0oBgVVqO/hVmpTkjQdcUUF53tYMSshf8Fe+0ivYtFEPSzj5I/z2162H
 28iPh0aLr142FA5Pg2lBHvlYrD/P2Rsc+F4NNiwAZjbsvHfG97f2uVaJEWOinq4NO4YUK
 lIF4zu7n4yvYR+i7WrhcPgz/56Fz5Ncwcq9rVIbKxb9AIlBvWz7y8JfCPBKM1zMJk8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789675738;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Vd4PJCfZkWyrjaXw93cF4t/zUY+UxQDjmsGO0+uvePU=;
 b=BwLp3Qy2bpfak2Ej5xGJD4F9reX2sHh6OtNDjfXpwLCb7qna44ET4qkYI10tbPOB73oB
 gZYqVfkF+C9BEXbLNZDVpNP/Kq4hvdyZ8MXHsNnwPLVGaaEebwX0aUjffTRutuXAn9Tms
 uKzqWCi49JaCQUpUTR6gETuOguu0yQ5vS+bzAvzq47B4mC8z4eVhM1djHBVp+L3qFXHlr
 3ACp+N8hoPM1txiQo3o3rKmW1AJrGs571e/fkpHfoD7LeKVnHhfoYMVTcz8xYR/RJQRn8
 gGCz0EqJMgSM6BjMhhbh9KjCuY3m9sbuEnVNDUtzpvFy8ZZFnPjh4HvgeZ5h7yOgKdA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 arc=none smtp.remote-ip=74.125.225.141
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.125.225.141;
 helo=mail-wm2-f13.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5541640852
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:08:57 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so161745e9.3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789675736; x=1790280536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Vd4PJCfZkWyrjaXw93cF4t/zUY+UxQDjmsGO0+uvePU=;
 b=Qj/bARHH0RNuKuKEJdXK7VtZrqk7IHwpVlJgntrq3jeutHmv7BL9wVYd6M126w2nTt
 wtnN+0DYWxuoIR6Be6fnrNPAfwrU4ZPHa0yfbZprRRUjFIKc6ZY7aXE6fl6696iSrDjp
 m/p7pZuJ8+4ypsAUyV9RNHfXTF2LgNKAXocxutZEfNpbbv69DhhTvYIFnZW1nhSEeK/H
 OUdmFPupROVtrTtP1JqJwqhW82QauuY1aLO85e5kuBlBj6bDfCISQzTTBYxMW0yYDSrp
 9CyLtMdz7GbogZU3B4s0sjHT9fruGFv1FbHKSBM2godp8mjft3WlHTKmOYERyQKg1GTJ
 Aypw==
X-Gm-Message-State: AFuF++nTc1CugXEyFSZFzU3CSM6DfzpvdyCuAnpNtc0SpuzkhicaZPFK
 YdIAkDeV1nhFyUvT0yZ7pnM7nOhxTbnYck+91OtFJgDVJUBiAo0Y8HXuK/SPeQ==
X-Gm-Gg: AYBFou1ODPV23re3dS21cHSoB6tsQqhJXbWtx7fPJfW7KT5Vapp4Jb/7DWFIywcLXwA
 r2ejdoiwtW1FRWLUyY64PTPVfUS/qNGPM1tVJzQ5ndV5mKyJukDr2s1cvUODRH92dfynifJo4Mp
 b9XL/V82YFKOYyqIwgXbxEVIgKYARSHa+bxf8WZdkr3NG1Q4G2s1iJAn9UMLoFXHFhHPRQUuTYE
 /keIasguLH+M1Gv4pdEptkF+kenxY2iS+I5GaURvraqZYaG186GAEshSDantNsde2v+SAAFdMGu
 ik4fRLAiJ1pzQ19AOF9xnDcZyxVxURxjRUg3N5F6L9JoAcKXFsqXC8a0fWFFBSEz5xJMEIEunjB
 Zhfplv0aZWxkr/O+pMr4yfDp0mdW+jtknGKCGvF6jiofW4vqto6yQdIx9bktnUv6c9miTf3hEuc
 Xpor/NuYX9d94B5TJbUKBDEzItMXBHGkKELFb8e7fKywWB6MOfIKziIzwY3da7+qilKreVigzac
 edldnPx7FCSx2zy1UMrqj0P5m4mq+GWII0gXipiZmrNyVkVrV5aJxtgzlSz560LEx/XHT5zdScJ
 QKFNMw7E7v12HyMk/hLqBiNlkqKCzAxs
X-Received: by 2002:a05:600c:1f95:b0:49e:7862:c09e with SMTP id
 5b1f17b1804b1-49fc57238b8mr349955e9.14.1789675735966; 
 Thu, 17 Sep 2026 13:08:55 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:7e12:1f7c:582c:d90b])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4870bf462cesm17214106f8f.37.2026.09.17.13.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 13:08:55 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 17 Sep 2026 22:08:52 +0200
Message-ID: <20260917200852.1741639-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libsoup3: bump to 3.7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
- https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.1.news
- https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.2.news
- https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.3.news

Add zstd support which was added upstream:
https://gitlab.gnome.org/GNOME/libsoup/-/commit/579ff56747c3aea2fa7dcbf125bfbd424b3ac59a

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsoup3/libsoup3.hash |  4 ++--
 package/libsoup3/libsoup3.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index c0b860875c6..588390b9575 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.6.sha256sum
-sha256  51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740  libsoup-3.6.6.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.3.sha256sum
+sha256  4e6a67fb8ff1376577afc24a26c842a347b0034eabf71ef13d0382b1c5bc05e7  libsoup-3.7.3.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 34a9ed27419..a850fbaa21e 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).6
+LIBSOUP3_VERSION_MAJOR = 3.7
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).3
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
@@ -51,4 +51,11 @@ else
 LIBSOUP3_CONF_OPTS += -Dgssapi=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBSOUP3_CONF_OPTS += -Dzstd=enabled
+LIBSOUP3_DEPENDENCIES += zstd
+else
+LIBSOUP3_CONF_OPTS += -Dzstd=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
