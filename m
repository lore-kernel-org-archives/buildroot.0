Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D26C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC0A240586;
	Sat,  5 Feb 2022 20:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHdRgklX8YdV; Sat,  5 Feb 2022 20:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A414E40550;
	Sat,  5 Feb 2022 20:19:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2439D1BF95F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DB3A4057A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AhSxe522XvS for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:18:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 071DE400FE
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:18:43 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id y2so847787ila.9
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 12:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O71d4G1pW7y9OgOWK+4nxQkcp+LJwY+tLeWptlQ4EWY=;
 b=PzOXmo1HwSAI3IL3rwmpy1te6hZab+Fo61Hb7BZyPOv7vrhu4Lr0VXceZKPNfgCrYY
 FFs0cFev5EDA2jM2rRBqojO4s/IE1pStK5kYYyZVM6mp/D4UiEJnNf/S7CFj9z4CvZoP
 HnII7VUH4ePXc5UhsV27UqgovylN8l3GqG95ckmz8rwi8DosM39cRbY0aFsrFXgEeA8t
 Co/FoETor348MnbAmGcJH5/17Bm3+Z/vVE3pIyI5ypuGXmH9toZH1WCvZCSV0CErCLer
 29Zcn6xV/k1LVFIF2qA547wC3NH4TZEvXctXcNRj/gt9CX+1yPbuqpTWSt/W9Mc4Esy4
 s9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O71d4G1pW7y9OgOWK+4nxQkcp+LJwY+tLeWptlQ4EWY=;
 b=eWeWyRjBmzqfPc4Ty/u5TSwLTLYoqgjCubkvv/aXjF0AmlBkkoB/K9POz2Tzw5wnl5
 DsNMNYuPIx1vHUJVdGm1VnapLb0Y+DHreY/iBmtIzCPhQ8fXiBogLel7q2m/5OSlGdNu
 BneYpICqMrPyJlG0o6X1ef5xP8GKdDjsz33GSmTPXzGVHAvh4Gl6KTIL50cckehKafMY
 m2psBNSUA6hqPNUrRj7fpNE6FLeMbIfgesYadlDCUr0HDTK1GTbTeJr7R+Ev6GMy3W5e
 pC7hvej5WYVfzS4SBAecj7IgQxS6eq9lvfNF8HAzIt4i3zY1lp3jwTblOlxXnVw3l763
 pSkQ==
X-Gm-Message-State: AOAM532/+BIaZ66HOWJ3lxqv22pmFU1UtBtHWTIqBp+iJI3sOBWN+S90
 0mM6keI+h8HTlHlaMK5pOBRqU/52zz4=
X-Google-Smtp-Source: ABdhPJwJbAgvf6zTueb47LveL+1oojOzSHwPAwj95Gy0pxoWnWWOHn9yu9pR/KqKofnVN9gSX6tiFg==
X-Received: by 2002:a05:6e02:1708:: with SMTP id
 u8mr2543641ill.319.1644092322907; 
 Sat, 05 Feb 2022 12:18:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id a7sm2781090ilq.88.2022.02.05.12.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 12:18:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 13:18:31 -0700
Message-Id: <20220205201837.3324085-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205201837.3324085-1-james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/8] package/re2: switch to generic-package
 make build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cmake build appears to be missing features such as pkg-config
generation support, switch to the regular makefile based build
which appears to work better.

This will be needed by qt5webengine.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - don't built shared libraries if BR2_STATIC_LIBS is set
---
 package/re2/re2.mk | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index b562d5d7ef..2863fcb662 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -10,8 +10,32 @@ RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
-RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
-HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
+define RE2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
+endef
 
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))
+define RE2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
+		$(if $(BR2_STATIC_LIBS),static-install,install)
+endef
+
+define RE2_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
+		$(if $(BR2_STATIC_LIBS),static-install,install)
+endef
+
+define HOST_RE2_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D)
+endef
+
+define HOST_RE2_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
