Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40070D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7A74144F;
	Wed,  7 Jan 2026 18:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTMVJyQrbeb9; Wed,  7 Jan 2026 18:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDEF941422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808949;
	bh=wSMjahTjpKSZ5my/UbGjhEI6Y2r62kU/4Diu5ArD6cc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jOOpClBiGuEGZaafL8PwUIAsZqRP+SIv0Vdji0iyPTyV4BfR4/6fT7k2NbqCrA+R6
	 3tMBdPjrGXTAC1kVOAbtU9AB6K8a3wb5TccOnugpCovyL5pxs0tJKY4Kvs1ekwll20
	 lRVLQA72aegswQcv88mjT520ta+j+Lchp/P1mjRgiY0G8Rd6SBnqzSfYWXI6YnOTCu
	 g3RAVZtTzlygrvfOFNBhZuUWTUbupPNp3er6yqsGFLSgy7Cbx1pnnNzFap7+j14BM+
	 4CyWozRJF+nU7hr1rGb4Efqbxztox0YFsuMh6n+ucX6eyC/U+JsYTx4U6krdy9UMgp
	 sswjTF2bH1oyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDEF941422;
	Wed,  7 Jan 2026 18:02:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F09A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 525EB40C65
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxeOfaw2uYUa for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E29C40A45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E29C40A45
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C83F883B1; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:51:50 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 42f81fae5b4d174a687db1b40dab4841dfd14708
X-Git-Newrev: f3a7d86a7cb6f6e494f6f2bdc2f194085963ce17
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.8C83F883B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python3: make
 SuperH tweak actually effective
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3a7d86a7cb6f6e494f6f2bdc2f194085963ce17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

In commit a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9 ("package/python3:
work around GCC bug 121567"), we introduced a work around for a gcc
bug, by reducing to -O1 the optimization level on SuperH.

However, it turns out that this is not sufficient, as the build will
only succeeded at -O0.

Fixes:

  https://autobuild.buildroot.net/results/31f/31f34a983036b4135c12e5797b5c2258ab33e6c2/

Which is a config with BR2_OPTIMIZE_2=y, which means
BR2_TOOLCHAIN_HAS_GCC_BUG_121567=y, and therefore -O1 is passed, but
still the build fails. At -O0 the build doesn't fail.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0f938aed25199d779978afeff1f8078b7bd3611c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0189a505b4..4e660ecee2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -192,7 +192,7 @@ endif
 PYTHON3_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_121567),y)
-PYTHON3_CFLAGS += -O1
+PYTHON3_CFLAGS += -O0
 endif
 
 PYTHON3_CONF_ENV += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
