Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807ABC54788
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444B8605EE;
	Wed, 21 Feb 2024 21:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1XAFIcpZqAQ; Wed, 21 Feb 2024 21:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F17260646
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F17260646;
	Wed, 21 Feb 2024 21:40:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD3861BF97F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A17D5812E3
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzUKIH2ADi8q for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E25EA812D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25EA812D9
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E25EA812D9
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuK0rhA4y; Wed, 21 Feb 2024 22:40:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:40:00 +0100
Message-Id: <20240221214005.176433-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
References: <20240218230524.639348e6@windsurf>
 <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA9nR1WS2EwIZmnbW1Nz4nHERlHukgHpHYgn4wyUcbSAi0tKr+mKCzLfB1Y8e9ZwA9e+7HgWdCO0QSizNnj/EZI+SaGw+BXpW9CQtkl404Pg4Jj417l9
 hXIKDmZqFOZw6s45bCV1hU7rDigZ2K4Pgcdy0uooMnJmnScyuFrrAjX7B+yxwYX5ynXvmYAh+rYUDcB1G3u1NJKPO+oKKxkt94s6cTlpvSG/O3cfYolhPJT3
 UNxu65U3HDT6tDPP1ni9Fn/LnVWbhC0FHOm1w954yCCjZMSiJlD5TeUAm7kiSu4BAUFcet5H0S4EeMqCgPkcergZueVFiEmK+lUP+1HHUL8tUN6+I0Evp3MY
 SBj/O31WkQZkNW948ZIhNXvmWpJg2qy7C0wM5T9Idd0lCaxV4rljVUGBA9KxH8SZk3EZMzvdr7Fw/fZIT7sYtx4WACj18t4TprxJE3AODMUmKtsUB45e0am6
 B2ENPUfv298CzOSevMo4k04UlFLLetsQyJJA6dSPfSttBetOPqP1CQiZo/X72KAOC/2E/X7oXCC86AV4HUd6W+79uuLMABsERAXpJhn5bmXdZXJ0ubneyKes
 y8gBZOre8iehIkNg8yRW/naJTWbTawnXtF9mYlgQvBt7M//CqNPv1vxAx/5yL7kL1bM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708551608; bh=Y/vWCxi8r0NKShAva4ueJdRt4zM4eSwAggUlnkIXHSY=;
 h=From:To:Subject:Date:MIME-Version;
 b=ThqWLQGNFiHgFO8DIWLkVcmk7KFdjMsaSQjSRsfJnF1jV1OMBbrehTmv8s8Nctf7c
 yutUfQVSV0uUey3Fh3NufmZwwTQv9GrqVcNvi/vI5iZftnyJr64S1qZK2K52Vn0gau
 GXU9yBD5I0Sgcn+bvNV5xraUbyavEDU+Wnw5Cf7t3LLETrmtJjCtOqzkomINLHTBJI
 A3dLDXSfatdGiU507MyXc9C1wLF1A2Z4TK49wB4UfaHeNMHt8KJdTtLm54JSDEkItw
 s0pPYqPLHqMnN9x6KDrX/GG88shJgwE8b5c3HJtUQKK2QYvdPTuNrKn7VMHMBQ5EtX
 a9mRpanREYnWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ThqWLQGN
Subject: [Buildroot] [PATCH v2 4/9] package/kf5/kf5-kcoreaddons: drop nios2
 binutils bug 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kf5/kf5-kcoreaddons/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kf5/kf5-kcoreaddons/Config.in b/package/kf5/kf5-kcoreaddons/Config.in
index 02bd38e395..88fda03ee0 100644
--- a/package/kf5/kf5-kcoreaddons/Config.in
+++ b/package/kf5/kf5-kcoreaddons/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KF5_KCOREADDONS
 	bool "kf5-kcoreaddons"
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
