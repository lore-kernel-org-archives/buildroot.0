Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CB9C7EE2F
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 19:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B5A41C25;
	Fri,  3 Mar 2023 19:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B5A41C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ya2gyYbbJEz; Fri,  3 Mar 2023 19:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE2C841CF6;
	Fri,  3 Mar 2023 19:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE2C841CF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 804A21BF3E1
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 19:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 597E2416A1
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 19:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 597E2416A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V97qeeWfc_Il for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 19:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E084168E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82E084168E
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 19:07:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l25so3287745wrb.3
 for <buildroot@buildroot.org>; Fri, 03 Mar 2023 11:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VbUobonffcuWw2Eyx5mdQd4/RNu+gvklVYnGV/RXU9o=;
 b=azHozrY/s0GS9Fcsf+3x4lGQo41IoutnU8NyosUQu47wGcOXn31gCJDkpIK3oMTkVl
 vtjTlZJrAy+ghIsFC6ZlYwXYyXYaLBtY3uJ6KfIwQcBHP0MSnQFDXImiqDiXpHfCFFym
 BHB6axOfW8gRaKGVrIyQ65rjlpwwQmREYo0ZQdgpGbAwGjtSLHhjCqMyZ+51jRcanY1X
 FZmpUs0FPPTQ3S+WHf8TyZotyaH7ORlNGfJd8aRFGbL5iXELBHcjFuinhfScWB9RnI+l
 9FAlKAUNbX1MgLbQ7m1XpgFWDdJN3mhPTVNJrSIcrxf5d07GXJgroGuQVr4SGailPiMH
 gufw==
X-Gm-Message-State: AO0yUKUAw2fFOX/WkFyT8s75F4tHdLBFrhWjmK1x1JdecMwYh9zLylOv
 k7KtR7Yf7WLALqIumEOgAQGXeeTBNf4=
X-Google-Smtp-Source: AK7set8zJ1G3uOViebaxniDWx9g2fzD1Uv0QdZhMMGLLAx6DZ6PZwSoU2q/EUoX9hOMpDwYEPyK2LQ==
X-Received: by 2002:a5d:6148:0:b0:2c5:5335:73f3 with SMTP id
 y8-20020a5d6148000000b002c5533573f3mr5008315wrt.34.1677870458236; 
 Fri, 03 Mar 2023 11:07:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003eb369abd92sm7928496wmo.2.2023.03.03.11.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 11:07:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 20:07:26 +0100
Message-Id: <20230303190726.4421-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677870458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VbUobonffcuWw2Eyx5mdQd4/RNu+gvklVYnGV/RXU9o=;
 b=cYhrWLokTUyDI0R5MSEnB+GtTdsb68o90bxEndsmOB0gv9QOXQu8q88n+a9pXh7Uxj
 p00Ha3RZ7VtPyb9aYBXf2YgQhNew9RuJ15DYW+Eio++GPTMlgegGCjE6BjHgKdTenC7T
 sZtAPhgpKjzg0c+9rN8nOtTXlkOfX+zkR+dskrO6iES8txqkpr1YZYxZvkKwAriR2fXd
 ggORdmjy41nuh1Y6xNi8YwaYkJJPlmfmXt9cYZMq9jpqaPbXuLtaWtuEh0skqbAamLLB
 71ltCfmli+u1yldNBAqLucBO9+risuVcpL0Jw1sYySHrMQ+UN6j9PcGTCWphzfqFbl9z
 5MuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cYhrWLok
Subject: [Buildroot] [PATCH 1/1] package/libglfw: add wayland dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix added by commit 0bbb12eff3b9f9d9719c48644c2b3d563e80de48 was
incomplete resulting in the following build failure:

-- Checking for modules 'wayland-client>=0.2.7;wayland-cursor>=0.2.7;wayland-egl>=0.2.7;xkbcommon'
--   Package 'wayland-client', required by 'virtual:world', not found
--   Package 'wayland-cursor', required by 'virtual:world', not found
--   Package 'wayland-egl', required by 'virtual:world', not found
CMake Error at /home/autobuild/autobuild/instance-9/output-1/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:603 (message):
  A required package was not found

Fixes:
 - http://autobuild.buildroot.org/results/9c032902418a4ab0c9aa655eb29eddee0711815d
 - http://autobuild.buildroot.org/results/7381e114fa5c796c6edbb2c8e3987563bb32b6fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglfw/libglfw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index eee8e7b298..f5d254eec3 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -29,7 +29,7 @@ LIBGLFW_DEPENDENCIES += libgles
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBGLFW_DEPENDENCIES += libxkbcommon wayland-protocols
+LIBGLFW_DEPENDENCIES += libxkbcommon wayland wayland-protocols
 # Override pkg-config pkgdatadir variable, it needs the prefix
 LIBGLFW_CONF_OPTS += \
 	-DGLFW_USE_WAYLAND=1 \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
