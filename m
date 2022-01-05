Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86E5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 18:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF746FB91;
	Wed,  5 Jan 2022 18:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uolP_Q1hxWis; Wed,  5 Jan 2022 18:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8B9B6FB8F;
	Wed,  5 Jan 2022 18:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 005B71BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2B440347
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAJ4wMxMBjHu for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 18:05:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 161E740126
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 18:05:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q8so4117384wra.12
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUNuvpAD+eHupiwRfNSew0ciqWFs5R/BHruxYk/ZTxw=;
 b=fM0DGsrfh8BGD42TrJEm9LDTVuyoZYfwi+UCAsqu9KPxO8tKffWcESbpeTUvRKlheF
 k5FKCg50D1nf1N7O6SaGQ9sgcHrf1btN86dpQgcdDwNOxO+lR+kUCnLJga18ueM1CKDW
 fbtr2dI4aA89aWoS7mHxrLwVyrCb1cA3pYzvWk+gCHKvc1Bp0zHzewU2NP93lBlnU+Ec
 NtlSpkKARvEtJmFD87tnIF+xz/bvRw4O2FN1of/ir2X6U0o2MzF+tC9v/nvJQI+vWZj1
 fYhC5ui3WjXMxromnAcI68cFyANfMLMRvpEHVarU8GoCJ5RMpDiXqnEMyMK+0izohDS7
 6wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUNuvpAD+eHupiwRfNSew0ciqWFs5R/BHruxYk/ZTxw=;
 b=JNbkgXJJozDTEaqhmlOtwOyOAlOxvW8Cq7feIGbZByXseSoeMcPYtbAm1+lP3h74sp
 vvR5V4KDzdgPZHMIDq+Q84U2sFQbGMJunlnZTOreqZbMBJsTwN7xYnFxzYIwAwh160sF
 PtGf3i+L5Yu482ySQDhEJmA7TykqGjssi9BAvzRBrUFjZhGn0DN1u29sfJe7mfECKOPx
 l4cOgKdSRfBzKWK0srAVAtc7dWXc323JSHOPmpsS+bilVILfccl7W/Ty3uEZLXhZ9mof
 b+bi1adGHpM/3yPNTrxgGfEcNoZU/XMPpQTYUTo1qwGmFh9syfy1DYUuJ5SdyrUQJVAh
 RfbQ==
X-Gm-Message-State: AOAM5327+1HVAH6Wp13sCXnyrccA/EdJ9jDKAvQZOm1B7WCbj8WI3k6X
 cTLzbx2Ve+GcsT59uqQ2xtzuWYoFlAs=
X-Google-Smtp-Source: ABdhPJxCutYVf8GPXn+lZC3hT4YWWDRGU/eaYeOnUz5DiG/VZJgmNz0FvHdzHMUg8h365TaqduYLmg==
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr47732566wry.71.1641405912246; 
 Wed, 05 Jan 2022 10:05:12 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id a24sm1642283wmj.42.2022.01.05.10.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:05:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 19:04:00 +0100
Message-Id: <20220105180402.388388-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
References: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/refpolicy: add host gcc >= 5
 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add host
gcc >= 5 dependency

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/refpolicy/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 043cc40a72..0e72b895df 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-setools -> host-libsepol
 	# Even though libsepol is not necessary for building, we get
 	# the policy version from libsepol, so we select it, and treat
 	# it like a runtime dependency.
@@ -114,6 +115,7 @@ endif
 
 endif
 
-comment "refpolicy needs a toolchain w/ threads, gcc >= 5"
+comment "refpolicy needs a toolchain w/ threads, gcc >= 5, host gcc >= 5"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_HOST_GCC_AT_LEAST_5
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
