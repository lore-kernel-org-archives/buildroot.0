Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC0E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 20:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A61D814BD;
	Sat, 20 Dec 2025 20:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kbXn5T3HW0j; Sat, 20 Dec 2025 20:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74513814B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766262409;
	bh=WS143bYoGGwEx3lxbRTPuzRq+4fcY/M7at+S9pTcuwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aUe+eVFB7sYpraaVRPfpxlYZYuEeZj6eKJFayqBnVCJPw9icQTQn18Z1FeoVHV6S5
	 8LEHrTPEUy5ugFvYXSVAnMsPhasQsqFg4ImS5K2a4RgDsi+tlcKu/wjjve7Oi2dmis
	 RTGnnNanBrrfr27y6l5WDN6J4EKvRwpiiWzjgjCkVzXlSlM1J+iyrAKfAwYD9c569/
	 I171LKoAbYvBpalFrzM2guia9GHvoi/aFouKjFkrv4JFiJfFqcr9eU7DlWvBps9Iu3
	 u6VK6JmjfiB1+FkqTvxeKATqWN6pTS/sSWlMDGqDwuOgMgNDdGEfxeZ9fVfTkJ17iB
	 KhFCL0OP0xCTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74513814B8;
	Sat, 20 Dec 2025 20:26:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3668423D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 20:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28FEA406BF
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 20:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HF2JuyMOA28K for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 20:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BE3D406B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BE3D406B9
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 20:26:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64B2A874CE; Sat, 20 Dec 2025 20:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 21:24:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9218276c548e790e92c6ce6519ba1b319dec525f
X-Git-Newrev: d40462ac54d3d9b9454ae5f76dfe93ba295d787c
X-Patchwork-Hint: ignore
Message-Id: <20251220202647.64B2A874CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libconfig: bump to version 1.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d40462ac54d3d9b9454ae5f76dfe93ba295d787c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:

https://github.com/hyperrealm/libconfig/releases/tag/v1.8.2

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libconfig/libconfig.hash | 2 +-
 package/libconfig/libconfig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 2b10dfc125..22f8473fc4 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
+sha256  e59ffb902dd5731d5d4e4fb81d3b989697615feab72dfd7c30618167b91a42ee  libconfig-1.8.2.tar.gz
 sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 3fa2be3563..8bd494081c 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.8.1
+LIBCONFIG_VERSION = 1.8.2
 LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
