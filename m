Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C377606A31D
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OkPRpSEs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5731A407C8;
	Thu, 29 Oct 2026 11:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KHJuDPbpj77; Thu, 29 Oct 2026 11:11:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BC84407C9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793272267;
	b=SyADreFwIh1IBEuSMr2tvfLsQPRrXhBA4xWKpiucg5px9bEeBASNKS8MrjN9vlTlacSN
	 7dwnBZ0lVKKnPP05oOjFNqCccmy/vL/fJ2s5wzTymTxYsbNvdLek0tLuMFlZ0gAd1PeeB
	 wOWUoBqnE6o6ZMuXcE3HIEIroLgbvaWhRui82KJMPN7Ui21S/mOJeoZbajfPfQDd2lJ8/
	 72kAg2Up3AKwfapgAyTpDZWIru1U5COFzjqdqzWXeACBIyeFY9BX5uqSCFm9e99vN+HXD
	 Dj+OOWLA8o4rLNfe/N21NRxaUT2ORtcdm3hT7vDHReNYZe6m74RMPy4M6edBG2t4dJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793272267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QkpouhLrFuKGHp4iZ55V9RkRYZcQuZcrt7MCjZiwT84=;
	b=QCaBRfu773H7ZPr7r0CfmxQ+Tj3vL3CuTosYpiZ21m+Biitka8cRLyopELoF5Ga0Kscy
	 tmyzHqrRoH2ThaXjlzEMtObPJyWO/tvo/na1LO6gKWm/tIDldG1G2ECeLOfi0ASyZ90w6
	 O81MqqM7P8I1PyQsCbFCOiUYapLtm99KnNeeezPYP9cXi7wxMBbmPS9zJBn4fKGQDzQNb
	 tyLLmNgfpNSDpOG9fcNBCoiaDCwq7aej7J003G4cc63jX1Icf+MDGSXGA0+3HlmoJUZmI
	 WptjNws5UHJF02uRzZ5rq74HSEuAOyK0v+L4BZHhn4Qpx1QP2mzt3PVKpfWLAaiLuNQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793272267;
	bh=QkpouhLrFuKGHp4iZ55V9RkRYZcQuZcrt7MCjZiwT84=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OkPRpSEsMydXDfWxLENMREeAVtjEW0Vois0JAMP5m8iM3Nolgz9mn/A+idKT2d16C
	 aB7/Ps+Cxu2v7ZJI7Bak0h17ro9MtSSp576klhQi2/g089YRLTYODP62qI8cOUp4ZV
	 e8FoBkmDR3FKR/4lzrkJmLLM1wwIdqX07shxEQmz6ZX8lhe/uem1SPQLM9oIZEGQ+M
	 RMtU/0DQlFKgY1eVDXhVw8itI97k2TTibvDudhaPTQutWKJkwMN06dIXC/+ZZ/2j2X
	 5zmmWbPuiS0m4KSIDS4OnWcHj4efr4g0v8EMmFl4q3T4Gxs1/aTvsLmwCMNJUajKTC
	 SotOfpHcfSzqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BC84407C9;
	Thu, 29 Oct 2026 11:11:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F9941DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 11:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61C94407C9
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 11:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e6rAeS8CKjn for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 11:11:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E0CC1407C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793272264;
 b=mzGkuUPkFbDMMhBDR3SK3/NxurfvVjiOa4SuAKYe9hZp27RrNQtOiVKjZ4Su3GoiJe+I
 C7HinU/1d5K2/YlbU02DXredRA0Kp9yHLXSl6lHwzDKzTheXouqTiMSjgy/NX/lm3XQ6r
 IavfSF5FhWLo8v6/tznWjmknhTNrMeYk/Hl0zIGBa7Eu6Ae9MQd7FH63O3931wRcKgbaT
 Vf2dE9+/qXCTWe8fOgujtS8401E0dpvmwL4uW3LiSCg2xtllko4kbDkP8ehm7Bm+4at7T
 RZ8RxqsqRpjQHW4YjMxeeIfxq/YaGZawSK4AtwbIxMUYPNVNQaNi/zPnUcLNP1bM0fQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793272264;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=cXKvA1j4jymWG2i1f69ZFF9ewM9kuxmlPhJNt0E6GB0=;
 b=s6nhapk5vEQbp7ypauGI/23XHqWQw62DHFvGihbY+D8lbQzJUJemYBmf1UOEOCZ8aso+
 wtQVIIKAq/3jNUngvT9r2F4lDoyZzKz1rzTIH7RQzlnz2QzNa9X/n4mVszVLkRZ0gGWY2
 3ipw6GZurXkndCq7b7K1T6V5dw7t6QYhf+gvTpVzEI61oCMiTKqvmzC/ruCi1IHccxmrL
 JTI+EHeEpAY5E4RCSlr5qCh6fDY33IugHueyYcBs/oQFArCwB5GcCs+g/m88rOCPx13cW
 itL/Luc/LgwA80rL0ocKT3gKSqb2dBWZj7HhPHJJka7J2FUDSmt6JWGbkgMGk7PSr1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=vCFYE2cE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0CC1407C8
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 11:11:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c46bd7a7345so112047566b.0
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 04:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793272261; x=1793877061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cXKvA1j4jymWG2i1f69ZFF9ewM9kuxmlPhJNt0E6GB0=;
 b=juZw99FpiSOFFJjYmbl7uxeOMq8ARMddEZvY55ngQQqNgDwvlJHHqqO/OZ36PQ7lBl
 QYqYICOtWLelvlxm25i35FyVt5n/evdgZ4fzJawanKqzHzTsmTrBP7omGZMAqM+3jKlt
 +dBxQ9BzG4gBbiKjmyhNteVwWPQSoqwSnsyuvjqTn9jzqYjlLoi2pvS/JR/eXPdm7sD2
 JpNbJm8X1Ro9KI4cA6EkZb5dn1Bt8OJ9Be7Sb07xqrJHhFA7zQAHk+4hH4ZpUyza+gu7
 6WDSRASYLgP7flzkkCni/vEXAfWXdYGoZVx0WE/PLfRyIx05bTQdoQWpZROH6gq5VZHj
 7p9A==
X-Gm-Message-State: AFq9FYIEjNzks+raIkGLR8k06A47Y/5U8XHdxULUeYuOrcQ4sa85+ssx
 I6Cn0KmjBgOAjq2zaO2WCWjPXWEkz/HaL38nVvhV0kpcSBx8eo/ONbyGo3JlZA==
X-Gm-Gg: AYBFou0OTX52hfEVPhbiMqelHBNsWmERgkXf7hKtLMF6yyzWDR0fjSOLMGqXCXzqKQe
 I1JBTKywUPiKYtJ9P55cPxROYLKU2uiYxtdHyUmNnHneUp2uPf5vezZSpGir3CT5/m6XDpwSUlO
 9JO3locIOVmbuggKAz9gcxK6y7GSh/j+7gLPKcjxcmvTWZ/z4dUSrwaEdX/FetE5fzGewrTzo0x
 6dlz5VjQlxQaiexXMLmi8QeqQZJWiYG4kGv6SXtdzQCq+KxiGuS7Zj3oh8Tk3gIFBAouC3CXTEB
 pDWDFbARgktiRx+lZsrIceRb/dqzfY53+WJPOt/eXzYPTfEw+mQJgnMGJvHUgJQoc6NLjViRXk3
 em4G4Zgkj0oGWJqP1PcOrXYbiIVxU1m62IwDw22JUMsJNpI4525PHlQiiUX6iEolMrcGsJJdvV1
 s6nNi85Q+/NrdZfTjUBe0q2UaUp/W+Wn8P1vZDNBcjGiIlrly3wh9RBt8gTw+NlHIBLk1x98jkO
 BzEfYB5X+4AQkv6Vuc/TS7p1vOslf4sdHe57PLgfrRpStpwRZoZVg7K/NM1N4gAXQA4f4kTxaLv
 Usx0izCuThLhjmiExaGJ3mWvJ1NoUWdlcUwt0OBWvkOPuyWLB23W54I7jpYOkzjMc+SPY25cUCv
 EQkKVCOtK
X-Received: by 2002:a17:907:6d0a:b0:c42:6632:a369 with SMTP id
 a640c23a62f3a-c49d1298d10mr203349266b.21.1793272261257; 
 Thu, 29 Oct 2026 04:11:01 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd64a02csm719512466b.44.2026.10.29.04.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 04:11:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 12:11:00 +0100
Message-Id: <20261029111100.563775-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pdmenu: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Brock Williams <brock@cottonwoodcomputer.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pdmenu has not seen a release since 1.3.6 in 2020, and Debian dropped it
after jessie.

Its tarball can no longer be downloaded: the upstream git server
answers the snapshot URL with an error, which has made the package fail
on the autobuilders since at least May 2026:

  HTTP ERROR response 503 Service Unavailable [https://git.joeyh.name/index.cgi/pdmenu.git/snapshot/pdmenu-1.3.6.tar.gz]

Rather than relying on the Buildroot backup mirror for an unmaintained
package, remove it.

Fixes:
https://autobuild.buildroot.org/results/c41b5f74067c44b4a48f7c6231c66ba25e377fa3

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |  2 -
 Config.in.legacy                              |  8 ++
 DEVELOPERS                                    |  3 -
 package/Config.in                             |  1 -
 ...info.in-link-with-INTLLIBS-if-needed.patch | 27 -------
 ...f-makeinfo.in-support-build-install-.patch | 76 -------------------
 package/pdmenu/Config.in                      | 15 ----
 package/pdmenu/pdmenu.hash                    |  5 --
 package/pdmenu/pdmenu.mk                      | 21 -----
 9 files changed, 8 insertions(+), 150 deletions(-)
 delete mode 100644 package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch
 delete mode 100644 package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch
 delete mode 100644 package/pdmenu/Config.in
 delete mode 100644 package/pdmenu/pdmenu.hash
 delete mode 100644 package/pdmenu/pdmenu.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..5ce60e86a4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -698,8 +698,6 @@ package/paxtest/0001-genpaxtest-move-log-location.patch lib_patch.Upstream
 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch lib_patch.Upstream
 package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch lib_patch.Upstream
 package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch lib_patch.Upstream
-package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch lib_patch.Upstream
-package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch lib_patch.Upstream
 package/perl-net-ssleay/0001-fix-build-system.patch lib_patch.Upstream
 package/perl-sys-cpu/0001-remove-extraneous-include.patch lib_patch.Upstream
 package/perl-xml-libxml/0001-Makefile-PL.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..a31e74e845 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_PDMENU
+	bool "pdmenu has been removed"
+	select BR2_LEGACY
+	help
+	  pdmenu has been removed, as it is no longer maintained
+	  (last release in 2020) and its tarball can no longer be
+	  downloaded from upstream.
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..9203dbc879 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -587,9 +587,6 @@ N:	Brandon Maier <brandon.maier@gmail.com>
 F:	package/dtc/
 F:	support/testing/tests/package/test_dtc*
 
-N:	Brock Williams <brock@cottonwoodcomputer.com>
-F:	package/pdmenu/
-
 N:	Bryan Brattlof <bb@ti.com>
 F:	board/ti/
 F:	board/beagleboard/beagleplay/
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..aab100cadb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2785,7 +2785,6 @@ comment "Utilities"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
 	source "package/opendoas/Config.in"
-	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/qprint/Config.in"
 	source "package/ranger/Config.in"
diff --git a/package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch b/package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch
deleted file mode 100644
index 78f3e576b2..0000000000
--- a/package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 319cc3859044214961164ed1f219f2f21ca965af Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 30 Aug 2017 23:04:37 +0200
-Subject: [PATCH] autoconf/makeinfo.in: link with INTLLIBS if needed
-
-gettext may be provided by external libraries, as specified in
-INTLLIBS, so we must include @INTLLIBS@ in the LIBS variable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- autoconf/makeinfo.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/autoconf/makeinfo.in b/autoconf/makeinfo.in
-index ee3054a..6d58d77 100644
---- a/autoconf/makeinfo.in
-+++ b/autoconf/makeinfo.in
-@@ -13,5 +13,5 @@ DEFINES		= -DETCDIR=\"${SYSCONFDIR}/\" -DVER=\"${VER}\" @DEFS@ \
- 		  $(PROFILE) -D__USE_FIXED_PROTOTYPES__ -D_GNU_SOURCE \
- 		  -DLOCALEDIR=\"@datadir@/locale\"
- CFLAGS		= $(DEFINES) @gcc_cflags@ @CFLAGS@
--LIBS		= @LIBS@ $(EFENCE)
-+LIBS		= @LIBS@ @INTLLIBS@ $(EFENCE)
- INSTALL_PROGRAM	= ${INSTALL}
--- 
-2.13.5
-
diff --git a/package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch b/package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch
deleted file mode 100644
index 1a22aa6f2d..0000000000
--- a/package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 5368bd0cfd0640f5c0ca766d4fda1b3f71c1b013 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 30 Aug 2017 23:07:26 +0200
-Subject: [PATCH] Makefile, autoconf/makeinfo.in: support build/install without
- gettext
-
-The gettext tool msgfmt may not be available to build the .mo files
-from the .po files, so we handle this case by disabling the
-build/installation of .po files in such a case.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile             | 17 ++++++++++++++---
- autoconf/makeinfo.in |  1 +
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a708046..3e83ca3 100644
---- a/Makefile
-+++ b/Makefile
-@@ -7,11 +7,18 @@ OBJFILES	:= $(SRCFILES:%.c=%.o)
- LANGS		= fr ru es
- MOS		:= $(addprefix po/, $(addsuffix .mo, $(LANGS)))
- LOCALEDIR	= $(INSTALL_PREFIX)/usr/share/locale
--
--all: pdmenu $(POTFILE) $(MOS)
-+TARGETS		= pdmenu
-+INSTALL_TARGETS	= install-pdmenu
- 
- include makeinfo
- 
-+ifneq ($(MSGFMT),)
-+TARGETS += $(POTFILE) $(MOS)
-+INSTALL_TARGETS += install-pos
-+endif
-+
-+all: $(TARGETS)
-+
- pdmenu: .dep $(OBJFILES)
- 	${CC} -o pdmenu $(OBJFILES) $(CFLAGS) $(LIBS)
- 
-@@ -40,7 +47,9 @@ clean:
- 	$(MAKE) $(POTFILE) # make sure translators' input is ready
- 	rm -f $(OBJFILES) pdmenu $(MOS)
- 
--install: all
-+install: $(INSTALL_TARGETS)
-+
-+install-pdmenu:
- 	$(INSTALL) -d $(INSTALL_PREFIX)/$(BINDIR) \
- 		$(INSTALL_PREFIX)/$(MANDIR)/man1 \
- 		$(INSTALL_PREFIX)/$(MANDIR)/man5 \
-@@ -56,6 +65,8 @@ install: all
- 	$(INSTALL) examples/pdmenurc $(INSTALL_PREFIX)/$(SYSCONFDIR)/pdmenurc -m 0644
- 	$(INSTALL) examples/showdir.pl $(INSTALL_PREFIX)/$(DATADIR)/pdmenu
- 	cd $(INSTALL_PREFIX)/$(DATADIR)/pdmenu && $(LN_S) -f showdir.pl editdir.pl
-+
-+install-pos:
- 	for lang in $(LANGS); do \
- 		[ ! -d $(LOCALEDIR)/$$lang/LC_MESSAGES/ ] && mkdir -p $(LOCALEDIR)/$$lang/LC_MESSAGES/; \
- 		install -m 644 po/$$lang.mo $(LOCALEDIR)/$$lang/LC_MESSAGES/pdmenu.mo; \
-diff --git a/autoconf/makeinfo.in b/autoconf/makeinfo.in
-index 6d58d77..069daf8 100644
---- a/autoconf/makeinfo.in
-+++ b/autoconf/makeinfo.in
-@@ -8,6 +8,7 @@ DATADIR		= @datadir@
- CC		= @CC@
- INSTALL		= @INSTALL@
- LN_S		= @LN_S@
-+MSGFMT		= @MSGFMT@
- VER		= @VER@
- DEFINES		= -DETCDIR=\"${SYSCONFDIR}/\" -DVER=\"${VER}\" @DEFS@ \
- 		  $(PROFILE) -D__USE_FIXED_PROTOTYPES__ -D_GNU_SOURCE \
--- 
-2.13.5
-
diff --git a/package/pdmenu/Config.in b/package/pdmenu/Config.in
deleted file mode 100644
index 8f35f614a6..0000000000
--- a/package/pdmenu/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_PDMENU
-	bool "pdmenu"
-	depends on BR2_USE_MMU # slang
-	select BR2_PACKAGE_SLANG
-	help
-	  Pdmenu is a full screen menuing system for Unix. It is
-	  designed to be easy to use, and is suitable as a login shell
-	  for inexperienced users, or it can just be ran at the
-	  command line as a handy menu.
-
-	  Pdmenu features color support and GPM mouse support at the
-	  Linux console. It was developed on Linux, and has now been
-	  compiled on many other unixes without problems.
-
-	  https://joeyh.name/code/pdmenu/
diff --git a/package/pdmenu/pdmenu.hash b/package/pdmenu/pdmenu.hash
deleted file mode 100644
index 00c2569adf..0000000000
--- a/package/pdmenu/pdmenu.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  dedd2a4a5719278b5e49041161990c2f20b5909818837542aaca01819f2c14eb  pdmenu-1.3.6.tar.gz
-
-# License file hash, locally calculated
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  doc/COPYING
diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
deleted file mode 100644
index 72eb95bddc..0000000000
--- a/package/pdmenu/pdmenu.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# pdmenu
-#
-################################################################################
-
-PDMENU_VERSION = 1.3.6
-PDMENU_SITE = https://git.joeyh.name/index.cgi/pdmenu.git/snapshot
-PDMENU_LICENSE = GPL-2.0
-PDMENU_LICENSE_FILES = doc/COPYING
-PDMENU_DEPENDENCIES = slang $(TARGET_NLS_DEPENDENCIES)
-PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
-
-# gcc-15 defaults to -std=gnu23 which introduces build failures.
-# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
-# versions will work, since they are using the older standard.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
-PDMENU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
-endif
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
