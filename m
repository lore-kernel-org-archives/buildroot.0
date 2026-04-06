Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063A8F46C54
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 16:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACCD60A70;
	Mon,  6 Apr 2026 16:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHvQ-QS_N7UW; Mon,  6 Apr 2026 16:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F7B60A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775492259;
	bh=4WqQnXjDhBXz9MneiRxD2DLqLNB2Kzd5xHEa+T/p95E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f/TORtiZjuM6lGk4R1lGbqJE2nUVrWcZ+LSRNviuy4bl+kSDpMbosxJQlTyLfxkP1
	 I0cfdAv4DkRSA9r6emoSiGDhM55+apm7sw3QohH2Cp/nPkkPHc643coRMB4UV2RUuB
	 +VfPKQ/a2VgBfA/S6joR51dwe71PZa3pveUOvybikMJkfSGsqsTx+19p63LECs4qvJ
	 6BVe8hUhyvXjzO8S2Ducr17bzWLXE2xWjzNUcCSZ2DJWNf5pd+WygX0p4fZYUBWJAI
	 eDc7iBE4ZtjXGIGGGu2GOJ9eq0upunPyYf4QGiQtJiXLTNf3zcG1NK/WshXEVtfhax
	 Y6v2uZ3K3uBoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F7B60A3F;
	Mon,  6 Apr 2026 16:17:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 872441EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84E4740879
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDpbcCL6x_6x for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 16:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D34D040208
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D34D040208
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:17:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 632EE80462; Mon,  6 Apr 2026 16:17:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 18:05:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bd1973ef0376ac60ca5f04ef994eaf912b5162d
X-Git-Newrev: e8466476c4e47964517d2ec38f848dff348be14e
X-Patchwork-Hint: ignore
Message-Id: <20260406161737.632EE80462@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: needs pcre2 instead of pcre
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e8466476c4e47964517d2ec38f848dff348be14e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
