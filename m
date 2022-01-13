Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D0AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE6D84CDA;
	Thu, 13 Jan 2022 21:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NcdCqy2dRs59; Thu, 13 Jan 2022 21:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3CBA84CC8;
	Thu, 13 Jan 2022 21:26:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D3191BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A5A40A62
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0S2vG5THrR2t for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:26:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D28164010C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642109166;
 bh=0ItF3t5stlpjz5TRAyrLi2zui5PC3+cszMcZPEsiSc0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=P4XatmiK7kamogHULz9r763YqM1Sh/6ELHAPt3IqlmabuvguhUvJId3II85HPUve9
 jffOF+L16fSXMc/hN8Z11G5j3vueXMU1UhBbWWlau6/x+Edx0H69mSpkTNXXOHGiEP
 kfY3wADOtDeXrWZ5WY/gBLggZvOnbmbeiM5c1kRg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.61]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRQq-1ml7b81N8e-00Toy0; Thu, 13
 Jan 2022 22:26:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 22:26:05 +0100
Message-Id: <20220113212605.13343-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Raa+YoG2pDyzcmlKqfxCihbTG8s/hhDz4AcLFs20dQFQTshdCSK
 yi1x3A6qazPNHj9LEWxLwPgaXjPVVIRrFV4a0eFxZxxu23nL0KLTUIBu9eqvRUIQFj+DyeW
 QuJwj/InSb44ShGrA8bkfOqxnIHG/E4XMeY10z6aMSZXAwh/Q2CqcxoDdiGcK6Xnuov+C74
 mTyW3CXai8p4y6lRbDp7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:puCbksAaRYk=:C1brd5yvYBrDNRYqh69i4r
 HeSx7nQFNkemZch0EiPtb+jvijB/RVywqm0ByFNO2X7HPQGqq4H1zLmflXSjhOVwN5eDkVUVa
 1cAduOYMBNdH18zKzS0dfHWhVH8ncUHob1LmLCOYJiJjYQxM0qFWXP4zNQ8XYtryqRwatgpIG
 Aj1d2Wm4gPiSmSCn1wSoSxeRGGYvy7Bhj4HjivsKx1bSyWJ4FFTmOiA46eSDF836XqyZSqABm
 N5TtyGpXkQ1NDDApRu/o3MDMZct2L9ucN8g7vMoKvA6wTxGTgQJhhZi0Z5Zb+oDj5kSaCeh5k
 swrx33aP6o/u70GGaeRepLoT+c3nv6u3lz5nm5baQxOnSPPCB/+VeAs3tbM/c/NerMS4PTb3Q
 wOnpKkjrwfAD0NMwvmDRd5hQYTFBp2us3W5pbb9F+/FNxCqi+SvLgCmrihxIACOZNVmJ+SDd8
 WMMn5bi9V5x9uvZnwth8w8dKTTpcIGVEFUr8ZneM2FVy9IAbMP/nGi77gq82JscIT0rl6bQJM
 blQBqbSozv1LEqWn2Lxh2q5utJbPIkJXyzFum7iz4QE7OsoBolf1BsWrqKxnKtU6BUqmLoA8j
 iIfbj47it0j0GWI7paWBSEjWIHllAp4+HexwfMms1c+8Zumq8Un0ZhU4A9QGTjeM5FuDb6Z3p
 l5+JOn/2gt6h29/dnQxk9x6HudP6QMqCMH8aDhaCpMnQfrHqeVSchP3hu3NOSj09xuo1BzUaY
 cEB5WeU7AAXnuNEFlrSuv8PdOZKT3csfR7HYQebPhx3binXVs59T0yU51nhmD9Jm4D3P2hJE+
 3em/rNE4V0ClBkCxbD2aIVgBej3ph6arrDTECLCjk///hqdu7aOJXnx4UmgnqnJDGjSeizFpl
 +ocfMJfy8e1tgK4/qJbR3a2SfOgFeAJz69igWXB8ge+lyvKr1IWH/ezXAQDfzYw3qf7OwDKzL
 iOfN4WlEEyifDWA2PWyt/pKm5iQuQl+NLcjTKhZpmKy0gkPmw/7K19fnM05pEvxn6orbVGdcl
 sj74+I8GaZ8CVS+Hw1J6h0zFO1uUSQIc4MtDUd0mVjzb+Cq085NUxtwOrMHL1vE+J17bSNyTt
 dDTxq5JL2jw2Hk=
Subject: [Buildroot] [PATCH v1] package/mesa3d: fix glvnd option handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- enable glvnd option only in case OPENGL_GLX or OPENGL_EGL is enabled

Fixes:

  - http://autobuild.buildroot.net/results/e97ad48f20a325f5757754a8be2bdb613c86e4ea

  .../build/mesa3d-21.3.3/meson.build:542:4: ERROR: Problem encountered: glvnd requires DRI based GLX and/or EGL

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mesa3d/mesa3d.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index aa365838ab..fb178c10b3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -271,10 +271,14 @@ MESA3D_CFLAGS += -mlong-jump-table-offsets
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLVND),y)
+ifneq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
 MESA3D_DEPENDENCIES += libglvnd
 MESA3D_CONF_OPTS += -Dglvnd=true
 else
 MESA3D_CONF_OPTS += -Dglvnd=false
 endif
+else
+MESA3D_CONF_OPTS += -Dglvnd=false
+endif
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
