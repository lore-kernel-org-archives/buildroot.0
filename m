Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613F7D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 371B440DE1;
	Tue, 13 Jan 2026 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDhL-cZKAZVm; Tue, 13 Jan 2026 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62ABE40DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338011;
	bh=zM5XX+FvPS8eO2PZF0DhRNtpZZKC2vlysG22+9q6SKs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o6vI31G6Xwkw2iGo0QWnHog4VEAjQNzQOWSow6iSpdlWgWJogP5TT/ax9RaiXxM9U
	 u2aCNHiUZCftToskn2WtrHeO6Iz3NskG/7VQO2NiV+iRHxhkyd7lvq2qjFKGsF2Ms/
	 IaoJ/17Pq9pJpjZgCO6hzC51Eg5IkAA28F9VLMb8EAsofJ9B5gRpVp6SgGIIEytimz
	 kIPLBV0IEW4WPs28uirD1QB2/q02a3uJ4WYyQwsNiV8Jj2I/eAsBjuTkLM2/0yJ1a3
	 hQRgtoA5BDw7OoVNfU1EUyLgbQeaAKfm5Of731iB54kK17h/CXMLn8mzNiNzJ5lbg5
	 Za8aF9yjjmHBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62ABE40DE2;
	Tue, 13 Jan 2026 21:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F5B231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FEC940786
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJsAIUOA-Gp0 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A690407C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A690407C2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7888881382; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aab82b4649448371bb1bc9f288c3ad4a1ed2a9f6
X-Git-Newrev: 112cb83455f5f591de17c5ed2fec519b41dfdedd
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.7888881382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xpr: bump version to
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=112cb83455f5f591de17c5ed2fec519b41dfdedd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003477.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xpr/-/commit/6f34ba3a67e2c25f4fd6b2878038793422bf8770

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xpr/xapp_xpr.hash | 8 ++++----
 package/x11r7/xapp_xpr/xapp_xpr.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xpr/xapp_xpr.hash b/package/x11r7/xapp_xpr/xapp_xpr.hash
index 28ebd77810..0ffcdf3a5f 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.hash
+++ b/package/x11r7/xapp_xpr/xapp_xpr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003177.html
-sha256  a0bbb11475366622632440b1c6f16d19964b4516483232fe5f46c169528557c5  xpr-1.1.0.tar.xz
-sha512  53eb896cf1844036a13b1018ffcecbc6a0a56eebe0d7cb6331dbe691207498d2c41f3791655b7fc081acfef2ed9904987f363b710bf0eeff6c8d33f819a951cb  xpr-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003477.html
+sha256  8b9402f8331309f0a9d8143d4d6129c4a7479ff9449616849b9f1e2a5835cec3  xpr-1.2.0.tar.xz
+sha512  49538a757aa60e754ecd39273510a6e49ebb77b730be62e3fa60f00261c9c1e208d39e1ca3c61889a5ad7fc7c2255fa1f669fd19ecf98e18cb8aa9189cadc15d  xpr-1.2.0.tar.xz
 # Locally computed
-sha256  5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069  COPYING
+sha256  46f4634338006ce194cd0098a159c701f4587ab8e21c40ce510d8504e85fe128  COPYING
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index 4db4cd3309..c388335573 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XPR_VERSION = 1.1.0
+XAPP_XPR_VERSION = 1.2.0
 XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.xz
-XAPP_XPR_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XPR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XPR_LICENSE = MIT
 XAPP_XPR_LICENSE_FILES = COPYING
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
