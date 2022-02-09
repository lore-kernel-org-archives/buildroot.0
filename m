Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52C1C43217
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66889400C1;
	Wed,  9 Feb 2022 19:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSRKmCXyNKmW; Wed,  9 Feb 2022 19:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C90402A2;
	Wed,  9 Feb 2022 19:52:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0F91BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CBE882628
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4D72t7auOot for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:52:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8895081C58
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:52:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s18so5884718wrv.7
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0eX5kzrH4Fwjp72ZUQIzYMKoH7kWMAZolCUaKS4Pqjo=;
 b=LHrSCKRJaozkgLp/FyZt2+7xjp60BeEJYMjrQo91cNH+2IPMvlH7H/ww5zlCnLTOVM
 SQvxoXU0dtS02ypb2mOCnQr1GR7HuOBLwCQ7UnyzkGAa+1GhCoCyiQn8MyoORfgAC20Z
 Bu6f5ZHch4e74pL/7R+GoMlPgLpNOrAhQ4ejUmiqDi6X+qa/fcHgRpA8hhGmbmkHejPO
 Ed5/olOAztxbitnvEigqc4TslAVA7Y7JNS8OkuccR2dqV0K2XwzygaUATKmyAgOwsRSW
 K2EHqOWF/bTYGmEt6hx68XLNyTErveb/jLDyS3TqcO7REcvcTShUj6Q7waSKGWQVADd0
 UGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0eX5kzrH4Fwjp72ZUQIzYMKoH7kWMAZolCUaKS4Pqjo=;
 b=te/cq7t72EOzzmF3S++JX7osqOh37+oVarVFsfmtEk0Ta4kn2Eg0XliLnQn8jNj5oV
 jBNofxSK7ha48f9T81KnBstvNCsJoJmsJR81kG0OQrTnOHg+PPF5yFv5B6LE1WJSNwH9
 rOpWqEZ69ZpWLkLaHxhRbPoGALmGCP+YUQNxW11XJJx1jScjFbrjYMbZpQmKMzPk9/Oo
 USTR2X2mFHuooHf/qID1+YqvXXAnbdRUVWKMdTKkjvP7HOdnaFc6Apu+JO8oU3IE1Xjb
 CXISuwN9VAN5nHZfbOFJ0rJ9hZf054seQESYmLflVYJqPD/Yw2xr3yRg0+YCZJhTnCBY
 vk2Q==
X-Gm-Message-State: AOAM5335du0hACpr9BZBiiicH0TQkqgq0sWzds0Vdxue7p3n4TstbTlQ
 QSQyU80erepgx3RKMSUEo1RA/P+FCM0=
X-Google-Smtp-Source: ABdhPJxzRqvPTs5dTlJ+XtvHB6moHz7GUJLOkKT84+yVUTYjNeeI04beZ0RaQ0CKr9yYJww7XrEOnA==
X-Received: by 2002:a5d:588e:: with SMTP id n14mr3656152wrf.45.1644436368650; 
 Wed, 09 Feb 2022 11:52:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id z3sm7054498wmp.42.2022.02.09.11.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:52:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:52:40 +0100
Message-Id: <20220209195240.346534-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fatcat: bump to version 1.1.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/Gregwar/fatcat/compare/v1.1.0...v1.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fatcat/fatcat.hash | 4 ++--
 package/fatcat/fatcat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fatcat/fatcat.hash b/package/fatcat/fatcat.hash
index 66823e2d9e..56f89edd50 100644
--- a/package/fatcat/fatcat.hash
+++ b/package/fatcat/fatcat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 303efe2aa73cbfe6fbc5d8af346d0f2c70b3f996fc891e8859213a58b95ad88c  fatcat-1.1.0.tar.gz
-sha256 3ea03755e32cf7f5b12981de92a0fdad396448195fe0024990c9cbc388e9866c  LICENSE
+sha256  5574f715f62a9feda7fffc8099f8bca7134ff4f1274bb1bc0db96a2969eea206  fatcat-1.1.1.tar.gz
+sha256  3ea03755e32cf7f5b12981de92a0fdad396448195fe0024990c9cbc388e9866c  LICENSE
diff --git a/package/fatcat/fatcat.mk b/package/fatcat/fatcat.mk
index 1a2e5aacae..0dff53fa65 100644
--- a/package/fatcat/fatcat.mk
+++ b/package/fatcat/fatcat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FATCAT_VERSION = 1.1.0
+FATCAT_VERSION = 1.1.1
 FATCAT_SITE = $(call github,Gregwar,fatcat,v$(FATCAT_VERSION))
 FATCAT_LICENSE = MIT
 FATCAT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
