Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290CEF9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7F842B28;
	Tue, 14 Apr 2026 15:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BWEMUtE_8xi; Tue, 14 Apr 2026 15:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61BD042B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181369;
	bh=zFD7RF7O/F2a6QWqDhOJbcVbCxQQBYrREX5Fjp9G9NA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pGSMLEWniBmbywqTsGPhP5w3FV+Oi+6ebHilO4xNSM2NEnzukeJSsy7NW7/DVBWKz
	 CJrC7x6DF97ypjTiUkz6Tn/B2Jg6kwPKs+oqfi5yn4dvWEVc2XCMyRb6W+aQuQHyRX
	 LYGBswh/vUJIEg4dJqucAHe1OFc+d5EO4jfNuc3Cws9NC1knVzSZcqBRBcYcR6YqGw
	 KL8tdA8TawRTFH/2GkBLF9DxtSmOoOuuEnp+FrnOQ5/h94c32Fu1dUsn/aQiNANMkT
	 Lvr4OW81CD3NhRZts9KX7aAWzRlaAWRaSXi5KO/WygF55jLPBW8EAFMThto9MD1Bpy
	 RGvR3HqMPZmfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BD042B23;
	Tue, 14 Apr 2026 15:42:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2377E237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B993400F6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmPVI4A5nunr for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC7040078
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BC7040078
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 103EC814A8; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 11:58:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f7b1d8562a4ff3a549c81681473c608c24248455
X-Git-Newrev: 0114a8b497973d8ece139eb7cd04be9c103b4c77
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.103EC814A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rauc: ignore
 CVE-2026-34155
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0114a8b497973d8ece139eb7cd04be9c103b4c77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit c9f7b876ee5bac0ee7344e5ecb7bd3ac0d5aab76 added a patch to
fix the vulnerability for rauc v1.13, but forgot to ignore the CVE in rauc.mk

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rauc/rauc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 92f58c6139..f8fbb5fdd0 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -13,6 +13,9 @@ RAUC_CPE_ID_VENDOR = pengutronix
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
 RAUC_CONF_OPTS += -Dtests=false
 
+# 0001-fix-cve-2026-34155.patch
+RAUC_IGNORE_CVES += CVE-2026-34155
+
 ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
 RAUC_CONF_OPTS += -Dservice=true
 RAUC_DEPENDENCIES += dbus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
