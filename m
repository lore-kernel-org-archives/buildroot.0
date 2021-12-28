Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B75C433FE
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 14:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F864059E;
	Tue, 28 Dec 2021 14:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVGOjy6NYIXD; Tue, 28 Dec 2021 14:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82A5F40162;
	Tue, 28 Dec 2021 14:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F96B1BF471
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E2A40162
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OaPu0dag1yIW for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 14:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFA0A40144
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 14:55:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w20so29862909wra.9
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 06:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xAxZP4cDmwm3gAmYsQnKjRm1DhwRX8zav53uytdrTSc=;
 b=jVRJ1T0RY2FeqS09kHSVTOe9z/FLDn0BG2A21GzsxX1Pe+dgV20bpT1J+l0UgtK6vA
 cgTFp7dny5oMn44l5XH+4Pkzz1ZKgUfDhdW77/BJ9ibKknskmVT4Yhdo9x5zT6irJxzc
 +ZHFKa3/HICmyaQLODAoN5XAuuo0fl9OOFdw1ByjtuFPTnk67D2c2buKjrp53Sk7Emdd
 s5VBMC6U9bUop1r+1cF4/3htYSdi+D87xaaiL9uYCaSvxETYFU0r0lLG79dGHJaeVbYM
 RFNQNMR8BGQka6BHWEL3WDcK7urmKVb2HQAd7JqR/aFATKm5WfQjgEkDg1JCSgEzJTtt
 SYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xAxZP4cDmwm3gAmYsQnKjRm1DhwRX8zav53uytdrTSc=;
 b=oBRo48NMR61Z0qzv3H5YY7pDj8cGzXq2LgMLIPI+6onXHpiM3g6Z3VuHa+5PbVP2Mo
 +g+3Y3WuZ16keTTfE47iHe8FFDSWhbZiqx5v+w17LlFcRD8rr1RpXUafU/wUNBf9yu/A
 Y7gwzntLMDd4jyHZpbalaqfm+utWqYVs/ZlwwOcDDrG95EBBXzHU32XnYQoBVV32sYft
 VZYG7v81McCuhlWkOsOP8qqN71Q2PtMs5x4u7CV25f1QRI5mkpbfWAPZBHebudOZaN9P
 NIB3x5/pAvXnJ51x6JBy7fFpngvtvUyetKJ9FvGdyeFRtWu4SIvkfBphvAmFaJMKbxQ8
 mTEQ==
X-Gm-Message-State: AOAM5314MpWWMKIXyfCmut/m+9lBNTVSl5h/P4l2DVkYA2jFuQCKkYY9
 wRpTUzEuQETtOTY7EgNhC0JYySLq1tjMJQ==
X-Google-Smtp-Source: ABdhPJw7Z8kwPC0zu8LkGk6yss/EA7hKnnsdFAEdJu3Tl0GV6EkVmwrDs33JjGVfkvSFrv5yWIHfzg==
X-Received: by 2002:a05:6000:18a5:: with SMTP id
 b5mr16559680wri.24.1640703303892; 
 Tue, 28 Dec 2021 06:55:03 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id 9sm22781729wrz.90.2021.12.28.06.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 06:55:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 15:54:23 +0100
Message-Id: <20211228145423.4063094-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/atkmm: bump to version 2.36.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to meson-package as configure is not shipped anymore

This will fix the following build failure raised since bump of glibmm to
version 2.68.2 in commit dddb65efbdf2c7952f22a1e51009f17f1676db4a:

Package 'glibmm-2.4', required by 'virtual:world', not found

https://gitlab.gnome.org/GNOME/atkmm/-/blob/2.36.1/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/0c4932738aa509f582074f399dfbe1c70ac74070

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atkmm/atkmm.hash | 4 ++--
 package/atkmm/atkmm.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index 42cc2d7221..f965ad29cb 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.24/atkmm-2.24.2.sha256sum
-sha256  ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd  atkmm-2.24.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.36/atkmm-2.36.1.sha256sum
+sha256  e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458  atkmm-2.36.1.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 234a937bba..3bcb941c9f 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATKMM_VERSION_MAJOR = 2.24
-ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
+ATKMM_VERSION_MAJOR = 2.36
+ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).1
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
@@ -13,4 +13,4 @@ ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
 ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
