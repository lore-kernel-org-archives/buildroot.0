Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53222606A339
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VkaaqftP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28DC040810;
	Thu, 19 Nov 2026 12:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81dh00SDO9mD; Thu, 19 Nov 2026 12:35:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9432440822
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795091745;
	b=iWiRG3MGX7zhFUxXRYplVQ6cOIH8em9TbePkmX0SfHgMoJ0BAh23TI3IXmRSjOBsKp4E
	 2U714RCYlQ0n3SXYUG8EnqPpY4A5ptGw+k9cIaBvvbLN4FNF19h5UNVeXEu2+4mdggPEM
	 T3QCQdIHwkYAM91K0B+sRq3t4Nu6tFasdLGRf60KkX+Zv+6mcDT0atPkAajdyXdxpQ60o
	 pM/LfcPLfWGV4/mWwanc3EjLMNp72POJJlwuCPllYBAAURow8HbAVsRD4Y8BQoee+ys44
	 fsjjlSLEVgqCWxXCpElASX+1WRiDcYi25Exle8eaCSiF4byl7oOiXm5hIGVt3PdmIxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795091745;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B9liWKggtwxqH83cHo5hCRk40SVg9zmuVPah1PFhLhs=;
	b=djecXaxFGaXyDGerx5T82FEoyRj1O80NuaUI+ll0R0B4uXyRxCh10bWPUgSPZtad+lfd
	 AW3948CE0zDqvYps5+q3E3rigxl5bK60D6s98GKOwwwkjIh2IKTEmrtAvqoME3mOsIr3b
	 LDhXohJyOgfRbDE+PcgXhgUJy2vQxjBhOc+K/LbFqzixQSRWeBMAXaRJtFU/WtzIYB4Sl
	 xGOKz23b/d5u02hyDeOwgkGdkoKTALSGD6VFdARrJisnhXVTi/atK5hykpZczupIv5pR7
	 3j0NlYiuPrwvJmavmJIN4DP+MBSMwLq0WAsbCvLpQKce8oPIglTi+Q3KwDf2mdQkS5g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795091745;
	bh=B9liWKggtwxqH83cHo5hCRk40SVg9zmuVPah1PFhLhs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkaaqftPpTYeib7mUAMsxmBaY6VGGWXV72iXc6nSh13ZKeyoLk5WsFRqf0iHYdxXF
	 m3KXAp/xs9/7N2Sch63GN2h9E1ARYpZHx2MWYiipbSA9XJjIchtCzvOb5pA06BQf5u
	 dya1BGQhT6kwnIt8NDErudoXwGAL9OC4Jm1/QqKE5FxdrtwiuoJ5grnbNOH0ZZ77Dh
	 H4Va4p53NHjYBZGJhUH23mo+L6q23eX/Zh1jj3OoNdQlVX6l/xK1qqLfbBpiI57tyU
	 qJw4JUwG7wTQRwljDPrNkt+rIolxleHrKp0luwMyQmK6tamWZidNIKicybRlb5ye+v
	 IGai+pKGxxniQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9432440822;
	Thu, 19 Nov 2026 12:35:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 053E71C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9BFD40822
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id codwRyDxkX-Q for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 12:35:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1233240810
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=209.85.221.50
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.50;
 helo=mail-wr1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1233240810
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 12:35:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4a34ffd3e39so1211353f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 04:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795091740; x=1795696540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2YW7rRYuwtyBqFPqjXlTv8DvTbfd39A95ZWYFFl8BR4=;
 b=WlPS3zr6xWuLQtc2Z77gKQOqWvF84r+u3uzBmtqgZZfSDCGMqeyoFa4UPQIqVNk5F5
 YzVL9/Hq0GWBCn2koOvtR0H4W1Y16b7ptfNQOFTioTP/NdjU1s1VaGFtD3UUVrwSl8QS
 o07TPtKkjoPC+A8H8nkNtby+NCCAIWGZkeuPCT1iuScYpBcuBHMmMNKUHlWhpSt5PE/V
 wAH0pjSEkHBSFY+ZfM6hC6lhLCEFUxKrI9qc/RYl16iLjKaw54hFkwdIzg9prdU1lfmy
 lch6IWfyp0PYCi6/3BEugcGI5QwitJAYxYv9NrXWrxtZ0n5l+BcIhURhx03dzYOGlzUs
 VJ3g==
X-Gm-Message-State: APuU4Z/QUfzLXWHc6CZbu5eCYus3J8tskFyopICC7+5+EuJkt+2FBup9
 Fd+rvvztm92vV+JhzzCJ3PdC5Viu4UHmdRsYYm2iRaBw0YBNagKFzVCBjzHzoWZ/
X-Gm-Gg: AZFdTZd4KXISQAlGGEW2okNTCmEuaUkMO7xD6bUItD1iNy8OJUSIxGCzm/DB/cz4PNH
 zcqYYBt35g98iBCBMVfpnOhxHYqlivKwMJOjnZO5XneDmPMEs9XsPaPriLOTzsfa9NuesqaZpqe
 icyffMA7v9PSzUO8SDe2Fc+FWV0hcSZxp5EBPpwMNhgMGxkCR2vV9iJS6FSDgdDtd75kl9VMq36
 b1YQolRbxzfQch7yXBuazP6sa3S+F+0mhbIai2GyJ5bxlrCc1ytn1HZuklmqBrI5Q2ac2rWjq+x
 AISBvNhIh/3bLp8wGOIV0uq6w0jY2QMOW14vGftMaGVZlsENFmDu9UD6c0Kz8iQAWEfF2y3fRDl
 LBwXXDDS1W/AtmuFciCEAfPvszr0LHu3oIXC1nXK4Lq/2FGmZ1LX38UNEUeeju1wfAryx9zoE0K
 fFUL6a7GoiQwnY2J26uk0MGKvr8TlFLzl+8uoZFnBLZVOveSvIKmb1o9lxNvAKaLuV6B383HuxZ
 rz0ZkndIVylRDu/FG94S2e4FKJDvxfSc61QaDk7jOm3OTiDSksECHNE/QLdcapFihugApnD7Zvd
 wIvUm8kVuSeGbLLn2ktluEl6wusu7UrpuwLTXm+jjxkAIoW7IPETmVgXbIFw1SCpBLDsIYBMhH0
 IWUXnwYHC0+HYFZnBNS7oyMTQkAbG7lafRENrZm4MOgZSzFLd/i9D/KEtCJ3qn6ADLqsdrz8hTh
 ZjGpWu5pJ5wQ==
X-Received: by 2002:a05:6000:616:b0:4a8:7115:fa08 with SMTP id
 ffacd0b85a97d-4a87115fcb1mr7412846f8f.13.1795091739499; 
 Thu, 19 Nov 2026 04:35:39 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4a656b1cfdfsm10659156f8f.47.2026.11.19.04.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 04:35:39 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Tudor Holton <buildroot@tudorholton.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 19 Nov 2026 13:35:32 +0100
Message-ID: <20261119123532.1749442-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119123532.1749442-1-thomas@devoogdt.com>
References: <20261119123532.1749442-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 3/3] package/openjdk{-bin}: security bump
 25.x to version 25.0.5.1+2
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

Fix CVE-2026-114938, a heap-based buffer overflow in the HotSpot
compiler which may result in takeover of affected Java runtimes.

This also includes security fixes from the OpenJDK advisories published
on 2026-04-21, 2026-07-21, 2026-08-18, 2026-10-20, 2026-10-21,
2026-10-24, and 2026-11-17.

Other relevant changes include certificate and cryptographic hardening,
updates to libpng 1.6.59, FreeType 2.15.0 and tzdata2026f, and fixes
for TLS, HTTP, Kerberos, JMX, JFR, and HotSpot.

The headless-build patch is now upstream and can be removed.

For details, see:
https://openjdk.org/groups/vulnerability/advisories/2026-11-17

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 .checkpackageignore                           |   2 +-
 .../openjdk-bin.hash                          |   3 +-
 package/openjdk-bin/openjdk-bin.mk            |   4 +-
 ...OpenJDK-in-headless-mode-without-req.patch | 144 ------------------
 ...ARCv2-ISA-processors-support-to-Zero.patch |   0
 ...pot-aarch64-macro-assembler-fix-cmp.patch} |   0
 ...t-share-gc-shenandoah-fix-constexpr.patch} |   0
 package/openjdk/openjdk.hash                  |   2 +-
 package/openjdk/openjdk.mk                    |   4 +-
 9 files changed, 7 insertions(+), 152 deletions(-)
 rename package/openjdk-bin/{25.0.2_10 => 25.0.5.1_2}/openjdk-bin.hash (53%)
 delete mode 100644 package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
 rename package/openjdk/{25.0.2+10 => 25.0.5.1+2}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch => 25.0.5.1+2/0002-src-hotspot-aarch64-macro-assembler-fix-cmp.patch} (100%)
 rename package/openjdk/{25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch => 25.0.5.1+2/0003-src-hotspot-share-gc-shenandoah-fix-constexpr.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index c875aa796be..5861b778f93 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -659,7 +659,7 @@ package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
 package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
-package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/25.0.5.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
 package/openldap/0002-disable-docs.patch lib_patch.Upstream
 package/openntpd/S49ntp Shellcheck lib_sysv.Variables
diff --git a/package/openjdk-bin/25.0.2_10/openjdk-bin.hash b/package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/25.0.2_10/openjdk-bin.hash
rename to package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash
index 42892b1e6ce..29ed381fa2d 100644
--- a/package/openjdk-bin/25.0.2_10/openjdk-bin.hash
+++ b/package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash
@@ -1,6 +1,5 @@
 # From https://github.com/adoptium/temurin25-binaries/releases
-sha256  987387933b64b9833846dee373b640440d3e1fd48a04804ec01a6dbf718e8ab8  OpenJDK25U-jdk_x64_linux_hotspot_25.0.2_10.tar.gz
-sha256  a9d73e711d967dc44896d4f430f73a68fd33590dabc29a7f2fb9f593425b854c  OpenJDK25U-jdk_aarch64_linux_hotspot_25.0.2_10.tar.gz
+sha256  760f91b22c3efc9bd1b64ff950598231be82928cc807e30691a0e7a2995a62c0  OpenJDK25U-jdk_x64_linux_hotspot_25.0.5.1_2.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index f56d96504d8..ef11d7e9e67 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,8 +6,8 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_25),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 25
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.2
-HOST_OPENJDK_BIN_VERSION_BUILD = 10
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.5.1
+HOST_OPENJDK_BIN_VERSION_BUILD = 2
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.13.1
diff --git a/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch b/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
deleted file mode 100644
index 78ab31ff621..00000000000
--- a/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 434d082d9082c1ce2d9ea46ec3c90420442567b9 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Wed, 4 Feb 2026 06:48:59 +0000
-Subject: [PATCH] 8376684: Compile OpenJDK in headless mode without required
- X11 libraries
-
-Reviewed-by: erikj, aivanov
-
-Upstream: https://github.com/openjdk/jdk/pull/28310
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- doc/building.html                                |  7 +++----
- doc/building.md                                  |  6 ++----
- make/autoconf/libraries.m4                       |  8 ++++----
- make/modules/java.desktop/lib/AwtLibraries.gmk   | 16 ++++++++++++++--
- .../unix/native/common/awt/utility/rect.h        |  4 ++--
- 5 files changed, 25 insertions(+), 16 deletions(-)
-
-diff --git a/doc/building.html b/doc/building.html
-index da8465bc532..f8d815a5474 100644
---- a/doc/building.html
-+++ b/doc/building.html
-@@ -1380,10 +1380,9 @@ <h4 id="alsa-1">ALSA</h4>
- can specify it by <code>--with-alsa</code>.</p></li>
- </ul>
- <h4 id="x11-1">X11</h4>
--<p>You will need X11 libraries suitable for your <em>target</em> system.
--In most cases, using Debian's pre-built libraries work fine.</p>
--<p>Note that X11 is needed even if you only want to build a headless
--JDK.</p>
-+<p>When not building a headless JDK, you will need X11 libraries
-+suitable for your <em>target</em> system. In most cases, using Debian's
-+pre-built libraries work fine.</p>
- <ul>
- <li><p>Go to <a href="https://www.debian.org/distrib/packages">Debian
- Package Search</a>, search for the following packages for your
-diff --git a/doc/building.md b/doc/building.md
-index 1a9fe6b2e78..92ebd3d32c7 100644
---- a/doc/building.md
-+++ b/doc/building.md
-@@ -1173,10 +1173,8 @@ #### ALSA
- 
- #### X11
- 
--You will need X11 libraries suitable for your *target* system. In most cases,
--using Debian's pre-built libraries work fine.
--
--Note that X11 is needed even if you only want to build a headless JDK.
-+When not building a headless JDK, you will need X11 libraries suitable for your
-+*target* system. In most cases, using Debian's pre-built libraries work fine.
- 
- * Go to [Debian Package Search](https://www.debian.org/distrib/packages),
-   search for the following packages for your *target* system, and download them
-diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
-index 96f377c2f99..8f02b7ec8a7 100644
---- a/make/autoconf/libraries.m4
-+++ b/make/autoconf/libraries.m4
-@@ -42,12 +42,12 @@ m4_include([lib-tests.m4])
- AC_DEFUN_ONCE([LIB_DETERMINE_DEPENDENCIES],
- [
-   # Check if X11 is needed
--  if test "x$OPENJDK_TARGET_OS" = xwindows || test "x$OPENJDK_TARGET_OS" = xmacosx; then
--    # No X11 support on windows or macosx
-+  if test "x$OPENJDK_TARGET_OS" = xwindows ||
-+     test "x$OPENJDK_TARGET_OS" = xmacosx ||
-+     test "x$ENABLE_HEADLESS_ONLY" = xtrue; then
-     NEEDS_LIB_X11=false
-   else
--    # All other instances need X11, even if building headless only, libawt still
--    # needs X11 headers.
-+    # All other instances need X11 for libawt.
-     NEEDS_LIB_X11=true
-   fi
- 
-diff --git a/make/modules/java.desktop/lib/AwtLibraries.gmk b/make/modules/java.desktop/lib/AwtLibraries.gmk
-index 463e09e12dc..8b6b50b9e62 100644
---- a/make/modules/java.desktop/lib/AwtLibraries.gmk
-+++ b/make/modules/java.desktop/lib/AwtLibraries.gmk
-@@ -88,6 +88,10 @@ LIBAWT_EXTRA_HEADER_DIRS := \
- 
- LIBAWT_CFLAGS := -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES -DMLIB_NO_LIBSUNMATH
- 
-+ifeq ($(ENABLE_HEADLESS_ONLY), true)
-+  LIBAWT_CFLAGS += -DHEADLESS
-+endif
-+
- ifeq ($(call isTargetOs, windows), true)
-   LIBAWT_CFLAGS += -EHsc -DUNICODE -D_UNICODE -DMLIB_OS64BIT
-   LIBAWT_RCFLAGS ?= -I$(TOPDIR)/src/java.base/windows/native/launcher/icons
-@@ -167,11 +171,18 @@ ifeq ($(call isTargetOs, windows macosx), false)
-       $(TOPDIR)/src/$(MODULE)/$(OPENJDK_TARGET_OS_TYPE)/native/common/awt \
-       #
- 
-+  LIBAWT_HEADLESS_EXCLUDE_FILES := \
-+      GLXGraphicsConfig.c \
-+      GLXSurfaceData.c \
-+      X11PMBlitLoops.c \
-+      X11Renderer.c \
-+      X11SurfaceData.c \
-+      #
-+
-   LIBAWT_HEADLESS_EXTRA_HEADER_DIRS := \
-       $(LIBAWT_DEFAULT_HEADER_DIRS) \
-       common/awt/debug \
-       common/font \
--      common/java2d/opengl \
-       java.base:libjvm \
-       #
- 
-@@ -191,7 +202,8 @@ ifeq ($(call isTargetOs, windows macosx), false)
-   $(eval $(call SetupJdkLibrary, BUILD_LIBAWT_HEADLESS, \
-       NAME := awt_headless, \
-       EXTRA_SRC := $(LIBAWT_HEADLESS_EXTRA_SRC), \
--      EXCLUDES := medialib, \
-+      EXCLUDES := medialib opengl, \
-+      EXCLUDE_FILES := $(LIBAWT_HEADLESS_EXCLUDE_FILES), \
-       ONLY_EXPORTED := $(LIBAWT_HEADLESS_ONLY_EXPORTED), \
-       OPTIMIZATION := LOW, \
-       CFLAGS := -DHEADLESS=true $(CUPS_CFLAGS) $(FONTCONFIG_CFLAGS) \
-diff --git a/src/java.desktop/unix/native/common/awt/utility/rect.h b/src/java.desktop/unix/native/common/awt/utility/rect.h
-index ceea38f4349..91b5a17ec58 100644
---- a/src/java.desktop/unix/native/common/awt/utility/rect.h
-+++ b/src/java.desktop/unix/native/common/awt/utility/rect.h
-@@ -28,7 +28,7 @@
- #ifndef _AWT_RECT_H
- #define _AWT_RECT_H
- 
--#ifndef MACOSX
-+#if !defined(HEADLESS) && !defined(MACOSX)
- #include <X11/Xlib.h>
- typedef XRectangle RECT_T;
- #else
-@@ -39,7 +39,7 @@ typedef struct {
-     int width;
-     int height;
- } RECT_T;
--#endif /* !MACOSX */
-+#endif /* !HEADLESS && !MACOSX */
- 
- #define RECT_EQ_X(r1,r2)        ((r1).x==(r2).x && (r1).width==(r2).width)
- 
--- 
-2.43.0
-
diff --git a/package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/25.0.5.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/25.0.5.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch b/package/openjdk/25.0.5.1+2/0002-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
similarity index 100%
rename from package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
rename to package/openjdk/25.0.5.1+2/0002-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
diff --git a/package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch b/package/openjdk/25.0.5.1+2/0003-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
similarity index 100%
rename from package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
rename to package/openjdk/25.0.5.1+2/0003-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 33124c17a8c..85c9f2ba009 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9b3164cedf78d7a76a59499d7a6833145c7e0269ec7b664bfe5ee03ced2f449e  openjdk-25.0.2+10.tar.gz
+sha256  b3ecd75437342ee932f71792bbbdd09cd336659324f94ad0e81e527af74d8c5c  openjdk-25.0.5.1+2.tar.gz
 sha256  2f00670ffe781881c6fdb60f49ecdfd12a6c0f5e2943b94d17b1f4bc714397f9  openjdk-21.0.13.1+2.tar.gz
 sha256  1358a7fbe258370744a11a4be8017bd9d30a00a5fc5b784f9221815bb7444a4d  openjdk-17.0.21.1+2.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 94e96e4924a..495ef58a0c3 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,8 +6,8 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_25),y)
 OPENJDK_VERSION_MAJOR = 25
-OPENJDK_VERSION_MINOR = 0.2
-OPENJDK_VERSION_BUILD = 10
+OPENJDK_VERSION_MINOR = 0.5.1
+OPENJDK_VERSION_BUILD = 2
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
 OPENJDK_VERSION_MINOR = 0.13.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
