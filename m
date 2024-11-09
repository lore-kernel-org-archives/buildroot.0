Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED21FD5E38A
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 23:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90FD680574;
	Sat,  9 Nov 2024 23:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YALHStv8jrG5; Sat,  9 Nov 2024 23:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8569580C8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8569580C8A;
	Sat,  9 Nov 2024 23:39:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF8BD92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 23:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 099D6605A0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 23:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDs2MCPsRM8A for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 23:39:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D929360594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D929360594
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D929360594
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 23:39:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2AA9DB0051B;
 Sun, 10 Nov 2024 00:39:10 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Rodrigo Rebello <rprebello@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 10 Nov 2024 00:39:05 +0100
Message-ID: <20241109233905.1787639-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731195552;
 bh=t2bIBB6gpr5kKHbqeLlgTzwwDQvrnQ+CblZhKCQ+dTU=;
 h=From:To:Cc:Subject:Date:From;
 b=laZ5EJiXCEjxSPPhLxb5jOeJnXtw4mL2eT3n2450ACYOtm9OWOLJcSpyeJG5ILono
 V55Hx/gfdsPw10xvHDqLLC2+BvOCG8+M1sYZXrY4LuJtEau3XrVYnzWXV5Txj40Gy3
 HabauV77xPVxdmUplFDNVENqk3nh9Cg9DLlpr4OLXvFoa26il8WsaLX1gam60O7NPu
 IVYlWNgw8T2bQJ9Q2+78djARah/s8YNzY80a9E+IvKouzItyjLewSYG1i77iawzgOa
 SEb3fHna6oPzTJ0mZQUre0m81e6kxE86oSrN0jF4gjJfww43+PanwoXE7Nl2Wri/PN
 ZxOBATZBqr5+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=laZ5EJiX
Subject: [Buildroot] [PATCH 1/1] package/irssi: bump version to 1.4.5
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
https://irssi.org/NEWS/#news-v1-4-5

This commit also adds the pgp key id used for the signature
verification.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested (compilation only) in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1534961536
---
 package/irssi/irssi.hash | 5 +++--
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index df72ee4d76..f2798d14c8 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  fefe9ec8c7b1475449945c934a2360ab12693454892be47a6d288c63eb107ead  irssi-1.4.4.tar.xz
+# Locally calculated after checking pgp signature with key
+# 7EE65E3082A5FB06AC7C368D00CCB587DDBEF0E1
+sha256  72a951cb0ad622785a8962801f005a3a412736c7e7e3ce152f176287c52fe062  irssi-1.4.5.tar.xz
 # Locally calculated
 sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 6790bf0c96..7c86569d62 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.4.4
+IRSSI_VERSION = 1.4.5
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 IRSSI_SITE = https://codeberg.org/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
