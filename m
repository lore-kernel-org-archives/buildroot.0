Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A556E95A62
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 18:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85AA240267;
	Sat,  7 Oct 2023 18:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85AA240267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5PizTOnUyTk; Sat,  7 Oct 2023 18:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3E64024C;
	Sat,  7 Oct 2023 18:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B3E64024C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBA271BF401
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C434E41D69
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C434E41D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IJrZHeCovOS for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 18:19:38 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF83C41D67
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 18:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF83C41D67
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3248aa5cf4eso3145405f8f.1
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 11:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696702775; x=1697307575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJXSkYf4J5RGLWxCSaDwDJ3eKcXUkcsEFiB6kHp2FLM=;
 b=sJV0Z6NW5HeLM9aHJRa/GqGTkOGW1q7SvjGVlm4gEnCFOK1gz04C1nvmZq1xTZFjZw
 GoW5fKM4yYdISx/S6la1O7ISIUlrueqg4U+AccC3RPtbm7W/C7p6fVOPPxjdt+Ig7ifv
 R/Rlkhj3r5XEL3okZ2mUhxS5HSxRdXAnRVJxKnF9lkQ34sr6HQUQSx1a5ZXoWn6UsaRb
 Z7j7GUxiZSr9SrB+1EW7fiqzxkcQmCqfCxlHfB8AT+bai4lJKy2KAyz86r+/f3GBdKkE
 olJ31Gnau2FiMpZvVSHGFyoblq44GNRvD/8dJCmSi1mcU1AuDTX4XPczzuAsIbfdWdwA
 sPcA==
X-Gm-Message-State: AOJu0Yz9LEgRG/Qho7udNoRGzFG4Ou9zmbsc2EYJgMWVasZscrAcvKMY
 4tPtrSRdl42Dao45tNY/aEaOSerOdqkEhpBnu34waw==
X-Google-Smtp-Source: AGHT+IHi9L6mf75Rm2GCYz+iGnvZfH1S7MxJnE4giryOY8lwLkoHZuKZ1bmxFHJvFTGsHrBzHU82Eg==
X-Received: by 2002:adf:f98f:0:b0:323:302f:aabb with SMTP id
 f15-20020adff98f000000b00323302faabbmr9408825wrr.64.1696702775361; 
 Sat, 07 Oct 2023 11:19:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b0031912c0ffebsm4842870wrm.23.2023.10.07.11.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 11:19:35 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 20:19:26 +0200
Message-ID: <20231007181926.7115-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231007181926.7115-1-adam.duskett@amarulasolutions.com>
References: <20231007181926.7115-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696702775; x=1697307575;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJXSkYf4J5RGLWxCSaDwDJ3eKcXUkcsEFiB6kHp2FLM=;
 b=WUefGmcCh7xEff2m2G8YnnGDoSVvLVq8b4FSrX0IDVaJ+RWdjNi7zDNm3YjEEWmqrs
 gfGB4m/mk03x+a/kSee4n9jsLVZ8eBLbgiypB1APNjREcR+Zj9aonygLnPA4FwytYREE
 xkEueSC0vTfzE9a8aXnLYSc2is54a7q1gElLE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WUefGmcC
Subject: [Buildroot] [PATCH v2 2/2] package/refpolicy: bump version to
 2.20221101
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patch

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: drop upstream patch

 ...ount-dbus-interface-must-be-optional.patch | 33 -------------------
 package/refpolicy/refpolicy.hash              |  2 +-
 package/refpolicy/refpolicy.mk                |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch

diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
deleted file mode 100644
index adec7d98d0..0000000000
--- a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 24 Apr 2023 14:24:49 -0700
-Subject: [PATCH] mount: dbus interface must be optional
-
-If DBus isn't built, the build process fails due to mount.te always using a
-dbus interface even if the dbus module. Fix this by setting the dbus interface
-as optional.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Upstream: https://github.com/SELinuxProject/refpolicy/commit/207b09a656c2c3ac5c286d3f7eef085325e35408
----
- policy/modules/system/mount.te | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
-index d028723..af84af0 100644
---- a/policy/modules/system/mount.te
-+++ b/policy/modules/system/mount.te
-@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
- 
- userdom_use_all_users_fds(mount_t)
- 
--dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+optional_policy(`
-+	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+')
- 
- ifdef(`distro_redhat',`
- 	optional_policy(`
--- 
-2.40.0
-
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index a09e59c270..70d1acc9af 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
+sha256  c89cd3b2e5d99765cc24536fd8e76de83951ad23e05472350328b5a4f8bee410  refpolicy-2.20231002.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 8fea7cc254..fb1c213b84 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20221101
+REFPOLICY_VERSION = 2.20231002
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
