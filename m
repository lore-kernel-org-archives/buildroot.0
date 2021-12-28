Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F9DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 02:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AAC681771;
	Tue, 28 Dec 2021 02:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VTgAq4bIPIx; Tue, 28 Dec 2021 02:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADD581753;
	Tue, 28 Dec 2021 02:46:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 478621BF38D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 02:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4234F400CE
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 02:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PJ11utt0byX for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 02:46:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34DCD400CC
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 02:46:10 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t23so27953338oiw.3
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZ+BggRBaSI0+a+h1fV1QTxJIe+z//ynKAGsLBqtWm4=;
 b=XnOCouGvUcpLxfYy7lB5HfUavnulnicmCUmmeE6jqzSqePvy2RBJWUAheSlSLLh9Je
 n2EXscYDn8I6mOqZUXTWYOiEJILH70c5uVhszKo1QKgBCNn3BpdTQ31x3lPLWBJU5KwO
 UfeqBQAGg10ydqR1vDGRl/XUIYVOsvScXAHvRTo/y6rPN24NisDTl6T17oz87XqqZlJI
 m3OwrNKGhhnRgf0fWA+NVjFhy6iqH0wvPDj3C9i8k92IDbIFNrNrGSceNqWcjP9n/uuB
 kMUdLWlIkqzDl0qIH9AW8iQJbf2D4NjiXhHPmtEdaSjaTvzKIH0M54mkpOucuTM1qEyH
 boAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZ+BggRBaSI0+a+h1fV1QTxJIe+z//ynKAGsLBqtWm4=;
 b=JOxPwqZh0MY1F4kg1l1kMUnkkddoYVvNI8VzEde2n1EwMCTFX2mQk8RpjGDgiqanNN
 tk0oFROSsfIwqUBtSogr+ojDqafklJv5ZY2GrLiLYtV6BAShINEFQxpPeG0N72qnXxtQ
 xpR9nqGgrxr2IwmPyrfJOFVE6XbrVe6mqU/mLqWSFXBXvdKA4PXsfO11j1qTohdFiH0N
 8Ce/HbLMuUZxtVq1l691PrcRO0QruDYfsLWwFbrKgohsUFMl//G0kSOU0V4CNbE96MoI
 EzzUfq1hobee+8EcNHrQABZDmuh73ZaSgcNrCjSC6LWsjVXuV04tFTww6fOJHVhhM96E
 qC1A==
X-Gm-Message-State: AOAM533gE/PtH9VFPlyfUjXHPovUjme9bX9lmdTb5tBjS2Q5wc1aK7LX
 LIMYLAMRWq86IlL3gLuTIhwYgjAwup4=
X-Google-Smtp-Source: ABdhPJwzEQLiAGQOH/m/bT6vGKnUyGoKWsHCkE6Cfa8RkApdehjylA0nRTczWyQj2ApvlAxwQp3i/w==
X-Received: by 2002:a05:6808:ec5:: with SMTP id
 q5mr15836616oiv.113.1640659568813; 
 Mon, 27 Dec 2021 18:46:08 -0800 (PST)
Received: from localhost.localdomain (89.sub-174-246-137.myvzw.com.
 [174.246.137.89])
 by smtp.gmail.com with ESMTPSA id a28sm3610371oiy.4.2021.12.27.18.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 18:46:08 -0800 (PST)
From: Doug Kehn <rdkehn@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 20:45:40 -0600
Message-Id: <20211228024540.1559-1-rdkehn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: bump version to
 0.9.12
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
Cc: Doug Kehn <rdkehn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Doug Kehn <rdkehn@gmail.com>
---
 package/nss-pam-ldapd/nss-pam-ldapd.hash | 6 +++---
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index 47864c4fe7..e0cdc403ee 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -1,5 +1,5 @@
-# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.11.tar.gz.md5
-md5 91df9d46a548aa7aa95d0e7c672215d0  nss-pam-ldapd-0.9.8.tar.gz
+# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.12.tar.gz.md5
+md5 cc30ee0ab91d6c94b7a343ae09b5dc69  nss-pam-ldapd-0.9.12.tar.gz
 # Locally computed:
-sha256 d0d71be06d1a90940b7566ce00cef1a465aae7171d5d062785506a83411ecab6  nss-pam-ldapd-0.9.11.tar.gz
+sha256 c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14  nss-pam-ldapd-0.9.12.tar.gz
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index 223a9eeaec..60f6328496 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_PAM_LDAPD_VERSION = 0.9.11
+NSS_PAM_LDAPD_VERSION = 0.9.12
 NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
 NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
 NSS_PAM_LDAPD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
