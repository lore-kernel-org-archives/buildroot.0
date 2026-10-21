Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A457606A31F
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z9lAx/YV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5FE4093B;
	Wed, 21 Oct 2026 19:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoWBEYM21mLv; Wed, 21 Oct 2026 19:24:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03E2740952
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610667;
	b=R1ENVH5GRfGwNi+h/XtaWz8ryiMUzlqKkGsPR+Huo/gPnJh5fKMErSiWvGAnrde4aHHL
	 EtraUgWmbQntCaoRRyuO+dQ89g0n74zgza7MSV/naKGBgNMkkXqDnV2xeZriXNJQK23h4
	 cWZcZE69112/hCV9CTs850Eyj4cG1f+wNPvx3SEP22t7XpkWcqD6CvQPA31Fl+p5Lg806
	 gSqNGT9lJv8CM6FYNc40UfhS/Ror+UIiExwWcSRrUcmT9Vrcz7tyUOepHK3VdPeqBl6iy
	 FwajeNYRupT8SRGb2UXcAlPEgej2ZJTl2iOQABQr8qw2pWAs6/MwuFe6OAr9ys+QxnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=l+UsOT7LwYEG7087KXsuUW2DxXlADgCXK3oQAuM3rsM=;
	b=EZZ1cMAK8iJiXBwKrkewcADVrRcPOEbfWf6vu8vdK1KONG3scPR1LwsEzcC7kBYTWASN
	 uon8WXYsPoTo1D0GUtD2Elyoy82wEc8o42YBDlsGhsTg0BYrPiXudeLVpbM+Zv8rNVXX0
	 +TY7DntZmPAFCrxuOAW2RWHRQR4RPmVhZRAoswI69DY/FzrodrIcdxWpfR7oyPvqmFCxj
	 y++2/ShJ3tnDi/5OYpONNzidQoH4mkPES/OYOUfLHbJx48UmJKcj1Qj3bzoCj7eIoKARb
	 M23e+FSMsoEihhducIDk2/+n/GamRFwUwUMa+LiSFo851vYilpzirHyly4unx7CrEuA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610667;
	bh=l+UsOT7LwYEG7087KXsuUW2DxXlADgCXK3oQAuM3rsM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z9lAx/YVa9HtA08vt+2P24VjZ7E5UJmEctxi38E5eLL42toxodp/m2ezVyCrhiHTL
	 bHIlFGP588TS++Ncncdp5Krvc1+53u3krVpeIPmp61yePMruhpIdHPpdh0oaydJz39
	 qHMiCmQCZ391BFFItOluYvZqUgC6GTw2mX98wy5mmOsBZy4KEqqlXkGUdypLvtD9LJ
	 PrDjrAW0U8VY4cNnPeHfGNP7l7xSVo0HJ57l7jje+97qlshLRUnPNW6FKGcmOI8int
	 XLu9ImGr1SKU6yeZ7igrDUa5N51Izey0hwTFgJnehm/Ovs8G+7oXUTtJ4ruRxqnthB
	 jyThmsPEasZ1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E2740952;
	Wed, 21 Oct 2026 19:24:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 207693A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11F0581E12
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhfOZdCGYGjd for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2665C81D9F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610664;
 b=Y74HXbS3kW9JlnTHtXud/cPG6Lv1NHyOAPAPtrhUqt5E1G9cyGoYR3M1O5BMhZqTEARV
 14hcW4DsqR+KdfL/NT3Ge1P5AmRz8n14xXT0iGxrP9qf7yp5nZiyARlveG8kID5YBzm2c
 YWj71+1Q1ndB6ELvrwkeBzqx2IuO0dbwSvy/z5R7UAZJIO8iRqCE++ni1CPvVjY5Lrp50
 oSCLoFGuVePwdY/QJRNeLt8+o/D2jVuqjWvGoD/wASOg9h+ANem+zds8teJZyHkFUvPfy
 MlbqNqnszpq7J4bU6XDToj3qHA9NkMYsL8Inhmy/CPkNQfy7x2/aWha0Qf8RfR8i7Xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610664;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5AdEKrG+LCkb2ES6qY3c+nwjaT7XlJlw06vidDRirP8=;
 b=BhxpNZrUbtbbjedvz7KYvSvZjf9Amnqp6XU9z0vHK3CM6y3TTakjJn3XKfnlUyLermI4
 F1JbAFf+oJewiBA+/lYu7d/IbsX1hJbLSlXjW4fixZ/xM1gRUAhQQ/sQueJ41m5QMtICC
 GjZ/6ekQqqNmSST2g/igX9PKXz8i+Vq5jO0eOOmiEb7QP+r+XYQN2iQCVGPBQinIeSIZ0
 StgitvmEKdVD5D+IF5crrAHXI0SnS+XBIQEh1W/hWj6uxP3Vk8iLQZegTSLgjB94QVEJw
 LPNYWOUHM16Ho8PjaPcnS9LYgtTTGkftKN4vATdrL9UaHfoyppphjlIGCNlopLwrvEg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2665C81D9F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78CFA99AC3; Wed, 21 Oct 2026 19:23:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:23:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af68a0883213ac465d3ba6718097f4e0e3166af8
X-Git-Newrev: 4b9c0915bf293d96bc469986e83d911b9b8c9087
X-Patchwork-Hint: ignore
Message-Id: <20261021192300.78CFA99AC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: bump version to 0.8.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b9c0915bf293d96bc469986e83d911b9b8c9087
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Cyan4973/xxHash/releases/tag/v0.8.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xxhash/xxhash.hash | 2 +-
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index fb8e384122..c2697a1054 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80  xxhash-0.8.3.tar.gz
+sha256  5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32  xxhash-0.8.4.tar.gz
 sha256  6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cli/COPYING
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index fc2084c878..80bb81dbf7 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.8.3
+XXHASH_VERSION = 0.8.4
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
