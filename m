Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB4BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 22:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95322847B7;
	Tue, 22 Mar 2022 22:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R17ZDPmxYACZ; Tue, 22 Mar 2022 22:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB28384338;
	Tue, 22 Mar 2022 22:21:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6CE1BF5B3
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 22:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67BDF40B6D
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 22:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rc_DMbyDER8K for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 22:21:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 485374048E
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 22:21:14 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so4561711pjb.5
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 15:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBVibrcR+UPcG2nYiCy9R69ko4oJVI7fB4zcjm+Jkus=;
 b=h/oq//AcpAJx9W9e7fSb0OaSho1m6FFbowASG9Glpn5yiQ6tEzhiIIcGosjk1G6DOJ
 c72MGk6TN3exLCNO9Ki/S5pBK7wT0+hAaVk1R+ZcJR3/AAaFcCIOM8h566PFucsvkqIL
 qDzBzg4BSHlTMldQKRR9fJbn7QDZhFgZRHjvUskvMdwolWEeBz+WGXT7DPcGA0VS5C6E
 e8h3cn6NZm+YInxyziWuHMcHeGv0aUlJMF4X2gzuwab1192HlcIBRQQCdfZuP6O/O8j9
 M9J61M9KNBUAdO//xyvCw2n98Djf59GQEc3UfgdfXztthNyIF8sfCF5pa8iUrmPqtnKy
 BitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBVibrcR+UPcG2nYiCy9R69ko4oJVI7fB4zcjm+Jkus=;
 b=nUBHjifAeM0y4/eobYLF4BdqmSQ/rQ8ifEYFwWhoH2RkPOqd3XHGrtpLY838r37hmG
 469NIWxTCSdUKDJGWR7q+X8fCEm5hx9l3hDmDe4eKiekzFPTpn7bnQdFu15a+zlUkNUc
 UTig6386zaz+vGTEnQB1+Le4OYXMkDVHwK0nCFCAG6zYoDIxGlhuQVlZuYxFC1qTAZRz
 3LbZEGJAvJc/fKla5Bq7bt6zndWbOCSRV+EQfKcc3lu3ItKRja9VRpTefHNMt0vOdeKX
 Id8i7yJ1eArswmE5BDkGxSkSd2CAStv9rgPcezeu/ooKUJFsIMuDpfUTaOo0TLbMIp/D
 /y6Q==
X-Gm-Message-State: AOAM532CFuat384a3TsnQaIdFZgkxBpw8YkMSF4iVs5N+ZbVYga+GHVT
 wvuGMOCK051fPMZ98Yq6Y3aGVKPAwdE=
X-Google-Smtp-Source: ABdhPJwbyjfHSMubcVY+D/Ee7Gw5K/tS5m8dbQS4oMlWHNz5hLHBx/RfO6C4JlxVlUb8vAduMAV8Ow==
X-Received: by 2002:a17:90a:e7cc:b0:1bf:2500:a493 with SMTP id
 kb12-20020a17090ae7cc00b001bf2500a493mr7659108pjb.37.1647987673293; 
 Tue, 22 Mar 2022 15:21:13 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm18415313pgn.72.2022.03.22.15.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 15:21:12 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 15:21:05 -0700
Message-Id: <20220322222106.42347-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322222106.42347-1-f.fainelli@gmail.com>
References: <20220322222106.42347-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_12 blind option
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
Cc: opendmb@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
 mmayer@broadcom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to add gcc 12 support for internal and external toolchain
in follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_12 symbol.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 toolchain/Config.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d2c81217c84a..b572a89f2f85 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -117,7 +117,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_11
+		BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
@@ -150,7 +151,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
 	bool
 	default y if BR2_sh
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		   BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
@@ -698,10 +700,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "12"	if BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	default "11"	if BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	default "9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
