Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA845F9D0EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D8B184DFF;
	Tue, 14 Apr 2026 17:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJIdOEtSnKbd; Tue, 14 Apr 2026 17:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FBEC84DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188947;
	bh=32Wi1l/6isAUebRNbe5e5/94JBxFLJ4NFoVcvh0WO4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FlbxqP/kSSoY+mnWof9cb6Im2KGqjBFlrvxmkKK5FU1MMBMIHGMwTK8pCakyn2Usm
	 2nChy8rVbu9L5WUO78mWaaH4bAMnHqEDr/QpeT7jjYShM97Dtuh1G6ehyBBjoO5K8r
	 ru2Z5orl2mpiT3CZ7tqo8M13drPduKANvi+uJF46tb8MrrJee8SKuClZtYQYHYOEBd
	 W1sajgTOVGhN80XAy03hjqJsIxieICoFC9oFhvmaapz3pyWtM/Rgw/p6qdQI8hu8j1
	 NMq1MZHl8DCF909vCumc7D0++rTSxJJoP3pPChMgc0hiThhecPvdSsQWXR6x+45iOM
	 IYkAiJ1hKnFSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBEC84DED;
	Tue, 14 Apr 2026 17:49:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C717F394
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66BA84004E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BR2yX92WksO for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 585D14041B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 585D14041B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF1D67FB24; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59ae90f82385965c457ad31b484f8628345ec91a
X-Git-Newrev: 3831283ca43dc75827647bec220d91e1704bb67b
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.EF1D67FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sngrep: remove optional support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3831283ca43dc75827647bec220d91e1704bb67b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sngrep/sngrep.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 5399d041b5..1c812e0a07 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -16,7 +16,7 @@ SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 SNGREP_CONF_ENV += \
 	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
 
-SNGREP_CONF_OPTS += --disable-unicode
+SNGREP_CONF_OPTS += --without-pcre --disable-unicode
 
 # openssl and gnutls can't be enabled at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -33,12 +33,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SNGREP_DEPENDENCIES += pcre2
-SNGREP_CONF_OPTS += --without-pcre --with-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-SNGREP_DEPENDENCIES += pcre
-SNGREP_CONF_OPTS += --with-pcre --without-pcre2
+SNGREP_CONF_OPTS += --with-pcre2
 else
-SNGREP_CONF_OPTS += --without-pcre --without-pcre2
+SNGREP_CONF_OPTS += --without-pcre2
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
