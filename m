Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A930C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 04:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40EFF605E4;
	Wed,  7 Aug 2024 04:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icBHA9RMmaFF; Wed,  7 Aug 2024 04:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 445B06065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445B06065C;
	Wed,  7 Aug 2024 04:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 871021BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 746AF400EA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rrmPJYveJJn for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 04:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B0EB4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0EB4004A
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B0EB4004A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 04:48:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A2654352117F; Wed,  7 Aug 2024 06:48:11 +0200 (CEST)
Date: Wed, 7 Aug 2024 06:48:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrL8iyi0kV0CP4SY@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723006091; bh=yrgZPwzvKv4AhUisXU16icOhX+YYvf5Ku3F3HD0t78s=;
 h=Date:From:To:Subject:From;
 b=iHY9dpqSJbasocfZJlYK7E9EwKucVEmtJ6dbzaADKNMvI24MivhOnmabQ0SjfwhGM
 dvUiYe/Zdb878J+NgJyBhq24y0BwDQaEzxb6izlgbNlK9sgkB89caovNcoVGB/WvjB
 03PfWKrOPqi8kaL4leuVPrZ9kHxAOwxdmtH9HLot5CHNx75Yng8V1otUYU1gVsabuP
 1O/72rfhCKdrsxWzNYU5pZD+bnP5pW5+XiqS5iKHQQ2JcHQYOW741utLICb17F3xiv
 DJBfYvxz3R39d5OrHH7xpARNDV+hJwihuI0FYWD1Ss1QtgEZN595DvD9YsuQvzciu/
 YXGeLxzQvvX0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=iHY9dpqS
Subject: [Buildroot] [PATCH 2/3] package/binutils: make 2.42 the default
 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that 2.43 has been introduced, let's make 2.42 the latest version,
following the traditional Buildroot policy.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9e1ed6353f..007728321c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_41_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_42_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d98dd7b830..3d1f77c8c4 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2023.09-release
 else
-BINUTILS_VERSION = 2.41
+BINUTILS_VERSION = 2.42
 endif
 endif # BINUTILS_VERSION
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
