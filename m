Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D05C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 918A06006A;
	Sun, 27 Nov 2022 13:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918A06006A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uBHob2ykDyV; Sun, 27 Nov 2022 13:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CEC6061B;
	Sun, 27 Nov 2022 13:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3CEC6061B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDF71BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC64403CC
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDC64403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLeGLAqRaCD1 for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A1F640275
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A1F640275
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:22 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 o140-20020a4a2c92000000b0049effb01130so1283227ooo.9
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOEPUu99b6w71IR/et2TIUFQ6iXLw9RkT/6N8Js4jXw=;
 b=ZYsCjRZ3U2BfUqWgz/CvgH7x7dJkus1VuzaswGrI9O3k56BWJQulGYxlL2q3TwnyHq
 9m97dstB+NhKYK6ImFWtFhJEchcViCS7YiWlIGJctcWewEr6/r606GH4oSBGUL8mqajO
 hgk5I9Gv8trAEdk8UPSF9pO/o9hf2qxA95Ay00Y6oyP9iZ/fPYKczpfsXuHmzPTxH9CV
 6xDBufh/MEkeUIBwm3esRvSJrkJeKuNeG2akpndvM+zLPFUT5JmpaF9H6ZsKvvaR5g5U
 swd6CDbjdEArqxFawEXT0CvaTP+sMWZyodsT1i1rWcS2KbzmSerrbKT5jMIB1S/gaEQu
 J+Bg==
X-Gm-Message-State: ANoB5plPO8eIY/GzJL0aGV/R4Wjho0wuK8Gla/RHQNAr3xg/05QEhdkb
 XfRN8LVyg3SBVzjhQPiigb9fs8UhJYw=
X-Google-Smtp-Source: AA0mqf4M3LLqF7SxywBxtQBb+KG6h5jWOqeX1zX79YbTmRzcxV5IUM0cCL5fkqJcdYUWJpWbJJZkqw==
X-Received: by 2002:a4a:dcd2:0:b0:49f:b5fe:2b43 with SMTP id
 h18-20020a4adcd2000000b0049fb5fe2b43mr19602874oou.49.1669554501628; 
 Sun, 27 Nov 2022 05:08:21 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:20 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:23 -0300
Message-Id: <20221127130739.1862398-10-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iOEPUu99b6w71IR/et2TIUFQ6iXLw9RkT/6N8Js4jXw=;
 b=GZhSroWuKMVbGQjjLyq9DXlZxePRbNEKh1vi0jP3ifqVfyuJB9+LDb8/5NkF1v8WV8
 6KuK/lLK93IYqALoblUelbNsKgq68SYSy1SKTbUkmqgOURzx79Fi7QzNvSQ0CgHLg0//
 iJZ90jCJt+CkNQ5+0QRmqWzLo866pbCFdIjIlQz98mMGF5MEAJUglumjNvGj3FXjnwZR
 rj4SYye0QB0czCG6u5vmm/4nAghmFPoN5JxOau9Z9hmSUmgQ8gr9i4nnppLUJ6GzyGjP
 JuiXxy3wDUgiunQ8HRW3RN63nDXXC4PlfeuG8t64DCvWQ5Qlcfic7+5MVWfQbnjupwyD
 xenw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GZhSroWu
Subject: [Buildroot] [next 09/25] package/pugixml: fix configuration options
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit upstream 1c5a0bb32583fd294022e68e66b541bf6ff71a67
":sparkles: Update CMake to modern approach" removed all feature
toogles, so starting from release v1.11 any flag passed in BUILD_DEFINES
was completely ignored during the build.
Version 1.11.4 was in use in buildroot since February 2021.

Commit upstream 0f1e75a902ef1751dd63a67fe223b5e8daf4c7f1
"Re-introduced the custom build defines" added PUGIXML_BUILD_DEFINES to
release v1.12, but BUILD_DEFINES is still completely ignored during the
build.
Version 1.12.1 is in use in buildroot since March 2022.

So switch the config options to use PUGIXML_BUILD_DEFINES instead of
BUILD_DEFINES.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE 1:
The code below can be useful to verify the statements above, after
commenting some lines:
|PUGIXML_VERSION = 1.11.4
|PUGIXML_VERSION = 1.10
|PUGIXML_VERSION = 1.9
|define PUGIXML_FORCE_BUILD_ERROR
|        echo '#ifdef PUGIXML_COMPACT' >> $(@D)/src/pugixml.cpp
|        echo '#error 111' >> $(@D)/src/pugixml.cpp
|        echo '#else' >> $(@D)/src/pugixml.cpp
|        echo '#error 222' >> $(@D)/src/pugixml.cpp
|        echo '#endif' >> $(@D)/src/pugixml.cpp
|endef
|PUGIXML_POST_PATCH_HOOKS += PUGIXML_FORCE_BUILD_ERROR
|PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
|PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
|PUGIXML_CONF_OPTS += -DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
|PUGIXML_CONF_OPTS += -DPUGIXML_COMPACT=ON

NOTE 2:
Current version for each branch:
$ git grep ^PUGIXML_VERSION \
    origin/next origin/master $(git branch -a | grep origin/202) \
    | sed -e 's,^remotes/,,g' -e 's,^origin/,,g' | sort
2020.02.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
2020.05.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.10
2020.08.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.10
2020.11.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
2021.02.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
2021.05.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
2021.08.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
2021.11.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
2022.02.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
2022.05.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1
2022.08.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1
master:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1
next:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1

NOTE 3:
local build tests to check size:
pugixml-compact/graphs/package-size-stats.csv:pugixml,165216,1.9q
pugixml-default/graphs/package-size-stats.csv:pugixml,152928,1.8q
pugixml-header-only/graphs/package-size-stats.csv:pugixml,13660,0.2
pugixml-noxpath/graphs/package-size-stats.csv:pugixml,95532,1.1
pugixml-compact/defconfig:BR2_x86_i686=y
pugixml-compact/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-compact/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-compact/defconfig:BR2_PACKAGE_PUGIXML_COMPACT=y
pugixml-default/defconfig:BR2_x86_i686=y
pugixml-default/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-default/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-header-only/defconfig:BR2_x86_i686=y
pugixml-header-only/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-header-only/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-header-only/defconfig:BR2_PACKAGE_PUGIXML_HEADER_ONLY=y
pugixml-noxpath/defconfig:BR2_x86_i686=y
pugixml-noxpath/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
pugixml-noxpath/defconfig:BR2_PACKAGE_PUGIXML=y
pugixml-noxpath/defconfig:# BR2_PACKAGE_PUGIXML_XPATH_SUPPORT is not set

NOTE 4:
build tests on GitLab CI
test-pkg config 1:
 BR2_PACKAGE_PUGIXML=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704564417
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
test-pkg config 2:
 BR2_PACKAGE_PUGIXML=y
 BR2_PACKAGE_PUGIXML_COMPACT=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704755515
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
test-pkg config 3:
 BR2_PACKAGE_PUGIXML=y
 # BR2_PACKAGE_PUGIXML_XPATH_SUPPORT is not set
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704849811
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
test-pkg config 4:
 BR2_PACKAGE_PUGIXML=y
 BR2_PACKAGE_PUGIXML_HEADER_ONLY=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704851087
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/pugixml/pugixml.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 6c756e9c29..c54148d98f 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -29,11 +29,11 @@ ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
 endif
 
-PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
+PUGIXML_CONF_OPTS += -DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 
 HOST_PUGIXML_CONF_OPTS += \
 	-DBUILD_PKGCONFIG=ON \
-	-DBUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
+	-DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
