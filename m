Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EE2606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T+9zwn7K
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3459E81A64;
	Fri, 30 Oct 2026 14:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8iruCTDdd8i; Fri, 30 Oct 2026 14:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53A15818D7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370057;
	b=EnhFmQ6RYVaSQAdnu5mFrfnstwYgBWJi5Y1PXnXI3C4mDD7OSQMoK7rQXM75MgMFd2Ll
	 B/eCY4NJZyQZPJJkjIsuGkQ77KzDfszPWKE/zONEF00+X3yr82kHDXOrgD+flzmQV01TC
	 mQ3PGRe0aLa5n/Oz/a9f8AAe8Mj2aqS/Z1+gK9IqmSYn9GzyDfNw9N1bWCOkDabCc7091
	 MDiR5dYR+PxodCu6XUkVzSSGfZ/AX661c9s5hUglm8+ZqubPcNgaAeW3MmyDa6+xtZ5+z
	 aDksSio2ZCoFcKxnIw+A7wdsiSjFqCf0IWCk4fECqOF1Ul+pg7dC/Iye8YgmrCni/xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=GpD5lCkMJwZsaaSbcbqKuwuYuYCPIPkCBRjZ7J8PnSY=;
	b=Ro5kK/uauEPL7l+JMKMqXniHxR3eG750dx3VrNPbRn0tWpL/lr7emuIi1WqUuwBzJdST
	 tzaBoUCD24pLDeoLx37OBNPmT27RCXHfIoI73LoOwxF38yyuaWi13v5WEoAWuu2uOJPEm
	 heN9rm/PehOgcLyXA7vtOD8s8UmbMdBi7umbOh9Swkuxkm3ys8V3q4txCXhoM3FNKggjt
	 8zahYxoRi6MGnVUY15RfvcJ3irJiTV899AJwDBcGPrV3foxnIn9j4hr9kTRxutiShfqf7
	 XAf0jDLOpAPEeKrcLCGta1N7Xk/eDzBoSRnC5m2NRX1OgF0kDCVwIA51ytobHZ8hiaQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370057;
	bh=GpD5lCkMJwZsaaSbcbqKuwuYuYCPIPkCBRjZ7J8PnSY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T+9zwn7KuxZOD14YPv8HpfL+EGPugo0/x/XmJMFrt4mC4gSVwLGwqR3Vpv5Ee/nG2
	 lLdFz6RfAroCFOHiPdfYx3HenzTjpUW2b4EhmF0OfsXf8L5cKlX81Wp3H7W1zzcT49
	 dlor0zmY8vQIkKoeOl36AP7l2PbIUKL9yErB7e42CZK3F14qHzKVT11P5YT8BH/SOF
	 x7nLLyFI84KWZdOowlYBf1jfZdYrdM986otLHUZzfXFs5RWOHVB1GYOPaWGTGkkeSt
	 P6kpkhaWOGPTwGVpq5S5dh7YsgnfKvWJJD2vhtL9KOqMVmQ60zoLbu0CBEeSpvgMr7
	 O7oozGvF9Bsbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A15818D7;
	Fri, 30 Oct 2026 14:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A0E3362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 503FD4052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4exFdcFyO8Hp for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A432B40243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369897;
 b=JXLsDvQt0h1ruaXzqsej51PXnoKQQyN2RSTc+Y52jMrHTF09neoN0QMWJnD4yTez1cKI
 wRGk/IbdZ61vSaCpwzoUubCCc8kMCEKZPcQ/4It/a5B/Vrm1tNq3JNU4tHDzdUQwxaoVF
 3Mg75oXz2GfZt5zHOzxYraXSihIKpHiGT91SYAeJTO9qNZbgl/nxhyRzjv2HVYwqbZcTu
 SI/n/1Z/oiyY89layx0Utdo/EGjOA08ir+5B8VAKTrHiqgwg1ggl46cExlU+h1eaVo74e
 ZLUJd3lj4XbXYimiu6No3CNObSEtCpO99J38yBbV1soDDwszpam82RCbuxUz09BOY1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369897;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ptdai9XCw7KUpmk3QaLV9pyE7niyTeNDXV+4qcLmH3o=;
 b=QvNo1wdr/LDGznEVKcGvXQiyDYWblFJm/R5Ba53jYncrTOsqKWKq5tPdDOZNlOsJ3wUC
 144gQv/R3XVJ7tyf/0D9qoTRra50EhoE7Or2aiEug/iF2B6KaPnFCxteGoc8gxwWGgcZ8
 DtVYGU7ItIu2MNUFdATjHF0MLL+gOIULihW0AHtorLAFub4uWmd/UGB9kuUfDa7xajDqJ
 3fjSrv+6CEl/h86AjaAL/VIId09uoy1UA+eErtv51/n4gRYYe90uApHMPgpo/dxZmjsza
 kXYsbstGRwIyfxBkxOZAFVHJ6VGSbGTONbuzu/hWTW/D6jaYCSJsvx55V49b1QMvOGw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A432B40243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E0CE9D389; Fri, 30 Oct 2026 14:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:13 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2384303e975f27ccbe827b91c180224278382c70
X-Git-Newrev: 040df834cfabe1d6e476fb01e34efde810a17ce1
X-Patchwork-Hint: ignore
Message-Id: <20261030141649.9E0CE9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python3: security
 bump version to 3.14.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4411992521822237018=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4411992521822237018==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/040df834cfabe1d6e476fb01e34efde810a17ce1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://www.python.org/downloads/release/python-31410/

Security content in this release:

CVE-2026-115557:
Distrust compromised eMudhra intermediate CA keys

CVE-2026-114583:
Reject links replacing the destination in tarfile.tar_filter

gh-160300:
Reject cookies with a negative version in http.cookiejar

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3736eda341337a2ddd824111a5f065c84d44c584)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 20abfb573f..7272555258 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3149/
-sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
+# From https://www.python.org/downloads/release/python-31410/
+sha256  de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032  Python-3.14.10.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1916982dfe..c24020af9b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============4411992521822237018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4411992521822237018==--
