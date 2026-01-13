Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7861D30CC5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E88D80EA6;
	Tue, 13 Jan 2026 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lMzMpppi_Nd; Tue, 13 Jan 2026 21:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF1181290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338016;
	bh=nUsCqVPXXPuu6Yc9eWVnYwkoteYyOCaH8fBVeYjpfvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R6OLSMai081oetf2CuYGTQ06GdGVa14Xye1nMt82RhFsSRwvEis8aCG0RrafGWFQD
	 YCd4si2gfI1cRShHEqrYWLCK8RTJDSaQF5NQGzV+mCmydUmN1X/ROxtqakfdpEObJW
	 2K/5lPz4XJ4d+vFL2LWTl31NLpOKWtIvV5QNVewkfWHqTOAkFUNVUIqWC+A4BQwbgY
	 OR1RboEHszI+F8ieZu24mrbMsV/8ArO5DyhLMRdf9EB2/1nMAh37PG1PsAdTWG18On
	 GfNtis8Z1/6j4ipdaV56FC5vALdCSuM/piFwR9f7WZyU8W9WRlZzmCTNWusyqzt6nL
	 wU29ERhSs1XeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF1181290;
	Tue, 13 Jan 2026 21:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 272B01CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C42A2407B6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYQrK9g8FDjp for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC98407BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC98407BC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3900880F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b27bb473243d64806be420226f16143e6464366d
X-Git-Newrev: 4dfa4f609ca239886ac3abcdc1b27811b7c4cee0
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.3900880F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xedit: bump version to
 1.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dfa4f609ca239886ac3abcdc1b27811b7c4cee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003484.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xedit/xapp_xedit.hash | 6 +++---
 package/x11r7/xapp_xedit/xapp_xedit.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xedit/xapp_xedit.hash b/package/x11r7/xapp_xedit/xapp_xedit.hash
index d550dbc8c6..4e1ff428cb 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.hash
+++ b/package/x11r7/xapp_xedit/xapp_xedit.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003149.html
-sha256  bdd33afeeca881622e55d2cf28f07b4a98f083d0a2573c0b9048f25bdd62db2f  xedit-1.2.3.tar.xz
-sha512  1089c35ef961e53f74cc7d892960e1ee7f0da17529e3173e7f7764b0eb4ee94d1e068cb177d8502ca55c1dd6808962d4b1427e303adc7e6db80be8828557f45a  xedit-1.2.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003484.html
+sha256  b00d488b29cd007fadf9a4e44193cbdd72b48c94080be5ebc02565f21f9a2a71  xedit-1.2.4.tar.xz
+sha512  30819ec491f9a02db95c20eb8653389b29bf4a4a5c54701d156db67fcb8fade5276dcb3a656dca245c958d75d0ee6fe50ab207e040ce0065d9d9a1bd58d5b24c  xedit-1.2.4.tar.xz
 # Locally computed
 sha256  6d3e4092277ea08fc6b3180dba061120ea53ee965afb84fce16f8ab3d35bb47a  COPYING
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 5aae798f05..91dd01554c 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XEDIT_VERSION = 1.2.3
+XAPP_XEDIT_VERSION = 1.2.4
 XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.xz
-XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEDIT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEDIT_LICENSE = MIT
 XAPP_XEDIT_LICENSE_FILES = COPYING
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
