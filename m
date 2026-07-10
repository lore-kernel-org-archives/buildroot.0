Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F049C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F4A40A27;
	Fri, 10 Jul 2026 16:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXFawy8s9ZaW; Fri, 10 Jul 2026 16:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14663409FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783702025;
	bh=5aaEbMBr221KFa8oXgonA9BjJCYcGcggQudTxrkxyMU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V7kniEPnnHmVx3WyRNubuA7KK0VPBzvd9nY0lOZgpqShKwT/M0WCuiRpcAiv4HtHd
	 xmOi35CklsFvR2QiODbzmbIP4Mb/YTUcbhcU7PdDhXtcdA/0+ris85uzs0vfgFlUcl
	 WOUpdzOPcuEkM0IEmqbGMf+8yigcDtVgc9I1GDFBhGGZ+6E70TkBJzADy/BeKfic6j
	 e05Q5Ycep9udGMd3eWFvwVPMpjh1RaiEBvAK1vqoeu/OWh0kvbzkeQHy7gzFXDgcRy
	 oQ6Y+S3FJGH2Z8s3nxKmR68Vgvzk2DYYjRW55nHJ0B268MV0cL046YBIqyexyo+VtT
	 cWLZ0B7eMQxEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14663409FF;
	Fri, 10 Jul 2026 16:47:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 304FC320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D7DC81024
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8l7NXOjduoX for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566F980F70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 566F980F70
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:47:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74E53886A3; Fri, 10 Jul 2026 16:46:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:46:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1329e7860f4004bcc998547ce3dc887dffe1da0
X-Git-Newrev: 138713f39a999c30adec7f2e2829aa67af87a110
X-Patchwork-Hint: ignore
Message-Id: <20260710164630.74E53886A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: update source URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/138713f39a999c30adec7f2e2829aa67af87a110
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libcamera has moved for a while now to gitlab.freedesktop.org. The
mirror on git.linuxtv.org is still active, but it isn't the canonical
repository and has less bandwidth than freedesktop.org. Switch the
libcamera source URL to gitlab.freedesktop.org.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
[Julien: removed trailing slash in _SITE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 945207888b..256909ebc8 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
+LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git
 LIBCAMERA_VERSION = v0.7.1
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
