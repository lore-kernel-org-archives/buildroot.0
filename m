Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A9606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Rdjg04Tp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC7B608FE;
	Fri, 30 Oct 2026 11:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAHLp_WstFOX; Fri, 30 Oct 2026 11:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECCD56079D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793360122;
	b=kDgD+6o0K2E5ZkHQGp33bznHwgvFqJZdRiVjqY3EVzXTumwbPHr1PEx6cl4+h19l4aRe
	 ppt80U4Ixck/jh6kTp+s6DjQ/UGZ+J8xs/raJSdFWQAX7Kzc5rXhg6Gnd7fFyheV7O98q
	 DSq5tva+gFKO8rJ/LlT9e7xGfPjsM7W3hNQbY6qzsYe3EeROMeLswnbz4uH6WjUPSc2sj
	 mh8ksR+j+xTpryoXL/7P66RYa8KIxWPm9d+UidHfRZEffQxuC2PPlRxYjJdorOBhELOTS
	 HCBUrEyvufgKbG44hSL2skFrb4Evgx0BloLZzri1sW5as7Tg/yvCvsH65buLZolhJkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793360122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EE4UbJoPcfU5NRQFdQLOD7ox6vwoWoPVubGtmKkLqZ4=;
	b=DJpGQc++DR6neOwAggZMvlp6NWo+ghmdsmq0c4u6/YidZ79nt3GFZcI/yKieZHgN+3n2
	 JIWWGt55wy35LpRfjWRiHU0wsuyR5MbXCOEfyvSZFmPY7Ma8q+fsgmdC9P426lzJxrnWw
	 475iRMsW7bGohPAFjnriaL3anNRmrv5XzjpHwzhKlo36i29i0cqSDyvmHGy4kablE5gDx
	 q7HNHk3Q40W8veE7+qJuByQYJc/IE74uDIkGdWSSOvsqqYoQmLeyMnG/1uy/moqeKf/10
	 5/25/NLG6BpYTWksmxpy8BKn626F0YHnhee8kHbXS2elNqlcqchZJ7/ldhcky7Ee/KA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793360122;
	bh=EE4UbJoPcfU5NRQFdQLOD7ox6vwoWoPVubGtmKkLqZ4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Rdjg04Tp+NezKl10sQXFBPt/I3/kBicJzHTlfVrSh+kfs8iiugPQ4zRlq/PMAvO2K
	 eEVcQKMuDRm6AWp4B8vkQm7k6fko7AqQNoB+5XqKsq6PmCQWdL3K49uhPCHSvwst/b
	 nO3wX0kG0OfXa3+h4m6/SoTY5U/fnmlMFllnpLyJ+Mkb/Vu+oMjNge81oSWCNnMIYX
	 Nb8gz2NxvDm7/kxTDyc/5t0dU4/IsgZSU1q5j85AB8H+xq2noLC5MRNWq8IPneCsj5
	 BONlhwzS63jZEfCENH61IwPYiNjaji3y4oa8hV/LebW+k+8uqEED1yaAw82SrabhfR
	 5lyrcbvMC6ZSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECCD56079D;
	Fri, 30 Oct 2026 11:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5FB44BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96EA880FA2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaZJJeShHAe3 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6DD7680F47
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793360118;
 b=tKxOVuvQPPRTPmtxs8f8OHT724RqBWXDgj0Xg6mh2RbxKllzpg10wnYyOVZhZwT+VHHh
 VWTl9UEvZqb+YRWIVkkaL7Z+KaynxJ/lcH+P/NA45lAhfo5tlzaGEuuKsJvUjqhbAzbIR
 jWdnKdqKC3t694/JYzQRziWEUHPdN+Mj665NG/74ojMbE+pPhk7Z751a8gR6+4ryI86KM
 Mbr8zQdoUSkum2WeAoDL2FobNhfBb2NrauDRhvcocFPIhbxZt0OM+QKbOpJT+U1yjZuIJ
 /Gicx5B3umJTtk3GgzhjIIe2FRjafNjTEC3HG0QYp7nYxc9NEz4p3aTuz+Cjwk1ajdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793360118;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4S0G+dj6wI+iGe09fxVe55a9kZgbn3D3xMZQxVRCCQI=;
 b=pWVjoHUgPwjX/AXoqsRYY/dAgAuwjo1fpWBCjYsdi9BZQt+fUH3wqsm0/1ghVp3+mmUp
 cwlHd9Bh2SaSp2156xLCxxvH+A4Fl8lZrQFD3DsBIM03GefXTnPDvb1EJKPQw6uTXMiJe
 EqHwVyaemSYmmTs6BRcnQfoQeJZbad90kRnmNVgR6H5En9HpRfnjVSu9UKhOa5ffcqh1X
 o1xar4XQRqJ4zH9GH9C1uX2cmmDIv31oJlCj5XF3dC9YSZ7CUFW/on1biOiAyw7luPTbW
 QmnnV1kQpjMjZB2FXrBMwTXoJS2p4oQp5x64G2xcL367MmNKXU1/lSWcoZnUQM7cu2A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=mVLoOty8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DD7680F47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:35:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c468bd799ecso68155066b.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793360116; x=1793964916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4S0G+dj6wI+iGe09fxVe55a9kZgbn3D3xMZQxVRCCQI=;
 b=N+l7Rsk24iygaxqsA9wXAn/J2tjh6OOZTZHVb3s7cKSD+RpHtyuJcgsjqDabG8GZFQ
 7AnZOKS3TVFHHSdXgZooMN+DO2nqZh4Dy3mawmB2zA1nSY6MpsJ/GQ9QfJz1C6/Z0HM8
 I5Q8qA2ttYYkC7gM852cLUNbZem4Z8oMARuk02o1OyHH3F3hFAd/7ipS2gIppCylEKcC
 wXcnnJwNVoxcs87hEGqWYAxFKUBRlsMfQ68NnUbSSmCI6viExkfddMAr6pTbLwfpmjMD
 g8cb+6cU079mkzW4q17Mf7mzEypwNdUaiIhfibkHoF4yeiVw7K5U8Ip9r1gGLHCfrYSX
 6RHg==
X-Gm-Message-State: AFq9FYLUosswIJQmzibmT/+Wy9zC9zAhnfCLk60qwlQrcpA+LG/QtNAp
 9hJ8OXCZS2w+fYo09oZljR1D1OEqSRhnE93gvpXtaLqAzRSy3Uv14Oo/2/ZUXQ==
X-Gm-Gg: AYBFou1axKRziqR7VVrRdMJpbLPPcuZa3eM93xAlBNZEw1EbqjUpWH+I8RNiI7Fqafw
 trV2Tvp5PyP3pah1YCWyFAPHc/KoRbWv7vrDQ6TfpFdZhP4jG841GW89/YyKfBaUYKlPxXLKicF
 voQm82kp54f+a9ayyEbf6Xlp9EWTSxutyB+GdUtJ9Nw7JX4AMq2exwl1z0ZfTJ0O9Y7cHx/Jhfe
 VmWFMTS0oikcjtVU/sPVa5G2AH7PO3rmmdH5hKP+AY3pQKAyZm+8YZwzd0ySIzJN7LLnG7PySL8
 3zJgXQiuEYMsECuMjl14AQzmB4KjJjZiNA4qHYUGtENWg3VTv3tQ/DIEJH4kBfqcBD/FzvvPg/S
 TbUUAVTQkaidfwqQR25rG2eUw/LLlzQ8GdesQboeRi5A0l8XFJ3ae2fTlve3esu+Nq90/zSiPsS
 zcYKfrYYbvb7mp0il85PrhwOhGbXuJtUBbOJzbLjb7QPYIGjSoNLvPR8f2ch1o7JVzeknjZbala
 a/lb8y6AOM+Rd2aBNIpsdwgz2czN556xDqMkuRoAQ27uAfTWDkVOjkj7Bh8YIwPInSSWGcMD2V/
 zFNsJLszY/8ipZc6RPmcSWNb67gpmBXa+LYq2InyZhQO6YlhJnMHgitKcbc5VNxXnDbZFeJiK+E
 SbfHL/56M
X-Received: by 2002:a17:907:5c5:b0:c3f:8c92:3b5a with SMTP id
 a640c23a62f3a-c4ca7a41ac2mr184279866b.12.1793360115817; 
 Fri, 30 Oct 2026 04:35:15 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cab9dc577sm57195466b.0.2026.10.30.04.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:35:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 12:35:14 +0100
Message-Id: <20261030113514.1090450-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030113514.1090450-1-yegorslists@googlemail.com>
References: <20261030113514.1090450-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libaio: fetch from Codeberg
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pagure.io was shut down in 2026 and is now a read-only snapshot that
no longer serves release tarballs, so the download fails:

  HTTP ERROR response 404 Not Found [https://releases.pagure.org/libaio/libaio-0.3.113.tar.gz]

libaio moved to https://codeberg.org/jmoyer/libaio, whose releases
carry the original tarballs together with their sha512sum files. The
0.3.113 tarball is identical: it matches the existing hash. Point the
hash file comment and the homepage there too.

This is not caused by a Buildroot commit: libaio has been fetched from
releases.pagure.org since 2018.11, and all maintenance branches
(2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x, 2026.08.x) use the same
version and URL.

Fixes:
https://autobuild.buildroot.org/results/0019c80cc07db35d11241c516c04a0ad3e00ca57

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libaio/Config.in   | 2 +-
 package/libaio/libaio.hash | 2 +-
 package/libaio/libaio.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index eed843f44b..6796035122 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBAIO
 	help
 	  Library for doing asynchronous I/O
 
-	  https://pagure.io/libaio/
+	  https://codeberg.org/jmoyer/libaio
diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index 4ddc97334f..f37e4cf4f4 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,4 +1,4 @@
-# From https://releases.pagure.org/libaio/CHECKSUMS
+# From https://codeberg.org/jmoyer/libaio/releases/download/libaio-0.3.113/libaio-0.3.113.tar.gz.sha512sum
 sha512  65c30a102433bf8386581b03fc706d84bd341be249fbdee11a032b237a7b239e8c27413504fef15e2797b1acd67f752526637005889590ecb380e2e120ab0b71  libaio-0.3.113.tar.gz
 
 # Hash for license file:
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 16cb502f16..0512c6a728 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBAIO_VERSION = 0.3.113
-LIBAIO_SITE = https://releases.pagure.org/libaio
+LIBAIO_SITE = https://codeberg.org/jmoyer/libaio/releases/download/libaio-$(LIBAIO_VERSION)
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
