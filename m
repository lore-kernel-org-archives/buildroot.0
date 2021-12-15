Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 18:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C4582835;
	Wed, 15 Dec 2021 18:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Dq6HflaPEnr; Wed, 15 Dec 2021 18:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B12827FB;
	Wed, 15 Dec 2021 18:50:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 569F61BF30E
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44254827FB
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCUHdU4oBq4q for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 18:49:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8EE1827F3
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 18:49:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u17so39860976wrt.3
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 10:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wjm7MZGTUF+jRPavaUY0IXSerrH4G8wUb9+o1W7EMD4=;
 b=Ynr3qVRhaewPaWEy8iS099/mYsf31XqGSPY0LkNdiKhh7fo3yE/0n4oHyIs/YEN5WQ
 KDDxPh9uodpPnw15NPnXvfRCh/Yx2odyCevXxcB/2WZlvdt2Qt6Xn6zbwotdDak9XLF0
 mhoPOKXHgtP01S2xPLonr7DdkKYzR4hlSvw99D0dxicrCv7RKlxHKr/owMLRVBDWoLfL
 aZTUnD4osBCtRKvJNLE0eKFRLtwTscWFmOp7YhK2m9beMRp0ymD43+Cm/mc8yrgx6Lm6
 eE1CwwrLREQ/mTTFdGWN50prATmIlilGkZI7KgPMv9ARAHe0w/i+Z1puyM2fL6NSpVNX
 vuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wjm7MZGTUF+jRPavaUY0IXSerrH4G8wUb9+o1W7EMD4=;
 b=NdZdG1OmkUWt5AOw+svy7mWBKyCafdA+88HqG8tYGkn6qNTwZNSUiOqcMn1XGhIKHT
 /xO9mhPvLuFvB70abpYEFFDWglbdzj0lrbuZJsCzcdmRHpu07kMmgnuvWpIYMuGODDNZ
 djavWXQybY648CE6tcnUbVQy5uKPDm1bo7ghOPzzeYX4yc40MDV4O7ehLXWY+HTqBkiv
 iYxBXdHjdafooz8+WpOfdYNUTnfGR7aY4C4l4nczm097B7Ywxfih1R2h/bATtsM3maXf
 In2QlDfr/dCD+Jl0FMBf/GEXKXtvZEtCrtslNXC3tffnGAvGvPVeKYqgxVXHC4EpY81N
 B2TA==
X-Gm-Message-State: AOAM530K6cU4qzHlM/Y4CffRM+tpK7tBWAG3x4rHy15qzLxu7v21fHGy
 kg9ZOYtUAxcwkGMUCN3ePixVdjg0eLnqAw==
X-Google-Smtp-Source: ABdhPJzqWKOCL4uvk+6WfyCHCPpVZoPEQGKo1NMJZcLmZSt1ZLlcP997cGA3EVA9WIJhQm9PR84G2Q==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr5799685wrr.522.1639594186224; 
 Wed, 15 Dec 2021 10:49:46 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id e11sm3483187wrq.28.2021.12.15.10.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:49:45 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 19:49:38 +0100
Message-Id: <20211215184938.21026-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215184938.21026-1-petr.vorel@gmail.com>
References: <20211215184938.21026-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/iputils: don't build legacy tools
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ninfod, rarpd, rdisc are legacy tools which are going to be removed from
upstream in next release [1], following previous removals [2].
Remove them now from Buildroot.

[1] https://github.com/iputils/iputils/pull/388
[2] https://github.com/iputils/iputils/issues/363

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/Config.in  | 23 -----------------------
 package/iputils/iputils.mk | 10 ++++------
 2 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 1a8b555570..97870d1745 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -33,33 +33,10 @@ config BR2_PACKAGE_IPUTILS_RARPD
 	help
 	  Installs rarpd.
 
-config BR2_PACKAGE_IPUTILS_RDISC
-	bool "rdisc"
-	default y
-	help
-	  Installs rdisc.
-
-config BR2_PACKAGE_IPUTILS_RDISC_SERVER
-	bool "rdisc (server code)"
-	default y
-	depends on BR2_PACKAGE_IPUTILS_RDISC
-	help
-	  Builds rdisc with server code.
-
 config BR2_PACKAGE_IPUTILS_TRACEPATH
 	bool "tracepath"
 	default y
 	help
 	  Installs tracepath.
 
-config BR2_PACKAGE_IPUTILS_NINFOD
-	bool "ninfod"
-	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
-	help
-	  Installs ninfod.
-
-comment "ninfod needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 endif
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 84059de330..6420720eff 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -21,19 +21,17 @@ IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # Selectively build binaries
 IPUTILS_CONF_OPTS += \
 	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
-	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
-	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
-	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
+	-DBUILD_NINFOD=false \
+	-DBUILD_RARPD=false \
+	-DBUILD_RDISC=false \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
-	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
 	-DSKIP_TESTS=true
 
 # Selectively select the appropriate SELinux refpolicy modules
 IPUTILS_SELINUX_MODULES = \
 	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
 	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils)
 
 #
 # arping
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
