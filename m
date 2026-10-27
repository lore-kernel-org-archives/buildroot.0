Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD4606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OiN+HYWR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D5480F72;
	Tue, 27 Oct 2026 16:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsZmxKc4sjqV; Tue, 27 Oct 2026 16:13:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B6E0880F7A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117598;
	b=radf5W+TncKQKauQPblnC+jWUbwt6xsmPSDBblD9/mpM0hJalN24+jFmDr4XM+B0WTgz
	 escRuHHkoGgmLyoosBqKtlIOgySQoNOMxo48ZNw1b6CI+XFeE9Bzy58qkIBe12dvpcW3H
	 inUaS+JWwj2J9WHSa+rRSfOhnBde3GOHwV769ozMOag1BRG5Jj4T3H7y7LPxYowrGwkeC
	 H4GzWahunkoPDef944F5GsPza9ALdDh4CcHxjaYulrrsKoiscuEH35TxRtk+R1o++4ROo
	 9E2j1jFyXSF9jFF79fWXJjIg8oe9e8e4GnzCYlb5nWTONzd/o/FrZ7t902tB8IKaWoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4mjNx63dzqylO/t21eqtgZ7NwgSSf6cc1tAvDx8FNLY=;
	b=JyXdEVGn6M39l8qjgW7ROifRxksfMLirKeYSay18JOUDe8wzt1JNsSnEdGpAXdmGaOA0
	 T85GvMbb9UsPUqGBUCVXuatEAE8ZWvGrATo3bHnx/u51poWL0B01mD/zOqZt/RDRyQHNw
	 PGsz4Qe9VsQOj1//m8FWT54lbUTt/0PYvx6dX1Wx5orSjxtbwQX78xSPmWcjnXQPCe+s3
	 byKKsmtY6hirA0oM6XZyeZugta63oUFT7kkOlMR2mHtjlcvFhuNrw6wkrPllfCV6oc0Li
	 zdkwzxsJ8cFL+qorCKu2tG/niaXX2rECltf0bKTFi2Szw98fTIXoEBKQoozoGbFhrrg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117598;
	bh=4mjNx63dzqylO/t21eqtgZ7NwgSSf6cc1tAvDx8FNLY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OiN+HYWRi0tS8ylywrCMKANFWBHreVih92vPCoIQd3EJXD5+FCpBkUNsGEmMcHc7B
	 8LifZyV8mJci7xFNy5Wwne2xXDbkLM0gFTgD8laqY7P4gWwqcqobccP3vkkHQqfKdd
	 S8auwnYBQtFK2oPcd5L5Ygatf+yyFqIJPWkzs27MN8XBwgeRgko3py01fJrSrMfwis
	 884bnC7AEX1gNcvL2JWaVE9GAy1LUM8N3QEtNCevPOsxHbk55JIgB5A8+YUYJ2VgJF
	 tS470gSpSw+HK3CmxZSsfPkpHU5Suyg8rOX/E4dPH1gIu3CgQ6RPQe20ZVB0QRwHFN
	 b2e9QjEJr/u0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E0880F7A;
	Tue, 27 Oct 2026 16:13:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C5E2F5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E46454060F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gc6YPJBEAYOL for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:13:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 481BF4057D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117597;
 b=M6W7ynIFoMGWWO0dA+J7fvH36drrla+3ZluTw0elwvgvOT0uCOrNXVa81mRzSsVDmsGG
 84t/5YrBNVUBy6po0Cdt4niZBA0n6zROggosmCprzupX4zrC/Ta/YWorycfahiivatOrI
 m2HYffXUgdnenoNftrbzCrC3U1UJQEEXrtjaGEgHUcWxzX8ZCmSAylHKn1I847JE8AdG9
 T6QJDBXpf5PP6E0DIgmLnkhmensV2S+VYUmx18sCTYBROJuVM8yJyvs+meBJqqOyu9Slu
 qRsPSX7/ORO/xaKeI8GB2y1wIn01k8gNzfS9Cn5pvmYuctVgjeR/I+GxhmnKzKz4fRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117597;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CpPjvF6u8v3PsR2PUtAe9kgpvu5qG3U8gB2DkKssAoQ=;
 b=Lo3FFt2GhWlFqg9IWxaTIoEjF13eSw7jBjv7IFXxqD+Owu59USIw2wzFc3S50+e9uxfP
 Dclqtb7mp09GieQncHlR87BawECWmW/PtTLQkcuhDjUNWCMIwPoeI1cuxqcyIrThs9+NP
 O4SSvEH6sSUqn+3fAjl0VSpDuiugi+YbGFiyTSD89ZsCjY5C/nd8AyLqQvU8PnW2qAmbA
 G6xvpZq7UO0HldKAXq/iKW/r9tf8biojVgsNGMHDtWpLd32DGvAxQ9qkHh99cn28XQdwc
 Vy6lOiMY/r15FToNhFs2bx8f0K4eKy+0NLXTTAvpA9ibEfusFlU/biq0VC6rn733abg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 481BF4057D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:13:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D1CD9D0AC; Tue, 27 Oct 2026 16:11:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:09:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f39c490c44cae0496c3ea4732d26af66f384fdc2
X-Git-Newrev: 7a0fc179a01d18189bc64fdbf57b170709f600cb
X-Patchwork-Hint: ignore
Message-Id: <20261027161150.9D1CD9D0AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: security bump
 version to 5.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a0fc179a01d18189bc64fdbf57b170709f600cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/mikebrady/shairport-sync/releases/tag/5.6.2
https://github.com/mikebrady/shairport-sync/releases/tag/5.6.1

Fixes GHSA-vfxr-hxq9-9h35:
https://github.com/mikebrady/shairport-sync/security/advisories/GHSA-vfxr-hxq9-9h35

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 1eafe03b53..ed30ad50a4 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20271e220e859b8f60a707597187564d3bda7dbf69dd61aa1357ec1656285246  shairport-sync-5.6.tar.gz
+sha256  0747706e19a64ec550ec8a6a5c26bf8e231a4d032de31644f5a5daa0632c41c4  shairport-sync-5.6.2.tar.gz
 sha256  5ffb12379c3293e48010d0ed04185940e107b54e48b520d58d847da53a153c33  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 7fd1a23eb3..0d0b4ca404 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 5.6
+SHAIRPORT_SYNC_VERSION = 5.6.2
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
