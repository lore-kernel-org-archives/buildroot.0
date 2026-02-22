Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24476C636B6
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 19:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6027611FF;
	Sun, 22 Feb 2026 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSuXGHGNG1yf; Sun, 22 Feb 2026 19:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B09611E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771789076;
	bh=CHA+P0sHKdYLt1gEERlLJ5p5OrTOXM0W65YUhJ0mvjU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=anFGhouGrTILCXsLUbKrM6zZb0hAOeN2PQk7wp6ndlCTILbPSDmZewyin1zau2mTu
	 UZQbWjLUM0DHkHLIT2KtK7a7ArjpSvLPH9tRXXsbAUbBeRtDgiM1m6K0+3LYOIlTHp
	 yRR506+8fGDQieSbMHgaHdNQDfzlnanIw+vAsOgbTMFAsugpsa+w8/gSSFnVv6TdiL
	 Gzga3R8T4g2a6H612IpP5/4psa2xzTTzRXzb3d3Fh8a9nib1GZAVgMAGm/NtfEcB75
	 1oxsLrVLCGCszwVjuc1eAB8Tb3wlnnfEdP1GjOKHupbe7pE43EhQsL8aQiA8C5jU6m
	 bOaryeUNCVzlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B09611E1;
	Sun, 22 Feb 2026 19:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88B221CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76E3783DF5
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLfCva5wz1fG for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 19:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92FC83DF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B92FC83DF4
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:37:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95A2A86FFF; Sun, 22 Feb 2026 19:37:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Feb 2026 20:20:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6c83a0b8e5658b901dd35ae23217075f035af998
X-Git-Newrev: 461eac6f23181c008110c11e911dfb453886a732
X-Patchwork-Hint: ignore
Message-Id: <20260222193754.95A2A86FFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/connman: bump to
 version 2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/461eac6f23181c008110c11e911dfb453886a732
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Release notes:
https://git.kernel.org/pub/scm/network/connman/connman.git/tree/ChangeLog?h=2.0
https://git.kernel.org/pub/scm/network/connman/connman.git/log/?h=2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 807f7144b1..da9c879b0b 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913  connman-1.45.tar.xz
+sha256  d25c2ddc0b5ad13e986ec35ad765ae8d2f4b7acb47c958a05616c943cd082527  connman-2.0.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 695a81f1e5..0100509405 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.45
+CONNMAN_VERSION = 2.0
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
