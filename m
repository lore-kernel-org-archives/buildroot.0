Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3334DCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C884637A;
	Tue,  9 Jun 2026 13:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GERHcZUu5tAf; Tue,  9 Jun 2026 13:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4000346541
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010320;
	bh=rKJyVGEF1kesPws69L2B8FdbMfrFv5RTv5D1zFBkO10=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iDe97jQSyKh3HO9JkBjv/duMiWPXhR+EZ0/QYrSGzEOv7LODcgz//TyCoGotfnXib
	 5WyOjkfz2+CmW8hlxo1E/lKVVbONQ8zdwl74Xeo2LGOHMSZS5rQmSB0Vlu3l7gNNte
	 GerDpj+NsdmBoUy6b9cH0bHDePRNwizra5I64XCckfpcFHH2xjlW0dT8bpnQw1bx/i
	 WMKhS95FxkagRmME0OU+Ai32LKqsMjhbbgbCv53i6FXHUV/tcQrmJeW4w9xW69l3v9
	 e5Lihnnl3PDA3GYz/D8eU+cmQqA5PRibnCdlk+O7hpVN/CggNckU1h3rxUUyTS8Hp7
	 YJBU7SQ8Ul5Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4000346541;
	Tue,  9 Jun 2026 13:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDF2190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E53646541
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmDuFVYIfHr5 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DDB412CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77DDB412CE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B41D187E8D; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:25:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c4187b92589985627fd375ea1d8820e7e157ecd
X-Git-Newrev: 7bf73cbdd7a073774e33b84195cb2c2e92737143
X-Patchwork-Hint: ignore
Message-Id: <20260609130125.B41D187E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire-media-session: bump
 version to 0.4.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bf73cbdd7a073774e33b84195cb2c2e92737143
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://gitlab.freedesktop.org/pipewire/media-session/-/releases/0.4.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: change the link in commit log to point to the release]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pipewire-media-session/pipewire-media-session.hash | 2 +-
 package/pipewire-media-session/pipewire-media-session.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
index e6b176eea2..3559d3c222 100644
--- a/package/pipewire-media-session/pipewire-media-session.hash
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  26e21852e0834a4418b40eae342ac5178dfe40342b9c5afe204d43ef8aafa14e  media-session-0.4.2.tar.bz2
+sha256  ea0e371b08f9fa158fb070283b04ce1c4c0a3180d6e89de46c206296918ee1e4  media-session-0.4.3.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
index cc7317f925..16e12d9eb3 100644
--- a/package/pipewire-media-session/pipewire-media-session.mk
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.2
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.3
 PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
 PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
 PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
