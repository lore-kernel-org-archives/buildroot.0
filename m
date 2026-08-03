Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AAEC55196
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 18:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA06606E7;
	Mon,  3 Aug 2026 18:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoZCNZEZdWUm; Mon,  3 Aug 2026 18:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEECD606E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785783172;
	bh=eUGzcrHFqfUPs9vP7EgV1xlGZJkvjnxus6vwks6ilN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=irDE7qzYKENwL35swgkzcj5ipssdhAf0+6sd9CwFeUKTWUqpiO07FmyLEQpZgToI3
	 sQF0Y7eOxAWuwG79sZbsc84aT53ZxyJj6+x1xUOYqndOjUQ0vO8u0sNyhylUhJ03hS
	 Aue8grqnp4WddyAnEZBI6mAJlBa3Ks/k2eNJQvQXK7io5sxLnIjnXK7mxTqvepquzV
	 OheU8g+OVqrY56FufCiJjzecIS8g8tal/mXj7wXm/39Vc/V5Y9YupDdNwN/vxCiC2l
	 gRdgAjJbTLDG/z274u9S/odxCzFUuNJcIGTwPxIVJtlBEI3Ho7yC09j+pR0krb2aQ4
	 TCIOf4iK+Yo/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEECD606E8;
	Mon,  3 Aug 2026 18:52:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E55922CE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 18:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7B17606E1
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 18:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9aEElY9zLFn for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 18:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A99606B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8A99606B1
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 18:52:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21B8D8B84F; Mon,  3 Aug 2026 18:52:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 20:45:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 933a591d8a4a5423fb0dfae0937faa7eff0c1b00
X-Git-Newrev: b98fac95a92924ccf3e2e8ebb137bb00cd30d8fe
X-Patchwork-Hint: ignore
Message-Id: <20260803185206.21B8D8B84F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: security bump
 version to 3.0.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b98fac95a92924ccf3e2e8ebb137bb00cd30d8fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.16/CHANGES

Fixes CVE-2026-52761 & CVE-2026-52747

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmodsecurity/libmodsecurity.hash | 5 +++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index aab9d14d67..011059d91d 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.15/modsecurity-v3.0.15.tar.gz.sha256
-sha256  c276c838df6b61d96aa52075aee17d426af52755e16d09edca9f9d718696fda7  modsecurity-v3.0.15.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.16/modsecurity-v3.0.16.tar.gz.sha256
+sha256  739be3c71b1939f14e91afe1eeae654acbd440da11bd29790458840bc315b4c0  modsecurity-v3.0.16.tar.gz
+
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 8920cb012e..653b4fd159 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.15
+LIBMODSECURITY_VERSION = 3.0.16
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
