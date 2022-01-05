Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DA9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 18:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A81428DE;
	Wed,  5 Jan 2022 18:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJtPt35aC7ev; Wed,  5 Jan 2022 18:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF9B428BC;
	Wed,  5 Jan 2022 18:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0CB11BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B98D40347
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PUOkrHBAs_M for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 18:05:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 474BB40126
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 18:05:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id e5so180732wmq.1
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEQZLTNWLwxRm3bw1zXWGAV9uS4dRLe3VZ5bjBZL27U=;
 b=apSKNQQ7m5pJhqNNaO4JW+l5KE/n0yN00R1nnmldVMI3dNgVPwnXn4ZRzrn83YKPZM
 pXmYBrFFt6W69+J23shvBaKgp/k8jDXfID9IduIEwk+JTMVI1TivJ86Q4J20vKcxZi6Q
 5fGogKTwL1TP/YN98BbPVhX3vB4e2BkUSlvOjSKmksC7o4g+pI85BO1tYNKsaaISBUhq
 J+C1xevHBohcdooUoF4q9J48nmvHCWVzO8mvs9YLLULfKm93nfD5WuaTQTDlWfXzxyvU
 YSEk7ALJqnfa44CoDZ3Aho9k2yJct3qHeQg7ObwXwIP/psBmVU+kexewaXpLm0vaq/GY
 yehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEQZLTNWLwxRm3bw1zXWGAV9uS4dRLe3VZ5bjBZL27U=;
 b=MdMTED9XznvkCiimsooZKlr5zhMtIT2LlPJL/vPT8eOnVK+2K4DSPE5+04SUeJxBuH
 5DQnDV13sSODWBCBNkBWVIhozeH51whNMTCcHpvJj3AP4BVR1hmvEIrEfxPj53snxJxZ
 VaCbeKtEXigq1aUlOdQjSGJzU65jWwoUa4rz8alwKJye4nJDWqkJpajoQRaAGba/KwrE
 KqpW1QR+hkdmDxd14rdrJhtUJCJt1AT7xPA8X4rmqWp8gM87vYlo0FoKx/9oDaE4fxj/
 zxerAmd5d3a5T3cozlKyJNBrtMEdktxeZ33n/T1g0jrZBg+9CKfzzu87xdqOwm+3GVdD
 JYeQ==
X-Gm-Message-State: AOAM533jXgcZN1FAZz2Jf/0u1GqMjn+6Mjw9nNcvExzBcS63puWGzLsq
 ZHFbboF/JB+gBwOM60a/cOzeAtUy5+A=
X-Google-Smtp-Source: ABdhPJzkY5zGqaAXwXa1MdK/hN1Sqq0Fqgd8iAzjHbfD65Q8wbNzBY5JcvcGhE8eKUlnhnZ3/zom7w==
X-Received: by 2002:a7b:cd19:: with SMTP id f25mr3921186wmj.105.1641405910400; 
 Wed, 05 Jan 2022 10:05:10 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id a24sm1642283wmj.42.2022.01.05.10.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:05:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 19:03:59 +0100
Message-Id: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/libsemanage: add gcc >= 5 dependency
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

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add gcc >= 5
dependency

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsemanage/Config.in     | 6 ++++--
 package/policycoreutils/Config.in | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 3c7050ee51..5103df3f15 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_BZIP2
@@ -17,6 +18,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libsemanage needs a toolchain w/ threads, dynamic library"
+comment "libsemanage needs a toolchain w/ threads, dynamic library, gcc >= 5"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 81900b4e41..3201c8fede 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -1,12 +1,14 @@
-comment "policycoreutils needs a toolchain w/ threads, dynamic library"
+comment "policycoreutils needs a toolchain w/ threads, dynamic library, gcc >= 5"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_POLICYCOREUTILS
 	bool "policycoreutils"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
-	depends on !BR2_STATIC_LIBS #libsemanage
+	depends on !BR2_STATIC_LIBS # libsemanage
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBCAP_NG
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
