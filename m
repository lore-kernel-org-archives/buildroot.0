Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BB1C27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 08:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41F2160017;
	Wed, 26 Jun 2024 08:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gt-lBfpui2J; Wed, 26 Jun 2024 08:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46AD2600B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46AD2600B9;
	Wed, 26 Jun 2024 08:54:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84A2E1BF41B
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 723AD80897
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vO3bhgFgtBKS for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 08:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5B9580890
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B9580890
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5B9580890
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 08:53:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1sUkFP31az-012Nv2; Wed, 26
 Jun 2024 10:53:54 +0200
To: buildroot@busybox.net
Date: Wed, 26 Jun 2024 10:53:54 +0200
Message-ID: <20240626085354.21576-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:G5NhM8D4v3jfQPC7HShbye4vijxpup3+LqkuK8K489For75qd8f
 lfjCRfups8IaV192odfim3OomaT/STisKQICsBnQtQR+JFostdj33mtXmZm3jGJm3FK9xId
 zddAWmYVUoVk5KshTccenHWiXZ0qu2j846yCjK6fBfSRgNMpQHBR9ziKbyGOg9op9hYCqdU
 BM82qfLt0hgxX6IZ+m1MQ==
UI-OutboundReport: notjunk:1;M01:P0:IhyWyomT+ss=;a/3QUOJdFR3rLYYE/acWb3SszDi
 0mH/3iRmbmelEBj23yvMVy1tnxGplD2wZNM/b6vBWdOGZONAWWhUWL7vnsWARmpQ5uSi626hQ
 n+7CiHg7tV1380ZrHbbusOU6MXc6ENp/ETVPTiJgBZ4F7z3+wPazp/68ypRtIZsn8QelrmO+j
 xKUiFrYMrxAOu2ODxvWoZj7RalDp7q8T0lWKzTI7vBYwxMU/5WAaUkr3aJc+VoTrhyAA9FkGX
 YluENSB6cDqgvEgz8E2CCuJlFMdh94xLtkUrPBi41RAQijtVVR4p68C+UmLY900GIaNwRIpyW
 8Gt5Q19/4h1ljp8zBpGR7m+TfdwPruVv7Px3KFd1e4Vl/gjuPr1FHAarvS6uelm5HfJ969imH
 +iBybZ4FvD6d83mxe8d4QnaNRvpmerBRomx/U30T0BdkxJN+EPE/fB3Oqqog2wCNpzUJ9/cxd
 BUtjwRfqqS89TSK6XKD0Bsu1UTOkYvX1y7p1h7A2Q8Z5EwfIF+iHlb9zX/JvbjqoVP9f6Tsbw
 OHgvxaQsfKR6n1TlWhWIDn9KF0RMQ2TiMt8ShTsEuXRO3xI3Jlyd37kAtg4TkGb/wM464ThqQ
 LF28kyv/Qua0FYV0clLh1opjeI/cHVzB4JCuUFD4xF/mwBvbvRyWYEDjllY11MWqOZnL9DODK
 Cm1s5+C5blhSevU5+AApxrTuPMblSthyHANgq0ShPUA7Dk6YRFnZF7NxuA3nOo+AeQ1FSMQyz
 N5QXgkHAng8w66onl5Vk4FV/9XTZhrPmuod7c2xjpPYb0FQt2x1Pf9azacKwLY2urCc+WurwT
 onPXBFlN+D6upVoBtdvuCqyW0+3+BFjs6WYuMu1MBMafQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719392034; x=1719996834; i=ps.report@gmx.net;
 bh=otVW46Q1njGmzF1HahdxiMHPEIIKakmQmp2oVDX4Lnk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BUlwQ7IBBKBNkgQXqflkiDh8t5jp/3+sDQmrYnEsOZP30g8p5gMEfFiHKuIQTNRD
 hle/7GacOkw/IgDAX9/3Hudciha5ONn5bPtECSWOr1wDJwF5//xRGEjNTEiLtFWt7
 pZsaGd1K49eH682yH2OtpcB8AupsxMtI7e1RxpPXZq7NdVZCGK9tQPgp/4a5vM16T
 oNZutYEatxfpJhdQrLn5DpW4McMAC3I0ag9Vt6G8CPh+YirYSdTom84224OSUvCIz
 eyQPXQdQVVhELE8YPcOiS+eBjj6Mky0l4hJsouDPms2JCS20kfd1L/Ss6eVBKbwhw
 doJTli3ytj+w8cc0Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=BUlwQ7IB
Subject: [Buildroot] [PATCH v1] package/wget: bump version to 1.24.5
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2024-03/msg00002.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wget/wget.hash | 8 ++++----
 package/wget/wget.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 75c3a913dc..04be124141 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,8 +1,8 @@
-# From https://lists.gnu.org/archive/html/bug-wget/2023-05/msg00004.html
-sha1  42384273c1937458c9db3766a5509afa636a2f00  wget-1.21.4.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2024-03/msg00002.html
+sha1  01659f427c2e90c7c943805db69ea00f5da79b07  wget-1.24.5.tar.lz
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  3683619a5f50edcbccb1720a79006fa37bf9b9a255a8c5b48048bc3c7a874bd9  wget-1.21.4.tar.lz
+sha256  57a107151e4ef94fdf94affecfac598963f372f13293ed9c74032105390b36ee  wget-1.24.5.tar.lz
 # Locally calculated
 sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d2d3087961..d2a3a38e50 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.4
+WGET_VERSION = 1.24.5
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
