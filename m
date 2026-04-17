Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6438EF99C67
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 20:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142E960A3E;
	Fri, 17 Apr 2026 20:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGeNr6yU7_fF; Fri, 17 Apr 2026 20:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE2560E31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776459328;
	bh=jjW2DoTE9kuR5GngUVxOLwI6XDIa1YROhmJgTCfL3Xo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XgInYzd+i1FQIU6AOhuOx95vH0ucUxmaEQ1lYUyJH0J5KMw3W3udaMFdhdYUyMvKf
	 KFrLEiFFTdDjV8uZ/sEx5VapcBbnMXZJBh5aV95tVkOy/78DOUGg+8xF6/tgeFKxcg
	 mjYe00slsTglbNPbquZwaazVdrR6t3VtQTUFKPm+t56zjLbCg7ISsp+p2IWw20qveP
	 7IMm8uFnBhyXqQEjkcQ6dpC5IVoZLwNL6FPHleU484zuQ6nYqsDDxu/pXdmy6BgEBD
	 HXc63bMdGOLKZmJkfwlie3Mq8Lbc1OqRGWvBsu9AKggGaUlAbQFzuR4JbV3i8rN5KG
	 o5Tvw/Ib5nGEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE2560E31;
	Fri, 17 Apr 2026 20:55:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0969396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B641760E31
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tISVyD_mrTCg for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 20:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21C660A3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21C660A3E
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B3E81E68; Fri, 17 Apr 2026 20:55:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 22:00:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 712121326f84e2508ab161053c2b04e45511c79f
X-Git-Newrev: c7179b0309f324e96d532a40999a4ac2d3106de6
X-Patchwork-Hint: ignore
Message-Id: <20260417205525.90B3E81E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to 1.48
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7179b0309f324e96d532a40999a4ac2d3106de6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Announcement:

- 1.46: https://lore.freedesktop.org/wayland-devel/AzTKh6JewwfUBFKaOS86DT4obISpv5b5bjFghXGwYrMPyk6Wxpz6H4_trRcEOyF9VpVV-0p1-UTNv7_esjO6ppw5SyIyGxWB8R5xI_SJYfA=@emersion.fr/T/#u
- 1.47: https://lore.freedesktop.org/wayland-devel/aUAqqkhyv6-OKvUo@gmail.com/
- 1.48: https://lore.freedesktop.org/wayland-devel/ac0NAPBFafhcgzE3@gmail.com/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index f35c054dff..2b29785dde 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lore.freedesktop.org/wayland-devel/aEw0AP7h6T8l11ug@gmail.com/T/#u
-sha256  4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0  wayland-protocols-1.45.tar.xz
-sha512  d0557a75eb486fb824f182648bec346e270cb1ada8727613377ab95b0ccb595c516de242f486110c88b7009e98c87b071bf5b598f84466e5624aa1d81f19e195  wayland-protocols-1.45.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/ac0NAPBFafhcgzE3@gmail.com/
+sha256  398036ac0eb6484982ddbde7ff86848d753231f9cdeeae983f06b52946625aa1  wayland-protocols-1.48.tar.xz
+sha512  24950c6181f576f8926e2631a3f017986f809cd4fe8efe6fc8e4d872e98aacabb9eb79877371fb5def1fc78027c8e1e1e25bb98d455c22624a810707be0b2c24  wayland-protocols-1.48.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 0cb23f8438..5ef8990066 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.45
+WAYLAND_PROTOCOLS_VERSION = 1.48
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
