Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B30D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43FF60E1F;
	Thu,  8 Jan 2026 11:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZHcAuggP0hb; Thu,  8 Jan 2026 11:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB7F160E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870039;
	bh=j6d7S3NpZ/S0kfNguUR2wM2mHtmeCYfeiP2Y2ZGMcYs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aoOcTmMb1YRdWN7QjtL3XZ5RuYrviy1YVNKO+VHsFBYmjdCiGE20wkJsKs+yGryWs
	 W6HIco5/QGC9YkkGc47ANc/6q4waW2uw3S241nGPa71bt3Aqs4i6jgjTzpm6iV69CQ
	 FYCB65C4mjv6z5U2JbjJzjuO9+ruslC4PqVODu3sBB+U7l4aG8SNNPypp6O2iyXc9+
	 lv3Kqt5S3bJvr+gbZMQQIsSHi9brYVg+ecx6dgNv/PS5mxW77OxdN2yvqSityfq/+t
	 NUnlaTSYSE23YmbFuoPhdVvdxJaleSz6YL5CotW/XMVGCxLdyD2AfnKqzeAev5e3CO
	 AsJOn0k54GWvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB7F160E02;
	Thu,  8 Jan 2026 11:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28AE3AEB
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D52504004E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvYwiFRXVynB for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FEA540650
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FEA540650
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E3CA88440; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:33:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ccd7b85ee25e2944a4395606ea57323234fef13
X-Git-Newrev: c0f96c4eecd36d922236d6ce0101995c4ad4f6dc
X-Patchwork-Hint: ignore
Message-Id: <20260108110024.1E3CA88440@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-message: bump to version
 7.01
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c0f96c4eecd36d922236d6ce0101995c4ad4f6dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: minor cleanup
    see https://metacpan.org/release/OALDERS/HTTP-Message-7.01/diff/OALDERS/HTTP-Message-7.00#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-message/perl-http-message.hash | 6 +++---
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index f733a5c91a..aec6102ac3 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  01b29ce55d79a774420bc768bb905354  HTTP-Message-7.00.tar.gz
-sha256  5afa95eb6ed1c632e81656201a2738e2c1bc6cbfae2f6d82728e2bb0b519c1dc  HTTP-Message-7.00.tar.gz
+md5  fc958d64205edb2c76e1673424523932  HTTP-Message-7.01.tar.gz
+sha256  82b79ce680251045c244ee059626fecbf98270bed1467f0175ff5ea91071437e  HTTP-Message-7.01.tar.gz
 
 # computed by scancpan
-sha256  553ecefc0ed6d4152809da8516960b9a12352c1c0d7d289ac4ab06d0bd0e67bb  LICENSE
+sha256  ad83c994e0d5899c09dcab1a45da14380f8f99afacbf383f759c05f8b8e21e60  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 6dfe61edfb..13d6b458cb 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 7.00
+PERL_HTTP_MESSAGE_VERSION = 7.01
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
