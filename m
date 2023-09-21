Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7F6CD4949
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 03:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C536860BDD;
	Thu, 21 Sep 2023 03:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C536860BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvGCGJM0Ngcd; Thu, 21 Sep 2023 03:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 185ED60BC7;
	Thu, 21 Sep 2023 03:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 185ED60BC7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 496FA1BF295
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 03:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CD82404D0
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 03:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CD82404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mjUSyiLSq24 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 03:58:53 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40A4140278
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 03:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A4140278
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M9FnZ-1qnp8Q49rz-006OUs; Thu, 21 Sep 2023 05:58:50 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 05:58:27 +0200
Message-ID: <20230921035827.70379-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:FfsUQrFH9IqzhTOiIWZH9wfnNssgMbXuUrFsfL8pSewYqTfrkYQ
 79yB71iFn0sI6i8PxWYnQPIMjRmTSYnP6HQ+465+MV99bsT9exMLehlgNSspdC5PARjf7z1
 Wuzbz3pLeHr+seLkmKx79g8046ALnbt7hrKCfdPowKE4ZyeWWYCP2MmDCTYuDyLp543UWeZ
 b89RJ4+PBJqlgMGlpRm4w==
UI-OutboundReport: notjunk:1;M01:P0:EypWF+5eN9c=;6bemfi2Tzs4/pKIydVxIzWIcmah
 A878FG1uZmARh/r574kgMS6724HkLrzbi1nDGt5VJ/XLhNO8ATKsreSFICAFWyEBD2fcYwy8P
 ls5V/5Y35khAvGMK7xfchPAqC4jBCEaiJpev9+QENXqdLFv8zop4kBLouetD7IaVF1kTPB2nD
 v+ZaDFjYh8DzqyCcbIc2zt7oDiTheXbWVlUGBZL9ku8D6Uby33bQLBfhdPkXibYTS6X2dAZJJ
 G9CRf4N3dk8QieUJ134iL2eyvRCs9NkPfp5kHrmNF3Al7PcN3f0tPwWU9dFowFAEe+MRNWwno
 ch59m1MWfXsiJxlWvvGol7bOA2Aa7HnRCLxzH6rXwMaI/CstqQJllE0juAL6DiOT2yAUtl6Mr
 QVqdWg6zxv/D05CTR+4h8l63rZFsr495nu7TaD9ZJkjJwtvohahwT6KzSkVb4jlqLBsCZoUMz
 1092hHaDBiUGr4lr31CMhkXTVKne5VL8VBRkgD/s+G+/2ZKFqcf7J9OQTuAo+YX0z9H+VD4Fv
 epFlp8GkWlZLq5gJ0g5PDzF75iyaNB7GD8HO1ofJ9qQg85moa5kacG1BknEoadaRlaIsO0OEr
 Ec/znIAoIkDF8xazqSY7kSNdl5/wYn9zVBq+q5WUQKBvUOW9jPjmoEynPZciFEmBChVBwDeW3
 JsQFcKNQ3cvdjGuzI72ALph0zzT5945YoX+UVvRstkxw9PZy6BFgrYsEN7ETbN9LUzki5VtCo
 16bguRxIW0pjNNMOKOYHlSBCGmYHjMyMFFquI+nQNduftaRw2hJDsQs8a/VBExFlQO7NP+mUt
 eiozfEe7pMMkxBAvCHA47bma/SqhMfPS5+WzGW+zbCvFoHjjXjWpi5my6Ly6/s3ax3EGqpatA
 m5If98ONIjFpUJJTPKgf1ZeBBcOJ56ISqV8MfmZGUwexMSreNdYbFOl2wlIuq+BmDNh+5E6il
 6OtzukJAzctd3I58rX5vtt2DMOY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695268730; x=1695873530; i=dalang@gmx.at;
 bh=OX8ct5wzXuprhBCP7sOS8hv5SBin5Pj15j308VxvGMY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BPHmmayzI7KqyBvaGbaXrTw3RDqpzO2hoUoGLJBYiwMOHbtVZQR9sg5Z/yngWmkfS+YtAOql3Wv
 +g83Xp6sEka86MKvHuFW4aWGk4ghTfLpZcyMwP53ycH2eMCFRjH8tHarQFolFyVS6e9dxS9rtwyYx
 Ubhq8Lj4F6EGkJGNsNnebhBfpSBR0ZF608hjWoPYM+n7Fq8ZUHRytE0LMVJyxAcytSSDCuYTZXbbX
 sxi01IjVZ3/SxShvgqS3soXszG0UmYD7pJ1PJiGz+r3OgTCBWpM0/uFYvxmLC6ZaULLF14lV9rpo3
 zG5AZqHihCN4VOBSCPM1jKMR0k0I/K9oqqdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=BPHmmayz
Subject: [Buildroot] [PATCH] package/fail2ban: drop CVE-2021-32749 from
 IGNORE_CVES
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2021-32749 affects fail2ban <= 0.9.7, 0.10.0 through 0.10.6, and
0.11.0 through 0.11.2.
The mentioned patch was removed in 76853089 when bumping to 1.0.1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/fail2ban/fail2ban.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 828dfdd6e1..0c1208c6fe 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -12,9 +12,6 @@ FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = setuptools
 
-# 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
-FAIL2BAN_IGNORE_CVES += CVE-2021-32749
-
 define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
 endef
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
