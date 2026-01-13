Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF33D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F1E960FA4;
	Tue, 13 Jan 2026 21:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jgZyG_3RRir; Tue, 13 Jan 2026 21:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4C7E60FB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338005;
	bh=DlHXtd612E+hzYvwyBcacAlNqL9VKuaYpraJwiAOjC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r5M1tbTRthcr57zX1bENwsDjecTf4lOXhO26ihKOQwGD2VPPQ4zP28I+i/8VtMrW/
	 WV4MHNfv+lgdPLz+81x+pSVqLcOPwyRKJCgZptqf3VYFO54qxZR+KwKNL8myIUTU9h
	 VHDG5BstgrUkOGfakwv4rDsWGsktnpbkuAJ+9WxuxxRcxTKrj26DgU8vO5ySVaVOrd
	 pM7+qTaDk74Y3octz7qzZYMbxZCsAIUnz6/D9nzeuGPRuOsAp3ck7RAC5Owz8HrYtE
	 72Ro+M1dvRoNpRZOXmaaGZo3pZBoeOq7+DVnmKmwmvqcDnNla6JxNY7nBuJbGXwhc7
	 bSDmN+Ioulikg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C7E60FB9;
	Tue, 13 Jan 2026 21:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3711231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 119B04076C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnAuvvEzI7Bf for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9862C407AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9862C407AE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9680B81382; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cca00dc4663b31b30ec5389181c58c6119e6feda
X-Git-Newrev: 3db688e649ad7ae30a859d6cbf76c8f2ef32a526
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.9680B81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_x11perf: bump version
 to 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3db688e649ad7ae30a859d6cbf76c8f2ef32a526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-August/003526.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_x11perf/xapp_x11perf.hash | 6 +++---
 package/x11r7/xapp_x11perf/xapp_x11perf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.hash b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
index 3370d7df53..a6c3111d81 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.hash
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003242.html
-sha256  5a0e7cea47716ad07ceca38bbd07ae06459ee4d837b9c9dfc21ccb94e3e24fcc  x11perf-1.6.2.tar.xz
-sha512  5be9e601071a42d103adbab5f30c1900a3779a5b2c06c709df99a85487c9790d36b835d43f5c6d74cc7d950cc3ad06927210d7b1f58939cfd0b4a6f3e5e32112  x11perf-1.6.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003526.html
+sha256  24f80d84b0e96171a998932ff007698fd1776da9975ed42e51d57b9cfca91828  x11perf-1.7.0.tar.xz
+sha512  de8185bfbac15fb5eb15c18ba8450d8e383e1356675e0368c9a443d4c2d14245fab87ac0aa4ddcc5ebf731af0ad1173f53c6937104c1be824bfda5b58112fd5e  x11perf-1.7.0.tar.xz
 # Locally computed
 sha256  f467ff659142e2eb4cb7275c48c789d249af398b09a405d3e181dcc339b3b922  COPYING
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index 3a1d579939..82b3d9b790 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.6.2
+XAPP_X11PERF_VERSION = 1.7.0
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.xz
 XAPP_X11PERF_SITE = https://xorg.freedesktop.org/archive/individual/test
 XAPP_X11PERF_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
