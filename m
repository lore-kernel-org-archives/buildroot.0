Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E26C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 10:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C147D40477;
	Fri, 14 Jan 2022 10:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiM1lE_R0hvn; Fri, 14 Jan 2022 10:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D527D4026E;
	Fri, 14 Jan 2022 10:55:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C35CE1BF37A
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B171E60AD0
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmtyN7CE4Qyh for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 10:55:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CFF860A9D
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 10:55:17 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8KEinfkKIBBmw8KEjn4i6h; Fri, 14 Jan 2022 11:55:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642157715; bh=d7MhPYtD67qAEnPzRFGvdxHGG/lojlnaKKy+uPZ1vzw=;
 h=From:To:Subject:Date:MIME-Version;
 b=j0C3QGCqfO49CHJNhiaRwTTlOClQmid8uvnjpkMy5nN/dc9Xm9EcBvAGr4NMl4Zge
 JkYl2Fq79LumHeuWFfWUZ9AcatAaQrkDgvwSH4fKWB+/yI2yllRIBW7iqsIIjFAwLM
 MlQqi4Rn/OXG9yMlVQoRRL4y4NERvBvpHG2NnDKrQ/qTDJaeoxZC6FuXAFzlAfoGl+
 GiOaxHuCH18VDQmikgwKN3GDZjtuF0nVQHHigA0+zsYEkWuJXpVL9ZlrdvZsrA7f+I
 ySY8JJRyOrT35576vVEQvr0caZFV+hID9ncOq+W+Jmq41Imp6UPONALuVy1ARgrYfT
 BaFiNNo6KIf2w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 11:55:10 +0100
Message-Id: <20220114105511.1010113-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHHn4aS64XrRnlZUxMKFrFIj5OoiiHoOP2Rk4xCuWiIZqTGKKKPMXfNgaO6tpccXV9n7iNXPs8qpQ1sqhqRUO0Oi0O19MCZOjgNzlitwhO6PqGdJP2c8
 3G6Ig8Gm+aZNoshX2gUWu3eftSEPPWPz4nWSXTSYMaFv2NSH0GpDalvZ8W7HIHGTsD+s3cT81I7+367L+OlmDe94nULkDPUwm2BPTYXdVx9ZSpC9ApgEQow1
 uH1SQOR17mNj9RswcZXAjQvqNSsaa+x9QdB8LqvLKGVd5IDhG9VhwaoQWoSDrqs/t5K6qShgFCXpgteornhtfI0hjRFYHcdJUqE00QTz//GnB2lbZV40eiAV
 2IUGUW8XYfSIoNbf6TWxSRpYH23C8SeZD6oFFrK8BFrXpOpCbWfOonKgbNteanhjXyANdwacUcl7mHLHcpOl7eENelvbiA==
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104028
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sg3_utils package fails to build for the M68K architecture with optimization
enabled with gcc = 10.3.0 and it's still present in gcc = 11.1.0:
http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index adc93ab725..ccdf62503d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -220,6 +220,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
+# ICE: on M68K: Error: value -16034 out of range
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
+	bool
+	default y if BR2_m68k
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
