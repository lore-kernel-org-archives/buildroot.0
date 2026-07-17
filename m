Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF1C4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACCF58081B;
	Fri, 17 Jul 2026 15:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oif-n48WMMXe; Fri, 17 Jul 2026 15:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0D5780BE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303151;
	bh=ABXjPce209YRMHcpjCgaEWNAOZicy7/tYr1AkjyHIWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P6HOLTtLV9MOPWDh56kvhRvT3UgUHWEX1KAnfxbqqHPZOJvn5us4C2zns+4gRLICn
	 Dtpzo7+q4gWKvXW++9B2eQ50e6eb/mU/XeA31hx4frB73IcpAhQm4CCnBZUdrt3XO6
	 oDA17AoOm6YswaBEv2d/N3nsm9P2kNbyS4bmQtifc24z0LG8+S06Nc34M/JwtFz2et
	 7hqGBQYjyhBCEs4vUKiWHhhXAn7usokMIbDiutJgmE6Xhc4xm+5f1aTQqIl0nhQLsi
	 Rk7kvz/uQDZDz04/7iTazM6R5BgZONIuwhKCcjM7U62xiHlj9iI+50TPv2p82bVXGy
	 7lgfqbwHNcGpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D5780BE7;
	Fri, 17 Jul 2026 15:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D84DB1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA1AB8081B
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiLK_1U5y4DJ for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0375680C7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0375680C7C
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1C9B88E53; Fri, 17 Jul 2026 15:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:02:10 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 138f03b86c1fffd1deff412e0bb4e4cd3c8c9053
X-Git-Newrev: 1b4724a8a104f900d81b044d953a06f9e2d57123
X-Patchwork-Hint: ignore
Message-Id: <20260717154510.B1C9B88E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libcamera: update
 source URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b4724a8a104f900d81b044d953a06f9e2d57123
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

libcamera has moved for a while now to gitlab.freedesktop.org. The
mirror on git.linuxtv.org is still active, but it isn't the canonical
repository and has less bandwidth than freedesktop.org. Switch the
libcamera source URL to gitlab.freedesktop.org.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
[Julien: removed trailing slash in _SITE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 138713f39a999c30adec7f2e2829aa67af87a110)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index e8f502b253..bdf31a04ab 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
+LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git
 LIBCAMERA_VERSION = v0.7.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
