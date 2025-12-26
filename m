Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01612E8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD095408B4;
	Fri, 26 Dec 2025 18:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gv8l9gTm3OQt; Fri, 26 Dec 2025 18:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA8C4409D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773291;
	bh=7L7D4NerN00dI0bTBlpwo7aPccm5abF0QPIrQeRRO0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=reo0md7uDwsymxPQLkjhTMKncTw6aYEuhggPCH+RSnqSEgzlickBy7pTe19MtLP5z
	 FEg7ivDLIhhvYTc2TY/CA0yTHg/+ItQiErdSyOf95u2ELDcE0JNAzngA5EgAA4kgzt
	 STek+kDPYPUL2lxFtHtxZDI/UvHEAnQuslEBoV72V+fFEEGgUvoNhzwFk8+4g7MnJ4
	 JcwAocU+hVtzU3E8sjV+winduZq9DTMfZQDJKNeRiNCXhdyDPjO45y7fmM7rKLl9ei
	 OQLpHEfqdxgkIGwXwaHtLvXtc4KBAe578CmyaJmIB5Ke0lE6C/6fXkVTht3vjkYj7U
	 6c0A/sz8ysd3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA8C4409D8;
	Fri, 26 Dec 2025 18:21:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04DA3EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CB1F80B10
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJZVXQMTtF6i for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B62E880C23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B62E880C23
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3EA98461E; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f26fe346543d5b086d69a15bdee797e3ff249101
X-Git-Newrev: b1c3cb5fe01533c965ff2d0f5daa029977981f9f
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.B3EA98461E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xprop: bump version to
 1.2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1c3cb5fe01533c965ff2d0f5daa029977981f9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-November/003558.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash | 6 +++---
 package/x11r7/xapp_xprop/xapp_xprop.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index 9db2fb9125..166650086b 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003269.html
-sha256  580b8525b12ecc0144aa16c88b0aafa76d2e799b44c8c6c50f9ce92788b5586e  xprop-1.2.6.tar.xz
-sha512  ab25d4b8bf9de8fb37149060ad4870ffed4d6846ac3b31903a42c36301fcb0d50d3ba15949fdd9079507db97d3f05d4bbd11711d825e5470482cc30772cc3f25  xprop-1.2.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003558.html
+sha256  d689e2adb7ef7b439f6469b51cda8a7daefc83243854c2a3b8f84d0f029d67ee  xprop-1.2.8.tar.xz
+sha512  bdd9b02c4ee738bb4661c3acc901330e635b9967de5efb1615297f6b0ff3cdbd0eab6f63f80a605539090e8d62c611bb603da17477e16e3c0b26ff4314d0b664  xprop-1.2.8.tar.xz
 # Locally computed
 sha256  f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415  COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 888e9d3a69..ad03e23e60 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.6
+XAPP_XPROP_VERSION = 1.2.8
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.xz
 XAPP_XPROP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XPROP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
