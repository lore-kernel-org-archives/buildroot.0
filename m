Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9372D66B9A
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 877B640F29;
	Wed, 17 Dec 2025 19:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWnt3-91bbMd; Wed, 17 Dec 2025 19:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B678140F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766000854;
	bh=1X9wt++Bz5e4Uk2n+Ug65aFKuP0zVB4J1LVP98YtUYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y32y/iJGu659u+heUqazFeb7sUn9oTy70bjn4jtYwdDjiYPWXnkHcjDk8f26akNKk
	 aogv3gYKhxrk6usoJWYpBbHEUp2wTwNFfhnwZe58rC9OG6HpL4aEkCz/N8AWpo15rr
	 IO2KH18m/bOGHClKrfTA/KIV3ekiWOC3N7SwR4ErWgBTBssaIamuQxwww4OM8jDFYt
	 01PFIFJlo4uewEgoPsnQ4QU+3Myr24YDe+KMu1whZsiNQOnlAGw0oqcXfVRh/tEo93
	 WI4iroQLJoDAw6GjfcIT6wTdhiBLQsaSauhn/U/a686o0WOUci/nk30T+TSMuGeF1z
	 ZRFHDOVc5+eHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B678140F2D;
	Wed, 17 Dec 2025 19:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ED3A361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6165E40F40
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6Q3SmeQEXN5 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:47:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E21240F29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E21240F29
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:47:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DB45870CA; Wed, 17 Dec 2025 19:47:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 20:43:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17d83926032bfa69293b994473e599159a0fc8cb
X-Git-Newrev: 626bc1f199411df91108565432c496e1fcf0b897
X-Patchwork-Hint: ignore
Message-Id: <20251217194732.3DB45870CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfcgi: security bump to 2.4.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=626bc1f199411df91108565432c496e1fcf0b897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a security bump to fix CVE-2025-23016.

See:
https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.7

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libfcgi/libfcgi.hash | 2 +-
 package/libfcgi/libfcgi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 348b0b6867..be9e3e8db9 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39af4fb21a6d695a5f0b1c4fa95776d2725f6bc6c77680943a2ab314acd505c1  libfcgi-2.4.6.tar.gz
+sha256  e41ddc3a473b555bdc0cbd80703dcb1f4610c1a7700d3b9d3d0c14a416e1074b  libfcgi-2.4.7.tar.gz
 sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index e0ef6da55c..da84ba6297 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.6
+LIBFCGI_VERSION = 2.4.7
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
