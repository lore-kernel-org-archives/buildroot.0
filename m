Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3041C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39CD360B68;
	Fri, 26 Jul 2024 16:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lENZiF4dngBT; Fri, 26 Jul 2024 16:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B78C860BAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B78C860BAD;
	Fri, 26 Jul 2024 16:20:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F31791BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE62F60B66
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytxi42tz1Tfx for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F9B460B4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9B460B4C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F9B460B4C
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:20:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf4S-1rojTS41Vy-00qEmM; Fri, 26
 Jul 2024 18:20:37 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:20:07 +0200
Message-ID: <20240726162013.2183792-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726162013.2183792-1-fiona.klute@gmx.de>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:h9QheMIdfUNz2Ym00qIG33JtcPI2HqkTvLryHyF59X64S4vw4/v
 6UVak2m/hhrhgMIZxw6FGF8poY7wxPpiggFYQDJKmjk9Iv1hmBj1S9PLVjA+ZT6CGZkJuV8
 nXgmEfzzG/6AA4Y6pko4dU1564TswDy5bHxzKfLxq2eogGumULb9JUJ46gxMckJtK2BxjIS
 9bOagwtwytALeowySyA7w==
UI-OutboundReport: notjunk:1;M01:P0:REnNkH7fkVU=;pM8Zfix4Xg5wfO+AJQByHQifhpV
 hd/LGpd7CIWzPdi58rAQt2sAoJlOIhK+KPYbXJ/N4eE6XfDmL1Xg9TlvexHSdXXp2qvqdpr5R
 GzWxXD0S2CoNujPIxSug7BQjzeD0GDn0BxXkGHVFErzHXr8Jsk0XJbKBasZZ3HkkIYpuwaDXc
 t2cGg60QyB2OFfuQjH6fkAlCIDrdwB7IPevnVTSn6nyopis+AwBJn1B8iG0M4iX32lPm4sOI7
 stCCR5Kzx6PTFQDpj5m5SepJhcuOkcsWoXTI5/st54ePUQTI2r6CoKQTgiQQzJphxAyzbaDQ9
 HN9hFJxAOhcvWpTR6GiwvJmRac8OKnjSiuzhEqOoclMRNACHWNxzxX49Ny2xk+usoVDuQx+Ag
 qtwaXoBOqfA7AylLjO07h1Lz9mGyJeK29OIjSosh4nxF0fWGEWJF1BGJLBtP61kbGwS58aMPA
 hFzbtdMrqdLH74EikkvnJOpkJSFXck8w+8i0eq2fAXQ/gl/bPedh+sYmJ4AeFSsIxq8KGWFQ2
 P/I6elOaeNK2Co5Y881eY76UQjV60Ei/Us+wEbcZYbo0EwNN8ak+n9dby8rNETJf6MkT9xSN+
 9J2M4kUDqsgfCfze63VMwPJCr2luuIUTloTzb60hWNBdTveiZXERYFDS5Xol7DsIW43da6V4t
 LQ+loyhzcc4/fTVNJRkZVLRU5mHQUmmyeN5z+a043v2PEqAXxwKIgzspiYTrXuYLWf91sE9U0
 6CPdpScqDlvgcQ0fnn+CdqCE+ygdly/jFeWt2XD7Tuz/XtKSZHl75wRIrBzCLG2aSHYm1kx3R
 NsMT0qR9VQ6RWhmIuBjWR6qQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722010837; x=1722615637; i=fiona.klute@gmx.de;
 bh=dbbHIJye4XgLNhTaw1LDSzARexqsWKRfIQEBvZrk9gc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lbDx79vUXtLJfv74mSypmAAofUE/IUPTp/s4qpTJmJniD0IcieF1YOcZr6/H+Vjr
 0OZdNlHwjen0ZIu7s7drph0dcUmvqdeLlNca4zOpOBECAsf8SBzz2Zm0Ah9zX6m2/
 pJGI+uhIvXYsw4MA4yx4OKSvCgW7l8zTWs1xaNYAjIiSi8wIG64+W+T5bhmMRkzS6
 kaWeMrNh7hDKANQmf49qZZSyb0K6bYlB97rAFIOPchSmq95q6pTj0p4LQCu/ojbVB
 ZYg1RQ82/ZSR+extbNgUF437FC5jKBCv/5C0IA0A3q/bkV+8mTIe2j2u4g0IPyvrE
 GESQ8cTMpNTfbBJDbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lbDx79vU
Subject: [Buildroot] [PATCH v4 2/6] package/iptables: optionally default to
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
Changes v3 -> v4:
* set ip6tables symlinks when selecting nftables compat

Changes v1 -> v2:
* clarify commit message

 package/iptables/Config.in   | 12 ++++++++++++
 package/iptables/iptables.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

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
index 6712136962..dbf7fbf5e1 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -62,4 +62,16 @@ define IPTABLES_INSTALL_INIT_SYSV
 	touch $(TARGET_DIR)/etc/iptables.conf
 endef

+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
+define IPTABLES_MAKE_NFTABLES_DEFAULT
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables-restore
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables-save
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
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
