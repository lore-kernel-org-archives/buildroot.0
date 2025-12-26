Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE7FE8FDB3
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD68D409D9;
	Fri, 26 Dec 2025 18:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3vmqrfNZnA6; Fri, 26 Dec 2025 18:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD7DA40791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773283;
	bh=FD7hITvJMTvyDgpTOnuoRD2BCCne6OhFknJpiHQ2FH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p1OjJQn+u28B1sVkj3iJI28flZBi68tmDADNTGGbMwswODvZnGEB3VW04fA/fsAOo
	 aT6cYm1oKymUEsqtbPR1w/I//+UgUQvK3EY6c+uOYc0JRDtGXlVvFEwtlrX57lZwkh
	 v7JaCakxtLgczYkMUV39vRFQ8tCZLJv0tVIiloI68Auv+kOgXtfqOYnO6VjsaCb99o
	 J3VpGxK0NrlLz4a6qBcO2HO2yvVr0vU73El6N6X/XXZIk+AXTXA7OMRMf0YrRAM1Cd
	 mD1gaauy3asPCyR4fpszXRHe8BqeYoY47SVE7Bz3bkJqbK46t8DUNDVG/fTofNYGQ7
	 bF6yIEbRGweTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD7DA40791;
	Fri, 26 Dec 2025 18:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EF3CEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 350DF80B34
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTF2uliffdNQ for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8AD780C1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8AD780C1E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A51BF81840; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66f3eb88c103ec53f8a2d776c57e62201f43cbe8
X-Git-Newrev: f26fe346543d5b086d69a15bdee797e3ff249101
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.A51BF81840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlsfonts: bump version
 to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f26fe346543d5b086d69a15bdee797e3ff249101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003461.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash | 6 +++---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
index cd8ae4f368..786f5437ad 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003151.html
-sha256  7b726945a967b44c35cddee5edd74802907a239ce2e2e515730b8a32c8e50465  xlsfonts-1.0.7.tar.xz
-sha512  ec82be0a97500a9e64fb5a6adbbec470b249b1267c3081c2bd44cd3e7148107517d1234c1da2f81b0405230ab03ad2943ea53756c3380f4d561665b38d0cedc0  xlsfonts-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003461.html
+sha256  807f909eace684b866fc63b3e962729c120822a6c96e051ff51cf350b3ffb6cd  xlsfonts-1.0.8.tar.xz
+sha512  401c86d902f173c440c08a22067a51e7238949c8d3c71eba7a8df11955edfec27525c8cbbcf2e96ed444fa20b15f98cf65a01343215d1ed9ba84fce849d02927  xlsfonts-1.0.8.tar.xz
 # Locally computed
 sha256  dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index f8a35e5638..0992f572e8 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSFONTS_VERSION = 1.0.7
+XAPP_XLSFONTS_VERSION = 1.0.8
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.xz
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
