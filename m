Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300AE606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Sj7jnV8A
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F66960618;
	Sun, 25 Oct 2026 20:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6q8mXHtImIcr; Sun, 25 Oct 2026 20:51:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2366D60607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961498;
	b=GfGxJ4E71sOGi4RoBJ1ke7KGRiR4sXNwhLhhFgXXtXXk/HWKSfNCIkNNqTJ6L7/hVNGg
	 PVQLfDbYLD9S2aUpz22SXtNlBn3Xcy+qQY/doDmjDFcptsdusRXCTkn0V98UAP44kzkZi
	 1Uo31jdd6GtNBznfAFyEYEm0Z+eFW5u9ineYXmPDTTnAmC0zaKQiewmftBbrcmeuSAmXR
	 i9b/FBBLyUmUiudxvf0vWekXfUGVY/BXVBFT+Cmep4SaDqGNuzHQ1dmY5NQJIBmvZ6B1x
	 xuZQl+RXejby0MlCfdUMmWXbSxbMz+w4aCXbT4c41xIzSbOUmcVvuJ2bPYsVu5+4DOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LgmMSo5s6Mst8ULk+eDZPrk6Y8jZJOXxreT7JXFklfg=;
	b=in7DOrRTzl3KV5CDsRKkJchTTjDI5TD3yQ0/Dj+VHffZIPW2vhGCPO2C70+YtQrJNvmq
	 jXryCYTINRvVewlwFUwa8ox86fGLZTbmAZ3/c9P0jI+S0OhGHb9720J/zM/zP0/P3fSN1
	 eLWOIhNI3NDcL8mYfA3SBFSoRq/b5TJcoQPOR56Lhqcd2BeKOSiyFvxb5xGj0zSebgIMn
	 ISRvCU71YgvYufTbWcXagONdPmxyKXT4BooTJHWqMpPb9UQAsGqapjMpCFtGr6v7kKqbc
	 LqvCZUB/7tQi7hctIwkB6D3wtE2XxLtBAb18ACjUizDDwraBvQ4GWCwKkN9txjvhgLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961498;
	bh=LgmMSo5s6Mst8ULk+eDZPrk6Y8jZJOXxreT7JXFklfg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sj7jnV8AH0wWw2rXwftSA+mUw5mE6+fjwrZWkZ9BXMa1wI0tHfdcgngo/W4xSgJa7
	 uIX4WPvpvW9GfUG55fny8BLE370hvogRfI56MQyOULBcyeEzSN8pp1C16M7ZF9p2lW
	 9ukv1bR8WhbSyQ/x+Az2CHnhDsyQH1RgoO4pvUEADKLE3nt1wi8kkzGgI1oh8yMlB9
	 xybbAd/H8kAoccGpIQHtkwPfLRtNHH9g6hd330Ua7yO0eoBh1FWccXAF0IAsLOuqA6
	 sjkWQqMWtED678tlQuXuOznMyiephuMeY4LnsnI91lLQ4i2AehUb1TFJXW04g+wZIp
	 inHtb9TEgT19g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2366D60607;
	Sun, 25 Oct 2026 20:51:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97453356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88A5D6060E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xXRBGvX5bPm for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:51:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E59E960607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961495;
 b=OfMPm71u+0eNagHCLqi4YqywXFFrTpmxJFjsqgtMTgtIFwLyFTsotHqtF0vw1E4PqZ/R
 0C3zGaViVlVOx7gfz19zGTkqCgIouVEQG2/sDnnGoFrqowqO/V40iWYabVRVkQixHNWhy
 6jGBb+4CRd8LfJTmB+07EEqwlmHzSYymzZm48SBjydLAi+pagMU5vuCrF6vLVpJFPWzeW
 Fjyw72+Q7YA3rUauuP+YF2liQupTOTKnqaPhz0jkAWvDg9oFgfYQoYkenbQCxKgyR2t+H
 dI5ndkecAalxKx4yFds2481m8U1wEro1L4VldzCDsP8Z1gXAySDCCWxqsxGBR0woOPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961495;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lhqSKJUJdEiC+4BqDjMK8IVjNYkRh7wUw9Aw5l9yI0M=;
 b=q7hs44ofNyP1zc09HvLDVCI2gjG3BVHs2/Y1geslO6dbI1Ep0vR+b00PXgn7YmsmLVF5
 tXqgRwDFy9cMll+tDVkknJuq5T+WbJKb+3BPSAsMjciyMFp4/BPJJtzCDcL1xdRSPZa/D
 3MF0kae5F8zYSiQvGPkokOasnWHue1ViIiz807zEItjJOiBIraizsvmlwagbep96uETN1
 BoSxX92hxqOdSwKe4B/YUR78a1Klox8hP5hBAXIkV7/WjkxvEFE+9vpGSBNY/S6Exre07
 m0g9KC//4SvwsA0H5gDNDKXv0nYH8jHd/lhD0jiJYmqYjhWM2Pq42cfOIhZNiLU5/2Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E59E960607
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AACF999B5; Sun, 25 Oct 2026 20:50:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:50:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acaff39b3cd987f6f5f4bed6e8fb1f99b6218ca1
X-Git-Newrev: 34c4d23dd1426b031df245a930f600f7888688df
X-Patchwork-Hint: ignore
Message-Id: <20261025205010.4AACF999B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/msgpack-c: bump to version 7.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34c4d23dd1426b031df245a930f600f7888688df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes since 6.1.0:
- 7.0.0: raise the minimum CMake version (3.5-4.0 policy range).
- 7.0.1: set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR.
- 7.0.2: fix integer overflow in msgpack_unpacker_expand_buffer().

Switch to the upstream release tarball, as upstream now publishes its
sha256 on the release page.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/msgpack-c/msgpack-c.hash | 3 ++-
 package/msgpack-c/msgpack-c.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/msgpack-c/msgpack-c.hash b/package/msgpack-c/msgpack-c.hash
index e4fe61f424..da32bdf27c 100644
--- a/package/msgpack-c/msgpack-c.hash
+++ b/package/msgpack-c/msgpack-c.hash
@@ -1,4 +1,5 @@
+# From https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.2
+sha256  6ae50f69612871aa01de76bec904165cd2a2fc30ff9f653f2f60a663c5c1a86c  msgpack-c-7.0.2.tar.gz
 # Locally computed:
-sha256  c23c4070dbe01f46044bf70c5349f29453d655935b6dc710714c008bca0825a7  msgpack-c-6.1.0.tar.gz
 sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack-c/msgpack-c.mk b/package/msgpack-c/msgpack-c.mk
index f12dcb085f..e611aa9648 100644
--- a/package/msgpack-c/msgpack-c.mk
+++ b/package/msgpack-c/msgpack-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MSGPACK_C_VERSION = 6.1.0
-MSGPACK_C_SITE = $(call github,msgpack,msgpack-c,c-$(MSGPACK_C_VERSION))
+MSGPACK_C_VERSION = 7.0.2
+MSGPACK_C_SITE = https://github.com/msgpack/msgpack-c/releases/download/c-$(MSGPACK_C_VERSION)
 MSGPACK_C_LICENSE = BSL-1.0
 MSGPACK_C_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_C_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
