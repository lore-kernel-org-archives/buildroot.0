Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6002F606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jV5YNhko;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=cJlHu9sr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF1980C38;
	Wed, 25 Nov 2026 16:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lBunQnf1prO; Wed, 25 Nov 2026 16:14:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D9B080DF9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795623280;
	b=rK2C/f39DPYpCX6oDXQbq9txurpNhZqmmWSk5bneLmSsZPx+YAMFWpgVqu9qZ8o2h4fq
	 4A/c6HYFL8MEcHQALiCjYmwFKn1oyX+2EaK2lmjwLSJ3nmrl5Xd0babAnBOe49bmA6DeE
	 UO8enqx5DtGqvjMxFQBcoNkiRgG3WOpdVMBH/ChgH0Us1TBYDtQkpsq6H1U8SA6LpJrE2
	 5nG5xHBU2xbBBHhbdNiqq1E+jUBSJGJiBFJE9+6sxj+DlT6rn0aw6lP4d/0UwAsZwdCK1
	 7mtMv3kwbrYx/Yv2MBBxYmGH0iMpdvkoVjGgyMuOtk8iA+ickWKoLjHI1CMbaLE/zNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+a0TiyVvtPvYwLrkW8Zf7grq9d65MnuXscq8+myuYyU=;
	b=X+vYYwOEKka8ZJe8ZAT0BpG/eZEBtiKkyKiM8deB1zHyZ6FiocXIEQFrtkpWdZ6fG4vA
	 6eCIS5vTGM7xXyQYhyocY5Df/76V8rvZFEL3dld3TPRof2oxV4l4zjXPDkNLoJC0tKLdg
	 4dan9Q17c/ppZhZ2SOeXiTCiQtmRwTvvhkDO8Kpc557iN3+zR1Br7D7Cd2tB1aYNsbdb5
	 l3KjOrz5yDSKZaW8990+u61HrOBuMrZd7zRGqPcOg84JtFnts2hR8uwpCYDDQetzg5D5X
	 p66pj+j1LxoB/t5bUpSiaJ4VtJ3+rgVw/wyNuWkTENF2e6S25ejXQl71FydUSvaqarA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795623280;
	bh=+a0TiyVvtPvYwLrkW8Zf7grq9d65MnuXscq8+myuYyU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jV5YNhkonEK696EPGtKp2V7nRiDRx4b14Mn3GuMpMss0TSrwclnWADgOb2czMQ38o
	 rdqdOz7Jm6f4mpWfSbzwKbLHNCMb1NVSOyX5X4uoXLg9+Iu0nIgOsnbwBIQcOAoi2V
	 oCD1rRt7IQrlA/qhL0RKphX3v2Y0f43z82/xq7T2boNHk+Xfp2cZXVTbRVtgqaZMdT
	 jaMAABpjgTjZ8zMXb30n0HYhQOSctMwC40sQmyFwqSpKhCcNkFyGxy+0XIT8r2EVfs
	 EdP9ds1Td9oKcS6QhYHT8QI+DZXuZwzXzl9NO1N5TcOVi2SSt7mI9C5WlVQ9tE4HBe
	 5hQ/W9O/S26+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D9B080DF9;
	Wed, 25 Nov 2026 16:14:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 057AA26D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0390A40116
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woOnON06_hsl for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:14:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E01CF400CB
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cJlHu9sr
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E01CF400CB
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so43025315e9.2
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795623270; x=1796228070;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fvAZRQkxMcxg/m9Snkt/ZTAFKXhEk8gnS+d6R/oEtuA=;
 b=cJlHu9sr+f/4coi98+bH1vTIuFPlkfRcKQO6BsS4XhH4JyMfSJdhKVVoU9ofgEmJvF
 Io1Ax6cnv5G3T+j7kUVfuHUXqy1Gp1YdpuTph423byKhwU2GZqJHOGYusWjvVJJE1KVO
 siqbnHt1RHKi01G03Wv0LAePG1Hrvt4e17kAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795623270; x=1796228070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fvAZRQkxMcxg/m9Snkt/ZTAFKXhEk8gnS+d6R/oEtuA=;
 b=lr0NDnurRXGPPXtvS2ng4+pHfON9Y7ctk7C1sEOPJCBBUG4W36st1naWI2eXS2fYeM
 +qAFkefYYNnzUv2yzAQHKTV26il6PRvbuGyOX8bXd1eUaK7YW5958hp0FouioU0tGIfd
 sdsXxHJRIAuZDKpq+c+81u1VEPPKFgX2C+NaPpTuZa3Av3na+8IEnIrEbm3upfyac4In
 5X9laZJ+AJPr5v+BIqS2V7sV0CuwI4/+V7ho6fMJbhrntHtgf3VPlo6XhfSWeHDTLU8Y
 KSw+oZFJxfVowe1s6JTG6G8Er/9OcKuQskFr0DulWKYz2Nj1UdnF3oiGO9qyAkxBVFmU
 CGTA==
X-Gm-Message-State: APuU4Z/krj1KcyYu//SuogatV9qNGZBgaxAfsrAG7J/qlTeEHqqXF6d4
 oyuFqe+mRsPH7GJB/OYtpVwfOfBX9X9bFHNPHBnwur53eT7TTz44kN1shgnou8IJhZEwp7NzPs6
 E0GGJ
X-Gm-Gg: AZFdTZdlUSCR8j85WPSJPaoosd8aO9aVJ7yrm9Ygg7W22kAbXK2R8h2wNa2wNL2qub5
 uaZQy2bWRLoRV8rTTfVis+QEn8hSSpwLavTeIFZ20SSEDGMkEwpsiLLfY3MmlbHgyj5btRADOPj
 Jjk7UECJF9yqfqDc0hNS+YZVUnimDJBDZ5SW9NJ7ZRk53Q12PcRUiyNXd3g2kPMlKiwyeOdoU6r
 QajUWLkPmoqr/Vs1s5d3DbOAtAxv/E0Rk+JwfpCbtXjMwooHmIpIb+zZY9iAwAudNf3fICauo/R
 il27JW28QfhQXoiEQHVuA1hZvGUnNd4HOL8439RCGuAr0FUvg9XhMJR1T+lhA+ZuqE73xzqpxRj
 02B53/Y2rLEY2CNrTBHrwKluDpPBS6o5xQlgo1qzdfhPZ/H40lIOzBY9Xqyr1hufpZPkom7OnSc
 9TvaeSV3yYIeTpooAbcoNaxCK1DsKLS78iQWKValVUDoJ0sDmBDXJbfLWrKFX9Yi7FSNSBcgz14
 bv94tH/Y6j4pkBbp+bXPmjgxKWArdmRhfxlH8zxc72BCQmJMdTuHXxOlT7aQlX1HcbLKBXlNudX
 1xPiXcQOENf5yFpzdfwhqM6B+ED1+CTEXyujqg8dBa6YbAYo7x3ukguYhuIMjPrHCfUvGKDRJgx
 cb89TkQl5XDNhj5SPIfxA7FgHWRZDWuP5FN91838JX9Tgce5sGRf3cyMlRPVHPLtU3LbuEecJJb
 gVaSwfp3+dLup0n+0Y3+JszKn6r/f1b70F86e9+ZOnPg==
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id
 5b1f17b1804b1-4bb887c3b63mr398773915e9.4.1795623269854; 
 Wed, 25 Nov 2026 08:14:29 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm430741055e9.0.2026.11.25.08.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:14:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:14:04 +0100
Message-ID: <20261125161404.859000-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
References: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 5/5] package/canopenterm: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CANopenTerm is an open-source tool for developing, testing, and
analyzing CANopen CC networks and devices. It provides a technical,
no-nonsense solution for professionals working with CAN CC-based
networks. Additionally, it supports SAE J1939 and OBD-II protocols,
making it versatile for various applications.

Project page: https://github.com/CANopenTerm/CANopenTerm

Tested on STM32MP257F-EV1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/canopenterm/Config.in        | 27 +++++++++++++++++++++++++++
 package/canopenterm/canopenterm.hash |  3 +++
 package/canopenterm/canopenterm.mk   | 23 +++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/canopenterm/Config.in
 create mode 100644 package/canopenterm/canopenterm.hash
 create mode 100644 package/canopenterm/canopenterm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 88d5ff1b7080..8707f6888fff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -828,6 +828,7 @@ F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
 F:	package/bc/
+F:	package/canopenterm/
 F:	package/canvenient/
 F:	package/cmocka/
 F:	package/connman/
diff --git a/package/Config.in b/package/Config.in
index 76d2743430ad..cdd740ca351c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2458,6 +2458,7 @@ endif
 	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
+	source "package/canopenterm/Config.in"
 	source "package/casync/Config.in"
 	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
diff --git a/package/canopenterm/Config.in b/package/canopenterm/Config.in
new file mode 100644
index 000000000000..9eedf9a6e585
--- /dev/null
+++ b/package/canopenterm/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_CANOPENTERM
+	bool "canopenterm"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS # sdl3
+	depends on BR2_INSTALL_LIBSTDCPP # pocketpy
+	depends on BR2_PACKAGE_LUA
+	depends on BR2_TOOLCHAIN_HAS_THREADS # sdl3
+	depends on BR2_USE_WCHAR # sdl3
+	depends on !BR2_STATIC_LIBS # canvenient, isocline, pocketpy, sdl3
+	select BR2_PACKAGE_CANVENIENT
+	select BR2_PACKAGE_CJSON
+	select BR2_PACKAGE_INIH
+	select BR2_PACKAGE_ISOCLINE
+	select BR2_PACKAGE_POCKETPY
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SDL3
+	help
+	  CANopenTerm is an open-source tool for developing,
+	  testing, and analyzing CANopen CC networks and
+	  devices.
+
+	  https://github.com/CANopenTerm/CANopenTerm
+
+comment "canopenterm needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUA
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/canopenterm/canopenterm.hash b/package/canopenterm/canopenterm.hash
new file mode 100644
index 000000000000..2b8bf504efaf
--- /dev/null
+++ b/package/canopenterm/canopenterm.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ef52877a6da48f0c60d934020f5387367d43ae769d144d378cb4e42fa0a29d52  canopenterm-2.04.tar.gz
+sha256  8c1f56d8bea303fb856c0bf7a63cbb91e81e2441bba1bb9fd8a314909b0e10b3  LICENSE.md
diff --git a/package/canopenterm/canopenterm.mk b/package/canopenterm/canopenterm.mk
new file mode 100644
index 000000000000..c6c1eacfd42b
--- /dev/null
+++ b/package/canopenterm/canopenterm.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# canopenterm
+#
+################################################################################
+
+CANOPENTERM_VERSION = 2.04
+CANOPENTERM_SITE = $(call github,CANopenTerm,CANopenTerm,v$(CANOPENTERM_VERSION))
+CANOPENTERM_LICENSE = MIT
+CANOPENTERM_LICENSE_FILES = LICENSE.md
+CANOPENTERM_DEPENDENCIES = \
+	canvenient \
+	cjson \
+	inih \
+	isocline \
+	lua \
+	pocketpy \
+	readline \
+	sdl3
+
+CANOPENTERM_CONF_OPTS = -DUSE_SYSTEM_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
