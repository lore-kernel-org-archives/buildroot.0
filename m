Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E2BC021AD
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76B482197;
	Mon, 17 Feb 2025 15:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SE7O6ltwy-dm; Mon, 17 Feb 2025 15:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D6382194
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D6382194;
	Mon, 17 Feb 2025 15:32:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4324EC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3228640328
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzmzcejEkq5V for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B50E540BE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B50E540BE3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B50E540BE3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1tEIFZ3F1g-00ktyP; Mon, 17
 Feb 2025 16:31:45 +0100
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 16:31:23 +0100
Message-ID: <20250217153127.1363472-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217153127.1363472-1-fiona.klute@gmx.de>
References: <20250217153127.1363472-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DjyhQ2O+9zF0U17kjUQCNKn0iQVQyuNFvH2MnNDaDySwIQExBoK
 gN/XOvH4Utlid0u+3yX48HilqNZe9yUx0vMFQxxEKkuRA8EXM6RZLntLIxysE3XtvirHVVf
 FvOqekdolfFQrPXeGy3OL9H5LTXW3cgTrvWjT/xB9jNBUdjLLwIWWD1I0S6zU6L31TdBOiY
 gZJjOcLfHhCdYVM16+yNQ==
UI-OutboundReport: notjunk:1;M01:P0:xvkA705bxu0=;ObjlBcOEkqRYOT+SD1sO6/G5LKV
 TGH9II9sCorbJojBA910//6WPeaGbj1/zjyDvx20LChVfNWpvequ9/yk8MV6thkwIHJDeMriz
 CohjxO6ToKAa2KYuVqnApci481ZXNYmW31QBmYd3NyMoHoVxd1Bo4GJLV24bSarWqHuGoq86D
 S9dkb++gwFRiPB/8xkcXPtbtedlZEFEWuLz6XJS5Nqw8iqhawV97lHyPnV/eTpv4jX+5bZJ+9
 GxZJWddqheTKSUFishb/eWm3bWGgppDHtUjgIm1594xTghTDXTAzNensgMa7DnE5ZE1WRbkPE
 NeslE98Md4NtLzZqki8FAjajlUJuPQBDPnQIMXOPgRIzDmjZAKHIAJohwTSwJtZUc1a06b1oG
 dhefaA3jQc/LFmRO3IzWUATv2pqkz3HrGWAxAnhkIvbBH7x022S+HtbJr3aIxqyBXalIB17j+
 QZbqvF28UQKsBDTZgzM/UFit/yKTuFBwgIephJkZ1LDx2vzHadydc3D0jXgDTUdpQKis1JOtS
 zwVYrzR4G0tVzilPa5WDA9qy/DZOtLFF8dZQm3FsvX/OM8XKiYHOOUp8ezFg5f2eyo3k38Nu1
 it15LXOCORB5GxWXOUbOgDmNSAXFjAEPWhQehTAFqDeGgwFljfHmACNSoVu7V81eMQf/fxV7D
 SBR45zEUt/BRMUYSdQuxMj4cL4h4fheVZQK8o/5roOfgEcVswv+j5/aTa70wOBaFYmNfJKBdd
 xJbb1tPW2A1BVQY7hc1WnNhI8VfvQxiCi/n9tQg8iIQNAVZu+k7igWQksYqfTF1r4GJCfR71g
 U1oe2d3ib5hpK9uvYf1lGl95zw98NE7DMn6dU26TgGUDAK25xSleqRC/qVyJhEu1T9Hy/P7ny
 D9hOLLHUQN8ki5RPBN/o8Mq+yWfUvNl9i5ezg59JgAaEp+cCOo1F3POaLdcH8YGtfplp7AFbr
 1F8lnBkfEZ9F0wl9jB1gSKzBJ5z/uL+0EXv2nZIGl4eEgcSH0o/VFxysk4NHWE6dhLCJ4YiTS
 F5lXjFAqTIK/ekZRFQMpqwvbFYE8y0v5Mv6182eHynQmkZ2yPX1vq2gjqz4STxQTKbpfuzp2r
 dUZvf5UJnJIkv0bbP1Ir5X1ruYb3btzzmDnLnf+4ahgZ4+ewEK3qUvWT6UdhKyhl5vZnG998K
 eDVkpOzoB0TyT9aMSo+3HwASzbsGGyGGVeikXX+V0VU2HpvKeyIucs1klddN9iVLUTZWgN67c
 aTfNnvqmfL++CAUEVzpT0F2gQFMu9tzP9aAfxCq8xjLZXCvD6ukUG0nst0sZYnAh+Ua1AGzxH
 pLIiY6/IP9MgMFO8B8osQtJhCXXmuMJqplZbKmA+h2fZJkCQHDQHATQn2wFRsaqUU5ZEmxedD
 QE2pMvEh8DkRUEs44wP1eHsPp+iDmOGCkMkA3yHzci8OMQuEpt3CtTX6dfJi2W9honCjU7feN
 7o5J18A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739806306; x=1740411106; i=fiona.klute@gmx.de;
 bh=nA/T10IVj9W8hQtWSnnpjKrgNZP/xVNr2DP1g7YKb9o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Rv8a/6liWSCaCiNMBzSnOCyoIF5LsLC0P6Frb8IqhpEVhTAXQ9E2da/qKOz3jOwV
 z9113SNTSA/ZnT77g34sy9shYjcqstifiwDPV8LGw2OdCUCjATI13O3gj4ILlK73/
 2+a3H8F/5mrKax7us1yq+OovYPWXqQm4KaBpvtdySzAJPlD3R4WOH2tczp5ZEBDAq
 Csv+a3lBymcgee34IFWuticakPbTz3lhaglKG/3FzG/fWvHxJ+f+vTzgOGPaidwsf
 S5KxDxm7vpTJxwsqVZOg6ub2LbRjUZ0PMLNiXnYLglVK9uYlLWNOSSNZLrkEZpVFx
 VM4L4MVMAIQEFkInzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Rv8a/6li
Subject: [Buildroot] [PATCH v6 2/6] package/iptables: optionally default to
 nftables compat
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
index 533f56a992..8d23dca249 100644
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
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
