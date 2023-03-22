Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F05C6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 16:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A57E83F8A;
	Wed, 22 Mar 2023 16:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A57E83F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvjIPcr5oYpa; Wed, 22 Mar 2023 16:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF1383F7E;
	Wed, 22 Mar 2023 16:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF1383F7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA9E51BF35F
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 16:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A06F783F85
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 16:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A06F783F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y10O-XKPDJLf for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 16:24:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B4483F84
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46B4483F84
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 16:24:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.182]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MfpSb-1q7UGN3oOP-00gIXf; Wed, 22 Mar 2023 17:24:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 17:24:45 +0100
Message-Id: <20230322162445.19051-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:33hm1fdi9wCYxg52G0ZFd5r5vqMqPOMiGTLd6sAfn9lU03fERlI
 4QZg3F8LKgnEA0onotSpTRAOOpFXaV+y+R1pUaGz8A1TVmbQk+6KcfYi1Ma3DtMaLjJvABp
 Q/2hRkuFvmuI4GYAB6R6Z2xeKS48cGW4C1HP9+WVcDqb8PR3rgqwkGGevQG+ysrN3SkkVK+
 N7lIfcr5+d5Ck31kHfJPg==
UI-OutboundReport: notjunk:1;M01:P0:X0oWDk2uMow=;Y0ikk0kFvdsGHrwElouVKyrdVGm
 VcQ09piH32EeWiObSwGswX/Kjz8WW32B3DGtTThZ7YIwUw8/BkwiAqTEoUwMJ7RG2dKk3NqIB
 Lwp8RjwL7SGhFnMAYdixbAqhClyVfE1Iv2E7za/Y9ci3kevdSYn2LKrpLl3E82++/OynTIv39
 gsadE9PB783WnzsP1qyqhRfPn83z2+DKGBQcQaB09s8VFvsErmjaHVMPGJSFJnaG/MVHuOARG
 V93KXGH+iNwbt2P+nFZJznbQpJe/b4PiyYVr2K9adn/VvUlFsSYfvMS8SgYlbdaatEcwIf/nD
 DvXBIIsdqs+6ca77PCGAI1nhOxe+RlCjSKU1YkhSpWe6X6OMNE8pPRfe9G9VvjdRM3LQsXXor
 qSCLj4Agy0gMVpipv7jKzcqcN1V4WF6uPSzbpOXigQtlS4MzIqmbkHt167Cl6hPkKEerUeywl
 99Bt4kDG5nHAJPLXKqCDfhFotwzC39/Tm0TVKJEtSqhp4uL/0tmAms5J7Vl5zcYk2t7QFTAmP
 XETQ0f5ove86Oom3K2P/HeW6AvYvBkb3sVhTmfVnV4Ec440cPR7ztN5ZNdNKB8nBX0SpH44Gv
 ztMqaugs2ivIe2s5Z5pWhsTnjnC3S7KB1kEw4ZfvTV3IK1SQ9CZre6rC/Oi6qyBx/YpG3MDPf
 0vVdZFOJzxWZxhNwY/Pv4s13w8kjRB1uP2Vf/484ji0hUM+hwkJcITRdCxTsYBxS+I8TaSWv2
 9MRisDk3qz3a8RKBu6QTTNGtNYyjYiezHBd47APeaFN/LuTf18qTMi9HOxj7HsEaRLCsslDE2
 K0V0XCmsrqhiwx6zjUWCcNyvDHsQ0/BDq9wLhDhX0InoYfHk7EakFfdQMwnqCOpBwFaQjqr8O
 I6i8usM0Fcgjvx3C0NAFyQaLjVraMEN031qh4JlAXSmjQ9F7N3YNDmCeGtaKlcIt+1y5xwhsn
 73qvqkQ+XCbzTMi9UzE/AYHpJT4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679502287; i=ps.report@gmx.net;
 bh=CzSn+fz1pQaWiSuR+px/TKpQ+BLNZXBMT+XtvbfKUm4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=OSUi2snasdT1Q3vpYWVqDdBUeLcM/1OX9zGhK0wKLGMtpaPfF835hlxXLbIaVcGRf
 THpy1/PvSn+u1yW78ZIDNqXAPRFJ6XOrRjNECuM+v0dRMQKGs52Z7cqZPRAcNTK/8C
 H7XGOIZxURztgK5ielHkQM3CeP9K2flinnGDQICSXgNFfro6ASN3O1itL9sWoveDg9
 JiQNhUerCagWAsIWPr209ki2+UEc0g2olollBdpNIePysvid2nrM9Ws1hD5c30Sz47
 Ihtx9CZqjPhydTYdvTybqxDChj4KhZF6dG7ZSK2cDqyUxfUYq7qxMbFeXGMrsK07of
 fdT4NZF0dCJPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=OSUi2sna
Subject: [Buildroot] [PATCH v1] package/libcurl: bump version to 8.0.1
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

For details see [1] and [2].

[1] https://curl.se/changes.html#8_0_0
[1] https://curl.se/changes.html#8_0_1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 32b3d0b5e2..8a29e7b977 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.88.1.tar.xz.asc
+# https://curl.se/download/curl-8.0.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  1dae31b2a7c1fe269de99c0c31bb488346aab3459b5ffca909d6938249ae415f  curl-7.88.1.tar.xz
+sha256  0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0  curl-8.0.1.tar.xz
 sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1a1594a45e..1354e526ad 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.88.1
+LIBCURL_VERSION = 8.0.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
