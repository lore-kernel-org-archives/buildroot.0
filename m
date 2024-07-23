Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4998C3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AF88126D;
	Tue, 23 Jul 2024 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_azZ1uSv0fI; Tue, 23 Jul 2024 10:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 391AD8128D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391AD8128D;
	Tue, 23 Jul 2024 10:29:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6485B1BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 522DD400B5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KspwCbGmjbUB for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B86A2403B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B86A2403B3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B86A2403B3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:29:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNtF-1s28CG3NxV-00hjJn; Tue, 23
 Jul 2024 12:28:53 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:28:27 +0200
Message-ID: <20240723102832.2522307-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723102832.2522307-1-fiona.klute@gmx.de>
References: <20240723102832.2522307-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VmMVWeQRBH89O4bst5P0TwVcu2QW+LhL0l1jHpA/fb2ah/OmczK
 K950ZFdMVSkTTdmMy9/2Llu4enXGC1psDO0yThBaWyijn/xz6Zxg5790VlaW3on981KeRB8
 tbkJQk3vbRGgUXhLagxa4ibNmYQz7B+6JsGVacour8onl6KvGn21gHW8JHF3EhRGczISnJy
 5mq3Wdrus2qij3XKHQX8w==
UI-OutboundReport: notjunk:1;M01:P0:Tc9z0XX89Rs=;tGjPnKlZve6m73cJAEJNJmsZJTa
 jAQL+NFrKF/JcGqqRtlWZN3Id0BxaFg0lVCB/Vytv4oOunHhZCO8WWdLy0KtBOiXkHfAMoBKY
 vu/iw4aQMtGRL2PJeYRMsDOqtnpES4WHLXC4j55Vn8V229WYwdPKUTg1Ovtar/uf0WNqYnL7C
 4mUSIAx0fkX8aeA2XS6vwjnYeNhvMqPZUjs9xYRn1EYequXkU7jyANpIyfQmuESgqk9UY7PeT
 QGx2Sj2rpKtLFQ/0epOt3PJtIq5K7Gu4a6DeUivzeYH9SaPUwyCm2oW7dvDnaQ9QlowTJglxf
 WyS7BErq8DoqlHX7n+C4YRSL5Yqw5zuxACBaiDx1cq1GCdb4Zsik7o+QkFZ4mz7P2zWAUydd9
 MS8awzHibYp9QLE5tMzAJCCqIyawbeoVRtO3Eu+Pp131EeAjX4smYqo5+UmTlYewtXDjhFU+9
 YlTKbnScl7OqOxpVNzQO/fpWmviGWcFixzomhvzIiyX2EJYfuCufqgMqU54FpJibQbKmimyvp
 6UEj8ikoqnoRB2vVfqt9yJ4k/UlHlrH/RCkd7y4usUBbe387PmwoqE8lG/2Y4kDo8OmZeO+nh
 1hrDxJye5lR5VWhAMiEPyEx34IHHBaorrURpG6rSC3Ad/Hmvy1lrQCoN1A+ZFx4FP9YO9R4RU
 IsDqLH1NHvdirHlasKw5BEAFw5LMyjAndzhFM+8ajS8CCmSvqpBJBDrNN2gqz9/tNxQ5VRKrc
 azXLtu8mSLc4yR4xJTjoz9O328ShGu+wFbNkvPNMCCLPUxC+deCO9tQ+Dr8rgN0pUzeEj/IEL
 IERr03i5pszlOepcQUZcWQuQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721730534; x=1722335334; i=fiona.klute@gmx.de;
 bh=ABHmcBEXmrt2vP/g4pCEWuCaGan7A6enfqX7V37nk+0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=O2t7tJ/PwW62EEVLbvTW1Kahg/6vSJ28ULZPwtuT7X+1i3ft+L8WnoMbM9VM+eQJ
 NBuAHovqkoSnqQ2SMlQ4Dnvu7sHQVYZ19NCayULqEeKprFRiVdtnapth9YOMICwMq
 ttZC2xRu1iES2I0Eqqs1f88ETwnBk1OlX8jAw4ha6hg9la9L7DfuTwMmm1mhM+RXd
 VE8YAqE6aHz/1tn4lXwGxB+zaJyMgDddkY2bdGXJxyO3L+J0fr6Pb3Du8UqzCF0Jp
 Y74V7KOY8RK17irutYcbowC08Jv7qvQ1pEF4OySNQipp3YFKb3hP96C7P/vJEcN10
 c7QSc8p//ONPkkKb1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=O2t7tJ/P
Subject: [Buildroot] [PATCH v2 2/6] package/iptables: optionally default to
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
