Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03F2C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 08:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65473820DE;
	Mon, 17 Mar 2025 08:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IuTKhHU1rZi; Mon, 17 Mar 2025 08:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFA0820DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FFA0820DF;
	Mon, 17 Mar 2025 08:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C6E612E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 08:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36133820DC
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 08:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frAJbZ2jIklu for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 08:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B912820CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B912820CF
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B912820CF
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 08:25:26 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 908C435208D7; Mon, 17 Mar 2025 09:25:22 +0100 (CET)
Date: Mon, 17 Mar 2025 09:25:22 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z9fccnTQEI/0FRWy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1742199922; bh=RxhqbAZy6x0WzEPGJcURCYGd+HnK+f5tKOIPGY/oc3E=;
 h=Date:From:To:Subject:From;
 b=JTMPbBOYKDaiNJNoK1/s+ufd8rF5Njd5+klcJXOSgJFVj/J28uFUdiC4ajOTt7ozW
 L3Y4chszPlp3GK88PuYUCgdks/zaKM7q55Hx7XAW+rrbB+vnofULaaF6Zfq4cQ3KKo
 XcOuVWBFs3NkSgzHgFrqMQg5CzuaCtm9TTyvtZinzbfap4xWhQUWzlzhp8sD7Dgkyg
 kdwuBBFJfovIZEyXXU/fAYYscFeE01pGFn1d1ukzs9j1oDNs6R69Mb8Ecxbb8V8n96
 HUntqWl4WTxsxqu4/EK5eL8vVS50brM0Fcuo5EwAFqNrDyBwHmQsEiylm15obkkVHx
 R11G9NZ3PDWGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=JTMPbBOY
Subject: [Buildroot] [PATCH] package/expat: security update to 2.7.0
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

Fixes CVE-2024-8176.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/expat/expat.hash | 2 +-
 package/expat/expat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index b0273c73e8..4975d0f864 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a695629dae047055b37d50a0ff4776d1d45d0a4c842cf4ccee158441f55ff7ee  expat-2.6.4.tar.xz
+sha256  25df13dd2819e85fb27a1ce0431772b7047d72af81ae78dc26b4c6e0805f48d1  expat-2.7.0.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 24cfa0a9d2..5d40133f08 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.6.4
+EXPAT_VERSION = 2.7.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
