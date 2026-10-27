Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD534606A320
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nZEHq6H7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A268A80D98;
	Tue, 27 Oct 2026 19:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmpmU6caCCJZ; Tue, 27 Oct 2026 19:24:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9839380D9E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793129052;
	b=TJHJY1vo21DjPi1t5GN9w8lhIq8OvWwl9Bu6pTTYz3h92Aea90WGGzGcg0LuGojzKNFJ
	 vvxO7B3/W4Jg3maCXaAXTbYcJjCr5HCQTcGiWproek6PNn+pcIoJ2CiBloEJlrTt+VQis
	 f1ifvRB6sjdrDKt/RLsYsP93BwPf2A7a5HFk1ozLQLfRWvV1bxA0bI1JguFFyNz4CzgS3
	 5Zj5xJRfAWOwD5AVQxoWfawYzKjsINOIGoOX216CdoSBmNsOkM6loPMrzAyuXI1abRKqN
	 a/Wf/mBh491M9Jw13QPHDeH9bz/O3H86OR+LYgNDw9R1kbm6CFo2tziZ5b5Juz9J+HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793129052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Iy5rGPhsbzp1NLY6BtrpA2Me5VEhkKTm8B557LcURbM=;
	b=thLJ3QdTkZv3XetEs9d1o4UvwZ3l9n71j5BMLEFSENqGLD/29sBmSH/NtruCptR/z12r
	 KfA3OLA3/QF/AWwA9FpgZRsVpYG1BPqt8LPLWg9abO0LLKcU0U0n9WmJGZGaToL+eBujS
	 1zyuTlpFNoEpfCLkmx5Kq65v83dr1O84kqLMcdMYddXgn2YpwTZoDLJBcmLcB0R9h8Ayf
	 ZE7QqDFrcONaFfOnN4fcXgRRLkVnB2GObL6Mnp2jh4qWPIBk/OEHwA1+xT8JNVl8WrrZb
	 FC0yg8Jp0hSEkLHkIHEYRH3hyyfJB4i5/hKzWaoMA0wOHGNKjrprIu0lvo34HAP1k2g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793129052;
	bh=Iy5rGPhsbzp1NLY6BtrpA2Me5VEhkKTm8B557LcURbM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nZEHq6H75olFu4PYV5gLwy0ax9aMfzm8AMC4NGXcUxt6MRLXOnv1U8aA4tYcdpb4a
	 E/VRVBIuneOUnjUD9dP81exzCLQbngkVSrLSE0HXjAnPaVvbrKiGfLj28cdL6VrQ9g
	 B0yqErXC3Yu1/OaU9oUfG74sBQEBhXw2zDf8bi3AfVheOQeqpPpnaWoXmcMh18dWLT
	 Dc9zQyVKlTsk+uloOZO8kRshZXhOQkWFBlcPSDpTRCJG9/adv8p12UmHDqdTWNWlr3
	 Tcg2wHWcYZfmAJadn3ypB2dDrPGUkGSvMJKOUXN1oLlhdOlQ/M9qdKv/rG9Ia5uHqR
	 cBUMtvqHWKGXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9839380D9E;
	Tue, 27 Oct 2026 19:24:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC6ED473
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2981605F7
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0rRHUO08D8q for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:24:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DAA7B605B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793129050;
 b=D3CdumUom9oGa9FsbG9+plk+hSRv9dYw2c8TVoII/Qhv5qur1vZaMjOzkre7D6fASTun
 +XCxjmIz3LDFZrqNAOS2c+5529H3fRvvaR3dUGG7YJ4plbIesLog6KCnnGYk51/feEIHN
 kjJvpoGKCVLUhSccT68x6MOjlGT6zYTWBoUh2B32myWeNh7IEqwoSCgA+NJTEZM7LRPOf
 AEwNFwjHRW6hsinykxUjsxmk0a7ijqdtRosQGvcTC8XqoKLx8G0LbVEolWMi37ulaff+G
 qtPjU5lNn5KRqvaCW+LhKVjvfGltl3foc3xU3cQU89nu+lC1r+XSslILFZYGdTXjXOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793129050;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=m8W+yTfqNbGLkl9cQ8nbVia7Znf8AY7KKCYcsa4vpD8=;
 b=tPA46YYAjMY/8q+apkmUTofR/gHQmvnzeo+9ZoZfLxAih2O8xooyAjTLS43MCgVxmiZQ
 ter2KaW2TJFkcHEvoEfnupJq7d5G/t+d0fRQL3jMJN+rPcJYVpM6O8MNYPi0DdaviGaT7
 ggDaWHCasA98S4QCF/G1Mjylc6T+ncEBp8ZRZJfNXHGwitZyJ5deR5izIg6rcSqP6aQ10
 cVpIfOHkk9yvKadP6x+49fC1k1HlEHWkUJU5B2B9W2AIzwbhaW5hekFmuigwnDq2IViF4
 0mfBIn3winz6zLSfBntHNQwK0RGJnadn3UvYrHEi3XgTGKRFXiFhFhUKZZAJG5KfTBw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAA7B605B1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:24:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38A0E9D133; Tue, 27 Oct 2026 19:22:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 20:08:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13dd3037f4bc92cae6b816b34bed28b3090118a0
X-Git-Newrev: d6816da11a3d043c0c73325616b951e83c1fa16c
X-Patchwork-Hint: ignore
Message-Id: <20261027192244.38A0E9D133@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-connect: bump to version
 3.1.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6816da11a3d043c0c73325616b951e83c1fa16c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

License changes are due to golang dependency [1]

Update github.com/go-ozzo/ozzo-validation/v4 from v4.3.0 to v4.4.1
Update github.com/mendersoftware/go-lib-microfrom 904960e to f0e3087
Update github.com/stretchr/testify from v1.11.1 to v1.12.1
Update github.com/urfave/cli/v3 from v3.11.0 to v3.12.0

1: https://github.com/mendersoftware/mender-connect/commit/14ebf68bd4f83057f75beb06702d6f8adac84aac

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-connect/mender-connect.hash | 20 +++++++++++---------
 package/mender-connect/mender-connect.mk   | 12 +++++++-----
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 2872bb467c..8daf1dc5af 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  b04331f447b9d21c5962d5aef2670f1de861e3065522a1b298af0904a8ee6400  mender-connect-3.0.0-go2.tar.gz
-sha256  420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4ef6  LIC_FILES_CHKSUM.sha256
+sha256  7cdd498ea5073b0b22cbe3b1db0a6f0d86243089112a5905a9b1d2b0c18609bb  mender-connect-3.1.0-go2.tar.gz
+sha256  649734d795498f215fe39bba2a166a53864afe83caebd5fe9c363aac9132b9d4  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
@@ -8,21 +8,21 @@ sha256  420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4ef6  LIC_FI
 #
 # Apache-2.0
 sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
-sha256  a4e99d13c6cd0e4faf3867ae5c9815ff88cab3cefdefe0dc1ec9ac28b1152944  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
+sha256  80297c4cb7b51b895d0385e45fe3d773271c8ae4c58e7c6d1ee0312dddaa4ad2  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
 #
 # BSD-2-Clause
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
 sha256  1530185dd39cdde7cb2f786a7a5fcf8bc34368b6ae73c15e72bafe88fd80b9a2  vendor/github.com/vmihailenco/msgpack/v5/LICENSE
 sha256  0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb079da5b5d  vendor/github.com/vmihailenco/tagparser/v2/LICENSE
+sha256  75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d57274735  vendor/github.com/russross/blackfriday/v2/LICENSE.txt
 #
 # BSD-3-Clause
-sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
-sha256  0b77fdea862f869ef4f201ac5649bdbd38ccb055c7f6454dffae9e2adb4941c1  vendor/github.com/gorilla/websocket/LICENSE
+sha256  c615fb76b7891c9b36b0e352c111d5a2fe77c0111e4129a23659b25b26c3fdd2  vendor/github.com/stretchr/testify/internal/difflib/LICENSE
+sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/golang.org/x/sys/LICENSE
+sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
 #
 # ISC
-sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
+sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/stretchr/testify/internal/spew/LICENSE
 #
 # MIT
 sha256  a2a1cea59d9c2d71908082f516f86bb560abf857646ecf69d70c121ead14aef4  vendor/github.com/creack/pty/LICENSE
@@ -32,4 +32,6 @@ sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor
 sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
 sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
 sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
-sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
+sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/go.yaml.in/yaml/v3/LICENSE
+sha256  a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
+sha256  c8024e31c1de453fea90f22a221968835cc7af9d520274a2576c9ec9976055b0  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 98fdfe16df..ae9094f3b4 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 3.0.0
+MENDER_CONNECT_VERSION = 3.1.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
@@ -17,11 +17,11 @@ MENDER_CONNECT_LICENSE_FILES = \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/vmihailenco/msgpack/v5/LICENSE \
 	vendor/github.com/vmihailenco/tagparser/v2/LICENSE \
-	vendor/github.com/pmezard/go-difflib/LICENSE \
+	vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
+	vendor/github.com/stretchr/testify/internal/difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
-	vendor/golang.org/x/net/LICENSE \
 	vendor/github.com/gorilla/websocket/LICENSE \
-	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/stretchr/testify/internal/spew/LICENSE \
 	vendor/github.com/creack/pty/LICENSE \
 	vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE \
 	vendor/github.com/satori/go.uuid/LICENSE \
@@ -29,7 +29,9 @@ MENDER_CONNECT_LICENSE_FILES = \
 	vendor/github.com/stretchr/objx/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/v2/LICENSE \
-	vendor/gopkg.in/yaml.v3/LICENSE
+	vendor/go.yaml.in/yaml/v3/LICENSE \
+	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
+	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
 
 MENDER_CONNECT_DEPENDENCIES = \
 	dbus \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
