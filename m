Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A84F9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A38142C41;
	Tue, 14 Apr 2026 15:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3o9LWOO4IAt; Tue, 14 Apr 2026 15:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D312042C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181788;
	bh=2PiozTunf77erxJcpWiSy4Vy5B6Tg6m0ck3tF+duVV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cGGhmgAjcxoQSe+0RX50DGIaFjDr6uvFxN4UfqkBdaw9xy/MeBjEBUIdWAxrOFIzg
	 YDjUjQGs3UyQQBp5ZiAoIZkj7rEVu9jK2SEH+f3pWkHGGUr7Je7SCFAcaDUokqbdjF
	 D8cDvW/tdb6OVTfMsmIhN42f+wfhREMutbtcCyWqdbskGMxnUBu8kizraWl0ORYa4Z
	 4LDf6c3qvLWejOTLXGjPXlFB2O4XMSWGKjMvM/RDZme/NU2PWpiz89MXT9UGWcr99M
	 UQ59Q90LHqH3G57yRAoeBi62vgvz5JnoV9FMc9rr9zZuF/8QQ9hmu3q02HH5rXky9q
	 xvd6iHKrClQ8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D312042C3E;
	Tue, 14 Apr 2026 15:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0284A237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC4FD42B19
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNl_F5o_AU6M for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 361A042B1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 361A042B1B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC9A08150E; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:10:45 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 874aae2bec66276e83665eadc1c9dcae8e21f950
X-Git-Newrev: 8c4c363e563965f6016216adac69853c3ff51732
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.CC9A08150E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/sway: needs pcre2
 instead of pcre
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c4c363e563965f6016216adac69853c3ff51732
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 0645cb39e0ce3af743190e587812a5bd4c1f4b24 bumped the
package from 1.7 to 1.8.1.

Upstream included commit
https://github.com/swaywm/sway/commit/f614f35e7354980bf4f0a66ca99be9b5f3a7ac90
in version 1.8 to switch from pcre to pcre2 but the buildroot package
was not updated accordingly.

Pcre2 was already selected by pango -> libglib2 -> pcre2 so this bug was
never noticed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e8466476c4e47964517d2ec38f848dff348be14e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sway/Config.in | 2 +-
 package/sway/sway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 1e4c8bfd3e..c89c0607d3 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SWAY
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	select BR2_PACKAGE_WLROOTS
 	select BR2_PACKAGE_JSON_C
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index f27d147852..a497a2cbe7 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -8,7 +8,7 @@ SWAY_VERSION = 1.11
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
-SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
+SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre2 cairo pango
 SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
