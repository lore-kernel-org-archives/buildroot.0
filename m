Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B41C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 16:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8AE4606CC;
	Thu, 27 Jun 2024 16:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtN_GcE6kizw; Thu, 27 Jun 2024 16:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBEA60716
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBEA60716;
	Thu, 27 Jun 2024 16:22:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1AB1BF3E8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 16:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05C4941B07
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 16:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILPJ0DN0znya for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 16:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C6FB40229
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C6FB40229
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C6FB40229
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 16:22:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.36]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1suHyB2Kss-00mZlg; Thu, 27
 Jun 2024 18:22:53 +0200
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 18:22:47 +0200
Message-ID: <20240627162247.1639546-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:MuPqMu9aiRt9m4OcjHzf4hOI0BLt5NU5GGpF4nxE6LOziNSblav
 O66W61FdNFtnuOqfJheUsOnQQHFXy6kve/6T5Kd0fOFKC1pMbLdSK2FxWKYUaoRDutCaMEx
 mX8YtCuJR/g0xowMRFXaDJOfDaSAKbKSC9UYBqEaLJjD9Wos8AAddgCmVrObaiFi+esrEFm
 GORRH8GX7uPp7z8A33Edw==
UI-OutboundReport: notjunk:1;M01:P0:lp34KghdPXo=;vxTOb6j0jwdwy9BFeWoke7ARVyp
 8iR4wJvxpHzaVngMymxH77ckvMTleYSHZreZ0MpildmKWCYu1xuy+vmplPagyYV4liI/1I1uN
 teWZxk5swrqsrZAk0Dsp5luFZOlnZ4+sr1wTphVZY43nJO4Bxot3j0ryWymFmxdko74xFGKpu
 Qn4DGsTc1N0kd0wymtvnrs+ECIuENttxHkL0c25+pM7Wgsd/Xh3iQhow2LZKoXqpQIo35lPim
 6K34Z504TZGt6FPPF+MOxGjDjERx4K4jyOWedQmz9MxPGeALvYk4psLbL2wfNJe0aAYYnMplZ
 5H9v9vexndhxW55LkNQgL4AhejOqIX2NwX1WsYUx0DLNfPvoeHNu54OSGgwVe87cXrA4aouHD
 z+IWCa7GAvNs5ZPwDGHMvco98+kANAgfjb15T8r3O3Xw7sWUAF4Ht6iCQpIVt6u1ZSepfRL3v
 6KgbSYAulVoJpClTU+V/KuE4VRYvHtzFj5KSmX/1xsxIQEgjfTdZGBQuw4OdEyjsag/WgkK+l
 /ExjMEttfaPY7nKPzWl4bXUY4y2/TS04Gy0dRvi6w759nywuLiaIbVsmPp/iPSIAfKcYNm590
 PrrboaDgyB1RqTPBSj3rCiMW8j0Wa01GLPabachhldDX4yUMQiehp6elclS+EnClCZRgRdx2g
 vcFJBt8RmzWL8+kgfNxqu2T2CwDgbKkEZQvuLTo1+GbjcPbQ1SneW36G3JD4t//h72FCayXj3
 D8y1SNHiqR0PfY4GhHvaSAEGNLjLs8Fmpw+GWAjx6dPHif6e1f1w1mskWaS2Q9OmQEs58kg12
 oZrvoiysS7g6wr9jFXN9MzN4uvnnZz8so30g+eCdpmg34=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719505373; x=1720110173; i=fiona.klute@gmx.de;
 bh=wwBHexLQKJ/zSmIjXIxoTR97dBh11h8TLF7deBlD4JY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uNGNSxRnUM4gzp/WFqRbnID9nDzTOovM15+V4i/w9HpfhDcOYZm3p7DDenlT+Kr5
 Yi3hHwZuJIPmXGoIj3lJQRZwKouGRRNio5N5B/oSANI/LCEOkObFfJriSnYX9NTe8
 lUggQpXoL6xzZcfjDxbDXzAjmaYGFVpoKn9PaiLp7h0D1+5tDh1SSMd4z8/bweGUU
 5l2OAouEJsxyhX3B8Ug6QCopJgWBlvvrlpgvhAPmGWyMnB7t5dgpbu5LseyzA73t7
 SQLQMzZWyDIZtIAZr/8fgNmAIMJQbENrwnRA0I1G054o9ZgbINKUwjKUpu37IGrlt
 IlyZWSh2YQRyzglbKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uNGNSxRn
Subject: [Buildroot] [PATCH 1/1] package/iptables: optionally default to
 nftables
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Depending on firewall setup it may be desirable to use iptables-nft as
iptables, in particular to better integrate legacy applications that
do not support nftables directly and call iptables. If the new option
BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT is enabled, iptables,
iptables-restore, and iptables-save are symlinked to the -nft version
of iptables. The -legacy options can still be called directly if
desired.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
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
