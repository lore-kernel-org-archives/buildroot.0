Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE60CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2CA585B0A;
	Tue,  9 Jun 2026 13:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l74NK8w1XbTi; Tue,  9 Jun 2026 13:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18B7385556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010235;
	bh=PN0jI9ERvzTJb7RAJx2rgifGaC1bssHPWMygdGhnab4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F7Nvi6T5JMW79v/zilpt3H2DbBFcQXMc/TtKg5/UYVn7OxE3jBhpiSheYxBsWmg+K
	 SdRaLRGlEc6kXxlZy0UV80VhUeHGA3cfzTUEg3rKA5aIxjhzoFXfhvCVLqKKINo+5i
	 MrXWI6/ynl/IfxErBz+T4RFrdw8WmweKyCc3y9PM1pxmV+0yf/J27Z/NOS5l4UEGU0
	 vhUt+K4ZCX//JtplPX3dGJ43LZIWtjb/MZxyfpU1NCNmh4BXf6pwtTAUIXSCIclHAr
	 Mbbi9r1SpInND2MXK3iq+SoKg9e/5/0aDvb8U9gD2nSg02mLFMLTFHqiSmgHY8105d
	 QSqg2qpd+ST+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B7385556;
	Tue,  9 Jun 2026 13:03:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89E45196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F34EA42710
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrQNoFLtd9wl for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9FD3426DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9FD3426DF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E67C287E7E; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 May 2026 21:29:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f0bd4cdfa4e276a167dee6e39c7c1a032eafa6a
X-Git-Newrev: 1a173d9918b228d73eeb159b0a3771843712a257
X-Patchwork-Hint: ignore
Message-Id: <20260609130117.E67C287E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlb: bump version to 0.3.27
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a173d9918b228d73eeb159b0a3771843712a257
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/hughsie/libxmlb/blob/0.3.27/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlb/libxmlb.hash | 4 ++--
 package/libxmlb/libxmlb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
index 5a202ebfbf..a7a0c53be1 100644
--- a/package/libxmlb/libxmlb.hash
+++ b/package/libxmlb/libxmlb.hash
@@ -1,4 +1,4 @@
-# From https://github.com/hughsie/libxmlb/releases/tag/0.3.26
-sha256  a18bc447fff0dd0d76a2e6cd4a603b4712047c027f9bbbdc31ebc25f0e2c1ed9  libxmlb-0.3.26.tar.xz
+# From https://github.com/hughsie/libxmlb/releases/tag/0.3.27
+sha256  63fa0275f7454d77c10e0af37f79dfdb071821caf429a57dbd9598ea3a9defd6  libxmlb-0.3.27.tar.xz
 # Locally computed:
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
index 34e7233f4b..e9829e4c4b 100644
--- a/package/libxmlb/libxmlb.mk
+++ b/package/libxmlb/libxmlb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLB_VERSION = 0.3.26
+LIBXMLB_VERSION = 0.3.27
 LIBXMLB_SITE = https://github.com/hughsie/libxmlb/releases/download/$(LIBXMLB_VERSION)
 LIBXMLB_SOURCE = libxmlb-$(LIBXMLB_VERSION).tar.xz
 LIBXMLB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
