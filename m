Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E46CA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 09:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8651E4012D;
	Wed,  4 Sep 2024 09:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bijraJW0kLg5; Wed,  4 Sep 2024 09:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F80940164
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F80940164;
	Wed,  4 Sep 2024 09:47:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 865191BF577
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 09:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7335A4031F
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 09:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vVOSqGWeKlc for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 09:47:03 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Sep 2024 09:47:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09CA240182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09CA240182
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.75;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09CA240182
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 09:47:02 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1M2OAi-1slE1k3q9e-003rvu; Wed, 04 Sep 2024 11:41:55 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 11:38:11 +0200
Message-ID: <20240904094121.23486-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:39C8utQSadzxtFhSMK9GeAfhQt5nhMdzmx4GO5PSe589YAFsLlC
 eciDhziBJs4YBhq65T+GOC+0svxVqySpAzQ/iYj0twLZB/uGLOuUJqK2qmrJsg6PZO9gQyX
 +AyW8pjU/7lh4ay+eo1F/Pwot6Hsu/qqXpexjUxyyWxDn9oFR06sJZqLqEDOO2kkWcsTf3B
 fQVILeto6lfL+taopjGAg==
UI-OutboundReport: notjunk:1;M01:P0:mg7L9ETopKM=;FU+6+tIIXQ6SAmGEorNZCGvOSmE
 TrTIVBNhjlALInt5Vg/6jCokTovhAVUf4OkNjcztsJUku5Gws2UvvMY5yBlX2t/mB+Cpf2J+T
 DHvSwkklQa+ebB+XPG1z2fsShPFd9HAPlGyFIpDFCUoGjXrSWfs4EC9l177bkXf5lYICLZaCx
 DaIZgk5Z9BBH71hcp3m31lxFtsLFeAcW3q1E0nuLJJ2R+2/2S38aJUjgQmkCcVaHAjsSSCy9p
 uh7dD4++JIiaV2tfc58IaC4LQQod+D1Y+d7yDimOcKL/XozE4QnxwPxNieg1md1z8jD6UPTvR
 Chi9MUYcN89LLHFSQ5IK83ZvoT4NGw6w2TIOL/7Q47bQK6YIbdMobuWodTufcsuDMlRutB2su
 CYMbcw02VLy70EmdL49R1a5WxyjEqW7VEQF2KPagnPqjRo5b9KK0/mQUjsFiKPFcv1Gtm6Vmc
 NmNIBd1ZLpUamdQJsgOv/TaUBay2cNTfkfs5AVLtIOnIV0I4z+xY1binRnMIf+KeUedPGx8pQ
 ZlrV44SrLmn0cK2LclcBY58bXXqcqpBy5uHanKQnYVth/fzGhXm1k3G/hjGg7EJVrlcQ2BWD6
 iKWK5/A4F6my2RfXWJ81X9CSv8LkFOmZcVqHSG1hC0wUBYI7hIJ8isyZf15bgJIi0/iLzjZJA
 KL8WJGjfP5+3DJ3t7O62jY6RdiEYUPjC3gkSteqE75lRVxmUzJyR4Vsici6Kfg8Kn9jiKvfQm
 HcwrIrogJosnJ8PeksoM5C43dVFJj4Zzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH v2 1/2] DEVELOPERS: add bluez-alsa to myself
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
v2: add sob
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 570f4ff115..b56b2c8d68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2476,6 +2476,7 @@ F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
+F:	package/bluez-alsa/
 
 N:	Nicolas Serafini <nicolas.serafini@ik.me>
 F:	package/exiv2/
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
