Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20671CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E52B081198;
	Fri,  2 Oct 2026 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBBO7UBAsnSP; Fri,  2 Oct 2026 19:38:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7AE3811FD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969917;
	b=ZxGy2mXffbIZVR41Cr3xvbW5RnV6n9XWAsTOn7u1Arx4rb5Nr0jnfj2pKTvDBn/jgR0n
	 IjKsP6xRai90/NeLlReo3QlqdR8SpApF8AL2GpkNSyfaaV44qNmo8JfVSWFsgdJt/++q+
	 10PbvxmxEAynD16PSQXLZv0+XdDPGe5f7fgfN8iYmX/zs1saFTOAseaBCuoz+KKJD2Wtf
	 Q1Lnw71+sGXU8oDDh3Rbgad2pUHsViqKEw8nqKZoEZIAK0fqdVa+1xX8dTjnvEb1Vi+Bg
	 GRheQ2BPBK63/KKHQU2fPq0nrD3lbtFObbZX/7nj/YIH9WfXSrSr/Zng3V8xaLY94Dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969917;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=H+xDXimiLjODR5rkUg034qaSIx+E3gAy03P6vRW6HyA=;
	b=VwW+G7qXq+5MYG/e2hyvsgfzulp8HuWbs0hVo5IWIJFcDJPPtifejkskI3fnAuhpaOSl
	 Ge2QVKjPpy2fy74ptcmonDXREO2jk4vLkTNcHQgPbqZeJuNXbWwDNWOB6YOI5KBxAUDlQ
	 txIpK3h1NfHqYGfqEifYBlrk46cdKWANgZM+unVyKCFOgvGtoPkzPe3Zw0EFlkWgITVrt
	 DuRarAQmBoQcH4SUw2kdwR54VkxeX7DlqsHU1hzvIHgBAmTMdtoVYiALyR3kF9NMOJsSQ
	 MYzMVQBqw94yynkRsvgoUKIfYJdR3PE3r889rBYFMLz7u3vQPm3NMC+pdCMKY8lCjBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969917;
	bh=H+xDXimiLjODR5rkUg034qaSIx+E3gAy03P6vRW6HyA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sBoWiny4kbzMT+XOCixm5FjLhzbAcuNVkmREap6bjEksUANfVUDMcgN4yKag6/fIh
	 nsbAfka0FdTYTuEmyf2jH7d3UhvcsMNhQuw/742Cuu7u/6mYgopMBHNDHRBYjmtf3C
	 jRzYOxj9EjQMZYlhDR+6/Oan+uP2TqtxYX7zN+NF4gjTY//LwEyDsE1rKYzW7c7jQz
	 bZqTnpJCyPSGodxJ4rua0GQeFvrgBYZs8han+PhnvPAQkSrnddcXuzbyb17B4M8HaT
	 3aP5dYxl4W0MbBcDG04zNWRyvTyh//K8w/6GLfY41jJaMhwfU5WEo+9uYcV+3qoCZy
	 oopMzDTgiYdww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7AE3811FD;
	Fri,  2 Oct 2026 19:38:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D74E2282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8DB360659
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNtqTZipZnoT for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:38:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DD28E6064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969914;
 b=W76ntcim9MHHm7xs3CCoabDMVa50FzKz9tH4NpDFSD1eljSNkoR/jaWlpquc+m9jlmtz
 3zOO606duhjeDug4flVLTkj1NEevAVuxkwUpoEO3dl7uSdsB80G6bGdV+3iT8V13ia91o
 YZseCa1Y4M3QorZWMEFOqX+Gwf8K1k2EHwP5dj+6AS8aHZ3PcqHNJLmQJJc07vcd7jiIZ
 nmfy7fGYR5BRWjvoC3sMtsxgpgXGhq5gWcdOJphNlsrWfycXD8oEBBbNqusG0pVcDzEUR
 LZk+eSxmXBCFoEZamzEALxPetMviirbiUWJxgQhVEI4yTemX4G9VT4ms0MeCUIhwFeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969914;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1RTqNLdCTk0t0jtibuNp2n/EgLYCp6fMCcHoJIeg0Xg=;
 b=Yz6o2OIbPifEfmDbtOgLt60BZuo0nplpR0Q65IJ/YjPzDPOhGKXyDHnpXmjQSGgKlXFw
 d3uSZT1dL2pnW6CxYVlulri2xzCIlOIk8/Agxd13qCHRvqHQX3RFNeaE8esA06NEQfOOx
 TKmIqX81yQLYVSgDvKvnRZ1M5sarN1IynJvLbZDStGmDj5U7And+qyKpZKH7IWcfyO3WC
 L87hSWnvbuYK17pupIYSdU1/iOQKGiCFqEw6d883dNp/Nd/8J8LNNj7fVtPXP/q38nl6w
 D5R5B8PdZboKRoQ5P1t2Fh0b/d96OLSQDpxe+Kkqn5WycBM1Ga1o/ocZ9ddMasSZ0Hw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD28E6064B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:38:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D62D886BD; Fri,  2 Oct 2026 19:37:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:38:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d236b45fc43c3979eecb183bf2995dddc4b3aec0
X-Git-Newrev: 12961c9a23ebd76b2b5de44770effebe6d08bf8f
X-Patchwork-Hint: ignore
Message-Id: <20261002193720.6D62D886BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.5.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5785739725956686783=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5785739725956686783==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12961c9a23ebd76b2b5de44770effebe6d08bf8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop local patch that has been upstreamed.

https://github.com/harfbuzz/harfbuzz/blob/14.5.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-fix-gcc-4-9-4-compilation-errors.patch    | 63 ----------------------
 package/harfbuzz/harfbuzz.hash                     |  4 +-
 package/harfbuzz/harfbuzz.mk                       |  2 +-
 3 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/package/harfbuzz/0002-fix-gcc-4-9-4-compilation-errors.patch b/package/harfbuzz/0002-fix-gcc-4-9-4-compilation-errors.patch
deleted file mode 100644
index e3de881e9c..0000000000
--- a/package/harfbuzz/0002-fix-gcc-4-9-4-compilation-errors.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 0d0b62575f2a52710d1fc3d59ed375cb3a50701a Mon Sep 17 00:00:00 2001
-From: Kevin Hellemun <17928966+OGKevin@users.noreply.github.com>
-Date: Mon, 21 Sep 2026 12:58:03 +0200
-Subject: [PATCH] fix(gcc 4.9.4): compilation errors
-
-The current build for v14.5.0 fails to compile on gcc 4.9.4 which is
-used on embedded Kobo systems.
-
-Ref: https://github.com/OGKevin/cadmus/pull/1005
-
-Change-Id: 7a4bec5b5418bd0921b273d8d4a1e79b
-Change-Id-Short: spvolnuouvyr
-Upstream: https://github.com/harfbuzz/harfbuzz/commit/0d0b62575f2a52710d1fc3d59ed375cb3a50701a
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
----
- src/graph/graph.hh | 2 +-
- src/test-result.cc | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/graph/graph.hh b/src/graph/graph.hh
-index 0399f7f3e1f..e0e733e7e61 100644
---- a/src/graph/graph.hh
-+++ b/src/graph/graph.hh
-@@ -635,7 +635,7 @@ struct graph_t
-     }
-     TRY(r);
- 
--    return g;
-+    return Ok (std::move (g));
-   }
- 
-   graph_t (const graph_t&) = delete;
-diff --git a/src/test-result.cc b/src/test-result.cc
-index 9d487d4083e..b7b93a4cbe7 100644
---- a/src/test-result.cc
-+++ b/src/test-result.cc
-@@ -433,7 +433,7 @@ int copy_move_counter_t::move_count = 0;
- static result<copy_move_counter_t> return_tracked_from_local ()
- {
-   copy_move_counter_t out (42);
--  return out;
-+  return Ok (std::move (out));
- }
- 
- static result<copy_move_counter_t> return_tracked_from_local_with_tag ()
-@@ -445,7 +445,7 @@ static result<copy_move_counter_t> return_tracked_from_local_with_tag ()
- static hb_result_t<int, copy_move_counter_t> return_tracked_error_from_local ()
- {
-   copy_move_counter_t out (42);
--  return out;
-+  return Err (std::move (out));
- }
- 
- static hb_result_t<int, copy_move_counter_t> return_tracked_error_from_local_with_tag ()
-@@ -457,7 +457,7 @@ static hb_result_t<int, copy_move_counter_t> return_tracked_error_from_local_wit
- static result<move_only_val_t> return_move_only_from_local ()
- {
-   move_only_val_t out (42);
--  return out;
-+  return Ok (std::move (out));
- }
- 
- static void test_return_moves_from_local ()
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index bd025fb515..0d465e7c6b 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.5.0
-sha256  b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9  harfbuzz-14.5.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.5.1
+sha256  7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6  harfbuzz-14.5.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 71eee8f93f..f8f512d5a6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.5.0
+HARFBUZZ_VERSION = 14.5.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

--===============5785739725956686783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5785739725956686783==--
