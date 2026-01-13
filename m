Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A2AD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBFCC40E60;
	Tue, 13 Jan 2026 21:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HeWMpMGDJea; Tue, 13 Jan 2026 21:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E3340E53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338039;
	bh=kJStOk8OzICGlgbgzhwUbW23+GYna0lx2BRNhE87vEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XhgfXghas0XPXiOc7lIw/rlJE+AIJaRhxESGNEG9rx8uLAHV6ysf6l1xQdPZKBkWQ
	 /OaE/EDrwwu1KqKXg0NAocZvKqxxEIjDdgoc8yTXBcKSm7o3jhnR9OfuQoesEtrvCv
	 6SumHXSRMaujpeCeMHzSJjBDUai9YhooJuZgvXdnlUCCIchiI4G9+B0fDgXFvkk4qL
	 IHnhduMasQ9LNhHZM8uTrT6SZYqckDsyNhfxJHu15MDpouEtsNJASlBTMbwYTSoAwK
	 JzW/IpS8u6JMK4tVjhm4Bf3t9dyX2rmwFVg58EICE3otXr1bfWEHR1+82apPMfws4W
	 5uWmaWSsDNLxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3E3340E53;
	Tue, 13 Jan 2026 21:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 113261CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3352940781
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Udd8jqihznd for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB20407C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DB20407C0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BA3480F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e59dc19d7ae4e33a756fc4f996a7fbaf9cafeb8
X-Git-Newrev: aab82b4649448371bb1bc9f288c3ad4a1ed2a9f6
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.6BA3480F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xrefresh: bump version
 to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=aab82b4649448371bb1bc9f288c3ad4a1ed2a9f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003478.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.hash | 6 +++---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
index a83bc84940..65337d1ff0 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003188.html
-sha256  a9f1d635f2f42283d0174e94d09ab69190c227faa5ab542bfe15ed9607771b1e  xrefresh-1.0.7.tar.xz
-sha512  8fcbb01aa368944ca536f050ab194b21bbd6b2a56265a7ed5807882e5c2f9660105283cdba0ea35b3e4a17a015586aeb82906e081da030332dfc49169a191c31  xrefresh-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003478.html
+sha256  29ed592d5ece35a3029004d8c46f3002f92970870a96c11e38baf7f1122b8b5f  xrefresh-1.1.0.tar.xz
+sha512  d46988c0423c3c6efb21a2eec0df427934d041afa6dcbbfd33f2dff19bf5e077baf10bd96780d98326d3a3e34cbf5824da822b6cb0091873cc1baade0aa05c26  xrefresh-1.1.0.tar.xz
 # Locally computed
 sha256  4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663  COPYING
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 9affbd468e..3424af96fa 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XREFRESH_VERSION = 1.0.7
+XAPP_XREFRESH_VERSION = 1.1.0
 XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.xz
-XAPP_XREFRESH_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XREFRESH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XREFRESH_LICENSE = MIT
 XAPP_XREFRESH_LICENSE_FILES = COPYING
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
