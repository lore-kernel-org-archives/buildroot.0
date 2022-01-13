Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426D3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 08:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91D42409C2;
	Thu, 13 Jan 2022 08:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yygvzc2625q1; Thu, 13 Jan 2022 08:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A267409D5;
	Thu, 13 Jan 2022 08:00:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13D271BF5AD
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 08:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F30AE60AE2
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 08:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2ZkmGKaq_26 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 08:00:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 985A76FB82
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 08:00:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so4889735wmo.5
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 00:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=636OnaEle8kHb7WpAKJGkRA02dedERL7vA7lfq5sWWs=;
 b=cY+MSdUtj45F4dCwzSqkIcTco3NV70NEIcZAh195G/rQ58fJCYK1D901aeSbonBPbO
 vbcupqlXU0nZu5O7yWaBurVGr/CXWK6yJ2P1UnximuZ3pukV7Wi5xh4UDUEM4geCD+V9
 rwVpammo2YltT7KfjeeJnQpXa1d0obcYVgY4zNMXT3U0bNq1ebwAMP9ufn0YDkBlv6Fl
 2B/Ea8txrMFqkL9o5jetcZ20F5PSNaasyeWXP8cZuGg5kDDfBOSdUwI17wlSO43ZqYg+
 OlyUmBuyPNCecfISH/J0BBiHeXcCl48AAIyhV6zyOwGHmjI5KAh08eHp8a8ra/fZAX+4
 0Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=636OnaEle8kHb7WpAKJGkRA02dedERL7vA7lfq5sWWs=;
 b=FsiX+OOSypez2CSwJSdhG9O15hSMG7JgfGLOeoUiRwiZE7gbz0cZRRZFB8zETjGxUf
 ICvswnzBnkkbaqIxejYQLNw/fLBB7pnVO7PciUuB66CngN9vxiw77gfEmp58jD72nMja
 7ueRICccD0qw6WI7Z+Zil9hF975b7wgAxqPVfAkFrlNc2WZdGKzPngQWnEYtQlAGFII7
 umQA6swUR8gndscQZnAmISjaK0u0N1RQCejtMJBGjeVmJ02R1PoKAIue2RhAfY+PCSnF
 ygVb8f+EckNPU6e6gw2aucn72y4Kw1DPqid9FmpAEr2cNUCccAzPT4xfmiJ7HUxyhcCM
 jaxw==
X-Gm-Message-State: AOAM532JZsSLCw96rCdD5J8krFPUuZVixW7350usIj0wXcHLWRAyANZv
 2EaJ+qDqEzvuAZcyl9UhIdnxJVfhmKc=
X-Google-Smtp-Source: ABdhPJx/U7Nuuu53yu1yLUOY65wfhsajTeiX5Y/m5ZwscimpQuyiYfNTwuNmz0A2k2WTAFHYCJB4dQ==
X-Received: by 2002:a05:600c:b54:: with SMTP id
 k20mr2792711wmr.96.1642060823717; 
 Thu, 13 Jan 2022 00:00:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id l6sm6247112wmq.22.2022.01.13.00.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 00:00:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 08:58:47 +0100
Message-Id: <20220113075847.3267080-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglvnd: needs __sync_*_4
 intrinsics
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

Fix the following build failure raised since the addition of the package
in commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:

/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/EGL/libEGL.so.1.1.0.p/libegl.c.o: in function `AtomicIncrement':
libegl.c:(.text+0x614): undefined reference to `__sync_add_and_fetch_4'

Fixes:
 - http://autobuild.buildroot.org/results/a204953020a714057ec6690e63a3ad8ac621acd5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglvnd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index 2d99be8632..cd19fde582 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGLVND
 	bool "libglvnd"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  The GL Vendor-Neutral Dispatch library
@@ -45,4 +46,5 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 endif
 
 comment "libglvnd needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
