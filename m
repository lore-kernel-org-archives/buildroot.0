Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84CCE77171
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 18:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58128607E2;
	Wed,  4 Dec 2024 18:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6a08ztVJZtd; Wed,  4 Dec 2024 18:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2443660B51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2443660B51;
	Wed,  4 Dec 2024 18:29:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33BF01DD3
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17FB360901
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v15sefpqYR-1 for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 864A1607B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 864A1607B2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 864A1607B2
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1tdAnh0tC6-013gQH; Wed, 04
 Dec 2024 19:29:23 +0100
To: buildroot@buildroot.org
Date: Wed,  4 Dec 2024 19:29:09 +0100
Message-ID: <20241204182913.4085670-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204182913.4085670-1-fiona.klute@gmx.de>
References: <20241204182913.4085670-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9RWkEPrlwMAPmHh47uliClR9EEgng0DfrjQ63F7MVv/7C+TOt6j
 ozE/TnG11m9zH2nHXV2ydjMu3SAFqIgGLqYvIFc4qTB8LqLjkYNXKtNlb7pVpwHjqUQWO+R
 PkZWyYzbRRRxZOyHMD7QMLmCenyA35LP2QsaiMcZZ8+beSRDwqNoAaLp8tiiYJxib9c/XJZ
 Vg7sQUpVJ75AB0lpalQHg==
UI-OutboundReport: notjunk:1;M01:P0:Cph3ivsHXpA=;drUX7bJuQHMiQ3uT5seNWgj8tAn
 W0eY3QDA7X44LKyusTkE6h1iW9ZkZTWi7Ys6uhc4jxlUgocrKquUzVg2/g7fRa/q6CUd5FdSI
 tjsiwtPlGX1mHraJTqp7k4sygZE1ffLx9KGhpwZMTk3ERTCfmfEFrM0BC4JkJfz7dKZEFnV5l
 lNgUWjm6LWIpDNb4nV7DDFOvzYNy2gGFHXxlL7Vu5eH4JN6HwUYVMZyN42yQftW1Q1eyzraRY
 /J1VVzDBlEdtrSganeiyi+IQ+l/3olW67dMeKNsJKah4s+s2rz5Nf3dQlNL9QJ14zl/R2uAi4
 K2rwvSiYOt+5A7sJ05UTTrLV063qWzYErbsb5O2SaWo4GIiwY/E3uFUjMwEA0Y9Ofq5RQFIjn
 Trkq2UKfcyZqAHCJLBcil/o+zXtzAdMKj4tf0hXvVEyxSA249SOm7sjPYo3xYBUyNkBEAa5r1
 IT7PAK+SA7elQwdZu2mBJcSJFG1kNsfLIUKsfqbotgOg65jwE9+qOiSHp8SOy49LD3vM0JimH
 BwRMv4zx4ufBBEhQZWzkEB1L05x6TUDV7Qse6vzic3VTxV9hUVEaV35fTkWEPTd53Snbrkb/V
 +P64uZh4CkPVK3tAYANoCsUCm/uFTa0lKuk/hg6uVVEyYh/DJBAusVg6fnCn+fu3gfFjZnuNY
 XlxSOIJHpFjLfNEMla23j3pbNUoM44w62rxwRYMs3jaipvWgumer4XVoHDaIBMwKlLX0SIsEw
 xxz3CAkuaYfnA83CvfDfW1acxJOxY2QS0qyQLTEifJA9dUgpUSW3jIl3OLqsU5C/GrUgH3T8y
 PBrh7rj/uQHWaeFHJezU+v49Nkx5ELwBrrPKl7m1igLMwQzIocd71g+dVHPvL2A6h9ngumX2l
 n6L/ziyHgqXnAcwCPfF37QOIqTxrS2smumtFiX9HKjsskNO9ijNzP4NgOGRSMa6+q3nroW+22
 +1Yv//95E6Jvloyr2PYOMnifiQpjAZziYo9GZFbpzbXXcwm6y/cdGXtIeD58Yyx/Ku/d88VxU
 d8oFdp8285mxeERMQWGgA58QbrWPS6iOQYbpSsP9f0yqvnFfOvvfGR/jjRd/vi8EQcIN1WDZX
 zT2uPpl+cOS0cgNuikRJP7D/8xjY4I
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733336963; x=1733941763; i=fiona.klute@gmx.de;
 bh=Jfc5qThGxO4e5pO2LePq+NoR/1Z+YCTJzsT978XdSjk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DRrPOaQnsyU11Zkeywt03NmpynzmsvR/IKnTh0Dfmhf11DEvZkZ4IprpiXKmWiM1
 dsro8dXS3rgRo2MN1bXCpyncXNkiNqmOMy0plTAVIG13AveScInLEjuPuCIx4NDdU
 gYjHXgPeu4SJ2zNqGUoCij8xbHYljavtKzCFxM8M683jJP84kudajKBxW6QKXrARl
 QJ1gzqJVgE+RT2ePngngWeVIuViVnjrlvHX5NtlA/wpohd5mUZOYCvn76lYmpvTUf
 QwhvsacXmiYXpntqyb8XQp2VMkoZ9nTVSXA4qGZxofnhRkrQiEJ+hXmJ4YQbgJ4SP
 paG2EFs4kKKj1dk/Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=DRrPOaQn
Subject: [Buildroot] [PATCH v5 2/6] package/iptables: optionally default to
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
