Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50090606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ODoQioXL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2501F60887;
	Thu,  5 Nov 2026 19:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yn6kiPkJ8gD; Thu,  5 Nov 2026 19:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3131260833
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793905725;
	b=XvlAmbKTTba0xcEjmroF8UdfxPrAl98Oq1YzUze0XKHYFhEAPigjj4oi7rugE5QTWnut
	 NQ+uPvupSomhXP3UZF1nYGJPb6h0gWwjNjOA0t0ObEB456C2Rf2uE3BnSYXV6sJM1W4qG
	 8JGiHWSjzFb+Z4RMvp9vVPS6qPE+c+NhFMcAp+EVE2YDZDIy9ldJmQYHtKgt0jRW0NrwU
	 +i04cNG4KurJ6aMnPOx+8GsMm4ooB7u/BB+b5CQhT+ozh/f8YTxtazUO46ETEkh/3kbuW
	 b0sxy8zdFeMXq17ksbl1979ehyzqraEeEZhUHa9SQV0HbGOd6waavOZZk1Op1LxpN7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793905725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kafe5SCdJDnvK/iT4S3DpOM5qMW7sDxzbqM39s5bTJY=;
	b=jXvFcMclPHwQzxyLAsGs0IXXtQorywOogjTGne7/+l4+cK4mfGFsPFjjd1Xrs6rCPfl0
	 yHJRlO4IadvCo8SBTKFBBkkINlP7pAsMj62bXoOMIkRGI0FyHg4pIjChcQocaEnay44CQ
	 5AOmoPf2f90xAeQ4D598HUr6PMjBSjYx3e2Mo2bhkeUSWObDosDrLEC4KFuihqQr6ai/v
	 uE33f0gIUf43N/XedlOOayTDlfQXJW76tt0azmtTGz/d2CO7EcdgkmWO/mJxu0R/oBhr3
	 V6gCegYHjkCuynUWMepG6DFz2M2x7toWlF+x21bJCEBc1ceXVfFAQ1cjnnVbcwxGryA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793905725;
	bh=kafe5SCdJDnvK/iT4S3DpOM5qMW7sDxzbqM39s5bTJY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ODoQioXLJX1/iKVpShDf9VhaSUA7wYG+5IdcsuZ1OJcAsoah34cq8zddGl50IKVbU
	 xBR7yYIV/HxyDfhsmb4GWKpFecV+OAexfH8R5yLPSRr2A+1r+bzHQrBnW33u89wSSn
	 a+W/Vvo5BfG4GBxYFiJTMnyeNMIIopC4VzCSd3jgZGS8sy7YU2L/iLJkt/yNQOA4U0
	 PVNFC0kr30NfSWYVyp+nneWZY8XH2LN7GYIN13ZjP3aD0ecs836sYI4QVXdc0yz/6D
	 Wk/lNXmzUuUCgHziqiQzOPZK0Doi39976VxwX28s7dq1Oey/4WQXXSgisKXR0LUcCi
	 qmL5RnWbhqU6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3131260833;
	Thu,  5 Nov 2026 19:08:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE76FB00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A451C60808
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlcI_aHcpSwj for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:08:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0EF260833
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0EF260833
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:08:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EA569E042; Thu,  5 Nov 2026 19:07:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 20:06:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87eceac257b679d95c14768d2896d128f8e02e76
X-Git-Newrev: cbfd535f16b3dc2b090f6f46426baacad3bab730
X-Patchwork-Hint: ignore
Message-Id: <20261105190711.6EA569E042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: bump to version
 2026.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbfd535f16b3dc2b090f6f46426baacad3bab730
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announcement:
   https://lists.u-boot-project.org/pipermail/u-boot/2026-October/634075.html

Exactly like with commit 747aa911f6a4 ("boot/uboot: bump to version
2026.10") all release artifacts for U-Boot have been migrated to the new
gitlab instance at git.u-boot-project.org, so we also need to update the
TI_K3_R5_LOADER_SITE to point to the new location.

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/ti-k3-r5-loader/Config.in            | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 7eb471e6d5..2dda271c26 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -18,7 +18,7 @@ choice
 	  here as it is used to build the main U-Boot package.
 
 config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
-	bool "2024.10"
+	bool "2026.10"
 
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	bool "Custom version"
@@ -62,7 +62,7 @@ endif
 
 config BR2_TARGET_TI_K3_R5_LOADER_VERSION
 	string
-	default "2024.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default "2026.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
 	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index af025a583e..2142f0c67c 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 178db5c0f3..382b82a00a 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -26,7 +26,7 @@ TI_K3_R5_LOADER_SITE_METHOD = svn
 TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else
 # Handle stable official U-Boot versions
-TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
+TI_K3_R5_LOADER_SITE = https://git.u-boot-project.org/u-boot/u-boot/-/releases/v$(TI_K3_R5_LOADER_VERSION)/downloads
 TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
