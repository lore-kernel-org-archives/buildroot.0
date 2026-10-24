Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C881606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RwsRW3zv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7FE80E28;
	Sat, 24 Oct 2026 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13z-qvFi5pT4; Sat, 24 Oct 2026 21:02:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3CC0080E37
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875761;
	b=fPxB7YYiEDr/+YSj6yW3z0jttypWcZCGeEF9PUo0ZaPtgnQJbeFPD9j2p2fowTY1B0Zg
	 GanVGhwNVsFUT7f8Sn56v/86p/tCK6mperf+7bIAcarn8g5o+TOrisYMcQsaBryzBuwfn
	 1jcNLNgzWfuede7llkUf41FA5X2K79Vu6btHrcODuQ/zbnzcb3CoL72EeZEaD7Z9vChUj
	 X3vWMAwJDD/PQnO3IqT/CHBmdCwccIV62qZuoLg6KNI2byeotbX+/RN8+Agm5oa4Jx/Xl
	 8f7xVpkd8m/dqtZoiAcwdkvXZZZQpkynSWEWRkY2z7jCXRzcdhbJIJMUX6tMp8WY67w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TiANovjiWXMD0dGYv01/ckYnpjM9hk/GlggCBKuZ9NE=;
	b=TGc2mjn1aRJpa/t9bBYL3RRYaqRNKUfWeKviuL02gziqkCsc4v0BSQmccpErcUx2xwWa
	 LocS2GOY7sD1tTLkWP3+AMn2YDobFO/Me/Rsu6UhXU4bPCswFUs63bqAIO7HyX/+0dbXM
	 xBWvmWq66IiCn5962yPElUJneUE2P+eArj47ZiUFXS6qn14MfTg217y4IPHyjf2fAYqwj
	 Jy16H0R4D8muwr4xLV5BY56oVgiCyTYIN3BJV6qAzKHpGXz0yD2bLmJo3AryNygEjfhuI
	 d8B6SbvzTT6Cpk9U4Z6l6frNJtyqms5teIMqUuF2r9Rp2ZArSWzy7SVDGSbANfkAjyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875761;
	bh=TiANovjiWXMD0dGYv01/ckYnpjM9hk/GlggCBKuZ9NE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RwsRW3zvzSVmF6hEtEPKmz+aVEaVqIYoi2RVVYNE5uyxQEFVVUvuHuIwxAX1JRlqu
	 VB+p2oBkV2DTlJzzVPqthM6CHT8+eFwYxMvHqgzNzV+G0RwD/+ZBTJCv1+IxVz9fJt
	 hUlY0tbntCBFU7GzbUuhgDRRKWB7iAA8uNacMx9RyUmsjor3vNZTUyH2x2bn40Xvy+
	 Qc3bbGV0StzHwmqaSxqNYdB4EYQa/Ecn6rRkdk634n7YaZFvkaeon9R6YzwwJpdda/
	 L/W/pdFu0dvNwv2u4fharF5EtumW+BCANuuUhKSZck5VOfG3ssan6SQ7BOMuGQqt6T
	 QqHwdrCppARbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC0080E37;
	Sat, 24 Oct 2026 21:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 045A22F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01CAB80E7D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbhmPGx9LIT8 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E48180E28
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875758;
 b=r1yWWMuwfw6qTZPUlfuaf2cI567V+KOYvN7b33nhFAVYKBiGr3kR10hrK7bMlsrmHFs5
 IC6pUZk/DsHWzrWQzmgZZT4ewVHcGa6t6pUbRITwCYIssFPuHbHcKTr1Irfu4NZ/refQ5
 Nbg2/YDbYvtlG9QJxXsednoFg/23DXshJ8NO+w2F4MNexOMViCJUnK07wgHFbV9nMDVrk
 7hbmC7Gu/Hg6I/hm7Lfq9hJ5o6txQnbbJ5gxI9eI178xRp9vObjuCggg0jP72T9Fryfbh
 NPJu/+x0igCAxWckOyjW3VwE/mvpspjN9TF/9PB54PUoRys0RIjjleNePGuynzFLPQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VfqXh8r+bHTPGC/rxgKDcTmjCLNJK2h6KzwTwXyZ0Zc=;
 b=SAw1xURonxixQ60e1IdqN2V5yf/Oh9SXgb5Jp7iP0DbJ4qNLXJQDaAQNNpof8JpKh5kT
 iQTBRIw2BQSfso6Q0bCARrmRWkt3uKMFxzXgi5+qBM88cJI2QIalQXjzcMvoolhNqmEid
 O3aOs0QYB06sw66ydxUJ1IXPMyNbubagTxSySQ7boRIpXy8A5NFIVuZfE5ixLzs6VyI6S
 u9OiUkri6IuIpabnoNAcRsM1lbxkPeY3MUnfcz7r1/akmyMGXX/6Ot/mGf/IlqLRkm0OU
 gkzdYB2PYkPu4Yo8t/jv3OFjrl2WVFP235QZ1BPu/FwM05KUFCKBJmTbBbmzDOkGI3g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E48180E28
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 300E29CC81; Sat, 24 Oct 2026 21:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:58:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1889206b35aa8e272e5a325cb037fd9d0982ae45
X-Git-Newrev: 92812b18fddb9217b18b1d1de9349af813760240
X-Patchwork-Hint: ignore
Message-Id: <20261024210113.300E29CC81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92812b18fddb9217b18b1d1de9349af813760240
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.4.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index cf228a2062..ee6e694b42 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ff70ecafe7f5efe02009b723d640a05dcce5016eaf0a6df60c2276df0deff101  intel-media-26.4.0.tar.gz
+sha256  9ff79e04075fa52ad9d5bc66154f508892241a61f85192d0846de9f55b9f2ef2  intel-media-26.4.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 1367d3a59b..ede12e9270 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.4.0
+INTEL_MEDIADRIVER_VERSION = 26.4.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
