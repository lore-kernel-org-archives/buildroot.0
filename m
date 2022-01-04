Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8902EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32C8F6077D;
	Tue,  4 Jan 2022 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yG3lj_9soV-G; Tue,  4 Jan 2022 22:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421B860B75;
	Tue,  4 Jan 2022 22:04:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73F831BF855
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6331C410BB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MaF4VKUtZw1w for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:03:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E0D2410AC
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:03:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso98284wmj.2
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 14:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MW078uXxYO0Q6FqTG6QoJo155y4zMuYBU3NMW2Bda+E=;
 b=D54RRV17xvzmiTDssAm9D/Vi0aTXshCS2seBFRvgkg/5NPw9Iu54ftOHndYOavg25E
 kvG0Smff3TuuWg6u3mz0iOgxkDQDycEzs4yMsxBNxhj2BTO1NGvhnX33rXE+8t1B0v+1
 0tD5yyBcrfGxH7qJa0fcJW2Lc91+1/XekNE4R40r0MOxrJR/j+l46T1ksFM0TO4J91k6
 isXRQfv+hmAY6KnkIaVFo8Y4zJRD/4UXB6I4fumgirIoUW07WXpMyRMTzHVKc3a2IJ9S
 Y7fSS9f5/8/QZD0gzyBOkrLIl5khRBAyti5HJLmmcJwoSKp/9xtWEfzZbhvBd5MlBcQt
 TPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MW078uXxYO0Q6FqTG6QoJo155y4zMuYBU3NMW2Bda+E=;
 b=r9CxnXI2xtuJ/+//lYEneofdN9CnFYITOnJbqnVgdhhVgJzCxLnrDR4pAkrE1iWyvH
 pHD2eQYH4ajBmJZ7VIX4PugK+BSnS42b5fubV3PJuHncJTwuw+7/Dvcdv0sZ+w1dDk5l
 IBLexAiKjWivMddAijk72GfXy+3ej4MGfd15AH0Ed7tm9bNiTLLSDq1dce0pewC7lVn8
 jmAagh0ylj/pPol/be9e0Cv8I3tDq83P+wVj6lhg/5TblFDwRwf3KfwPw6lQDxsGbf4d
 5fx0cf2gL257a//sW9y2j+6csNalzcbO+wvBpRChUeqoH2Oft01JiWPeRxPygu5nnsNW
 kyaQ==
X-Gm-Message-State: AOAM530SbSSEconH/AGcLphwdP9tdFUqvfvoS0CfxHJfPrS9ZbclctEl
 sTGNFH+OhdpHBGNJ4ow+ar3BaX6Olrs=
X-Google-Smtp-Source: ABdhPJxg4jdz/eUBFJlUSu/fyUj6TJK5SffhIAKce86Tu+cLYSYslGme05ei7Xv4PqoK+J9DJTnu0w==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr292816wmb.39.1641333831665;
 Tue, 04 Jan 2022 14:03:51 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m5sm647543wml.14.2022.01.04.14.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:03:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 23:02:44 +0100
Message-Id: <20220104220245.3706221-5-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
References: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] package/restorecond: bump to version 3.3
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
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/restorecond/restorecond.hash | 4 ++--
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 1869100188..b38c6dcf14 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 471c17e64aa6d7226e861d4d0125d15fdf9b38892c542be32bd83d999e5e75f5 restorecond-3.2.tar.gz
+sha256  218c3d8873f31764e3c82d53ac713c0c9faaa07caf42ed7184e93ca2b27d8f27  restorecond-3.3.tar.gz
 
 # Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 671f071b1d..7d6ed86f08 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.2
+RESTORECOND_VERSION = 3.3
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
