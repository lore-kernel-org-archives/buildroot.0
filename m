Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D7FD68BF0
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 22:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1ED0606F2;
	Sat, 16 Nov 2024 22:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAlR-bL_ezY3; Sat, 16 Nov 2024 22:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8464606F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8464606F3;
	Sat, 16 Nov 2024 22:41:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3776AB14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 22:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16B8B42540
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 22:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDxgZWjI6ndf for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 22:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5BC2424E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5BC2424E8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5BC2424E8
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 22:41:20 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3AA57B0053E;
 Sat, 16 Nov 2024 23:41:15 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 16 Nov 2024 23:41:06 +0100
Message-ID: <20241116224107.452731-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731796877;
 bh=2/ORa7ufRiuj8eLcASkO7pohEP/U9VeeyEyKP3H46eY=;
 h=From:To:Cc:Subject:Date:From;
 b=dw142NNAMjxauE2/yjr8I2Le7BoG0O72s5hlkc2QNInyYfyf1fSCs7fhcu/rSG1B9
 O5fjD6jc+uZzkdFvm/IMS7AZvcPavaMAgkP7R2P7yKCaOx5O2yPUugG3L7JH4ARAj2
 OIdDH/aPhJlB+yywSje7cdYYgBcMJXGmyQpjepy8Lc8l+U1Q4rK9KJZF32avVsu77J
 rHJ9qvpdV4R3/PsU1v4i/6Ks62DlFwv7rfQjQl61YLikqrCivu9kVqBBDocgZ+az6p
 WOkL4NeQzAKCFNaKMqWhQwLhkRQ+Hf8GRTmKZLYWASWdYOdsxsNcx5MggS3KKjf5bE
 /f7xMlu6XA53A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dw142NNA
Subject: [Buildroot] [PATCH next 1/1] package/whois: bump to version 5.5.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/rfc1036/whois/blob/v5.5.23/debian/changelog

This commit also adds the sha1 hash published in the Debian source dsc
file.

The _SITE url is also updated to the new snapshot, and to use the https
protocol.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/whois/whois.hash | 5 +++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index fb140fa198..06237b65d4 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,6 @@
-# From http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois/whois_5.5.14.dsc
-sha256  bf9c2cb307d5419b34ad401eecf2820b8f69660db41cf0762e5da71fa2df68e8  whois_5.5.14.tar.xz
+# From https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois/whois_5.5.23.dsc
+sha1  18227c0efec651c31fe764cdc3af17f5389bcc21  whois_5.5.23.tar.xz
+sha256  35c04e46bd8435f46e446a817728b5fae2f0a389033a9383e5e20bb6e8fba14a  whois_5.5.23.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index e98add4e6a..ca76b22e6d 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.14
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.23
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
