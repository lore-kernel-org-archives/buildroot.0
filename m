Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B66606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SAGSKMjL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 381CC4064F;
	Mon, 26 Oct 2026 19:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7q0XOxigGha1; Mon, 26 Oct 2026 19:50:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6400540611
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793044226;
	b=kWiaQkAId1HjtSCxRS5AVx3BNOBD0XQJtHcDeAgWeod0S9LYtPfOguXD9K3+LfBI5hZg
	 7zVsIwyF+nebXO4c+wv6GyQhZMQHCluq8hnqC1knig6NCLDND293bDWmHCUPYzKW/v5kT
	 2Gn76HzweAzty7nVEeF8Uyoy0So2Esdrd0PZ3WbJZEo6m2XbrFIFM4AyR4NBl1q8hdy7g
	 GC0QVUdtf0kAAq1SlrTt8aSHyVidE7QaBmGAGE+x0xjrhR6nTC9O/F1i9LCQSLTUfwwg2
	 YVR/SjQ08SSKgGFhXYAZE45WTpa8Zuifyy3drTjLw1L7OLOKTsBTTqYyTaeE4d7vO0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793044226;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wq9a3cSvdJI5BM36gCG6Z3UWOgdy3wAHRkY9qjeRCZg=;
	b=jHCStrHyEMZk7yGsMxzrAly5GbRnpObx7EMeV2qW/MJqOdKbfTgFx+nPmsEYnoPodiDX
	 7S5g4sK1XLra22k/iW6H8EZ6Kz55LHkBWJOeaCT7zrvnKsV8wsyqUVzw9eW5mZAgitDu5
	 LpBJwqFkPhq0WethkV/y9DKEojpvo5GEWS6hUaXRZouSCYWtculMxj7diVDEpkHZovq6Y
	 kSpLwzeZi+mHtBaEZxhUg2q+OKPpVR+isR1vYEzTAuSox5WiKg+0RidtS2TY3dszE6EK4
	 yvQE+JVkzZFIq3J4wQlEfEdyBTL1JgeGBM1Eyb+X/eA9kBCzbE3IIXZV2AU5MBaK15Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793044226;
	bh=Wq9a3cSvdJI5BM36gCG6Z3UWOgdy3wAHRkY9qjeRCZg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SAGSKMjLpnb5kCogAtoHwN5jegNVZyMnII6QB6ZAfRP1XIclrt76BOBbg1lCl3FMx
	 5c9mGgXQ1/fz9XSMMpG7bnI9NNDvC9mcQIooFxBeusI3w9IYgqhwUVIdsX/wfsRPf5
	 NrIdbDYOkVfae+oJNYuod2bvKDvXgsL7fSPy8pBVuQVRtWAcqjB1f1DK8B56IsVM0/
	 dG2CLW2c+hVV0OYufaDkK3moVm1rBFCYTmnzS8QyjlhXBFubiNyUrUgSWFP4LcTwql
	 tB9Zi/rz6prFRkdIMKKcd6wBJmmY4kdCXUCVztaJSxt3NEXrkePAQD4M/gf3w8mayf
	 TBNyoF86dcVCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6400540611;
	Mon, 26 Oct 2026 19:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A71F2F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6109C8070F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbdAYulFehrl for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:50:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B1B5880BD1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793044224;
 b=QMsI2edxVEQT90oXYDH7iPHd0i9gc08Cxj80fxVixpkRqzHUHfGroBjjaTN8X8vQknIV
 YLmuCE563C+OhSwcTnSCo395Hrpuppb+4feAWl3aXCor/uihkUqUQdoMjfLHspCh4MSBC
 afAtsv4t0r3Trc3ZZqah1zzrzMgzi8iNtKEuIYJx9SK1oy+7Ws5tU27te60WN7eHaRX8f
 kIYq6DsbBbsuc7+nKMF8kjhviC0Nlg3DamXwRyfImfPXD0LGKs3FkvrxkhrIhWzHVUxkL
 S8ll8cxgpM1oM/dUb1YgvcG/RShnocZQNsJYK5c50KX4AFB0KBWmsy/SHcBxosm2U2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793044224;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/iM0RygsgOhExiQskcqhdp+Kk0OUx/SXkXDFHd0A40k=;
 b=bEtbeIU0sAU3LhqxFl3GHwdbYiR/RMb4IArCjIwx8dfkHT+q5co2IpXBSr9qucsgQqPv
 aGHiVua/DFEv6t1Sn6J6CIrwAgXsuQga6vMB+ZLd4R/GPRN/XDVRif7CJL/n2E8JSNnMx
 BS0C3KdpI2dXfRAOYHuEs8kbS/6d0dlTylAWcSENKDInc97uFIOAPMWi0bFm0JqBFonZB
 oQFkO6zyfAooNLUDnjEy45tugGX/KuxD4sRomcVj/YVJzupxIKXVWa+U9x5mWUa7EXA4h
 xg3eAsJGOxK65AtwavnLpxoX5g5XtlsOvYWgsujLitEt5f8nnbZGSFq7pc4GhD1RTVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B5880BD1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:50:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96D119CF1D; Mon, 26 Oct 2026 19:48:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 20:47:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b9281e4a6b7ffba56569ff6166b58d7becd9f8c
X-Git-Newrev: 04b8e19efd4b7085583cdc3fe099890a04abbc9e
X-Patchwork-Hint: ignore
Message-Id: <20261026194858.96D119CF1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nqptp: bump to version 1.2.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04b8e19efd4b7085583cdc3fe099890a04abbc9e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 48e8a1f041 ("package/shairport-sync: bump to version 5.6")
moved shairport-sync to version 11 of the nqptp shared memory
interface, but nqptp 1.2.4 provides version 10. With the versions
mismatched, shairport-sync gets no clock data from nqptp and AirPlay 2
playback does not work. nqptp 1.2.9 provides version 11.

Release notes:
https://github.com/mikebrady/nqptp/releases/tag/1.2.9

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nqptp/nqptp.hash | 2 +-
 package/nqptp/nqptp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nqptp/nqptp.hash b/package/nqptp/nqptp.hash
index a37f7149db..84cd8fdcf8 100644
--- a/package/nqptp/nqptp.hash
+++ b/package/nqptp/nqptp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1df1d5edd5b713010d6495b3abca4c1cf4ad8fa6029df0abeb9e4de8e0eb707a  nqptp-1.2.4.tar.gz
+sha256  6aa1d73b8ee760bf19378c319db0d0537a867ff961764b150e19f87d96a02210  nqptp-1.2.9.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/nqptp/nqptp.mk b/package/nqptp/nqptp.mk
index 70e7e72d15..f7d1f51083 100644
--- a/package/nqptp/nqptp.mk
+++ b/package/nqptp/nqptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NQPTP_VERSION = 1.2.4
+NQPTP_VERSION = 1.2.9
 NQPTP_SITE = $(call github,mikebrady,nqptp,$(NQPTP_VERSION))
 NQPTP_LICENSE = GPL-2.0
 NQPTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
