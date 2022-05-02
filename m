Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2DCC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B1C0405E7;
	Mon,  2 May 2022 21:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OV27yj_rREuA; Mon,  2 May 2022 21:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A073A404E9;
	Mon,  2 May 2022 21:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E87C1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B0C7600C5
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuFIxVeSllqC for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49339600B9
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:53:47 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id t4so8701116ilo.12
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEEfS81ZxLb5G8ip0PSMAyxbBA7kMJJMTep+XK8OM2A=;
 b=b9o0XhcAwEkFbmlbSYVZ9Ax3JfQfTfxYJLeZZJJk8bxeFVPJ/LKU7A8U2uDzHaNF1v
 kM49lcV+mqaB8Z+t2Vq9e3h2pChJ/NAlN2yG4UhwH9o5WEzBR+RRShzXLP1lgV0s4Di0
 aKX7LHxUbL8GbkDDT+0QcvVW4qK/iKzD9R+WAc6MaDppYyCWl9J0fFEkJFLxUdqQHO5c
 LsEejgu0yHZR0818B9L8JrRaIbGB7wNgLiS+A0MicVapoqeZPJoj7gnhXl/2zgRTynjV
 22vvWzYjoVmafh4S00lwJue/mN9DT9ZyGc7QWs+k7iuQw7GpkbF2t8/4ud7KnY/NfjQe
 d2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEEfS81ZxLb5G8ip0PSMAyxbBA7kMJJMTep+XK8OM2A=;
 b=UCbWdQPqpeThF1jWiK2loA2A+PeezsQ33tPZCxlDFJHVEXnjFEzxsIyg7MeI47dW35
 ZzR2vliKVuN5XrQK8mD8kwcERWXdfhY1gXpPVzRcYw6xpVsGOMAdi15+cB67Pc7Doc/G
 vNpgVCUHlGkxZktx9zTeV0f8wMbk9sjZPXdbbPeYv6ODOEK1AOBecnwVrSCDIOpNIcBf
 8vAxFrlZuBjKBKjgys8DtyG3eoJ10GQySgotGdyx4igZoNuEXIc5K4dYniVYushlFvXT
 JHAESWHQYfKbxahQyXmd+R+jW32HSzjNZxAA9VxzXp/+ivoWQj+xPFFU1ec8eReTLhem
 lRZg==
X-Gm-Message-State: AOAM532dVySas4xtWza+GQToNX/XHe+h45Q35/RORQuF7kGlSA5O4gq3
 Gq2ytYH55gnU+3iEc0+fe4m4v/NDrfE=
X-Google-Smtp-Source: ABdhPJyDUA2m9mYpdBe/Itk4mOp8JPxmoIPG5jYgUeG/29DPHAmfCJunTzsf5wHKv1XjR/uGNktcIw==
X-Received: by 2002:a92:ca4f:0:b0:2cc:4571:3cd3 with SMTP id
 q15-20020a92ca4f000000b002cc45713cd3mr5268357ilo.110.1651528426107; 
 Mon, 02 May 2022 14:53:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 x16-20020a0566380cb000b0032b3a78173esm3366972jad.2.2022.05.02.14.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:53:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 15:53:42 -0600
Message-Id: <20220502215342.3485999-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/linux-headers: prevent invalid
 custom headers selection
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If BR2_KERNEL_HEADERS_AS_KERNEL is selected and the kernel version
is known we should not allow potentially incompatible custom headers
to be selected.

For BR2_LINUX_KERNEL_LATEST_CIP_VERSION and
BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION this means we should select
BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 and for
BR2_LINUX_KERNEL_LATEST_VERSION this means we should select
BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15.

Fixes:
 - http://autobuild.buildroot.net/results/816/816d7a3ad77ba051fff7fba7f2a38fc31549c360
 - http://autobuild.buildroot.net/results/3c3/3c3a9fc1a1e0002ae8169fd47b3003ebb86935f6
 - http://autobuild.buildroot.net/results/188/18883459577dc0fdc01149110ffb81bf1a28c94a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - entirely disable Custom kernel headers series when kernel version is known
---
 linux/Config.in                      | 3 +++
 package/linux-headers/Config.in.host | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4b4ea8d92b..82f5675f6c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,9 +29,11 @@ choice
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.15)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.104-cip3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -51,6 +53,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index decf02d175..43a116974b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -127,8 +127,9 @@ endif
 
 choice
 	bool "Custom kernel headers series"
-	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 if \
-		(BR2_KERNEL_HEADERS_AS_KERNEL && BR2_LINUX_KERNEL_LATEST_VERSION)
+	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
 		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
 	help
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
