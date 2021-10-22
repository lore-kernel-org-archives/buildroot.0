Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74591C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 22:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44A360F93
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 22:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E44A360F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A7340284;
	Fri, 22 Oct 2021 22:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKCsHi-Tymhi; Fri, 22 Oct 2021 22:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDB0B4028F;
	Fri, 22 Oct 2021 22:20:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 989201BF3BF
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 22:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 958306064B
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 22:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8Mcs5lF6kHb for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 22:20:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 593DF60608
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 22:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634941234;
 bh=wmm1mNErBI7jvwaGLNIkoYVve3Y6EoMNgW9nOrJ3/x4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fXRCR9jb2touJHXUKc7A6HSD9MNB32j5HT0uxcCUxu+yDdNOuy/RI46JI3SrHFHSl
 pbOOsIfv8C6vZTUz7p2cVWrLfiJf5tLocvbU8eA7nyPTz7RcNLQ+gCZHAxZqG+bQmT
 r50htZ2vpatRAjKKJmrmYMPOd6wX5rTK6d9cMHig=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.153]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mf0BG-1nAblI2uaI-00gUp0; Sat, 23 Oct 2021 00:20:34 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 00:20:33 +0200
Message-Id: <20211022222033.8862-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022222033.8862-1-ps.report@gmx.net>
References: <20211022222033.8862-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tY5YVfk6NnKRjlKnk+233UrtrHSG/Lkae+21uQS0Fb/e3jjfzso
 T4OK59r/XLW12bRVn6V4c29i1Vi5pyvI0bXAh6iLJo8vaZKHhxsrZvpusLM7QbhFKr2sLI8
 wVUyVVLO5nv8uwZZ1qdoG6BuDYqRMN2/H15MhGZkt60LJKs7VfZyhw/7Sf0nlzvB6KJUI4h
 V215vSqkibCHWJNe3u4Pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:efXPkPqDGCI=:j2zasZNnXFhuzWManaKVz1
 mM2uyZ9Qg8Rx/ir4qjVcHYa5UMcHW2sEqLh9KYRe6fmt1/CCBBf1FEiZnRn2uJiLSZ+oN8RPX
 7deaInKsSXfUMPbX0wn7tS1invd0rBLlRe/JWjmSPSTAVm4h6JiBgfStESijz2M+R7vXxpi3O
 gjxzpkGwY2WdhaXLUVFFtO+HViknjqGyqa8RSQDYlkF70RMfsgLIo6uidGBZ6lrocxhnfHNt4
 DWg2mwEFwlVQavZFXQ78GSh8wkzwDRBMgRmSCvyv10tatAQ/f95JQ7HZgN3UwatJm7upVDQpl
 glzkAo/GveyKOs9I2A6JvNqjnIfnHTmdMsb9EsvenmI++R67QULRiOAYpFQOCv9GwdgnqYOkv
 JGq/4dQquy4oFSVSjmxDuT6yqxKwYaRa2xTpwStnYxoCjFUdReM7hzVY4ax4UcVra3Wbvyr2L
 D6GD9Hp2mjd5OxCIt0Sz7pog4xUReNphyG6wknzAK9H8Xdvqv2mR6UMp1wnMvv25UPEEsv4aT
 O3J8TTKXauRijuFiI6wb0iaixB+J3wANRURfq5/zfsTTkXzZUasr+MJoFNwV/kogTMyhVzXr+
 bPgj8RIQLj3M45PurEPFLvD/sC+/7ezddmf4wWJoEw5n0c1Qe6HWNS01LFfPEdigG5+I5BlL+
 aEstZdo+Jhvq/Mii4IjeLayIQf6ntyMnyCGuLwxRkVWIb2Be2C85zCOrgXcOXZdtJxnjUvoXN
 Yhoajme7U8K5sas4RHnPwCn/YKGkjEbqKuya5kaPlALd7S7+2bWxANoD+Sc2cMsUW5AgxK/pr
 Gcc/hn1hd6HuvE44Eiz9XOEDMjTbwlkeOvAHLiRhth1TafHhQlNrhZgu05Sn3qVxJv0GutWX3
 ppDStrY7PJQOXF4q+fZD8uDBohzTapFSANdYVjY0QyOTkWkTtHLWC55RbpRky7J2LmDRlG218
 U1Eudpuk58mQfAqdsvenyANae8EmzgU2cs3vaw0hYbiH3ul23RkOydFfcF9+RLJxAZRkPfSGo
 Zn/kLbtldUAd/2cMzooGBH3kyxz9aViW6GOOAOiqpcH+yv+rYu3WHOS1wY3bVNLhxcudjM+rV
 xaSQAwt/W496jE=
Subject: [Buildroot] [PATCH v1 2/2] package/ca-certificates: bump version to
 20211016
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 20211016

- add host-python3-cryptography dependency (needed since upstream
  commit [1])

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/8033d52259172b4bddc0f8bbcb6f6566b348db72

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 024034c977..a1675b999e 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,6 +1,6 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1  c9875aa16e42981c6975e59a11727539053e2299  ca-certificates_20210119.tar.xz
-sha256  daa3afae563711c30a0586ddae4336e8e3974c2b627faaca404c4e0141b64665  ca-certificates_20210119.tar.xz
+sha1  bce5a8fac45456dbebf256f3a812c6cd0a853e3e  ca-certificates_20211016.tar.xz
+sha256  2ae9b6dc5f40c25d6d7fe55e07b54f12a8967d1955d3b7b2f42ee46266eeef88  ca-certificates_20211016.tar.xz
 
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 94302ea96b..0b75a8c778 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20210119
+CA_CERTIFICATES_VERSION = 20211016
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20210325T091936Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python3-cryptography
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
