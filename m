Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065D8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9931240299;
	Sun,  3 Apr 2022 09:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4T3Bc-WaKegr; Sun,  3 Apr 2022 09:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 710FA40260;
	Sun,  3 Apr 2022 09:23:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FED41BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51D3B60BDD
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2yBNJGYmgec for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:22:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E08960B78
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:22:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u16so10215565wru.4
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L4IViUUymkDMYZHJqJFaceG/eCYMRhCwRIPlZ+jGibg=;
 b=gstcDgOyqM+xL6eVJFazdSUq+NDGzMqfUJSVkAa9DG+ZMrVNbZWSFTQymnyVSRyWtU
 YwSggJt3qnVWDdDvtc3KSvF7dU6XU4puHbCZwDmAZovdGCG8n5Y/cttVEijcueI8bpEX
 dbmsH0wSCj0nPOsJlRW3XsfU4mrdZt+MuzxLi3OhPmN1XVG51w9xNtWP5T02AXj9zHCl
 /I3ApIFPFbOB8JdxGLCKJurxGD84ek7eZSLgC4NnxaWuWX1Z2uC74qeKA74bmjRuPwpL
 cZa3BhV/mE+JJQplFdFBpPBArwn+yliChWHwt23rRENVEWpi2FvqctzL2evu81+8vLwP
 1R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4IViUUymkDMYZHJqJFaceG/eCYMRhCwRIPlZ+jGibg=;
 b=jxlhOJP7fLSeqDDB2XvTKio0dSfGjYL2JVQ9iENWkojqLW4EbBACIlNucsz/RlF851
 ftTZXB8c5UCmATeblTpt4ugaydXvSygzxpg66lOGa5STcTxgGgd8PaFs+9YRUeIpNZ09
 BDW9Jss8fU3bUbm7XU+eDFEenjFu+iYdqTLDDHCZ8eqHPBMD/QnwnCRsecdTyOHF43pe
 16Sxy5fd26ZFNQEI59gRVgWGtxHy0WQEGa9GDnJw8cCHmPnza+G5pl0ckYIHIpjuLmwJ
 zFb1o0JQNCcYQ6bdQ9fFOWo7yGDRrcM2odfeyIVCA/L9YLYOXduAszs9feQZHdMoFMMT
 yEag==
X-Gm-Message-State: AOAM531vmpI0FR/Wm3ORUosn+uaN6zbrgXWAb3nCiAY/xcOuj+w8u7P3
 SzqpptNtWB1TRjM+jAXTB1ZNylhcD1Y=
X-Google-Smtp-Source: ABdhPJxFJnYJmfhWgO/tHGGUjclgZY+a9uQrsufOsr/lljeunFadeV/L5hoFmYU/f2l77WGwbOC2pQ==
X-Received: by 2002:a05:6000:2c4:b0:204:14b4:e74a with SMTP id
 o4-20020a05600002c400b0020414b4e74amr12947096wry.608.1648977768738; 
 Sun, 03 Apr 2022 02:22:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a1ca102000000b0038c78fdd59asm14384882wme.39.2022.04.03.02.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 02:22:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 11:20:59 +0200
Message-Id: <20220403092059.2320843-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403092059.2320843-1-fontaine.fabrice@gmail.com>
References: <20220403092059.2320843-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-weasyprint: needs C++
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b33e39e3ea5078cc80d9658e8af63049189bd475 forgot to add C++
dependency from python-brotli

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-weasyprint/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 4a7e5a513d..7fe99c3951 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
+	depends on BR2_INSTALL_LIBSTDCPP # python-brotli
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
@@ -14,3 +15,6 @@ config BR2_PACKAGE_PYTHON_WEASYPRINT
 	  The Awesome Document Factory.
 
 	  https://www.courtbouillon.org/weasyprint
+
+comment "python-weasyprint needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
