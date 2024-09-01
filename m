Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3790BCD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 21:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F6D810BB;
	Sun,  1 Sep 2024 21:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GMl72S-Z7CX; Sun,  1 Sep 2024 21:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F8C81118
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F8C81118;
	Sun,  1 Sep 2024 21:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18A681BF584
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0EE4013F
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4lRImzbGW9o for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 21:20:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C04C9403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C04C9403B4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C04C9403B4
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 21:20:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42bbd16fca8so19268205e9.0
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 14:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725225640; x=1725830440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UQxMlV+iDNso/TMvnMY2URcibdSLzQnagrmxrcfkJhg=;
 b=nF4SqwMNydvV9VtgN65w1hadQKJqi8BZtXZkQTzoNgAQgMEzi6CImuwIgA2XmQxPmV
 G3ubNaJ6O56/HWwXpvEd0XkUxpj0npG1zWn5ex5OBUZtDxHyoeFXCWK2k48ID/1vGzS9
 EIN14/u2n5HSHbkj9utEuW/nu9FlVbZmhxDPFoe76UGECpo2Vx9kvhVS8wb9slCG8tmX
 wa7kz6wACczGNaxkhD07d+iS3UsVqkKvSAE9z7z99FBwGXurwt+YyNV/NNCjHXl+o/rx
 rxJ5yB7DOkclNYQHEpWoxXu3EwjT7osuf8Lvya9VVFP4rJM9KIxBUs/OHZ0qhmEjm/e4
 bRyg==
X-Gm-Message-State: AOJu0YxW1iaHekd8ANrmDfeNPjR+vJieNWTbFzGb2YAr9PVFuYa5AY/k
 uWbfBnDUsRL7GewvYq6/DK6ngNuQGS5chHgcaTBgso7ZlleytDFwFjTjGg==
X-Google-Smtp-Source: AGHT+IF4nyKX2RbzNhoE8OW00/9/Fhf6aXt6HG7m4DiGn8upGD13zZ0psZiMY/H7C6APnWMAxQ2D2A==
X-Received: by 2002:a5d:5049:0:b0:374:bd03:ab7c with SMTP id
 ffacd0b85a97d-374bd03ad51mr2875473f8f.33.1725225639591; 
 Sun, 01 Sep 2024 14:20:39 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4a5edsm9742102f8f.1.2024.09.01.14.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 14:20:39 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 23:20:35 +0200
Message-ID: <929c7ee2be2e6489caf80cf18425fd384972f813.1725225634.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725225634.git.yann.morin.1998@free.fr>
References: <cover.1725225634.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725225640; x=1725830440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQxMlV+iDNso/TMvnMY2URcibdSLzQnagrmxrcfkJhg=;
 b=FgjPiS9SSpI/7h3pJ+SKTyOqKU/B4xcv5UP+67SDetU2B4Bv9eua8IyUT5kt8TEqlN
 UNfYo2+aynvQQmcuPEakx72oLDer1mT0u4IGkbZyuBaeU896bCL0GTnhO9KZn/6zSUp5
 H1ZWt6fESL4fw0zVFCgdDY4mmn3itSjsPyECZ+14Rzp+On5SfnI7QBfFWliX+qeSKyk0
 ZiiHE9HAn4jMeMuVr2oVIw84W+3np5QUeSig8zQi7UNbPc+enSrjQFm2UlSXqK0NjBXo
 xgr/7OgdhsbrElVnLIN9wZD0+lDWO/3t3+RzlYfctPAKzn3icoWIHLQtFBSR8tgWigQ5
 LHGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FgjPiS9S
Subject: [Buildroot] [PATCH 4/6 v3] package/gobject-introspection: works
 with musl now
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current versions of gobject-introspection build with musl (Alpine
dropped the last compatibility patch with the update to 1.80.1 [0]), so
relax the dependency on glibc.

[0] https://gitlab.alpinelinux.org/alpine/aports/-/commit/528c4ee63970fe6ee733b6ea99ef7a59a8f108ff

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[yann.morin.1998@free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index b8a9e244a6..042760b430 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
 	# cross-compiled python3 must be installed to staging. As there
@@ -42,9 +42,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "gobject-introspection needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
