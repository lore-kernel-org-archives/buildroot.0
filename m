Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EABC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E194483143;
	Mon, 10 Jan 2022 22:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NpeQiyq97D9; Mon, 10 Jan 2022 22:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD0FC831F2;
	Mon, 10 Jan 2022 22:05:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79FDE1BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 594CC60E55
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nz-7oTJwhGx for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:05:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64B1960D6B
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641852316;
 bh=F1JgtkPZhMH0hvJs0tMshQ1cIRDnHCwH9xuBi8VgSYU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=MB15+dQPQf1a5Zzdy+UkhPO5AT5nYLnUcQ+ZRe4EacKF5UUD+JrR87gmyINb43c45
 NYMTWlomAGKZk9w5FECmOJaIIfirX/HS3ICwxuZHphFBORBBA7WV7x0yorr6mtuTz+
 +hd+IKVre1UteqqjE1WidHP/gparG/WGXHYmkxoM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.151]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MJVDM-1mnJ0m2Hfc-00JoxI for <buildroot@buildroot.org>; Mon, 10 Jan 2022
 23:05:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 23:05:15 +0100
Message-Id: <20220110220515.10921-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:DAgTzPDsTmW8YM+9MKfxiPWtYKUT0fkuj0tg5R1sAV+1ikQKmE2
 NWhr1TRybno/vUk1HaeEsxSUUBl6jg/KXW874p0wGagzYEdKNN2QJOQL3Slv9l5Vaoq90ch
 6wZBedAls8hot/L7VH4+pbDQQFrftq8uERFHizexUobkXZva4djjIhkLwsLT2KdsxG6eUsj
 2Mo/d+FrSCDxr66pOkjSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lXvTBSGguEE=:P5oM8utSXLxQVb7C18BU6q
 dUBdBviSY5c1UEuzLKWxFhN6eebh9P8K1Tdreeht63DW7dHahosZaH0PpJqFQ9bZrg8YuoiP3
 h/MvMBRTUVRRXV+jAw3gSpO9Ab+I8/qZAwAQepCM8qtkCkXs2SUvaHHuVDgaGTimEhDavU3Wt
 CJezyXeziQM/an8NC88HWFKW1iPeu8Pj8yB0HK7GRI6BPgcX4zTd5QHX8VY2YVbCGwRhmS0T6
 GUvMUfGiifxP4I8XJCHgehuBhDp9Aj4D5trMwdiGhi8zVcdBzF5l5gaKLQd2pQY5PaxtTbUV7
 Cgp3iMuXunGzUnJQOZUrujFJecmYweUc/YaDY9U9Fo+VpApTAl5ZvK9rwFEiZqXMuZFEgL5UC
 G0/MYnwIiq/FGuCiRV0Uq0Q2iv0FXYTBmQFZR1mZ+wuojt3679aFWjPM4o+KAOfqYWeoTzxoT
 HVp1SJQlAEaA8meQN7XbgmKNWdYENBCcBoNxU03RqPJRP8y6ryBdj2TpRNHpN7yq2/9zXc36w
 ax+RPZVKMZNeOQA/f1LxkPkd+av+Qmgd+73vM351SUNTIzXNVAB10u1M8aSIjEGdrwHxF7ri5
 KXa+MEAqxDIPzGgTkYXU0z88oGI3CTdkpm9kzhFgppfxY/lOALgdISfetnRhgTrF0d87g7qe+
 QBTTsdn+h0dd8jO7APOqcVsEry4DimBNne7Z4leVk7ZAWEmVdfxMKG8+B7YMB/GnVUje/VbpU
 RAtgmbe+rj13VBjWhSjm+zrmQ9oYzZFJFgYGVblKlRNfTt+LZ2XFgnH8tT3ENjz7FwSo2UQZV
 hPTbQ5yJiwJNjXEykhwVcMQ7zppgEQhIKUvvXsEBvzZBdhX2mX+IN9Ku6lubHIUuDIoA0zRtW
 kO8TcnqY9/kJg92ewI4F3yjKZr8kSzwS8u4JwOGcljCpQ4yJblN2d+ZakDOvS1rM2ql6tCy3+
 hXhaJr5RxNU0ZU1cAzz+EeJ83bi8xRVQoxbAd8XYODZ5dYSzCD1JJ5PKU/AVJwjDub7wRUH0t
 nCQXnr1k9dyxqBNG3rlp1h6/n29bS/uf3xPogVaUd7mSmKz83ccwLtG+GygtwK/OQfPxEAXSz
 DAPp/GzBMVrlzQ=
Subject: [Buildroot] [PATCH v1] package/assimp: bump version to 5.1.6
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

[1] https://github.com/assimp/assimp/releases/tag/v5.1.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/assimp/assimp.hash | 2 +-
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 8f6d613bb4..50f0b3e6d6 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d62b58ed3b35c20f89570863a5415df97cb1b301b444d39687140fc883717ced  assimp-5.1.5.tar.gz
+sha256  52ad3a3776ce320c8add531dbcb2d3b93f2e1f10fcff5ac30178b09ba934d084  assimp-5.1.6.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index b5f84ef56f..766b2c9b5a 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.5
+ASSIMP_VERSION = 5.1.6
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
