Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D1FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 22:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3280F410AF;
	Fri,  3 Dec 2021 22:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-omEBFHiVDR; Fri,  3 Dec 2021 22:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C0A409F7;
	Fri,  3 Dec 2021 22:32:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70DB91BF9D1
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DF1A83C28
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AD5KjGmDEpV4 for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 22:31:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA4D983A47
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 22:31:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso5941706wms.3
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9iRinbI7wu3BIgQRALqCPZXcwufWEMsR5RwZVSZGihU=;
 b=iwrnHXcE3F9yasX5Z6DWaBNYwE7OS+ZkPnalu4FhZe7XxvxDe6yoUFzB3L6uc5ai4/
 3NPhnQdov6TAxGGTJ4etGqREVTw7WQSOx6vf78rXx6Rp6EJPSOB8LJdqXztC0l3rsQG2
 1nIxcCyPdQ52F4ljEQGaribw75IbRC6yQ59URYcxJTPOY8bsUtVrOqiDpx9WjORIEmrw
 QqzmqlH8aFK3J03ABSvoIEnn8Or+hBiA8L9EOIQC2VjwFErc8VrgYRhPsYLF7jz18DNA
 XuKbQcJJzdrhp2rXNXTHgHY3RZ95alYmB/gbTKfhbQN7p7qy04JndIv5FtwEd5z3JnDm
 CmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9iRinbI7wu3BIgQRALqCPZXcwufWEMsR5RwZVSZGihU=;
 b=x6qJq5tSS3SIbndGDIdoWjtJ2l5TASnREY0qJxnNBRJuzf/C/0RjNRnYDZL00o3Gu8
 UTBYzy4QL/hVwFBUThjmO36AiMpI09QbGKVPdh7H3JQO9D9ii2F7pQyL4ExvNqhoHwsM
 xrWPF65RKv/chnXDtCwW4q4ChIzFWvC0nJ9gM95kjCgzK24TZ9+xFrlX7gsraTOERV8W
 /kjcvFVA8wqGGVmrBO0vfSU1a1/CAoY/zJpWhF42mzGPSTrciv5uaVYVbSVU1xUYYuC/
 1R+HUvnEy9R/JbHSEp3s7f1VTHhaeODQ/tdLelryt3ARBb2nhH2XlHW306mDQB0kijqV
 YlJw==
X-Gm-Message-State: AOAM5311ULhUJD0Bjwg6+63nuxuMAA8SawQtJ6Mf0pLI7kEmBoyse1YV
 fIUtwf1qUpxM7OIo9bLCJ9813bsY3hEq3GtW
X-Google-Smtp-Source: ABdhPJykmETGlHpeVs8KUQ63ke0L3kvE9Exsvu9Yug4XGFVyRtQARIwBd6DYI/vKpAl6Ng168YTRYA==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr18598787wmq.117.1638570700058; 
 Fri, 03 Dec 2021 14:31:40 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id l21sm3801798wrb.38.2021.12.03.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 14:31:39 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 23:31:25 +0100
Message-Id: <20211203223127.274985-3-nolange79@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211203223127.274985-1-nolange79@gmail.com>
References: <20211203223127.274985-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] package/systemd: adopt odering in
 nsswitch to newer versions
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This modifies the order of the nss modules, reflecting the current
state of the documentation.

nss-mymachines lost support for resolution of users and groups,
and now only does resolution of hostnames. Changed in v246.

Multiple changes in regards to nss-myhostname now recommend placement
after nss-files and before nss-dns. See commits ce266330, f918c67.

nss-resolve handles the nss-files logic itself, and its suggested to
move in front of nss-files. Changed in v249.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 373e5c82bb..16202d4ac9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -563,13 +563,11 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 		-e '/^gshadow:/ {/systemd/! s/$$/ systemd/}' \
 		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
 			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
-			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
+			-e '/^hosts:/ {/resolve/! s/files/resolve [!UNAVAIL=return] files/}' ) \
 		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
-			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
+			-e '/^hosts:/ {/myhostname/! s/files/files myhostname/}' ) \
 		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
-			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
-			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines/}' \
-			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
+			-e '/^hosts:/ {/mymachines/! s/^\(hosts:[[:space:]]*\)/\1 mymachines/}' ) \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
