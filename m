Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98648C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3840660BAC;
	Fri, 31 Jul 2026 12:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icIBUHdz66DD; Fri, 31 Jul 2026 12:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7D960B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500550;
	bh=RF2fknNeiCmMmUmjWNhQ7C+QNuMvb9yo1eGPpMqOQos=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XbZ+C7ExTvfxqYAO151K72qjB1zlVoivQBkQBYZT4etm/helan/UpnZodsJCFaWiJ
	 +N1y2Yd1T0CZcfHydSCLkKVJSvrwv/d9DcAJdhPgqkrSB+4p0z2qUj1US3B7ab57E7
	 iHD3zh3xAi9cH0ZYMTw/i55Q9het/ZDcNfG5w2XIZ32UAkI9SjezI10LA9BN4DDpJc
	 lNrOsYGO4poLNQfCvYEm964ejd6OB6Uisu4uf6Hj+3sjo9DqqewRWu+6VRuhqAXQCl
	 hppdEf1UzklzJGx4+UaAnBD3j1+A0dLdL7UjlSdjlXi3gF/uAu2GwESqk9TxGeAnie
	 zCpUOuo6fFC4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE7D960B7B;
	Fri, 31 Jul 2026 12:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDCBD42A
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A39138133B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfSENo2KCaWG for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB7DB81338
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB7DB81338
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCC2F8B73F; Fri, 31 Jul 2026 12:21:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:14:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f4dd8841eb1683c1b77eefaee4ff58271663067d
X-Git-Newrev: af6fb9e1fb030ecc8cf2f1d564fb1e3a9b5c57f5
X-Patchwork-Hint: ignore
Message-Id: <20260731122143.BCC2F8B73F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libass: security
 bump version to 0.17.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af6fb9e1fb030ecc8cf2f1d564fb1e3a9b5c57f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libass/libass/releases/tag/0.17.5

Fixes CVE-2026-61626 & CVE-2026-61627.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f6ca8d4f5f27232f439bb3e68ace6f7baf20d5cd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libass/libass.hash | 3 ++-
 package/libass/libass.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 2f4f718813..467c9b3816 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libass/libass/releases/tag/0.17.5
+sha256  2dca25c0e0c837ddf00b52011b3f82cac1e4ddd3ad018227806b0c2288864acc  libass-0.17.5.tar.xz
 # Locally computed
-sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index ff42c6d621..3675a75f93 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.4
+LIBASS_VERSION = 0.17.5
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
