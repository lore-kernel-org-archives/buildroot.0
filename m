Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BCCC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB0040EB7;
	Sun, 20 Sep 2026 14:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oX204QlhWxI; Sun, 20 Sep 2026 14:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DCCBD40E94
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915929;
	b=Ja6Dneo5RV424tV5VvC/MNkFEMaIxzE8cG33Mz8C43jexRi5gZQQC4L7EJQ0xylWZkot
	 wSjT3+sg2Dksd5rz8AXemyh1kyjhwRWhdaC/YHhubuelzWSxyvDpPkiUDti/6uNi55zdd
	 GUAeADF6a7+5EO/V/YZpXIS7AUsefYUn2FiZ86GUVmQ2gD9zOu6aGjGGTMi4x5d1Jb2sF
	 LXgyH/7siOJYZ291coe6Ljn6PrnZTCcceaGug4g3fdCiNGhQJqVNHfyyhGIdw9lihtD+p
	 pZoc3GJByY11Clj4+nD6qLzQuvl9Rovq8dMzky7xB+LPx+TCwQAy/VVHytbdS62GY5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=jkpwzhgE1Ig6sLZFtTNoeu+5vYH0tS5awgUD1f55hD503kL8kYEqyldIDMLSBlnHMb48
	 txwppnxeiq+7r9y+zgWuJZT/TrM91MRtm+Sn2QmpROlKjT8dxfzOD+Lm17JvA3o6ubosq
	 sYThVt0rt2OLZU6mZJdC9uEv5C5WlROsmuVoZzWlaUOawkou68GTE6YU8/YpRkgm+Dg4W
	 1VE1/FRtaA9IYVdv427rgQMqIIt7t7loqptkYFAS0Pcb0uoYfssq8tgaZyjvcB2k2QPjD
	 bVfAH36zVD5vrFoVVX/HXJEyRWqfOwETrgHY12CHrawPECWb1l+yUY7UFL/LRwZlJJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915928;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlXqxZpK5t2gfTSJo2R97JB1/V2VBbgs4YFH6j6TcaeF6CTR3dVizbSdMOFgnQ/50
	 JeMkP1biHMKMn9PzKJIFMSKQsSsY1lO/ITkSf/YuSLayIU7a7aLrYdPsRgVnALZXBF
	 DeQPKxc91pl8XMqi9HpnlnvQGR8JZseawX4TLId+qj3XUnbr751O7zAEptJ5Npb+mB
	 YNauh49CRpKA5pvDr4QggzKemnvN7+CA8r6cnUpt8A5+mM6SWUWHCzqH3FAxU0czzf
	 QZ+EY3u9ahfKJkqn8Dqx9p8imTTAU9XGMKDbjC1lTR1kTOVLFsfbP9hfOJmEE1pzbR
	 FHXlkHdCBt75Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCCBD40E94;
	Sun, 20 Sep 2026 14:52:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57D3924D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A6FA4002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeZnnEZaWDRQ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:52:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2216740022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915926;
 b=h1wPkKyx026j+t1pFCYgtkWd3lIRXFoDeWt3Q+RSYIYViVzufzOsqNZYmvAIzqL8LgYO
 paUON1XHtETatNVN7HnI4PXy6Sx2EVNXgIVFDip9iXfr5uOPMZCaDX9cUDY8dymuNZRWK
 kvNucRpt/5ZMDzJU1X13ag+h2eQhpoaYtigx4ps68k9Oxrh9qh+9J6e1Z3tit7hrcl97Z
 XaBEBcw84pSfOWMiMYygUDVBC7rRDEDDbF3/6+AC1DeflfG/4LSJOMpjAHZiL9rdqgwBu
 lAOvrfay7amLT8mswN9bvtM19+TTJrGGZV+frRFYX9ykyb1WD5qUjsDOO16GOOyn3UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915926;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=FaKItlxNkcv2KUJUUoShF0+zApAf7kqqeoHeF+ADZ8/xdRMKFuaL0yalAyiKA90dBXMI
 3MPpkYIwwcbTfzUPaEhEtn9LcXaWRwAIeZ5P9ss0DWz+AwsYKRyU2YI1DUKYpL95OD48B
 EKzBVVQTyihMJCP3R/c7cPuwD6ylNFuQy8ZyP1lypGNbAFNIM/Y38cEXS2OezCg/v8uVw
 AzsMJ5u85h/3JZHWJP25EYw0LYqfh6grG3hLU7vFn5UHpWNJNs/lHb1wNHTjOq+swCjha
 IQ9NAK85xSsvuJ2KXITQfHt6KwBuZoe7kfhzQHZmRaQ71SoAg/oFh26xQ8e3gREf/sw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RdDLryJo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RdDLryJo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2216740022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915503;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RdDLryJosQnmE3xj+ogCPqu1zpYbRW/5gqO7GVXV4OXXC8chHvmLUiuiHkhIiioWf
 f+JsoNTkhvjrBBK2hmbD12ojkO+FhSbdJJw606N4FuGgFoPH2eqBPzYpO++qYRQku4
 j0KYdIevOivzKXfS2uXLokeeeOrlWvDMl3Um2U0tO+E0Iv9pi5HNkQO5+qhCcpdpoB
 NkFoKoUjLQnNoQ/xon4ne2+136ryWOJxM2uIgy813rZDiBoiqLWlRSb8IHCPB6/bkY
 3K/XG6pQ42CJWEoq5CFdyTmxRDJzWIyHWpk9sUttckV6F75FvxPAT3BsPKEWrqYpn9
 aMcg1FHAetTkg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:sIjfj3VGgFt49yiiepkAWMk7fXUXLa3y9KcQ8Go5cQ+QUT0HGPO5FsSuGTgWX13x41jbtf5NxWo9H1qwid3FvjAv1mHI398tRw/aLj0gZNZel/35eLqvcEz7MG4UXzvrrRojNsNYWdFYL4jcJuEP6g/1FvM+I0qjZcJmVZUs6i5epOutrOy+82XNpoYaXhRh3wKUKzUsjH8MZaxGerNNi9MeixKzajKc0eaQL0lY2FX+TW6kgkcyvQQJAU+Bo5Uc4d7mIeI136azKvApbcv1RBcHehegDtJbgtZw/qUpJCMIqC4S1MwEOcq0CkYW0FwXEOm8yr34pRGrEBbu8W+R0bgbA51rUZW5ozj4ZccBEAbidgKlm1tdoBzQNdNHMpd3JM7REbktkw6gn+PvW/JJyrNxbNBMpAZwXmoJ+fNWWRbZ/uSSdBENg08TebQ/a6/bvy9ugHDdSEk9CdN494cV996+Zui0daZnagKdgiu6Xp/F5xyOpis7X6RIp8yJlhA9pAxWJKEuzBYh8jVPkFbO4/YFxSNt5gRlDGshkh32v2zYQVGAjHoJRVnKbSsKSFiNgStNQwVaJMSWhmFbfujCVmEiku3FzUo=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4225A4C4897
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imj-000000000hB-1wqR
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:59 +0200
Message-ID: <20260920144428.3009612-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 38/66] package/luvi: fix build without c++
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
package to 2.15.0 which first included upstream commit
https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
that added the miniz submodule.

The version of miniz used by luvi contains commit
https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
which removed "C" from the project variable causing a dependency to c++
which causes build errors when the toolchain does not support c++:

-- Check for working CXX compiler: /bin/false - broken

This dependency was not intended so we add an upstream commit to fix the
problem.

Fixes:
https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eLists.txt-only-require-a-C-compiler.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..c68e05bdc7
--- /dev/null
+++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,47 @@
+From 383e551cccf41fc2ce1177712d6a37a85d936642 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:56:00 +0200
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Commit 05ab4dc05c9d1e1f951f5849b659e2c7e291a620
+"Add some catch2 tests" dropped that C flag,
+but should instead only have added a simple
+enable_language call for tests only.
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/miniz/CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
+index 156df83..e0933f8 100644
+--- a/deps/miniz/CMakeLists.txt
++++ b/deps/miniz/CMakeLists.txt
+@@ -7,10 +7,10 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+-  project(miniz)
++  project(miniz C)
+   set(CMAKE_C_STANDARD 90)
+   set(CMAKE_VERBOSE_MAKEFILE ON)
+   # set(CMAKE_C_VISIBILITY_PRESET hidden)
+@@ -309,6 +309,7 @@ if(BUILD_FUZZERS)
+ endif()
+ 
+ if(BUILD_TESTS)
++  enable_language(CXX)
+   set(CMAKE_CXX_STANDARD 20)
+   set(CMAKE_CXX_STANDARD_REQUIRED YES)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
