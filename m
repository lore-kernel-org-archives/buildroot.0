Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952CC606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nZjjokR5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=cpT0lvnY
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696DE811C1;
	Thu, 22 Oct 2026 20:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w50d2Mljiwtv; Thu, 22 Oct 2026 20:41:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C00A8122A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792701664;
	b=JyoHO9OfTU2RNxVOlngbk6Xn4DFMAcETxGntxp7kTd8YomPprv4GrA8bOonY43cHNQfR
	 uOM/X/dK1+DRQ+Um55KnqYV7hjNJEedPZOZ3xSpAkyOBbUhzkYXi2fHtGLZ06JXD972/L
	 Rcjy249WrRVX2ZyfE1s2Os43YlAQgmJnDVpGgDW24J6RO9JNp2jCIHnPKrt9GHctBsfNy
	 ZxOXKkVuYkpRb+ScOZNQkghZvUGJBHEfIpoH1ijvbvOSVpuUl99leJpNGUEu2JjefsAmD
	 cIZrMxJB52jp112qiN5EJt+fw4JZAf3d8tlEVYr3sGb6S8NhvkRqDAW0j/nud5tlgTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792701664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZXbAsyX2KCnI/MjqM3qhJ0QoZnUHPyrmzX09djoDRHk=;
	b=RWd5ZZYj2qoxyC8emIIfQYgG17djXZuB3WgYtpQvRmH4CDVgZMggBxrvMIudBQxjXPNu
	 Sb1wCapVpGXjRZjKZtUz7s0QiLuCRHg9fKYvm3oL1fE1RGZt4dm+Gow4ueQTJebLHXqSO
	 DrRLt8ozr+7V3I2EpjJYRiyu+ZqNr3cTMuoLfgZcsNUZtfzWr91odsQEjfgvr490bvWBp
	 2W8TnNFQp2EtlfFoCEe/Mt/XwYEE4qfDycuQ1zZyHvfL9jflYaxdCEG1G1dAEv2qgUjSC
	 UXX3h4x0WTjIk1O29RuHYBQ2WlW+XC68K2YXiHnDcTLvhgXfRHEkjK1bkyK/QST1tHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792701664;
	bh=ZXbAsyX2KCnI/MjqM3qhJ0QoZnUHPyrmzX09djoDRHk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nZjjokR5M+S9/CRB0T1RuMxnOdrNzpzGSejvTMyMEh9tScWwc6Pva+MkTzJWG0m4i
	 uxSCgcsF90ULJskVg+WhV1mfhJdatb+wsNU0ghr2lKOvLJ/6aBXnaHr5SU3Xq+0ujL
	 Qo3XkrM1g2U6Pxjqt06HKWiweedDrV75bVuAPb+bkLUL6s1u3efrVtB5zpxeCpH27r
	 gHQ88Mel8WPAc27wDpax0Ictms4RkP85KPRRoDcd7lCwTvJewXx38tE1dsgVPMXk6A
	 lodb22p9eb/owsNFQtY1KY5j3QUA5gZK4PfOUrm3wNkjoBrSPdlpL/ewbQHmxVix7h
	 OJ/wTirzAmNfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C00A8122A;
	Thu, 22 Oct 2026 20:41:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C3333A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 222A14054A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cu6J6NEWF3rT for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:41:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F100F4053C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792701660;
 b=bfyiUVEup/4egOLO3Rskn5HZfwrY9jVEQ6xK+FQh5MItUam1uMlnJ0RTqm9A9EDudF5P
 e251mD3z0n3/J4B4dlNdY6X1JGjQzOblbqjZTSu0kQP0ctWrOpw/viOF9jQaq1RdIl7Yv
 YjgsOVdSf5xNnJqf43TsuTH1ToLUPiyj3DtH+/HvOOQu6fJVNULkkCix/IQvctgZTGcJ+
 PBgE/MSGvB0VjtM1E6lUeaYxdTY5YlKB9zUiAvckuwmWG0HHgbQ6WJU7NmlcBuAf2iiwz
 BbHrmNWFxPZn1zkiazou+kYXJGFMqFXmwkA8RLVO4LiQcmZ8tOMDrUAueuXMC8H0W9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792701660;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oqabiZJmxS6Hb1wt0M82GLCFfMoZC7NccEbBa/yTmYo=;
 b=tVlGijySWAE46VmtDqhdTQVvaz/OgEi7DhCOZikw3SA+uscmjxYUvkG76g2nx0z+5N8U
 ySBYfrPtqyOiTzN4iSpzil8dEED1CDYHwprKIAMjSWW3UgNrXtFommY9kIo+eRIkHYx0P
 s8BiKKu5hT5WoZFcVAW0MCACFeC+rRqdOAoSo9Sa+B7es78MamT5F9syZa1z9Q4arE+9G
 2SWJcSAphooNjQwYKD1/XSeUvFhJgtGu89Nh3CrJoDqNYyedHbyAtyYTYhFfEDTOHsA2h
 Lyy/KZEIKbl5LTOx4fsngE+Ys74n1d2m9/5+BmtCaIbFbRhBY90bnZTZgFmC6Zx2I3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cpT0lvnY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cpT0lvnY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F100F4053C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792701657;
 bh=oqabiZJmxS6Hb1wt0M82GLCFfMoZC7NccEbBa/yTmYo=;
 h=From:To:Cc:Subject:Date:From;
 b=cpT0lvnYiWzEne1/qHr96CeDC5CK+mU2O2x8mTX2hLCEETlY2eIHSqAbz6oujeWbE
 EIaKvZKsnpFDbgzz4w2mVxJGCEVf7TN6PaHTdocRVs02ub2p2vAy/5bb14XQKvWqSO
 dff9NtpSWq3bH9VmmSdl33G4himOaXW3aaaxtz+bQjM31aVt5jGIOdpy8p3wg14PfJ
 YLjNpbSaLut9IuFUeYpofltiVbD2ehbJ77WfV+gIKbgD+/V3KplyoHcRXBJFbIAT4B
 f96Hy0ps5HjMDdyOYBmCKFtPgwBK7UsFYHIiT6z8GV38M05gnYfmqLabWUgFCIdBTr
 dIyAFcDZjqCWA==
X-KAS-Sym: v3:f51bdf72230551df:RV2rMlYB4NYuZGUMydTEz3YcWpBRbzLbZ59Yev4HZ63b3
 +osv9gkDoT5rQOW/FaKJ1T+p3iPn7RT/tlJCAIbI1z1ATvY1lDYmpoD+imgGztb29uN4Cd8a8Xi
 9V6DfrM+aXfRPsZvZ3nNwzT+CVE1C0BPSBLEUo3Q/GqYJktbCbPrbZM1IJXelnJ04Y3mVm4s7sj
 UD8XRAb4MAC5Bk/4sAD/UH0Ayt6b1hj0ys6P5vGO4YY5c8er35sn6rLfzxjuXBQiRz32QbJSi7p
 SO8G/5V/BOtQAys/NmnQd1947rv2gvf0kcLC7iVXTaET7uHU7X0/e+fdNLB9fYZF+PzXWwKA==:
 TjbGfcdkT6CN2XgYPjT8TIBXzYERW5k+J3d50W8XawefaE73/l3hh8oU8t3odixbTgHeh8ZQ9/z
 b44jcRsQXUfJQOZp6QjkEW7FfvkM61FyJskhCqhjKqoZq3iwZCpef20P+AYsnbVAsvlU0HFnKab
 noJeK5mA51qPEFLSRMBBVx+Kxhsgs7kMsNwiWIHl+iSq0+gOXLKAgXXmZYirUC51uuI0tA2+wSn
 9AH3JVA1CfDhbD/m85KwPtTf0e6daGSt//qSKWMeisObFKLRoPNHZ4NxIUeepiCJzve7Yi5BCvB
 1R9JOg84k8TWav/fW4PLgM9wHZXYZ1itN5bSc+khVG+tQs+cFCPgX3OztR8qnuWlBijc0T8cB9g
 ww3Af/cffX3AlkyW1w15qvPbCH3vHVoVBy3359AgL4IhocvvSSoJiQbCh+h3IPsumQKLYe/ptTd
 s2jxQm50XCvuAFgt9vH63ofSAJJJx2zITZQXzTvNAw8sDuGUAj/52oqxlCb3cWoAfMJaxqAicEb
 KYqeYhdur6Zz7iBRjGmh+LNiqIlDXlgK75qKjqHEICNK3RsM6Sjil/1C8DcJnnsyUCJRAFRLPGJ
 uIHs1mqovZ0x+PEjAeWZaTwqeqhZuMbrvkVAFxMlw1To8AHOpJkbMy3DGnUgZpJQJzZSN5bp6ZQ
 HSYxPTvrS1J4d
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CBA5A4C6388;
 Thu, 22 Oct 2026 22:40:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56688)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJzaq-000000007jd-1OYm;
 Thu, 22 Oct 2026 20:40:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Thu, 22 Oct 2026 22:40:56 +0200
Message-ID: <20261022204056.2236446-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: bump version to 1.0.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/fribidi/fribidi/releases/tag/v1.0.17

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to upstream commit
https://github.com/fribidi/fribidi/commit/5d829288e00b9dd709c8050f469ad0b2737f822c

Switched build system to meson to avoid fixing autoconf-related build
errors which would be introduced by this bump. Even after adding
upstream commit
https://github.com/fribidi/fribidi/commit/1d42f35e26f7ee4cde23a4103ace0f9f4f86a1aa
the build is still broken:

cp: './fribidi.1' and 'fribidi.1' are the same file
make[4]: *** [Makefile:834: fribidi.1] Error 1
make[3]: *** [Makefile:507: all-recursive] Error 1
make[2]: *** [Makefile:416: all] Error 2

We would not only need to add autoreconf but also a _POST_EXTRACT_HOOKS
entry to remove bin/fribidi.1 from the extracted tarball.

Instead of fixing these errors we switch the build system to meson which
is supported upstream since version 1.0.2:
https://github.com/fribidi/fribidi/blob/master/NEWS#L117
when it was added in 2018 by commit
https://github.com/fribidi/fribidi/commit/a991b009b11fb791a9217af23659b092eb45377e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0d3b5398d3dfcfd3940852f1b65d21f53d2a8345

with the exception of an unrelated build error for target
bootlin-x86-i686-musl/build/ffmpeg-7.0.3/.stamp_built:
https://gitlab.com/bkuhls/buildroot/-/jobs/17395269501

 package/libfribidi/libfribidi.hash | 5 +++--
 package/libfribidi/libfribidi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 9da9281c85..38acd814d0 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,4 @@
+# From https://github.com/fribidi/fribidi/releases/tag/v1.0.17
+sha256  6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2  fribidi-1.0.17.tar.xz
 # Locally computed
-sha256  1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c  fribidi-1.0.16.tar.xz
-sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index ca0a39ccb4..1a275c5fcf 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.16
+LIBFRIBIDI_VERSION = 1.0.17
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
@@ -14,5 +14,5 @@ LIBFRIBIDI_CPE_ID_PRODUCT = fribidi
 LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
