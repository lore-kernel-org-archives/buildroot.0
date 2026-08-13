Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F107FC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C579D6082A;
	Fri, 14 Aug 2026 13:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4IrLmCKt5am; Fri, 14 Aug 2026 13:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00C3608B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713612;
	bh=+lXoiYzouZMeqAEaXOCMburzzaW59jFUKZw/Z1XuNls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HpIPfMv+3wtQrbitfJ+yrr2nxxnlhkrS8B+q/SippYt5OJbDSo6d9SzHQt24ry07c
	 A8UMQ8EgcI5BQaNtlkjCx3vXXeU7KGG8qAMBVpH6tgf5N3UNZZiK4PYSqJJp91obBR
	 ZTAbQohYmuQB+Ay05hWBh0lCUdg1IbD47HohOPWZVPE7dvRzXeKEKy6hC5tYu7Halo
	 AG2Zi2SMUbkZKmkf5DepkOdZJA35vuniEw0NmagePCwLXaj08sEAjOqov5XuaLIDdy
	 mM5LQ/KCYjxsxdBkgv1olUhF34qEqq7x0ippTWc4oNjU4cE3CAk0Po61OBzZVg9f2X
	 dsPbPGpFVewmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00C3608B0;
	Fri, 14 Aug 2026 13:20:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D637633B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC70680E24
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeA4-CRbAh4E for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 721CD80E20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 721CD80E20
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60E948D66A; Fri, 14 Aug 2026 13:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 09:04:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ac21aecdc18863e3586f0fb8c5f58b92f8ab21d0
X-Git-Newrev: d3bbffae21792da2ea7daa0785c151e16501a42c
X-Patchwork-Hint: ignore
Message-Id: <20260814131855.60E948D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libmodsecurity:
 security bump version to 3.0.16
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3bbffae21792da2ea7daa0785c151e16501a42c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.16/CHANGES

Fixes CVE-2026-52761 & CVE-2026-52747

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b98fac95a92924ccf3e2e8ebb137bb00cd30d8fe)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
