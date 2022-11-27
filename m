Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9977EC43217
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 08:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED09B4058F;
	Sun, 27 Nov 2022 08:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED09B4058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRXaC-AfSe7B; Sun, 27 Nov 2022 08:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F37740123;
	Sun, 27 Nov 2022 08:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F37740123
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F12531BF470
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 08:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D335C40123
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 08:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D335C40123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKfuQkzoFmtw for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 08:12:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C9BD400D2
Received: from aven.230ruedubac.fr (aven.230ruedubac.fr [163.172.52.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C9BD400D2
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 08:12:43 +0000 (UTC)
Received: from aven.230ruedubac.fr (localhost [127.0.0.1])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTP id B45F05652A0
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 08:12:37 +0000 (UTC)
Received: from knet.local (knet.230ruedubac.fr [45.83.230.42])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTPS id A942B56528E
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 08:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by knet.local (Postfix) with ESMTP id 70F1C11E9E
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 09:12:37 +0100 (CET)
Received: from knet.local ([127.0.0.1])
 by localhost (knet.local [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbWPaZg_ytIa for <buildroot@buildroot.org>;
 Sun, 27 Nov 2022 09:12:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by knet.local (Postfix) with ESMTP id CF1F111E96
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 09:12:35 +0100 (CET)
Received: from nb043690.wifi.internal (nb043690.eth.internal [192.168.200.169])
 by knet.local (Postfix) with ESMTPSA id 9D49D11E9E;
 Sun, 27 Nov 2022 09:12:35 +0100 (CET)
From: David Barbion <davidb@230ruedubac.fr>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 09:12:32 +0100
Message-Id: <20221127081232.2160208-1-davidb@230ruedubac.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=230ruedubac.fr; s=mail; t=1669536759;
 bh=aKKdrARtWYu/8BC1ab0WfWFrN9JzG2zaqkJ+rbOIOkk=;
 h=From:To:Cc:Subject:Date:From;
 b=PBs1bLzwvKmThsNiTIC/AYY234d/bDaMnbggysyyUHJqqDRiNRqLugq7z+mnoxawL
 bZEN5Y7ay8XPrMjsil/dEdIpxyjRFrEyGhvYK9hleplPMpeBvGQqlLpwijsoK8PMYM
 PT1k0xJIOvAtHPzCrGzPcEzhNG4bAGpq+0AYd5Vs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=230ruedubac.fr header.i=@230ruedubac.fr
 header.a=rsa-sha256 header.s=mail header.b=PBs1bLzw
X-Mailman-Original-Authentication-Results: aven.230ruedubac.fr;
 dmarc=fail (p=none dis=none)
 header.from=230ruedubac.fr
Subject: [Buildroot] [PATCH 1/1] package/x265: fix armv6 cross compilation
 issue
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
 David Barbion <davidb@230ruedubac.fr>, Thijs Vermeir <thijsvermeir@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When running a program that depends on x265, it crashes with the
message: illegal instruction

The package x265 was forcibly compiled with the gcc flag -mfpu=neon even
if the target CPU does not support the neon instruction set.
This fix adds the cmake flag CROSS_COMPILE_ARM to correctly set gcc flags
when compiling for ARMv6 architecture.

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
---
 package/x265/x265.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 51c39df4cd..ada7f1e4eb 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -35,4 +35,8 @@ else
 X265_CONF_OPTS += -DENABLE_CLI=OFF
 endif
 
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
+X265_CONF_OPTS += -DCROSS_COMPILE_ARM=1
+endif
+
 $(eval $(cmake-package))
-- 
2.38.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
