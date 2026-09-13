Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CEFC88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556FA405A9;
	Sun, 13 Sep 2026 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQas2q9mcx91; Sun, 13 Sep 2026 16:54:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0E6D4405AA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789318467;
	b=FOirZy33oSeFwzjWx5J9nRvFkvgnRtqTqDAJ6RB/CV4HGlnMspeWSFPphO8agOdWt+Gd
	 et1Ny9VXYxfF/ZpQ8bqUz//ReJGeZNm0iZTaGBmF0rgpHyqLoVhd0z9RzUCr8eh3Zub+L
	 acAr4nTJbNVs/e6NSVvFiE/+VB7r6yRx+Br+Ek/UufM9RCWP4bt3p86npyMV4yBeB/kPP
	 5wFNy5raLIl+PJjlYDiFZwJ21QpuqIJaGE0PTYagjsNR33+ni0nVnaMCb38hfguvHajvN
	 rKeL16O9CA8W5ZG4NrIA5Cm8+MVVOIt3+GvuPCMA0m/av9WX9I571tEd3VGinX2XJSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789318467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ej1NkZ/GIIJC5Gyl0jUnylVxsR+yGdpJkBfxL5kvGfU=;
	b=NwrzxRS7vNnKyjXRh6gbGomk4vIOaHwPRaK++x3hefLpWRl8kw16OAOaN/9n/hdM0d7v
	 RpiiiSG3RZlc90bkQmYIiGBy6Qv/IwFeJOmJOF0fto+tcNy83Dv8qmyX0wmFm2eU08Egt
	 QGvznUMAnUfYsQWhwAzOL2cKpvUldq03YxEu5xg4DGU3uuAPX2gRy1tympfBAK5lept3u
	 hTiWpgoWcHS6qb86rruywYjkCTac/ctJLmMCPTpSvdofjqxqRjHPNXt8kO6M70a9QFxzG
	 aTnDrz0uXZhgtK1rTGOJhgGF0oWpeZshOMDeGf3N8d3zZbScDrshkBL1Y7mGDt2Xbdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789318467;
	bh=ej1NkZ/GIIJC5Gyl0jUnylVxsR+yGdpJkBfxL5kvGfU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Xco6uRVRv4fuRJkHl3VrYMyuRF+J+PqZghLCvOTU0dAsrgOm0FoEu42UDpjHOzy4C
	 6yBLdGkfyxTpy7Mn3TxRorW3g7JfNFcya3LRhC+MNEDr2aBmKqZiPVYeuJxrSPvI0a
	 rWB7bz8lOFgtKBaChEsjLOmi5SSfhX6GPt6cI2DOynstNGKDLSAa9upXDUtRH7fWMf
	 6S4uTZrqg7TMXQVkJCuZqVAKe86L+T7GIGxt6L0PKYRg1RMRUkANNpjW6iSWQ8ssjG
	 ecvpZMI+b/Pop8ugjEXUYT072XSKpmKazkpTMsMB5wLUUU2/y55b2Au8oYoy4Z4NkH
	 6Es2V8EDVE62A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E6D4405AA;
	Sun, 13 Sep 2026 16:54:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23FEF29B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A4A94006F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ha3TLNH1n29 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:54:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AB84440022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789318465;
 b=GclvujGLEwM6iFbSFQXP9rgrkh5pqWeLj/LuDpeShx5yzMMt7etYH1sDN0mE84k8kLvU
 E1OFjHyLH64c39BjxVnkxtzkotwxiDFQyvlmryhYWrHSffanK4ml1Z03pwvcmMxpBWVCu
 r+duyK9muPVO6Zr2u85IPlX+Pzn/7asziU8W0LXitHFJsld5d84lQOmTvvkHbjbn6xnow
 Cekl6gtcHmn9Vf3mo+/Ulc+bop4+HTn5JlK/CGhYVswiTp1VCSfZK1GnetsYwhqNsyfeD
 GAQGoQFOpgyLnZgMgszbP6Fsyj2L32V6Sr5/QOD7IaMVGfOof76YE7gp5gwC5NUpiZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789318465;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=KlHoa8TXXXE+bQyM3lrDTPVMXzsuUPjkYb/GtFJHY0g=;
 b=nVPKvvnVBaglJZ6iIb5/zqnnCSlBhwWZwnVqD1AR0dqBdBfWBygZwpNqnxnZ+w/lDs3W
 b0v+MBI5wy5BboaMtd15vTuW2xjgjBmlPR+c0sWYwezEFTtQrx0xQ4C7S4rK9kYznpEsg
 jcz3zSdKaRW2VzRVoC3BlJ77WkzmnHCf6yXqOVS52xKA7GNqxqyqi3r8WNljvZHlkCKIf
 IUHqvY2J3dsQ2F8qu6xrdb9T/T4HzPqvO6cNEqxidnaWNnuKd8sfmA7Ckz1a0fXi5sC05
 05JvETKzk73kWO4bhxIHEJVjKoUUO5JMkc9dH5J9IpRnBVH9NpMIZe/KzJCgqo8LinA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vyroiko8; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB84440022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:54:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 090334E404BD
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:54:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A737F60435;
 Sun, 13 Sep 2026 16:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B86611C78D5A; 
 Sun, 13 Sep 2026 18:54:19 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 13 Sep 2026 18:54:17 +0200
Message-ID: <20260913165418.1693180-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/webkit: fix kernel headers dependency
 due to seccomp select
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit
0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
version 2.5.3"), the kernel headers dependency of seccomp was bumped
from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.

This commit fixes this inconsistency.

Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3a4c3ed792..cfb05fd0d3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -87,7 +87,7 @@ config BR2_PACKAGE_WEBKITGTK_WAYLAND
 config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
 	select BR2_PACKAGE_LIBSECCOMP
@@ -95,9 +95,9 @@ config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	  Enable sandboxing of the processes used for network operation,
 	  disk access, and Web content rendering.
 
-comment "sandboxing support needs a toolchain w/ headers >= 3.12"
+comment "sandboxing support needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
