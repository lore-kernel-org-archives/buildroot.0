Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856FDC3DA7F
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F836080C;
	Tue, 23 Jul 2024 13:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu_Zs0OnVBy8; Tue, 23 Jul 2024 13:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D9A60871
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D9A60871;
	Tue, 23 Jul 2024 13:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFC921BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD15140ADD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgkOwhDoaBwI for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F73240A38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F73240A38
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F73240A38
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1sCOTj36z2-011KIX; Tue, 23
 Jul 2024 15:40:11 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:39:44 +0200
Message-ID: <20240723133951.3542206-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723133951.3542206-1-fiona.klute@gmx.de>
References: <20240723133951.3542206-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:i+a3HctWsldRc8ShVK6Lz82htr73Cn5owreuK2IsglTYZ9f8cYV
 QV2cW1GxClAKX25kRhXyZOIjknz0o9qJPmJeVlrHF37yag6pLhP20b2jFjsd0cCkdnwLoAs
 stqCQ473MzUCTAmRNI5tNgTWYPpwjzNbndqrF4B33eyu+vssccr2GYlxtJJINjygkrumcRa
 t0tvmDoe+r+f+MvgSbw0g==
UI-OutboundReport: notjunk:1;M01:P0:WuRltPLo7c0=;DNTkbJN/uJU9wtDrlteZjQ2FP2r
 31tFK2wzCFslHdIW+Di/ab4f1AVP0q50KBaiWux5QC080TU5thEppROwEnpHe4mG/Y+uSgvF+
 U2SliZOzgHwRhOHrWvSK2yVI6p/UKhAiEFzV0rnYva0d6l1T3JmCjBB6sUoEnH4h+U0jObcNt
 iW4wYpRap9PE+R1/yII965RSX8Ia9w14lWO/Oa3QzS0MjHpwioACoj8vOwfK2s6ccs0VCcBmW
 OSLdFwtYOAStuQCTzaHRwhu0uTsdTJYBQmvpjvJ9dpGqgSgRFVfaUMJVqx0WVanpAvR07ZUT/
 6VU4O+XcS4bbiueg4JBoa6n8WhXZITINZULi4bAGDpQ1XzVqxamntPpoT10Z5/j9WrQsSEcDw
 ybcjhNdplNFMtDEtqmkckCLIkoVVjBH9ByI/gxGUq1A5kz0ampGGe/JqgTDSS5yvQoj20sAdi
 aVtj5z/S4deCUnxAV8MvozD/nTC9W6DfZP5OOC0SZlDGvu5dWSJdCT8nDTVCf3AIVTYJAUbBp
 jcbVkHHjTGvJ9TWQyz13faIqzDcipQi9JUiRPXtsjaBrB7bCF9sb7BMrSEb5FsNVulZXE9Yj2
 o7GkJGnVLq4C06gfbq/aX5/EdaWFV5WU2WGIHHzrBSwhg+ws8Ek8l3EZ++Q9Ivq5ZL/f4Z2IO
 80+Ql94w61atutS9U3CKXKv36L3PFUqppnqbNn1cCG+s0a31tvr6avXcCMJbIxUAET9e83i2L
 51aaSerImnfkzxZDd1NhLpMv1YXWfMw0xPc0HHju+7bih8113+ftD98225qo2VTqLLDkgQ7Ru
 +SyHWT3QpTlD0WUp8316vdtw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742011; x=1722346811; i=fiona.klute@gmx.de;
 bh=ABHmcBEXmrt2vP/g4pCEWuCaGan7A6enfqX7V37nk+0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dTtQPQv+nSHjaw5k02yu+FxYlEDn7atpbqF/Ny93jiURf//CfOi8GMGVP676AEky
 OJw283bH7SgU9ZZaz+5jOdhYx31AI3vAF+qZDeUzkPXE0+EMPlNF5QKEoDfFNDEBI
 xuwJHjquxg1HRJ//CX/E+AU1vsekmH4N8UkXExJ5yWG8aBmhREztKjc20WdgvYm8x
 R580rVZNauMeof6PYMCj2rWiXj8Cl2fkugMP91Jmh5MEZHvqtGtm9s3ugjcYQP/KF
 S/K3Bg0HNtBHEp8RH5xX09ZagmrVmiPiqOwBskhW2I68Y/e5VbfYTTjJmxphL0Ggf
 DFrycV4mgED0v4cv9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dTtQPQv+
Subject: [Buildroot] [PATCH v3 2/6] package/iptables: optionally default to
 nftables compat
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

For an nftables-based firewall setup it may be desirable to use
iptables-nft as the "iptables" binary, in particular to better
integrate legacy applications that do not support nftables directly
and call iptables. If the BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT option
introduced by this patch is enabled, iptables, iptables-restore, and
iptables-save are symlinked to the -nft version of iptables. The
-legacy options can still be called directly if desired.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* clarify commit message

 package/iptables/Config.in   | 12 ++++++++++++
 package/iptables/iptables.mk |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index e6b12603e0..ef02c26242 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -24,6 +24,18 @@ config BR2_PACKAGE_IPTABLES_NFTABLES
 	help
 	  Build nftables compat utilities.

+if BR2_PACKAGE_IPTABLES_NFTABLES
+
+config BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT
+	bool "use nftables compat by default"
+	help
+	  Make the nftables compat variant of iptables, iptables-save,
+	  and iptables-restore the default. This only adjusts symlinks
+	  in /usr/sbin, the legacy variants can still be called
+	  directly.
+
+endif
+
 comment "nftables compat needs a toolchain w/ wchar, dynamic library, headers >= 3.12"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 6712136962..257834b8cd 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -62,4 +62,13 @@ define IPTABLES_INSTALL_INIT_SYSV
 	touch $(TARGET_DIR)/etc/iptables.conf
 endef

+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
+define IPTABLES_MAKE_NFTABLES_DEFAULT
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables-restore
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables-save
+endef
+IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_MAKE_NFTABLES_DEFAULT
+endif
+
 $(eval $(autotools-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
