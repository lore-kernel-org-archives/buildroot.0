Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C182E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 504864068F;
	Sat, 27 Dec 2025 15:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZP8TcbJV_dJ; Sat, 27 Dec 2025 15:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC0E40690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766849210;
	bh=nlwvrvJcZC0NX8jEGjUKPmciCNS4/Wmm2OioXzHgKY8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ir09hSrco0MvTcQPSN6tXOwiVy+svTbYNcy+RBcLlfAMrmxxXvnwAdIpU12XmQKfP
	 vKiYmjG/ETSYWFZ7+v3QPtAIjr6dzjyFOujtpEUhk16TUXH21qUajlVmhYDnw1elfA
	 AIdzegKNxbs0/x05k/qPCRQ3cfhxiOvcou1piH98B39B+JU5SlB9IZ/VXmvq6mpVsb
	 Z+UTEgwOqo57xHlSmWUmc81OceUloo2JkFMkNhzfOyAOCjnVMPYdoCfGdvWOgIijD/
	 8pGYo3d3yO/J1KkImrbNhw3a2FYgAv8MbEZKYImMin/VnuE+fxewpxnAYu41HUL97O
	 3nfAgLUdxPWxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC0E40690;
	Sat, 27 Dec 2025 15:26:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B45A2119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A735580F1F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-ca6biYNUpk for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0161B80E9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0161B80E9C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:26:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B6C8775C; Sat, 27 Dec 2025 15:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:26:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d297569eb405d2db729dadf8dd86ac2d1070b742
X-Git-Newrev: 0f938aed25199d779978afeff1f8078b7bd3611c
X-Patchwork-Hint: ignore
Message-Id: <20251227152647.E1B6C8775C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: make SuperH tweak
 actually effective
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f938aed25199d779978afeff1f8078b7bd3611c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
