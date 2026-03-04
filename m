Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35920EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E99B940515;
	Wed,  4 Mar 2026 21:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6y1ljSy1io0; Wed,  4 Mar 2026 21:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C3841DB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772659164;
	bh=tlyBKg/m3rybLFe5AgJlvM9dFWOP3a66cHHMy5gBHXE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KfTyaqiTqnJxnfxNrEJaBRg2SNE79fMA12V4GqKhrzsxdscIDPXkxN2EeNsxZal1Y
	 wglZUyknYMM4ogWUIhqCCR/8Eoa3VeelTEdoh1KNZRFkKWuLtNBNg5z9trhaIMxhst
	 OgVF6m3s1HjLZBlSKE0HNTBDX2lk0i1SzVuo/Z3C38l4nQEons1kA0AmfjK41o6Q/5
	 0UnVyVya6zzuXW35NWMccr28ZTcXhK8q1HuDj/f7+e/37AUosK+sFTcMo5sDwDzAuV
	 M9Pi4XCxtz8+LYUbCQrIR+BbKQoHrm0qevPGjdgwXugrILk5uUpW42Umeo3CR+RDEH
	 3S/OSd1Aygb1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C3841DB9;
	Wed,  4 Mar 2026 21:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67AD2223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5386741DBB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03SVfTefEuxU for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E03E41D69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E03E41D69
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:19:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78E24861BC; Wed,  4 Mar 2026 21:19:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:18:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd715a60eafe87eb54c9fe57cf92dd8a56447223
X-Git-Newrev: 1a9998e511ca6aea86a166511c4e3cb8456afb06
X-Patchwork-Hint: ignore
Message-Id: <20260304211920.78E24861BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup3: security bump to 3.6.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a9998e511ca6aea86a166511c4e3cb8456afb06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

While there is only one CVE number assigned (CVE-2025-14523) for one of
the patches included in this release, the bulk of the the changes are
security fixes.

Release notes may be found at:

  https://gitlab.gnome.org/GNOME/libsoup/-/commit/25eac153004f777581ca2d95e31a02ca96844332

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-14523

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 32aa7382fa..c0b860875c 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.sha256sum
-sha256  6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234  libsoup-3.6.5.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.6.sha256sum
+sha256  51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740  libsoup-3.6.6.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 0db587a93a..34a9ed2741 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).5
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).6
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
