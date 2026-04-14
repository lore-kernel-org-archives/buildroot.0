Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790C6F9D0ED
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4910742C6A;
	Tue, 14 Apr 2026 17:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDdoPN_OuiiU; Tue, 14 Apr 2026 17:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC94427A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188939;
	bh=h3oEjcznqzWJDCpouukaG5R8UHpsm4fqctj/fHOVJUo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PbO8+wPgdypdm3TPigBMz09tMQ/9eozZqxrNZNGIP9EPMK/CVj0diviTwQQYcWLZh
	 xFsOHdkl3A6JSSfva/qDA+kgY1LStUieNMtlrJnF5bsG2qv7HP1gKEI0/rwOdQb6Ug
	 M6VfnB8rAQHBTLuNCXn8F92p2XmX+abVwSoYDl0t9jgwi8e83nWi3ZJtrRP8S/LSlC
	 12yJmOCIYC10yjQND+GEZreVxoyBWV6Qc48Dp+2Y5hRapldvgSkxFGr/jTeKBJpXD9
	 /NHcLzS6ekEjmQmArmfH94ICCgzc22hwQTdBETvrqmSii2LutzSHdpo20gcEEqNHkd
	 amXs8HLKtpWQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC94427A3;
	Tue, 14 Apr 2026 17:48:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C427283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E9236F4D9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x91lWMJFGdzv for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E796F4D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88E796F4D8
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AA327FB24; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9af410c5abe7c45015337f80390ca53b974f1b66
X-Git-Newrev: 12c5a199231d7dbece4043a2011897bd049e842f
X-Patchwork-Hint: ignore
Message-Id: <20260414174850.2AA327FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget: remove optional support for
 pcre, keep pcre2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12c5a199231d7dbece4043a2011897bd049e842f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wget/wget.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index e3143647d7..de03ec9cef 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,6 +12,8 @@ WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 WGET_CPE_ID_VENDOR = gnu
 
+WGET_CONF_OPTS += --disable-pcre
+
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 WGET_CONF_OPTS += --with-libpsl
 WGET_DEPENDENCIES += libpsl
@@ -63,13 +65,10 @@ WGET_CONF_OPTS += --without-cares
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
-WGET_CONF_OPTS += --disable-pcre --enable-pcre2
+WGET_CONF_OPTS += --enable-pcre2
 WGET_DEPENDENCIES += pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-WGET_CONF_OPTS += --enable-pcre --disable-pcre2
-WGET_DEPENDENCIES += pcre
 else
-WGET_CONF_OPTS += --disable-pcre --disable-pcre2
+WGET_CONF_OPTS +=  --disable-pcre2
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
