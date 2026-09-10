Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D4C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 23:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3093240AA6;
	Thu, 10 Sep 2026 23:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPbucOvY6P3k; Thu, 10 Sep 2026 23:08:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AC2A040A48
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789081702;
	b=oRad8ydmHQv9eHsn4pUdWrLTf4GevywLmYJe/fI2GA5/sVqqQwy8vvgZVE9dukpQZ/SJ
	 334+OhJ/qcjSoTpdo6rdUZwkYUZyaim+gRmbchlkV/+fPBnjPtDz6GtoWE16SVEh+sG2b
	 QBMUrcmZ0meT2/EDLNtEVcE0cFgdowrGMVq3V26h48jZInCqaOBiKSzSAoR4C/9LnXFb1
	 2Z3nryIxkhirPI9X57yKz0ZcTmyN8zBMNoweX1Zb0YWGT776LNmuTWN1+b04fb2+KlQ7X
	 I0oU865GIBW1EORUiMEizMXiCnz7N7XxJfKFk3b/pkQIYByo0I1w+AnhuoI2bQJMO4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789081702;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0U+H7tTEVfbQh3Uu+qbE1krtZxLjmMooaqNUISID0N4=;
	b=AJ1sz/n3uANUFbkevaxOrg0ocXVrym4YV5eYwxD/2j0Soo8O2MwEiS1KT/yXtQ8erzGX
	 MHI5cOWsul4biQkTzd2HOKpbz/90GVF4TilxU2xVme4LhwvHOM8XRpDr/nqtQLV9R4zKJ
	 ovRTPG1WY6XoBZiC+eYk7dtpBmK8QHSHNuHdi9STGHj3l+Nvyfqt9grx7B9kSFCZHkAnq
	 dyUgt7QYFU9iDZP0ZF3bXMlvCyUOUCwSHrDWPUNxqFSeciPW+Ua+4kH2sfyISIXvKb7/m
	 GAyNO4hr3rbC977l4KdVaZXBT4xD+KY2v6tNVN3yV974yU9lrUHyqtyJ8aSKpj/WsAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789081702;
	bh=0U+H7tTEVfbQh3Uu+qbE1krtZxLjmMooaqNUISID0N4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CO+UrUrN2PUmXF9JxGjf+IK+zwxA3MerBlqVktLO+Y/JTcKTPfNFheNBfDQ515WHA
	 cRgQ0MaXHkbNLyxvMkeykkOpbTcRfNL35srgS1JcEIKOSDaE6UFZeqLnGaN6tuXQhD
	 mBOzw8MQE1FyTIZqfeZbXwB3GezFSzUr6/i/A/XCZ8l+mjZ9XeTLBL1Yi7cgZdBYzb
	 oDeiO5CaHpM5cDJsfxA6B4JNOV2hj89VpnXSvdvLnqzKiYM70fAxSCW5/H/e8APfHE
	 pRon1rzALU1vZJn5jOilKe3vcADbas4RkTqt1rGiCGUXvYmRa5Y4cZZCwOQ4Zts9Ym
	 j9RT6YQyDRSgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC2A040A48;
	Thu, 10 Sep 2026 23:08:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AF1B769
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5EB240077
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAY5sRYrrEge for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 23:08:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C645E40073
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789081700;
 b=n5l5LtDRLLwn62M136B6tIND/t2VUv36v5sAcFNPFoa3lrj97rTHrrE59Xi6ozaMDZIf
 SQeS9ucj7gAHzcwdRGuaCyZWoQjmD0m/HXk/R+V8f4lJ0EvHuaMNNnZeFKfI/WDsqjx8N
 PWTr6pPImYm0CPcSZppwg9yNVsgUMc6sfwH8yuE8zuxISi9OSu7cUAxTsuUd0GPDmpfWo
 o3daMzhgePKtPWT/QXNKJWqWt4EaNlgo0nQ56SG/dnwY1Wr/yPUENt+5T7zywk8Ot69Th
 FiBjZIDD3lV6ldeF6ci8Vg/30Wzqcc5TllywLRIGih6smtL/LRibHPJP5q0tOwsLFcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789081700;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=YzibFZqO8hTKnRd90o+F79fTKxROhs7glTl+yG5Ufqg=;
 b=rCeFD+gKMFxkBG1fw34mtrMSQer5CQVAppr1iVQULdY5tE7vtGXHMo3LZrUeag+BIZzp
 KaEl0hBSe+55U5VbOdxJ3eg1AD6QHNg1JQWgNwL1mcZrhjTry6tuqG3AAekHnIqvQse8j
 Cw3qFIOZdpKuy7Ku+0uLy+NDcyDLy3P1AqmW4bTtm/cmX9y3w4yxc9tMZx3NdjubdCZip
 5FIeY83wWaDYz7tbNkKVZMQae3enfSIZPkV+9M5qZRERXMcuOKk4cU+PTjd8MyMZ6IswW
 hr1hzj66sQo8E/957jMbMeR3VwsEh6mAKs/vpoDVJQK9rvlyr6Qfc1KuMaIOj5qoZvw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=CRdQdiCR; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=CRdQdiCR
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C645E40073
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=YzibFZqO8hTKnRd90o+F79fTKxROhs7glTl+yG5Ufqg=; b=
 CRdQdiCRfkY1qjpeEGxU4wWzpJ8xDsbkM5WzvQtba3QIm3cPt5ixH7iwTNaiJyWg7j15EpWOOJnpJ
 MaCkqowjgSys4bdAwO34qL9dvpW4QP4U+6UaF5afkXHOC5B8y2BVCCLCcDiqd/S66ux2nRNXZhDF+
 PZMvG2OJx/6WZryVOJ75bVdWFToobgd3hef80UQtK/QsITzHFo82koQ4k2SYKdJ+bdcsiUU8SMDiT
 2yyUqRZq3/fxqrDb24rcmBf5b8hbpRQG+AdwNtV9dBazbXauNpCWmoVOd1FjAGumXviArG0cnvg+o
 zHctRc4kI8z/B8RDfi1sYl9iE9uukM54Ag==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x4nsP-000PNa-EP; Fri, 11 Sep 2026 01:08:17 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 392538fd;
 Thu, 10 Sep 2026 23:08:16 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 11 Sep 2026 01:08:15 +0200
Message-ID: <20260910230816.1937334-1-aperez@igalia.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xdg-dbus-proxy: security bump to
 verssion 0.1.8
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

Fixes and issue that caused broadcast messages to skip some checks.
Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index e5be1f0cd3..bbc1762acb 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
-sha256  3ad3d27ba574e178acb5e4d438ba36ace25e3564f899c36f31c56f82c7adbbe7  xdg-dbus-proxy-0.1.7.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
+sha256  b6630bd24f8161b0e2546d2acbb014a3b3249f5c0d75f2a863ade898b9034d3d  xdg-dbus-proxy-0.1.8.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 6c3ef5c9d4..7f9fe16f28 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.7
+XDG_DBUS_PROXY_VERSION = 0.1.8
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
