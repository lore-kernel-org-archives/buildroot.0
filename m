Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01E3F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F99C84DD2;
	Tue, 14 Apr 2026 17:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3hQcjdr1r51; Tue, 14 Apr 2026 17:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A20D84DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188940;
	bh=cs/X/jH7iUz4U3zuJj4KamGG4QTKZ09AdnyH87tVDAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=amwSOI2tCqwz4cxz3CnFBt9QGTNuNQFQVD8hG8mJe40+ab0tWhqH11TQvNH6yCqk3
	 X//O5VFSaB4jgSuko3SDL2jUszznPiPRVud0EUwOLyLsjgtlUbrL9+8XfLDEbXTOu/
	 cdhGk7s1Kv4BFcBSiBy5SjsMdaYZnh68j26KENK36J8G89Nrl2VZ4AD+ergq17dPOG
	 JcSeQrRnO6vnLCIf9uEqVqcuze5a5a+S7OemfuGBoXDSLzz8iGppzF++Z2GBJW23/M
	 LgkC/kLhcqnos3DsffY6eGxtNIDrGXRZhbhroEvFBff6h46t4lNAUZP4HWDFdGSsBo
	 8+afJyx2/T9xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A20D84DD5;
	Tue, 14 Apr 2026 17:49:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B81375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A3F14273C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMHoHSCzuhlH for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A44642740
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A44642740
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07FDD7FB2D; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3831283ca43dc75827647bec220d91e1704bb67b
X-Git-Newrev: 9af410c5abe7c45015337f80390ca53b974f1b66
X-Patchwork-Hint: ignore
Message-Id: <20260414174850.07FDD7FB2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: remove optional support
 for pcre, keep pcre2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9af410c5abe7c45015337f80390ca53b974f1b66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tvheadend/tvheadend.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 7919612441..2f99bebbb2 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -16,7 +16,8 @@ TVHEADEND_DEPENDENCIES = \
 	host-python3 \
 	openssl
 TVHEADEND_CONF_OPTS = \
-	--disable-omx
+	--disable-omx \
+	--disable-pcre
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
@@ -126,12 +127,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 TVHEADEND_DEPENDENCIES += pcre2
-TVHEADEND_CONF_OPTS += --disable-pcre --enable-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-TVHEADEND_DEPENDENCIES += pcre
-TVHEADEND_CONF_OPTS += --enable-pcre --disable-pcre2
+TVHEADEND_CONF_OPTS += --enable-pcre2
 else
-TVHEADEND_CONF_OPTS += --disable-pcre --disable-pcre2
+TVHEADEND_CONF_OPTS += --disable-pcre2
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
