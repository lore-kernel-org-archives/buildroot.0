Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AEAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 20:36:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52D6260FE3
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 20:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52D6260FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED47180D62;
	Sun, 14 Nov 2021 20:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yo1Qa7sTqF-t; Sun, 14 Nov 2021 20:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 694EF80D60;
	Sun, 14 Nov 2021 20:35:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5D871BF3C1
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5F0180D60
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 20:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwNxdlgM5DPX for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 20:35:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FCBB80D5F
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 20:35:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 263158D33F; Sun, 14 Nov 2021 20:31:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 21:31:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 399ad854cc210db728e06933b8a4ad9089176ec1
X-Git-Newrev: 8d23bc990c2f5640f482feb1aa146fafef6749dc
X-Patchwork-Hint: ignore
Message-Id: <20211114203150.263158D33F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: fix LUAJIT_XCFLAGS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d23bc990c2f5640f482feb1aa146fafef6749dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
d4e6e1b53b07b05d51ebfb70979608c144ac155a:

/usr/bin/make: invalid option -- 'D'
/usr/bin/make: invalid option -- 'U'
/usr/bin/make: invalid option -- 'A'
/usr/bin/make: invalid option -- 'J'

Fixes:
 - http://autobuild.buildroot.org/results/92a5188ef7f9dda3e417d3853b0c4067415f5970

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/luajit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 89b164c96d..3367336899 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -47,7 +47,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
 		BUILDMODE=dynamic \
-		XCFLAGS=$(LUAJIT_XCFLAGS) \
+		XCFLAGS="$(LUAJIT_XCFLAGS)" \
 		-C $(@D) amalg
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
