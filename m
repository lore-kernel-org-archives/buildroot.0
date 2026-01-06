Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204C4D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5CB40CB3;
	Wed,  7 Jan 2026 17:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJU6CaxNcZRJ; Wed,  7 Jan 2026 17:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD02740C8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808127;
	bh=LKL+ZaoW0t6dOOpFbiMCbbuqCLjxKJHPYXpIG0h5oe0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fXadrrifZcTCgG789kq37bhcbPfTBOpGb47vVYZfqPTk1mKPv85OXQA3MIHGNltPj
	 O/kTS9TNOvaPT8duCQTkmiWucDIcPD2SZQdbrI4twtF1HxVC1Rc/8fKDnPaXewX4wh
	 sLRf5x1G+waWAr69Df2t/BTmH93ZnRV8SItXKUqZiCYu1tLZTH6LXDoqWu9JEd/EXd
	 gh7kARTk2uKBeroi8UZMnGIO7qXqtFizJMdv+TetDzO2MMpBL1wv33XWXXaNw/G+yY
	 zIOiZWYIsAYnHN0muJ1v4umPgsmO4L4APi0LmsG9OXKolzxdVoHvGLJxo5Vum+ZjS1
	 Ht+GcbCk3DEkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD02740C8A;
	Wed,  7 Jan 2026 17:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93AA325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0EF56087F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 441JA8ZnN-Mv for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC814607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC814607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC37881917; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:42 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 23ccc3ab5ce38f95c16e4f59729e3da93ccc0a71
X-Git-Newrev: 9cb5a7f69063fe8eeef3b106e02a743f83f218b8
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.AC37881917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sdl: fix patch
 reference in IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cb5a7f69063fe8eeef3b106e02a743f83f218b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the
`0003-SDL_x11yuv.c-fix-possible-use-after-free.patch` patch reference
was renamed.

This update the reference in IGNORE_CVES accordingly.

[1] 9fab7bb79d package/sdl: drop directfb support

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d372b654a45882f641ff65a4acf7126e66c35487)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sdl/sdl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 439c30b2a5..29697fe3c9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -13,7 +13,7 @@ SDL_CPE_ID_VENDOR = libsdl
 SDL_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL_INSTALL_STAGING = YES
 
-# 0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
+# 0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
 SDL_IGNORE_CVES += CVE-2022-34568
 
 # we're patching configure.in, but package cannot autoreconf with our version of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
