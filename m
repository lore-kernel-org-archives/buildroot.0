Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C90C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F54860875;
	Thu,  6 Jun 2024 08:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VP56VzawFPNo; Thu,  6 Jun 2024 08:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D3546106C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3546106C;
	Thu,  6 Jun 2024 08:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 459A91BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3081583143
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoU6f0yBfxte for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE45E821C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE45E821C2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE45E821C2
 for <buildroot@busybox.net>; Thu,  6 Jun 2024 08:40:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.127]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1rrOdn2JsQ-00TtNj
 for <buildroot@busybox.net>; Thu, 06 Jun 2024 10:35:45 +0200
To: buildroot@busybox.net
Date: Thu,  6 Jun 2024 10:35:45 +0200
Message-ID: <20240606083545.11646-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Wj8LtFNMONpREUm6utUP07LaqUGjYTPkPrykh8s+qUyx1BY3OfC
 Vdq9HuwTJOXqU+FBn0MtNvjTXF/qeR3CqKOdMieLjb2cJGt4ss8DFmF6159CQOuQsqaHfIj
 azoMuPyNGGu210/X5MQtDgGl9Ig+73QRBr9CnsmzUM8X8YxKe/wL0jHpWK2ni331a0Kpg47
 Lhaze/a3miL81YEn00K0Q==
UI-OutboundReport: notjunk:1;M01:P0:bBzP+WBTaTU=;4SYXijF0Yo6Q1FtKksPdG7YYlKz
 dt3Vqx7RmpZUTOwMN1BC2RlufKUsa9b5nbjNWfyDHF8gmpSNTuYQcBgjzzF5pE3Wzp4nMnitz
 GzQ1PViA+TP9aYGF2+6IjSTqC2pyBiDXMlj8N3OXJ7XqKTScS8Y/b2tuwfkTufSSi20Rd5k0w
 fuRmw+d1zuzcVLIWmldc0pXdWJ2I7jOXxVxgT+oqPsMKKgv4MnM9majtj1gp3ORu1MJnbRt+8
 kF3OTK4DvqEHuo2yxv9k0/pq3DLzRnTDQKwjdk2XVYG9OZTuSLlOxlg6LLTcIytzN25LE572x
 C1TcfwQFvPqiOqd4b6yN92AkCx139ZE2rpekwoKQIHU4pve7EXA/t7BeGj+IzTBIXweYCOo51
 vGCemkHBD2gbalIvXa8ro6SLVuFZXaNuOct93pQkmA4vUz1QyRo9A9bwTIPzf7Yo2MtDA1Pbp
 3HWIGP+qLiC4ghJkSazp67k//D6vfhyOOHwkz8r2a9/PRAt7XQ0qHSfOcGui4++Te8p+F8AJu
 2+Yo8YQJu3C2R4/XwCZuoMKVv7sry13y50I7ox7dBOHQkPq1efkFIPUI2xiMh8jDvaFJJ1wJ6
 vhV3qtttrVDo6Ezc//OVnbm88aS+0CLCKyH321E1C0kCArm0D1Ya3wknJNkYVAxHg6JtZPi0a
 ScXw3Oe42kGCQAOnF2VYHIm110jjPnCfakmJYJqwMxElph+nQZOx9QxLveLQNMmsU3AvNiOqT
 bimOkbOhcy6Tud4VXswnNBsqiry9B7GYRzn5NsG3E/Nq60YpfqdpLqD+Q7zBT4vuiDDkgZFGN
 x26vdB8UPiUqw1GF2Az0GyzX9UgLpyqZ01MiZtpM7DxFw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717663245; x=1718268045; i=ps.report@gmx.net;
 bh=czqM279DeuPFllWUqT1EeLmzQEKrLYXLKIGYd2c3OgA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=mPsRFyjPXMXpXAg1F/2r7OOsrRGJsPT2va/tFkLyABSy+BXhDuALtScXi8WFhOq4
 89Y/4nWidaN0MbJP2JTgllxqo6hzbPgEFpsZxwtaCvgo+QVkDvZLgkKDJbZgLsOdW
 0+UUwqQzLmxP16vWqCSzJP6k6UgPidb/t+NH7t3HpiuCKpujg1ccVMret0Uod/3Ep
 v4mNhwwD45YzzSDdB7yfRZaAfuk/X6WDqiTKRkOVbRhTf6cF8otXcXB9SqBhnm/CX
 gx2XznQHHr5SV4sZ8AKLLZEn+rRxgCGuL90xs6aYqorNmCRggDdxq59lGiYPVSdmb
 fa3cFdAeq+jGam+u+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=mPsRFyjP
Subject: [Buildroot] [PATCH for 2024.02.x v1] package/libopenssl: security
 bump to version 3.2.2
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-4741 (for details see [1]).

[1] https://www.openssl.org/news/secadv/20240528.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 841d4b4cfd..0909784e90 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.2.1.tar.gz.sha256
-sha256  83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39  openssl-3.2.1.tar.gz
+# From https://www.openssl.org/source/openssl-3.2.2.tar.gz.sha256
+sha256  197149c18d9e9f292c43f0400acaba12e5f52cacfe050f3d199277ea738ec2e7  openssl-3.2.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index feb5026c02..3043aa1c26 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.2.1
+LIBOPENSSL_VERSION = 3.2.2
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
