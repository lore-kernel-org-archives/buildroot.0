Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C768C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA32F83F8B;
	Wed,  8 Jun 2022 07:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzpFzj6puTWL; Wed,  8 Jun 2022 07:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B98183F67;
	Wed,  8 Jun 2022 07:12:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02C381BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2CD440B4D
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egDd-BPzPfuP for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02D5D40363
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 3BAD1FF808;
 Wed,  8 Jun 2022 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itnSTys6NZ5Kh3ez6dI0yg5jgoMFqCWZteap4Vb3Grk=;
 b=Rb0poJBCPw7gXwufvcjukUdeME7GME2ysR0dGNZXuFeaXYBeQ9NGdCbFn0meeIXM9ccI1i
 HwUd7WW1IUTSKbrWFXhIDCUPaSQA9WJgt0IU0j+khGWQjLaowF4TH9obnDzFo/qhBiueoz
 QYokLc/B6sr9Ixz7bxDsYeJGSD3Jtyn4Tb5aPno5+vr+GHZGCl3QSdqUOxXQ1MI0TR16tw
 +YXdse32zvAovXIZNKGxsaBdGjHe5+4ATUbO/8osRyD5hlcZx8/s5TujojFK+yufRFVscG
 3y7MxBe1+h+A55zfm+ws972EH+H/kN4T9T8KYZcQCD47EqLS/XUXwfI4dVR9Yg==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:23 +0200
Message-Id: <20220608071027.3384469-12-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 11/14]
 support/scripts/gen-bootlin-toolchains: drop "mips64" architecture variant
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These toolchains have been marked obsolete by toolchains.bootlin.com
as they are replaced by the mips64-n32 toolchains. See commit:

  https://github.com/bootlin/toolchains-builder/commit/121e78806b4968858f22ebea317767883752a456

Will allow to fix:

  http://autobuild.buildroot.net/results/d13b35ba5a0f68f72e6592bdd9218b625a3c6554/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 36727c8fea..5e1e315f6d 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -99,11 +99,6 @@ arches = {
         'conditions': ['BR2_mipsel', 'BR2_mips_32r6', '!BR2_MIPS_SOFT_FLOAT'],
         'prefix': 'mipsel',
     },
-    'mips64': {
-        # Not sure it could be used by other mips64 variants?
-        'conditions': ['BR2_mips64', 'BR2_mips_64', '!BR2_MIPS_SOFT_FLOAT'],
-        'prefix': 'mips64',
-    },
     'mips64-n32': {
         # Not sure it could be used by other mips64 variants?
         'conditions': ['BR2_mips64', 'BR2_mips_64', 'BR2_MIPS_NABI32', '!BR2_MIPS_SOFT_FLOAT'],
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
