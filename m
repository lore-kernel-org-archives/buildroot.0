Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B30C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67116409D6;
	Tue, 26 Apr 2022 17:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2ASRbG2xSiw; Tue, 26 Apr 2022 17:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A8640B76;
	Tue, 26 Apr 2022 17:32:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 526321BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4119F83E4B
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVWbnG4lYIbb for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:32:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74F428333E
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:32:21 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id v10so5537686pgl.11
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBVibrcR+UPcG2nYiCy9R69ko4oJVI7fB4zcjm+Jkus=;
 b=YDVq1gXU5cHsdmuUsX+qwnRgjzfW0jGg1Rzqgt1T0eXI5VOlOgneGmuetrpfSZuEvi
 8npjkuhpWoXS3FJl9zOBh0/KkmYJ8Ef/m4d9Z+OCwI7VkCsHGGQl8bVVjNMSJwR0l/1x
 /5WBSP355yzPlBOOV0iJ3UrkKfqJzrNUei/EDj2fqh5K36x6hv2En8cQK2rJni5syh9C
 Dgt17+W0nkk+r37X+zVW8j+WyjzENfmo3Zewg554ke3/bYh3QYx3RmvEepKweINFcZLY
 Xj2UZLqi1wb+wx11q1gWj+AOT7zdedfyH7fuRhaZJJsHW1NaaO7EtPTSWH6hMsfVc9lQ
 AnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBVibrcR+UPcG2nYiCy9R69ko4oJVI7fB4zcjm+Jkus=;
 b=fxsMBbkmnEqKEjU2ZVnyJFEwB0uNItJL5y43W1wtvi33yF8AbC+jehPET5u05fe85G
 6BkmgpPayQ+PdnD6v0jAVFj7IyfuW5wppu9Far5UMAiXNaWpBms0NFTykK+s2evyyXs3
 +uicdkpmbPsLEb1yo5PTrAOB60cb3BCbqjmggKK8ZWylNC4u0YCq+9Nk28QNXMbb5WOO
 C3fH7zTRB7uU2tx4llxZtSFRLrGk5dePCEHFsFZfSiekzQZuUL5ylqWgdbVZjYXfBGYs
 ajFho2MZGLjymJxhfHVV94/s4aR3mGuEd39gZKVdyUoDavNqfpa7wqzSY7FwoL3ntH2P
 ggqQ==
X-Gm-Message-State: AOAM531PgE8RWuxQU0XgwnIk6CswxBmPebJKP12iS475t385Fm1uxWLY
 bLGyk8LBLGaL/+hlBHPiEO7zzgsJgU0=
X-Google-Smtp-Source: ABdhPJx0zVEyqej2dsVpRo0EBrTHUuVVdFETaVwPNLb+t9zi3hsGDGwcyxUwzSJEvZ6Rb+M+TD4mNA==
X-Received: by 2002:a63:5b0d:0:b0:39c:c393:7e7f with SMTP id
 p13-20020a635b0d000000b0039cc3937e7fmr20856652pgb.16.1650994340470; 
 Tue, 26 Apr 2022 10:32:20 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 o64-20020a62cd43000000b0050d416200e6sm7204341pfg.5.2022.04.26.10.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:32:19 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 10:32:10 -0700
Message-Id: <20220426173211.64840-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426173211.64840-1-f.fainelli@gmail.com>
References: <20220426173211.64840-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] toolchain/Config.in: add
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
Cc: opendmb@gmail.com, mmayer@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
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
