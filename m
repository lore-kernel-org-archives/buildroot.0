Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77434C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5E961251
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE5E961251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF50A4089A;
	Tue,  5 Oct 2021 20:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcwf-iefWPcP; Tue,  5 Oct 2021 20:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE12406E7;
	Tue,  5 Oct 2021 20:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72B9A1BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61F7160D54
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MaeUahiilj6 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 20:22:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28D7960D53
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 20:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633465353;
 bh=eaAx9miE7v+9i3ctMwy1OG3WWydDtOcC1v4Yzsujpvw=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=CRaBpNw9ae/7F6peooWnjekJ6JfSmRlclw3HS4iHOtmE9yOugkOGyp6cq4GvrHkZD
 yZKtzJgGy28BLtXn7QpAT5stZUcxS0cO4AYDHrIrnSvUui6Hui7rB53nSlfWbQCekb
 UYcObKieGg/39Vt3W2+HqrAPmMlyG2vsAAU1OpmQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N5VDE-1ms5qM3c66-016zTT for <buildroot@buildroot.org>; Tue, 05 Oct 2021
 22:22:32 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 22:22:32 +0200
Message-Id: <20211005202232.32172-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:vNVuUKzSTswYfvRgnmEnK+Z48CXtNeCO+H0rmvH9xfCtAXh0nCU
 a6853PZTrCNqO0gjGyjX2NiCJ86wbU6xAvXryof5R+wHafux9kd0DC3tqcUTbMB0cm9oMbC
 tzPGWAXJBEWVTao5FBIGXqZ3RKeJkav4SDif9ph1o02VSV2m7prsDhd02ojqn/8roQMNpp7
 I02d9UD3t5CSPH7WN0s8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xl0Ewy45NN0=:4a/GvZGfQ93QkiRGXc6mqY
 FYYehaZLdA3hv0+SOm6Ouglxj0sybEOqgjiNtcaqYHiY2bramHMnBV92VX9GTkEYM8AzX/c5B
 otfctB+ShBoSoVn0uOemDlwMBdIyilXYShg2cDHLucnU7+8MccQsl7STFcKNn9OhI4xeao+Xw
 pagIY6mkN+tpYxfSSucaRcsDW98IJG+Z8K+wxz2ftaVV6QEklV2VAsBoHSsSBglKGrk1HDic/
 S4BXJTNaVF/WR1kI7cKJwX6lKJWhWNnFSqY0Q2c59szfH3DNflWRAapwtQhbxTjUhB7Y8J5fS
 za901RS0KOclT7PKBW6j03y56D9Ddu8bAobdGCgXeaIo9KAt/GZb0cPlralY2MHUld3Hd4Js6
 8cAe+wgj1rlZrzTXXtTh/0n8vGS8WMIik8ep6B5fnN8yuNkhhoXkW8nx+YpS4eq/vK5JuRjAc
 /D0a2oXC0by1AojuedQ/aqHjGpJpNNIvmAD5d1T7JiQqaE49GrJDYWE9Zj7kc/S8XwLgPyQqM
 wJdvoyUiCMMDMPl/e5R3eL3YvB4cJI/0q23jjefsDKjB2rRFBuCERHVoMC6uP8TUTr0ArlOwh
 kbzFttWo5Zzh8u18lx69J7IMBLxm5LFfbG8tiR364I3DH/AEjikR25WdxcaBKUrqmzVxNuNC8
 FYvuJYBkrdgPuLQxK+gypVnFBA5GQw6SrTiYJ3byJlfvx1B8lnPduaYbepQdFA6AzahaLNcrd
 XikAX+FrfFBELyEXERgoX9skGera3RYVhGykFwzdB3gTjySFqMMWmLs2/cb3XW+s4NYnS1tRj
 lywCIAG7IsnBAKg4CM3zpRSZ2OHbwTV6QB3Fo+jzYTO/gbwkqTuF4krPUTr4sMDPixE71WPEn
 XGiIX1h9zCGk5HGikkR+G/bpZM4fioOingGbKK23EI64SgOG+eHAcLh3EczAe+EENH9o9aiO9
 ArC9nkB9Akq7nL0ffNmlL3mrZys9uxQXakJQPAwoXMcMOT/li0F4Gk4zZ5WMPniGdzt657895
 XGeKbDaPmJrLNLT41GjLixHOo6RW21F0sbRagRfZwUrMDJSGeJr3iAQmPnmScPOEjWrIEjVne
 JFQv6f3VLIeUtI=
Subject: [Buildroot] [PATCH v1] package/log4cplus: bump version to 2.0.7
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

For details see [1].

[1] https://github.com/log4cplus/log4cplus/releases/tag/REL_2_0_7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/log4cplus/log4cplus.hash | 2 +-
 package/log4cplus/log4cplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index 28e5b204c7..a668eca37a 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  73519a5e47c40cf375aa6cd28a703b01908b5dcd3f4cb4290db2fef237c8180c  log4cplus-2.0.6.tar.xz
+sha256  8f74a0a5920ba044b24e2ebeb0f1e5e36d85d5c23ed48d9fe328882b16130db8  log4cplus-2.0.7.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 8b62fb8f92..56a85025cb 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.6
+LOG4CPLUS_VERSION = 2.0.7
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
