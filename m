Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D21CA5FD9
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 07:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEAC260863;
	Fri,  2 Oct 2026 07:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eja5UyV2GPT9; Fri,  2 Oct 2026 07:59:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E069A6082E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790927993;
	b=iozvfpqSi3Rc7u9cipco38AX2s1hGnZlVp8f9G4MH+YZ5rPbq2xg9UHsWVFRMM1QeU+A
	 3mirBL2r+PyrmWHmmme7CYT/lq8TMSfdSE22EHxbxvetsiTaPA0RgmlQYGocowcnBsTX9
	 SFRXjsLBWOtjvDL/OlwSPhps1qorusNxqmY5tjIxJCe3VcGDsAuXLjD6CKaDtUw2kmF40
	 rCr/VxJtlKPHB9M8J48a+Tj3PQy9TpyCpQuYkaDo5oPlqn6hfJunUdd5iuPNFkNDI7+Tt
	 b+tU4cGTMQn6trwveHtgZC4Kfth4Lm7uW5MUp2ls50IOzPZ33nzdm1zEigD+WAJE6FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790927993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=JEAmg5e1QpY3/lxvLJYPumFIg3dlwE2utiiaDaVmzGI=;
	b=JdbiDLzIxXIf2pjz5drwIiuy0t1ZE+MkgUu8YtE+ItgKTvd3t0BywNfaH9DCli7dkQ8k
	 M64ldp3GuQiJIgT0PsvOxTmKGFpvGqC21AcEjZDp+8KeBIGvil/h9BzJmSzQDVFFu2WoZ
	 bkJuASiXJLCDKDRaH3bU0nKRPMncK5bu228tZBEeY7LVUsbXz6TMh1H5kow30YKzTNpk+
	 yWwHReHGC1ce6xBh//mw8Jsakxs3YXupP3ICu4daGvO2wD/7Os2bXysKlWiPQ7sjga65W
	 b09HapmTsvyuBtLpv06sukj91QRXc26h4kp5wIfL1+aHeIRQrO645b5I3fpVuoISP7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790927993;
	bh=JEAmg5e1QpY3/lxvLJYPumFIg3dlwE2utiiaDaVmzGI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mVv0zirFhLYRmhamJ9mmTwjyhA5lrShAhXv1doZQuxvpvUpG5jjguMkcy8gkHKqLd
	 rhIRe42ypMZn3TJawtCxm2ccLF0HbMGYTbvFIkiLaru+I4SmPnMMMwfddRyKiv7FKI
	 iZP0xFzSr2hTzXPJnAYIcblyzRyO6Bd1Wc6TdFVmPAQRo3QTXlD1bbfaCG2tqRKlwo
	 RDjiTMOWaVEWqTJN1qJr4+RqbSdPI3I74LlmdQVzBntFHrjD44eQeSca7GbYBQ/a9v
	 fPphg/9ttpHgLBJF5my6WPIDQdnMUX14pBBLv4mdToQewCujLvGei5y2PsTx00Dqc2
	 HXr7Mvme7+vkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E069A6082E;
	Fri,  2 Oct 2026 07:59:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6A281A6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C8A26083B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WD0upTJI9fEZ for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 07:59:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F24C60828
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790927990;
 b=m3T2nSxE0pSif+mjWoDhST7MJoRIP+LF6X1LgSudT9efBZYCit45lPGVcxuG7StewgYf
 Zk4AGmMwPDNsCgQESoQg5slni4ggIojVpZbKci7IcgHb2Bdl5u6MulP98UF2Ha3t0+OL7
 Vlpf3LlI3hJE1lUq63CSeq94YdnhbiP+8MO1NvUBr/N1FpDhiZIJa23D6lOeCk+Qt10uQ
 UdP9AN2g9uZWWBXIA6BJhaUxqKN17To1Z688VgRAVvz7mEjXDKR0i1SjfIV3wd9fJh/qO
 r3FWRwSDqgOQrg5sQ4SNtb9INvemTVl/P/A5hWLWXbfFfgsTjvP+mumh8hrIdMan0zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790927990;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=lnzkvGvxhNtd9cXL5XJdv6H7few9rfs1lHCw1NXzlck=;
 b=sdvHxKC8clQdkzLIj83mXisz/rW3Owj+Nf+cvqFScclfw6/xYJp3PlJy+DbZTIvCZUNA
 EXHWrIGrnW1HyOIE4htdMg+5VircQmG5zGoLvtq1cRlhsklsPDMYBHXwNIxvMER1c7Q82
 E1MdYCbtcntE3+XSG14xQlUtKvNpccg3fZw4hgPV3RKoenG/WDE29QdM85NFZJ8MYGe2m
 zo3n+3dnn7ONxDCEcfBnIDtcX5WwWKxNvs/9oYSIDYfo+s825HswyqRmZ9hxpCVbwSNL6
 TRxJEDYqKnwYGHB+YDMYyKQtlQL/eCWEC2bh2oJ+ZqLvCsDVNerCaTLaOwEVk424g2w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b="vxE4iD2/"; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F24C60828
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 127EA1814BC; Fri, 02 Oct 2026 09:59:48 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 09:56:34 +0200
Message-ID: <20261002075640.2350126-6-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002075640.2350126-2-buildroot@heine.tech>
References: <20261002075640.2350126-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 4/4] package/sqlitecpp: bump to version 3.4.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- licenses hash changed due to updated year

changelog:
https://github.com/SRombauts/SQLiteCpp/releases/tag/3.4.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

Pipeline with br-test-pkg and runtime test:
https://gitlab.com/heinemml/buildroot/-/pipelines/2901349165

---
 package/sqlitecpp/sqlitecpp.hash | 4 ++--
 package/sqlitecpp/sqlitecpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
index 960d9bfb21..c9de5048e5 100644
--- a/package/sqlitecpp/sqlitecpp.hash
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  33bd4372d83bc43117928ee842be64d05e7807f511b5195f85d30015cad9cac6  sqlitecpp-3.3.3.tar.gz
-sha256  a16149966042207bfc968dd1081403d43a37a6264fe31c7b1a7960dbb0e716b9  LICENSE.txt
+sha256  9910ad8bc0a821856bd6d9fa7cb0b457883108f2b803700256b451077ed6dc05  sqlitecpp-3.4.0.tar.gz
+sha256  00f43691f376cc7abdab1f9d72ba9d1a92846b481d2df5ffa1c345108b28048c  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 418860fc6d..9c136ed69e 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITECPP_VERSION = 3.3.3
+SQLITECPP_VERSION = 3.4.0
 SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
 SQLITECPP_LICENSE = MIT
 SQLITECPP_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
