Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE1DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 22:20:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C037610A4
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 22:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C037610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F41A80E92;
	Fri, 22 Oct 2021 22:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4hqEfqN_nn8; Fri, 22 Oct 2021 22:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A44D880E4C;
	Fri, 22 Oct 2021 22:20:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2090C1BF3BF
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 22:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1016A60608
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 22:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRBAoNE8bWoi for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 22:20:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40882605C8
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634941234;
 bh=7ycR7tXJXHioe8WIG4WCSWHD1HqPPg5zJ/QuhUm1DNA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Ujhn0kqgaweMSl+3buC5o36L7NM25nKTyyhkwDwvZNxt+9achZsf4lsh5ZmMKwwi4
 vx39EukHB0+9N6wjdIjIotCcFRwVmE0xIvQJ53zgi4NJ4El85H+2SPlPoqOg0MkCve
 HwQb3IALQi+51eeQwgb9C3C83eUXaFKqBc/B94IQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.153]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MGyxX-1mPyGP1Sqp-00E3lj; Sat, 23 Oct 2021 00:20:34 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 00:20:32 +0200
Message-Id: <20211022222033.8862-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:/Km2ARgl5Gu8nMVTR02nIYwUfY6yVVn0Ml5jToOLOk6eAr8t6be
 7VRROK79BLyZNZ17zCF4VovBiHF5I6nmft0z6i8HsPxW1lCvQP/dDrjB3Ng0LMdwE+aAzc5
 3vTYHXQxdO9z81z0gBWKIkX4wiTncJKTNfSS0WokVC/Vasl31OE8i26RiBMf+obUlCjjXSe
 l4s8j0H2xxjWkzLvsAXcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w42HJCahRtY=:1mISXnSLNEROCFbL5EySnx
 fQWkbudspXWqrlXJgz97APLbhmOAOL3qElfBfZh9f7UwFgDQqTY9PUAb99L0Lq43X28TMySix
 3ILh5OX4W7SwJm9cXKYb0t5M3epcOMI0kgoPSfvVQHabDZbH+FKOUYpjWx98kzRind6PQJdvg
 wB+RjoMVrlfim2ksxRhUub4otsR/UeqaiUNGIdWQLWev2OdUxJHZIDnbOVsMaS334WeEhniQN
 8jU49xBseFa+L2M6F734HCFJiS9oCFUaLE1yVYas0ujJhTbxEkBtk2uDUvVzHVeMBdpTSCxdx
 cBv0kAyPgD5MUPNf+Vw5Lo0MxSJS5Siwr22X74tO/W90NrgU7K++Wrnx1OT2LCx6Kqcpk4VtS
 f28MouIjGVEc92al0gS3He+IfhYZ7UZYKNFyiTEJkpahfKV2wGyko1wWhptNB0ixdHYxJWBko
 MA3VRe98boFSs6jovNxLKIfkde1ttq/MjW/9FFvPof4yB1NNTYoZldlXbtvMajV025OhjCoZv
 64PctjUnpjEIloEN7YXCpLpBNWS5zEekmszqqjXz11rEpHmZyFxeyleDIDeWwbU9tPscxjpAu
 ziH89sw8VOy34hD9678pstOdzPNz9CcuOP65xx/9xwa2aVBQ8ADn5qUBDbmvrGUFkbDTmBsyJ
 F6UHWVS/AogGlSD0UD75WpchgwPv/E/N5TVHci7g5N+ohc3xM4KFr7IWcNzimicr4eahPJBkI
 bUtbZuMp8eOExoT4yOUGlTTarZa2LCyi5LnBTx1cZQ4np5bgGiP8iiVqdnHpP3GNtWenhYvFJ
 DMYjNQSqripeOE7heZsqx7GhBWuG6KvPni1RzRXPO8hmqK5cRD1sxtOOuJ2sxhl6K0Q9GvNMD
 EVXy6cuBPFMiwrVQHxpSY007OTAlGUR/4rOy1rSEv4C7BYHWb5X7L98VUTP2b/ph21IyZQ/b1
 xB1Z54JNgELp23B7rtXtilITMxJBfe46uA10l/vFr0+b6WI0LszMnN5EbfeJxAgpk/1IQvh88
 3d6MOkGZ7q2//PHFCmEeSsg2Wu5Utn4a7MTT1ZHJepRUuV572VgYuXFsdnBVnATR7NTgHZ9n0
 dheM+5FA5BwsWg=
Subject: [Buildroot] [PATCH v1 1/2] package/python3-cffi: bump version to
 1.14.6
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- the last version bump of package/python-cffi (790c10d) ignored
  the comment 'Please keep in sync with package/python3-cffi/python3-cffi.mk',
  so catch up now

Fixes:

  ERROR: No hash found for cffi-1.14.2.tar.gz

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python3-cffi/python3-cffi.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
index 7541e71b73..52ea3b3fbf 100644
--- a/package/python3-cffi/python3-cffi.mk
+++ b/package/python3-cffi/python3-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cffi/python-cffi.mk
-PYTHON3_CFFI_VERSION = 1.14.2
+PYTHON3_CFFI_VERSION = 1.14.6
 PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
-PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
 PYTHON3_CFFI_SETUP_TYPE = setuptools
 PYTHON3_CFFI_LICENSE = MIT
 PYTHON3_CFFI_LICENSE_FILES = LICENSE
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
