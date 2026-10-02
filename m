Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D9FCA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 14:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E82F60B56;
	Fri,  2 Oct 2026 14:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8C7VvorGao8S; Fri,  2 Oct 2026 14:00:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9FB1E60622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790949603;
	b=d8kDYlGz7hgdCI9xIrkT2cs0U0yRSpqWgzVQbhHQ+k9sf59romO3OThCU7b3phzQZNyJ
	 Fu0i9GkBm8SMlH2E4RuJOZA/3gTjwo4dR1r7TpPxHp2s46TMmHKWbFvfzUwV6YqiM1Hne
	 rxOOxgbkJaW6NkgRP3ojyGIbTaLVQBlxZUvAfoI6IM4hPkdopyECrjFzUvL7sspcx+e7r
	 OLBhhhrBHTeQm1jFFm5HQ2rdPJvHC6QpEu064ku1uDX63f7uDJxbO+aX0gZInUVHE7Wn9
	 5YEhtZFvVoetr0VIRwQ5fnEsbx2KX4H3mQpXJ3/yr5OaBV9a7g+ktL4P8vUlt1P2jUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790949603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FsahQKLrXTIeLDF2SSEGrQihEk3eQQz9x2WhAZht+IY=;
	b=HOpA5la+mcpHwrfUTK581lpD9P8jDFTCtt/3foVqGCtK0ulYYtrNrk00Mg9O2SpAX4Ye
	 o/wwWm9NvfCsxTs0aceztb/OI3xi32UeZsin3Fph4Y5QYpflPx+Trg/5nT87R2d5zQyg9
	 GivgYH9/BHT4wpwBh5BrpZJZ21J3Hm1EVOfeOXtuebToGEDm3UYtqm+6KbqZ7v7g4EoCL
	 9M/3lYEZDq51WyVfIQXoUxuF8DcTGVx9VPuU694IjWoIksd+0y6c2m3xBBAhm4POamTrP
	 KO/byXpv5ZaRbKsfr4sJDN8WQP0poGOhWw3WB5Tmois5JWO36NDra27tvb/tzVb6Jdg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790949603;
	bh=FsahQKLrXTIeLDF2SSEGrQihEk3eQQz9x2WhAZht+IY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sdQSjt9EREbIJc/rizj3aHQmKnqUDMIbfdsK/cYAVG/CFnwRlPqGjGhrnWfFgMuPX
	 PcqWkd/TvjPn/J4O+8geNub1AuDpky9XIw7ytbZy3b0Z7Zrq1OqhrnlKoG4NTE9hd7
	 JUH3bs0fdmLXNy3bfH5ofWGd2lqigUQ1uA05kJDMu0B6Fme5q7S8zBeSxOJECsc1rK
	 4dmJVUx0NXnbvzYjGZDL7gj8ZzZRCeyeTXsL50LROlaIcNeDUdyCNe/jLOom2r+Fzg
	 r6dpyfq79GzLcUV1N5s7htqiAFcOaU36QM5mCGozriKBpj0GC8tmjmyqnO90R8SaBT
	 bt97ciUeBn87Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB1E60622;
	Fri,  2 Oct 2026 14:00:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C62034D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 14:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 726D540565
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 14:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1GXR1BTii-J for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 14:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 44F65404F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790949601;
 b=IGc9izDgDsJXVRpLO0lQwavdJdWsgmeiHFofJ0EeGGwhUmmxeqby88A0E8cq/8949AER
 xAlKGlC8v9/LkMc3MCLVpOSqQoCsWY9CDSE4S1jsW3a4SUDrWM0umoAR4QeA5Xa745GgK
 +fSMqq5bYgwS6awVJsEVGtqqiX7Uv4T0df9RVmQ8fHivRU6YIl8wJq2r853LTALqNIR6S
 xjWzr33Dkh1DgrzTxxTmmH1q1y9n7H9tC+OX6vHIUIuLu/0guDEEoGEty+cvPSMtJkEwt
 0rpFoKCQPzVIRQC96j6j89ZBpoGUmoCyDMbQ5Ff+isvgYqzm6ga2dMjmRPQUSJuoUIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790949601;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=0QB7NLqCtTpwSjgndgIPUITCnXWGaKN+QQXzlD/6PUg=;
 b=HrVlwCsAL64RD3ByXUu3uaC+YQPZMhK4vjpOvuuFUqy07cLHRHemjWR/z9/xzsq4yVVR
 7IZctbnuGEuoUkAAKJsdfx5OGTSFca/rBtlGK3IO0lS72EkOIRvn0gcBjJjMNHKv5fCZ3
 iuFJ+mlGGAr+gs5mcm2OdAor9p8q7qqPcBnj567ge/XZbMlSaInkP0EmaXKXCQAeQDkKW
 LkKQOiAKVq4//+5u046YFFUuWUurj60q5hPSzkSuHUHDKIOuBNU2Bkkz2FfcByri830aL
 obN4bAc2bdHobmcOWt1mdbytz8fbA3e273QN4bE6JzLPmXjERgRIF28RSMyDLfjsegQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b="WfEJNs/n"; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44F65404F8
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 14:00:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wll-1wjelT3FiT-00qnmr; Fri, 02
 Oct 2026 15:59:58 +0200
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  2 Oct 2026 15:59:56 +0200
Message-ID: <20261002135956.354969-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:LCz9cZzgl/neSNnv8d45Y7bW40AKgE/M4xYOz+AU8XlDsHbNeJg
 HM2Li6U4ziBnM092iT+h4fDCx+ckc5rxQ0HnFly9rAst1/I8Rm3FFErW1Yf0BoCl2LzZxfK
 bHQQDiZNTBE9W7uHPNIdjb1VK1ABjVPJnMcp9TDa8dbd8R79yCgjvVOjnAKVxI361i1Tdaq
 E+4IGdfy700Ap2kU9BLbw==
UI-OutboundReport: notjunk:1;M01:P0:mg3G5bkJK1Q=;zeB/zWT9GYSlj0+L5HW4auKmuHa
 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
Subject: [Buildroot] [PATCH v1] package/gzip: bump version to 1.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 1.15 (for details see [1] and [2])

[1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/tree/NEWS?id=e6263160768c73f6117f3c1de78291a60f2cb796
[2] https://lists.gnu.org/r/bug-gzip/2026-09/msg00030.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gzip/gzip.hash | 4 ++--
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 90c9be4e6e..ddf5e38f0f 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.14.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.15.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6  gzip-1.14.tar.xz
+sha256  9aa0cc780dec156b8282844833b342ab7cb08c25d2cd9a1869cdd0df31deff48  gzip-1.15.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index e79de4c99e..1c74089147 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.14
+GZIP_VERSION = 1.15
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
