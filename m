Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED704606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HMITiZ2S
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D9D40791;
	Sat, 14 Nov 2026 21:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwI5b-bD4-P7; Sat, 14 Nov 2026 21:22:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 98220407CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794691357;
	b=K6bEGFONlYc2ME/HymDf5GT1XzzuCiV0ylLvYH1MJKIriO2BsM15eOcXWW/LneKIfUzz
	 j+hnmcGZSexyUhEzrW3XfTFVbd2uSsnIwPyv1Zk29S61bNOlgMGOc/Ccx3HiQgHN+64g+
	 NLoZz3YbSDZ8fANBz8tVJxtOxd9Slhr1sNdx3ZZUH0gvsb380H6oRg2Esy1Yj1ludM7Bj
	 SjeMnxDPkL0c+5GMIWBMbFxDJ+o3XiMefyfYExLo3vSgvhMNKEWoUnl7dGhnJzm8BpEkI
	 Wi0v4maNeE8Kw7LK97wRyTE/jWuP/rlwclV1P6ldUEx7cSXpOa4UEx1q8g8BmZ0YSEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794691357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1tEyPUg3C0VrHxU1STXtCBaC3o2QXA3Kxr8oTvJpLp0=;
	b=atvLVqg1fmbVI/anLnBQG7/8JtJIdaneJILcDwXXa2kvCiz2Y8CUAxiqppPYmCB4vY6k
	 T/CL6BA/UoBGcp6/JBJoUlXWs7RwaQke5LpHe8trueL3Z0yRHuYsapQct+6Qx16kLP0wz
	 xMSzz9ujXJh+i6254ViYaKqkwag30DhQEITlfLsAJXbVIml1yYQ35IKPAmO1jdJtwyW45
	 xMf4DG4cOqdnZ2aMWePZlMI8UjaI3ji5sgXU0S1bbHWnO9Dhi51iYDj9bWJK82qXJM3Mx
	 UIA/27o+cS8XiTd1Txy7JjCq/BckoGaxBol+kUpdc7k3iC7CDllq30z3GkhpDK3o5Xg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794691357;
	bh=1tEyPUg3C0VrHxU1STXtCBaC3o2QXA3Kxr8oTvJpLp0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HMITiZ2SoUs4p+ISG0PLwRrAJJY3yluzjTSuMxmKvTiJVQZH1gPPTO2A9T0YEJ8I1
	 pyBLGeEheghKKnnTxQBQU04+EpVTnhFHqTX4OpRB//+KMAoE0NXCeLTAr6XEesfOOt
	 R2YCxXPi2HY5BjprRvr2Yg4NzzsUmSB1viQVgLE50EUAAEaav57AMrAslq0j1cH7JT
	 TIctbKAS9b22dN2DXxAm99ftIZGkxrPN2+mTgmsAp5+shbXZlW73/IzZJRcqC3KYjz
	 /B98hwtA03drU2h5997wLL5isr9PAn3/cxQtfhw6yW0Quo4ZprnokXGfP50tS0p+5E
	 PhkrsH61uZqzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98220407CD;
	Sat, 14 Nov 2026 21:22:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 757E91A6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F173810D3
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N130ijvOg-Ja for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 21:22:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DC1388109C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1388109C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:22:33 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 20E5F5FFAA;
 Sat, 14 Nov 2026 22:22:31 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 14 Nov 2026 22:22:24 +0100
Message-ID: <20261114212225.1098201-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: test_iso9660: fix test by
 selecting BR2_i386=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. The test configurations which were relying on the
default i386 architecture are now failing.

This commit fixes the issue by adding BR2_i386=y to the test
configuration.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158106
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158107
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158108
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158109
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158110
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158111

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/fs/test_iso9660.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index b2edcac460..330a39c202 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -4,6 +4,7 @@ import infra.basetest
 
 BASIC_CONFIG = \
     """
+    BR2_i386=y
     BR2_x86_core2=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
