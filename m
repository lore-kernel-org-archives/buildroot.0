Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3072606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=egwW4q0T
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96446087B;
	Wed, 18 Nov 2026 08:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pZG6VM5JwdE; Wed, 18 Nov 2026 08:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ACB946085E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794989310;
	b=f9Qyy5nlc/mAHe/jnb6sNhR72O3evY+i0YxQ2I8IgXGkYUVGd7we/vJ0rFWT1eJROTQh
	 OLnsuCQVSxOaqGIeR7F9mODuV7gB4fhnMNKDwJp1SxRbL0qWuQM/5Pz8eNadD8DxtIYIH
	 Gf0VkdHvaa4LkprMIvfXX0wOZcl8tk5q6CipBL9Nn+n34t+lU3E0uuhd5skwGO8tgmPV1
	 8uoHouT1u2ujcZn1DptMR8hWrSMs2rkTuj9UpV2T6DuSHdEwBR2XS8A7v9KA+zV4R8agN
	 A63PthFPZC+wsLjeiQkVjr4hQzX7GHcj9SbtcPC381fXSPmIi8cM2ORHAR8lSFOhR9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794989310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rpnvyC9xFIb1rhpPm67dvFg40/yVim0ktXVSy1mB0k8=;
	b=UMbnPGuMg6nwdyDkxWubfDPNoNiQV+LkmiFaf75p46gSIW5SNMnJOvjz0nsiOAV49wdw
	 ok+yXdujSoaIPOMQoi+jMK+dRQd/oyClpVkQIP8lan7mvJMDaCZz9iUmr9fcAl9zG28O5
	 55DWUwVxfiQjGFw0muA+BjMJ60LppnWLBOVzy8jF+m90xT3wkh6Tlb21OU/G//hCjM2x4
	 koiwymLeUcIlEfTwWxQB3MFHF/j4XRkJYJQPPX/eLq/F7Bc00s/NoMgcPqtS0+msTyzHj
	 XHFt5dm4MtpQOcfZwwW/TI0oha2IDHSaKSyJmFUaaEO8hyPt9fwH7WqleALWtfvoUzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794989310;
	bh=rpnvyC9xFIb1rhpPm67dvFg40/yVim0ktXVSy1mB0k8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=egwW4q0TsgrPMO5AQBhuCcJA34UTxPpWQxwYZaspk5fPSq3KQy4Kk3epJR6RNGH9O
	 EyCQYcUQgEoqNsfB1KPoPXYS3vJ3eKMuTsoNCHOB82gJGbVEb07NKiEdenPX+bhxrl
	 JwrT3FQI8j+TzDmNf32Q3E9jVRb1BcA5ee/BMSYsSspkK4UHx091F2wtnXq9rhBaiH
	 v4XUnezxCgDg+WaV9CwDg07CjLk9ZZdUwYhPB9c48SLUfim8Jk7ez/P/mqm5SO9qtE
	 7zQaNloePPf8el5N+ZIkJ1BNrraujHdMSq7kRXJo9HdiJxcWtMFiMRNobIRDdI14jZ
	 xbac1M3oW9Ajw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB946085E;
	Wed, 18 Nov 2026 08:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8509361
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 08:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 822546085E
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 08:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPY4Sw6PNaLf for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 08:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2AA846085D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AA846085D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 08:08:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c4d427836e9so77612466b.1
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 00:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794989306; x=1795594106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WdVct6ca69O31oAaxR8gmcIBJ0WHQokzJSL+Toqgc7I=;
 b=oWs7W0mY8bcjfMWgfuG8A3MDWPAn5Mjiq6Be0jP0tm+vVkaV1ISGULuS63LjN6enac
 rQ2O5WN6OgHaQjdTkL3In0E+GdrkNxHoO3yNLSeRuQVeIahwyRxdD8lvVogace5aLwnM
 U/xAFs/eUQK2mfqTrYRsUbSCgPCHo4pf/jV/7iZJsOjpAk4rnwSLuoovj3dpQ0ZzZECO
 aGSfPfOGTsUTosgz6u2vHkJAaFy6T8YDg0IKO1/yCAeGNL+QTkOPPiR9Bct8eSln51wp
 QWVyDV98n/pBlcFZ8WF/Ln0/FIy1JezNJ+edQ8qJ2J6JpyHi7WNXDGSrSdzljJ/UDwd8
 g1Gw==
X-Gm-Message-State: APuU4Z+PEu7lA9CboAJF/Zz15hDuBhbeRRw3ImMa0ZoNuJcpxp8JJjXO
 K7PhrE3Snn4ZXVowMPOtuKv9/yjl/0QhAwRT7kFwuNZN/lC7B0x3lmoGmlJHdw==
X-Gm-Gg: AYBFou3SsVoxzjC2s5s36pbfOwT9fb/P8dzrqf/lxaToWpfktBh+8Crr/92YuzJeR2q
 r6jfaj5GVq6gTU4J7nepArCes2RpDjamCEnreH4zs9WWYCQFH6ptIIPqHktWx6rRaRzqwsX9pyZ
 A5WGicGLgeypapVCoWEOD6cxEMu2np4+6U4jyiTzkxVxhgoQCbMFdZpxHlH8XwblcO8pXvoHvcT
 g1p8e62ChDPGgeQIvsYlkeuyZLjPEqWKdPBJ9GbE+g9nnEWL8I+hgWIVo+PLxcPjiXPWy3JkdSl
 salvVKmHvYPD51efibMonv/J6m2C87exWwtsJNSe7IjTFHihA81FvPK2W0Ies3l+oUOWUw4G/yf
 32VzSKVpbTLnE7bfHScBpFyXwbMqZEEfXodyE3Go16NjXPdhkvGEpk428IdmWsfjMNplqsLWex5
 oZWek94CARzhTQqgoBVMkZvp4E56YPMMYIwR0jupNE1+p7qlXC3BuzWIAt9wPgYUZkG0NXw9/hs
 FBhScIwWrXovlIyCAYp6D1NyN80d04jfxVoMOVznOoQRz7s8vvO8BYMpoVlPxiULgdQ8OgFKtfN
 //EzPsPqWgzD8NaKU8tt8NrTH6cLbs4kQpY7egkzqfzo1NYTuTUuC4BjNrfdKRIdFCF+CI+5NLa
 LuQlxu5eE
X-Received: by 2002:a17:907:1b1f:b0:c50:f0f9:ad74 with SMTP id
 a640c23a62f3a-c510e19968bmr156335066b.9.1794989305648; 
 Wed, 18 Nov 2026 00:08:25 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c51199921basm19540866b.58.2026.11.18.00.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 00:08:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 09:08:22 +0100
Message-Id: <20261118080823.387880-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/uftrace: bump to version 0.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Version 0.14 fails to build with musl and GCC >= 14:

  cmds/dump.c:1179:25: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
  cmds/dump.c:1179:25: error: initialization of 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]

musl 1.2.5 no longer declares basename() in <string.h>. Upstream
replaced basename() with its own uftrace_basename() in version 0.16.

Release notes:
https://github.com/namhyung/uftrace/releases/tag/v0.15
https://github.com/namhyung/uftrace/releases/tag/v0.16
https://github.com/namhyung/uftrace/releases/tag/v0.17
https://github.com/namhyung/uftrace/releases/tag/v0.18
https://github.com/namhyung/uftrace/releases/tag/v0.19
https://github.com/namhyung/uftrace/releases/tag/v0.20

Drop the ADDR_NO_RANDOMIZE patch: the upstream pull request was
closed, and uClibc-ng now defines ADDR_NO_RANDOMIZE in
<sys/personality.h>.

Disable the newly added optional libunwind, libtraceevent and liblzma
support, which configure would otherwise detect automatically.

This issue has been present since commit f7f03445cf32 ("package/musl:
bump to version 1.2.5"), which removed the basename() declaration from
<string.h>. GCC 14, which turns implicit function declarations into
errors, was added in the same release. It therefore affects 2024.05
and later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/791c3b45b9c6184c6fc6183c8040486792fa75a3

Fixes: f7f03445cf320adbbc41270a806b38c911d3454a ("package/musl: bump to version 1.2.5")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...place-ADDR_NO_RANDOMIZE-by-its-value.patch | 34 -------------------
 package/uftrace/uftrace.hash                  |  2 +-
 package/uftrace/uftrace.mk                    |  7 ++--
 3 files changed, 6 insertions(+), 37 deletions(-)
 delete mode 100644 package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch

diff --git a/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch b/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
deleted file mode 100644
index 2855be0d9e..0000000000
--- a/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dc0a75b1679debbc3712b262e5127e90961f92db Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 23 Apr 2021 22:57:56 +0200
-Subject: [PATCH] cmds/records: replace ADDR_NO_RANDOMIZE by its value
-
-uClibc-ng lacks the definition of ADDR_NO_RANDOMIZE, causing a build
-failure. A patch was submitted to upstream uClibc-ng to address this
-issue, but in the mean time, use an hardcoded value.
-
-Using a #ifdef ... #endif test doesn't work as this value is defined
-through an enum in glibc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/namhyung/uftrace/pull/1389
----
- cmds/record.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmds/record.c b/cmds/record.c
-index e750f053..fc4eaed4 100644
---- a/cmds/record.c
-+++ b/cmds/record.c
-@@ -2110,7 +2110,7 @@ int do_child_exec(int ready, struct opts *opts,
- 
- 	if (opts->no_randomize_addr) {
- 		/* disable ASLR (Address Space Layout Randomization) */
--		if (personality(ADDR_NO_RANDOMIZE) < 0)
-+		if (personality(0x0040000 /* ADDR_NO_RANDOMIZE */) < 0)
- 			pr_dbg("disabling ASLR failed\n");
- 	}
- 
--- 
-2.30.2
-
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index c4aad39016..d23ef78853 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b81255bc288e79e96a5b158d4875fa6425ad51c85f4c4c8523c1defb9366ad12  uftrace-0.14.tar.gz
+sha256  03189061130693b274a4d0af47c4a3135d4a496ca111b78233593bfcb3d3720f  uftrace-0.20.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index c005a32b76..7ee9381554 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTRACE_VERSION = 0.14
+UFTRACE_VERSION = 0.20
 UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
 UFTRACE_LICENSE = GPL-2.0
 UFTRACE_LICENSE_FILES = COPYING
@@ -13,7 +13,10 @@ UFTRACE_CONFIGURE_OPTS = \
 	--without-libpython \
 	--without-libluajit \
 	--without-libncurses \
-	--without-capstone
+	--without-libunwind \
+	--without-capstone \
+	--without-libtraceevent \
+	--without-liblzma
 
 ifeq ($(BR2_i386),y)
 UFTRACE_ARCH = i386
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
