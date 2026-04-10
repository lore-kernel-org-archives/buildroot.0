Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4DBF9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E6E42B2C;
	Tue, 14 Apr 2026 15:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGbsOPm3w6vi; Tue, 14 Apr 2026 15:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D812B42B2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181376;
	bh=RYG5ftbMZXZdtE4wK8RSzdRBBKDfu8tApSCxsW8J+rs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kSJKnGUUDjywwigJ9K7GbsOWv3marLSxLGF4+ZSUJJL/D7IrSjMDSAjzL+zm21Ntm
	 7wT5ryQdpx0k8AGXjZKSYNz6353xr87ekYS9UCypsv3S97ILtlDv+yTp8e0wGmU4m8
	 VftnNna0vTmNthU5xGkzYG3UBhNe/6zEOkGWi1mkY7WFQs59ORC192CtwFtRB6ZLLg
	 jUX2GpOF+N3S8E8Ekcl6cQRwrcl7b1xp5T9k1O9yLTGs1LhZzm8hFKIm6pObi3AxQ1
	 6Chx7eZ1HIi/XBFI/WhKxaJjV07tTTQg6VJNJ3uurx3r+69H++4onfBBrdNdFb1mtt
	 hAU7NfPzUG8Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D812B42B2E;
	Tue, 14 Apr 2026 15:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFEE5283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8F1C84D43
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dn-ifQJs2wUP for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8BF284D46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8BF284D46
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B431814A8; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:10:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d617c1bee9e173cf2db9251c75c5b137b9746ef1
X-Git-Newrev: 93916077d27748dad475e43300f40a154393823b
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.6B431814A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sway: needs pcre2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93916077d27748dad475e43300f40a154393823b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 8bf7b70296..97ee5ca853 100644
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
index 74614b0c7f..65fb856db2 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -8,7 +8,7 @@ SWAY_VERSION = 1.10
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
