Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859CDC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 09:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FAF082308;
	Mon,  5 Jun 2023 09:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FAF082308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSzB_dE0Fbp1; Mon,  5 Jun 2023 09:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B8282661;
	Mon,  5 Jun 2023 09:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B8282661
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF911BF3D1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725F140195
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 725F140195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38XpMK1GJv2P for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 09:56:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A5040141
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A5040141
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 09:56:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so5718386e87.0
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 02:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685958973; x=1688550973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQ/D5sykRs1dDX4LM8FNPbwC1dt2gDzHCOEF6NoS72o=;
 b=Lff5LRzbmscOSIZuWBQdAGxmhJj4K2QyoneMEvZ3YFNjMi5p26TT5qFsT9+dOlplhx
 knZM03Bn9O1u8ms+SJLagF+ON+FhA/nBTzqvh9/7XKsdM9iURXC1fA0+NxacTeSkmHGk
 ujmMoLw9y4V825h4jpFu/w406ME2a6XEgYgaSE+8KekE/MEA/PfYO8TGeAJIWpeEKJ2F
 h9GpVyOWv6ThMC6tKH7siEzhuWVN2vizQiQduTkwB8+3Ruq/ti5YU9UazaEv+bI124Lr
 qFSoAChGanNGS4ewylInYo+Yn8XE8JvEEfUuwfSni1tgFeTyqwvoet9FGM/5SHbsni3u
 JjcA==
X-Gm-Message-State: AC+VfDxYzByhHf8bfKWlRxP49iLhYyJTYdiL1Ru4/mEn1Vg2cF/5hXgO
 XwdjI4WeEw4jmT8DmlBHaFfMY+0TiSw=
X-Google-Smtp-Source: ACHHUZ7Cg1n0QROZBBYVwI7YascY7lngGZZQoPmR4YLq7EXhoBM1ZJEmhKntm5JhJUtlqh90iCg6xA==
X-Received: by 2002:ac2:5473:0:b0:4f6:1805:6080 with SMTP id
 e19-20020ac25473000000b004f618056080mr2739310lfn.4.1685958973013; 
 Mon, 05 Jun 2023 02:56:13 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a7bc048000000b003f4b6bcbd8bsm10291176wmc.31.2023.06.05.02.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 02:56:12 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 11:56:07 +0200
Message-Id: <20230605095607.332091-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230605095607.332091-1-romain.naour@gmail.com>
References: <20230605095607.332091-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685958973; x=1688550973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQ/D5sykRs1dDX4LM8FNPbwC1dt2gDzHCOEF6NoS72o=;
 b=qNenJOL7uxR4jb+/UVDOiy0F7T8SmT6K3QpX5jQ82MeeZvTGXYnb9FYVw2G8WZ4uAz
 Hy8vSDImA6OkluITVWpSdxWIaX9afxI7KZNQUPQsQxyneVBFzIaYWR6MTez6x91SOBQ+
 4+AtDvd9fK7aOskxXzVb0AnIgtq7Z3WIrU8wYct+/eZujFnKnE16qWEWyqLvckWzUZpX
 EKs/2Ub0syRzz+dSCrMd/2kz5EcN5wVfrJBM1LHpgdqqrr0fKYtDXdI1aKk5HGgEE6+m
 zRFbnOrw+sHpjoyqLQFD4TrTsCfVaQz2LLSiybkUkyMuGW1/3gMNLbu1XVLuyh6UJTBn
 /INg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qNenJOL7
Subject: [Buildroot] [PATCH 2/2] package/libjxl: requires host-cmake >= 3.19
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libjxl requires cmake 3.19 since version v0.7 due to the
new behavior of cmake [1].

-- Configuring done
CMake Error at cmake/FindLCMS2.cmake:40 (add_library):
  INTERFACE_LIBRARY targets may only have whitelisted properties.  The
  property "INCLUDE_DIRECTORIES" is not allowed.
Call Stack (most recent call first):
  third_party/CMakeLists.txt:114 (find_package)

The portability issue has already been reported upstream [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095

[1] https://gitlab.kitware.com/cmake/cmake/-/commit/afb998704e67d3d3ce5b24c112cb06e770fca78d
[2] https://github.com/libjxl/libjxl/issues/1425

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/libjxl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
index da04b89f9b..923560298f 100644
--- a/package/libjxl/Config.in
+++ b/package/libjxl/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBJXL
 	# libjxl fail to link statically due to libatomic issue
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_81426
+	select BR2_HOST_CMAKE_AT_LEAST_3_19
 	select BR2_PACKAGE_BROTLI
 	select BR2_PACKAGE_HIGHWAY
 	select BR2_PACKAGE_LCMS2
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
