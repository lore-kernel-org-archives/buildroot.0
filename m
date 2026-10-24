Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Of43owMS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A076062A;
	Sat, 24 Oct 2026 21:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpLVU3cyp5uq; Sat, 24 Oct 2026 21:24:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2B7496061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877041;
	b=KxFr0/e65dCxpIYuawzBJCqrn4Mnotn8xK1HGzZkcFZhXcSbGJDUqvcMnK7asmwbKaYf
	 tvpGrp9PCyaZTGwNZGgNYtuqJ5NKIOxAEScm4HcjXNBnNeyRuh00eq8GfsYftxBtRdgSo
	 H10iIceFp4oEd3ZHB0Aw3VECH8gF3np/DXTtc8KajLpjC8QAfohDzDMpWw3BDyRb1gNTa
	 py7hMK9kxqSLkbbvwrvsyJJwcmWj1feXu8FmVlbxmWMhLPlGAUV9yOg+o7jV8zI2Mr3kW
	 Bl/zgKa7etcCH0HD2EtrvIvIPObT9N/UkKNmVTg0+SD2L/dJWSBjn8t2paozZL5DcAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lG8EyjLu8gNTCytbPo3giR8kOVQ+tbw8QFpIfmzKDxw=;
	b=kNK3YBXFjkAZjrpq3UeAX78zzjh/jcsaTq6AGxogSrE45weYdrJNZO8lSSvmkdxHHS5I
	 rZQNiDsw0idegJJqUUy/sGev1rIj65FkjBPHMk3Y3mNgGD8tJ//e44jJHe8zwB7QeLP9e
	 gLFQBYKMPH2Yh86C9dg1nv/qipyKMMivtL3ByIpdOePxMrjujh6DKE00pxNpDSdWtM46x
	 bhRJtEKixPTGMFgLN7/ljogRK68lk7crDMaqe2RGknPr2hiGSAcjBy8Nvu8aLlIOajsCe
	 Hhz13D27/VeaArkUbmYJCMqScj4+s800Hj0ciKgHcag+iawFkvt2mdQxgbOwM7fioKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877041;
	bh=lG8EyjLu8gNTCytbPo3giR8kOVQ+tbw8QFpIfmzKDxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Of43owMS4VctjzcjQ0bm5JVXGouQ2nR+/7PJfqeMkfWz8Yvn878Vgl0X2cBbIimg1
	 4m7r7tkasTRuH86jP2QCXkechbTBzSLRju2XSgAATE8iT1b3olo4vBpexT5Oo6qLNE
	 EmDLQ56LYUBytJrZik56nIy9uq03z08b9B1EinRxW6iAEeC83epwFZIVBtjM+MmLA3
	 T00iaYnqa7ADinwfknDzH9as1OdOi/FsAzZ88V1hNHWcRqzFFGNSQr7s7+31vDstRU
	 EA30S1ZAcQJj3xq4sMnMD9eHX7TXtS+Hna/3VxnlmnZC/lJrNBdF43gya2NNYungwR
	 +R5pS+PizHrlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B7496061C;
	Sat, 24 Oct 2026 21:24:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5159E765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4339D40582
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3Ze1tiMpPsp for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90D37405E6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877037;
 b=RR9A/3XE5u0pPaEmjxZilzkhaKxUciHw2gE1kwP6gltouBdnCzs5Jyud3zA3nRElN3Qi
 du7vw0rnZciks21C2YglqZQEvxzYH3VFgLKnodCOA/MtvOCw+24cBFDrUYT07rbh9cFKg
 JUr33ZGhOLEKLBmhKL8NSEeCr4c0R5c62Y5MM7ZIpxX426jxNy+arWeLwGwhGzuUHsH58
 jUa47vxLdKZOGyKFSd7+UmpJDhg8fKr7yTXkl3wuPJ0p+ODW6TJOCS0pk4n6+CwVlbys6
 QXjV/dQPK/G7JrpFy0dqPthsd3yDDbb5ZR+I7k4j2pcTrRTISWbLvNharH2Z9p4AXgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877037;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0qZJizY8njc1k81K1uQaOpcJOZq+3YbOZgWG6EfyyXA=;
 b=O5CjLR6vQt16FouUzwGbadKUE9h8lX0O8uc7+llBdEADP73tjXqZbBhkxtwe0OY3KcBi
 U8rWD8o/MlFvUdkS8uC5KeADWKTePc9+ko2IOJ8633Qxj/EtjWaW+mPVAr+yJITZQPLv/
 oNgZl9ucFR3sdn5bxXf/antl84GoU5e1kLHENJ/NQjd92aBF3HVUXZyw+5+GapXCdJXwE
 PsbABaxeQ5aXRGNcE8IWcI5nYeCqJElouc83j1MZqmLMkHC43BY6S0ngU+PCZJ0M1Vedr
 sue+DbjNOv4DnVYFn/U5+c9V+8+blBK9J/+IMEipEuDJTW336YPG3VgMO2HXW9K3fWQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D37405E6
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 627379CDCC; Sat, 24 Oct 2026 21:22:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:23:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ff55f528b5ddbdadb8fd86c3f481d573b0d05f2
X-Git-Newrev: 3019b599f8bef0a9a1cb2bf056b16c7e1000fb40
X-Patchwork-Hint: ignore
Message-Id: <20261024212232.627379CDCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: bump version to 4.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3019b599f8bef0a9a1cb2bf056b16c7e1000fb40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/transmission/transmission/releases/tag/4.1.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 0e81ec8ec1..7d207e28b1 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  ce7d2d8b101f7eb54bc3cf0bc55f52f7ebd4a25fa48e00bdca9a7e0fc02617da  transmission-4.1.3.tar.xz
+sha256  86e7aa020cdf64826447034bc85f4d3b7c848d8c0891d9dc9b9fddfb2c805d22  transmission-4.1.4.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 0f5ee5d6ac..94221d5f71 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.3
+TRANSMISSION_VERSION = 4.1.4
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
