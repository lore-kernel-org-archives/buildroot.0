Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC05CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D84ED41474;
	Mon, 11 Aug 2025 16:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIVirOjrjJV4; Mon, 11 Aug 2025 16:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE4A940E0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE4A940E0A;
	Mon, 11 Aug 2025 16:18:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42A5D154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB5B6144A
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfopvoqVBdW8 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF2B361417
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2B361417
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF2B361417
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1uSjes3AJb-00zwoX; Mon, 11
 Aug 2025 18:18:29 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:18:03 +0200
Message-ID: <20250811161809.3641323-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811161809.3641323-1-fiona.klute@gmx.de>
References: <20250811161809.3641323-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3n6CzmF3tl7JvzcDOhYIn3Ht2bxU6pxl3HQNaEdbwQsUIx1+/PL
 orm1EoOP3WNOC/yCyGiEXC8oYrAVVJW9arVpnNel0hHGAUGoPIY9U36lYSeJ93TV2s+8F+P
 j15PkxfIOIonaBIerEzx3m4eElzZ3fguEI4LXbdDOX249SB3vhSzcyGrrBhvX86ub45dSL+
 MbTxbh0l9v+6UrxJzRTLg==
UI-OutboundReport: notjunk:1;M01:P0:0IXV/vIjJw0=;n/n5LEQPeCFpVA/8DDHHC0jYrDW
 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
 qfbCcIMvgwtGnV7T0/85WdbkSBhcMSz0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754929109; x=1755533909; i=fiona.klute@gmx.de;
 bh=QyGa+rYSFstlHxA2ZAJYGhourkx5z01WTJdIO4xj0R4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=A/s0hV4ZzkrSfnvIqu2iAbdvAc3NFH3hF+xsrKUlYSRXtcz+yUWrUiVdzQpqAYLQ
 7OMOt++FmKi04S/HydXICw/W8gVPCdMY/iyyZra2urleAbFe0hl6bkd69eebZi06D
 K2mzQoRzhvt6I4dqOhYtV9OJyn+NME1bYv3DeIGg4+rikmQFq0wV9ne+L/1/Q91DF
 OlgVVGpqcpVdDa6ZRbZ8CI+KXspjJ1fWJ8KEtVqAt3+eVsdJsOEQFdxUbYZ4j2jzY
 6yq9rIRgBLLSaxFeFYsrRMKAO/EvLtKYtugMTnVXvgEVJBEeIWmJTwbh1JlTaZ5BS
 qWyenZDIwD3Fo97pQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=A/s0hV4Z
Subject: [Buildroot] [PATCH v2 1/7] package/elfutils: new option to enable
 building libdebuginfod for target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This does not make debug info available, but allows building programs
that link against libdebuginfod.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* add option to enable building libdebuginfod, instead of building it
  if requirements are met

 package/elfutils/Config.in   | 11 +++++++++++
 package/elfutils/elfutils.mk |  9 +++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index e866dd448b..a57a7e4d8e 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -33,4 +33,15 @@ comment "elfutils programs needs a glibc toolchain w/ C++"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
+	bool "build libdebuginfod"
+	default n
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # required for json-c
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBCURL
+	help
+	  This option enables building libdebuginfod. Note that this
+	  only builds the library, it does not provide any service or
+	  data to download debug info.
+
 endif
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 39d6607cdf..697ec538f1 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -49,8 +49,13 @@ ifeq ($(BR2_microblaze),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
-# disable for now, needs "distro" support
-ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
+ifeq ($(BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD),y)
+ELFUTILS_CONF_OPTS += --enable-libdebuginfod
+ELFUTILS_DEPENDENCIES += json-c libcurl
+else
+ELFUTILS_CONF_OPTS += --disable-libdebuginfod
+endif
+ELFUTILS_CONF_OPTS += --disable-debuginfod
 HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 
 ELFUTILS_CONF_ENV += \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
