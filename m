Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD0CC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 16:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AF5C40448;
	Sun, 12 Feb 2023 16:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF5C40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXcP707BfDft; Sun, 12 Feb 2023 16:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 431614046A;
	Sun, 12 Feb 2023 16:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 431614046A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2E61BF357
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 16:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744D34033D
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 16:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744D34033D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE8hcmCgAz7j for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 16:33:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C88C402CE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C88C402CE
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 16:33:39 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.101.78])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AA32F780333;
 Sun, 12 Feb 2023 17:33:34 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 17:33:21 +0100
Message-Id: <20230212163322.480467-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676219616;
 bh=2EzhhFugdG0blP8Ier8bYrQ+ZtOcuLJePICZ0rCfZQU=;
 h=From:To:Cc:Subject:Date:From;
 b=MIcbcYpM4VyPDeMszjvEy8gnaqOVteu6okL2pv7xKV6hGuPB7q0dA/BThJugdRePd
 WDlYLboEIOMG5vdRTV1BPuCEaKA1KX0usAfvA8s7ctaTbhjFeLZLdfjj1Y6LRE0CFs
 yei6LIwbf/ujTFjz/aj1fvi9qQZfT+fyG+C/xfrJg5QjZxIDBahlp3dwO57GbqKBnr
 spr6E6tm2/+md+RYk2T1pvRCJavIpTOXu1ejMIIIwSbaXW3c5cZoZoFqpXBWxAV7Cp
 ZWQP0g+r56AhOG8O9PGV+AstC2CVPMw+UF57NP7ChZlXJ5MgJLqWxcR58H8XB0fbF7
 7nA5dNgYDZmOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MIcbcYpM
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: reorder entries for Julien
 Olivain
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Entries for "gnupg2" and "test_python_hkdf.py" were not at the right
position.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ae698f87c5..ece0d986ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1685,8 +1685,8 @@ F:	configs/spike_riscv64_defconfig
 F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
-F:	package/gnupg2/
 F:	package/glslsandbox-player/
+F:	package/gnupg2/
 F:	package/octave/
 F:	package/ola/
 F:	package/perftest/
@@ -1716,8 +1716,8 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
-F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
+F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
