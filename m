Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C4C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 15:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6483F82222;
	Sat,  8 Feb 2025 15:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WybS-K8hJTdd; Sat,  8 Feb 2025 15:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60B57830C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60B57830C2;
	Sat,  8 Feb 2025 15:03:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 696526C
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6427F400FC
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk7v01CBqSLS for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 15:03:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF6D0400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6D0400EF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF6D0400EF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:03:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 62A5A4435D;
 Sat,  8 Feb 2025 15:03:34 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Feb 2025 16:03:31 +0100
Message-ID: <20250208150332.172207-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208150332.172207-1-thomas.petazzoni@bootlin.com>
References: <20250208150332.172207-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveefgfektdeggeeuhfefjedtfeejjedvgeetjeffieelkedttefhudfhgeetieeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1739027014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEbGk8yY1CkTVNOtZyAQqtHBYorKvW6nlab047GuLbI=;
 b=pFnJiXW2csevG9O99fx75Xkb3BGdG5WX2r8ICdELxU4a6nEb6hFAbePyhQLO87KhLgTqY8
 kwbA0TiTeZPq2a2wZPBt60hBdNaSP7bLLigFcjR1CiSghoQOGwoBQ6aubJUh0dZ2LJPOyN
 vG4qjZTSU+D/3DAmGWK8H9z/3KIGFwyVfgT8XYEKwcTF4CrXf+yLsH4tp1l9FIYg9eN2y6
 sXrsCTWVWiZi7WR6JCzwYBb1tfOjJetQ3HNcjXWnTa9Ts6qWSdqO3p/pOs0m7VV4nO2ktM
 w4thlXQ/LWlBxWzz0l8yAv0gaUkMuU/Z/mNLBA+r014aabQIREZXIQCI6zyuuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pFnJiXW2
Subject: [Buildroot] [PATCH 2/2] package/heimdal: add missing dependencies
 on flex/bison
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

As host-heimdal is only used by samba4, and samba4 already depends on
host-flex and host-bison, the build issue fixed by this commit is not
directly visible, but can be reproduced by doing "make host-heimdal"
for example in our official Buildroot Docker container:

/home/thomas/projets/buildroot/outputs/foo/build/host-heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17/missing: line 81: flex: command not found
WARNING: 'flex' is missing on your system.
         You should only need it if you modified a '.l' file.
         You may want to install the Fast Lexical Analyzer package:
         <https://github.com/westes/flex>
make[4]: *** [Makefile:753: lex.c] Error 127

[...]

updating lex.yylex.c
../../ylwrap: line 176: -d: command not found
make[4]: *** [Makefile:756: parse.c] Error 127

Fix this by adding the missing dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/heimdal/heimdal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 155cb66e1f..f6c52f63aa 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -6,7 +6,7 @@
 
 HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
 HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
-HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt
+HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
 HOST_HEIMDAL_AUTORECONF = YES
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
