Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59557606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cSarMIcU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KDZojT68
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22805406EA;
	Sat, 24 Oct 2026 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRWh_-9lyEDM; Sat, 24 Oct 2026 20:31:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA85D406E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792873877;
	b=HGI1akcCDjwhi1GqLl3u6c4DtorIy95DTLCLdqI6Cq55+OI5htGyOn7qp5ig98p2BH1y
	 GM3YfjyYh+7AeR5/xauciuYKBzW0SFgwuXk8Gh8gNCzvGp/GB9yXPGb/p+/tKbmdW785D
	 qMJ6O0FATIKr7Xf02Z64nZgUb56xwTq9I8gj53cTtxHyurxRD2K+UBWIHnGVLox49aEut
	 UhUSD21JbQWSNUn495E/pWcNEFaLKWwbE6verTsqh/ieNexel3OXP+LQjQILlpss8QdII
	 m8X2M4NdNrvd+7E1jmFYjZbaA4TQSEG1eMKhayjRWqRRqSO9kKzK1RmrddFr6r/KG/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792873877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R872gndqSesq8wsk70QngGGzUDSEsUfCORZevcHAcak=;
	b=LfSipVRHz5z1FYDTCQ9CzlA5Gje+BK946/HMScHRh0xCcsFJ1V+JpY1VBdrLx3y8d128
	 xIadRSMu0UgYtmTUfIkvbZPOhuYGUogniV6WR8tSwlnF/RleK2/8BbFIw3ae6xIFGYFDW
	 SaPG2SA0BmpJNw4jJkkcnhNrgtXBVSqLfyPdxpkcuq4JTJaC3FXagvi7ukIRjW5dkcDMe
	 Q/QhmoW/rsqjMV7525ReK+A5AlHkxDNVeMsjPMZwhzgyr7jGpTT4ShI4rqQvM+QOcrN+x
	 BY/baC8JPcGIrz+SK02hhiD2Ab9FsNLL9W+FVUFml5BwVVJWcegnNq6Cm2HdTD0lJcQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792873877;
	bh=R872gndqSesq8wsk70QngGGzUDSEsUfCORZevcHAcak=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cSarMIcUSvw1GG/ezLLWANSRJI/I+xB0s6QfKpIuH+NTP/pqCqKOIZgraWAY+8xKk
	 nsczVmTROsur6DX8EkNxmT75w8UAI0/hr1NnAgETAtHY4rYdIxAcJVFtL/PPWS71r/
	 sYDFQVSEBqaCo6Lgm0PY8b8/OCcseDyGLrskPe5hIcVpsVXct2pvgrYC4KTfvc3YZ6
	 4V4cOxKHiIHQez+3xuT4RDAN2B65TKtkcmwibGmfGgNpSoEhCyAWavXs6C5q/CaTpi
	 vQNjQGYQUJBHSMW8DInJlYl4tIKwwfSPxqWpe1VlxV+tRUCskCgnuF+1Bp44v90OP+
	 WgIjJa3EF/MFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA85D406E5;
	Sat, 24 Oct 2026 20:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 443F8356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3567460625
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZABmC1lqb4f for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:31:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D98AC60624
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792873875;
 b=Uey3BuPiyMiU6S9FShbTJHw9n9c3LfC53KUUJlhWveiS+/GctzoYD54rsM+TC37guDzf
 4CiXGmuEwqjXzmJxDfiL7df8Vc3el5xqP5u7WvZHXKv0wA9P3kxvSfN6yjU9Cgl6GYY0n
 XNf5j/Vl1+L1xkepKHGB+1k8bX1iqdMKrMJ1oGvF8CIhgPzwtMjA/e7dxrGaPXNKAPBKD
 FHmNW/bNUvAXmx3ae/VZ+1Z1qh+6XJoiFa/dCZJFRK2J1JNwNB3qqrDbUXTqSadZ++9MF
 3azJF020MNnTZqQ55MU+H0Vs9P5JFXCAPkMh7eu7LEri5xO/VuzIieATBNJKVeLZbbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792873875;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=EwyF6d0+COALAWKQxoJfDZs2VQfWDoUuautWJgfz2T0=;
 b=DFOtm/5PgkXm8xs/7OsgM4RKgJnwgKCo/lzxKExdthz+PinZMvfkmVhE+kGPOtV1W8cj
 W7bpc693iYWjB44dwK6QV61c8tiAu8LlVHElJ+zeHwNcrVhzgIKSE5gGDYmnvj20YuG5i
 H/Zd1A4XiS87qNRmFpY0duzUrgW+IfJvBm0CwsHThLH95zBjGvDD/hdFFe9N6gRmfZ/XX
 O53eiawBiywC1KLPSbDmi8Ukw+q03MnHhdaby4VmnksOCbblIB7F7r8FXhKC4dmnT2JWM
 tGOMNsy0WX202Iq2OPCOccAaj+856RLHBsAnQqtJwXrOVoigA6AfC2+NUtpOK4wkPww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KDZojT68; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KDZojT68
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D98AC60624
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792873870;
 bh=EwyF6d0+COALAWKQxoJfDZs2VQfWDoUuautWJgfz2T0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=KDZojT687pnGGMj3V65kNUXLCIpdREN7a9Iy+VbAtH3W4qG6JV9gZzhH3BhkXILLd
 M/plky3mRtQCn4OktesT3/7DHvEZUYHiJr+vnjUuhHJxMM6J5Gv9YI/7BsT9Q3Wb/H
 mYHNu22sACUl0FqzhsG98ZZHQAbyORCwCgDk7M/rrVVQKWVij4SndPI5QabaXjLyD1
 dJA4X5K3xLreXJt8Gv2N9Mu/IK9dT4zXoPtPJFgq/EN2GjprdPrCSFq6lPCmH/R8GP
 0Os2e0j9kFEip5d/p1Y1QRneQ36qAvQrLBaEQ5BFcZpG4tByLAIfzIsuI1VMpKY2kW
 DgqmxPsgE6bDA==
X-KAS-Sym: v3:f51bdf72230551df:ItQOhoHdKTvWg0goPmYKXvJL9H6W56pV95e92f2XrMW5g
 7lgLaIeeEvfug8jGdfX1vOXBy+1EpV7jb7Rwxiw22ChBXv5ivne6wJmKZGWwpxubOizKiqb8P4x
 IQ9nbvN+NuS0QVgJ+cW6OJomD29RibcRx9OGAm6mbqqBYfsyE0j7EWGS5tN2+h5cQOAS9EWGq+C
 AhP1VY4d3i8ndF/x6jhli96WYDDyU5w6u2Efrzxt37PPo9HSkOZTjjnDjOsmDnylXWwhjr9PGkP
 AvGG8I92pPSHKWcqGWy+56V+3uF9SA92P+/xaoOkcykntohMjwMepiaqmUe8YMld/CAl7aLQ==:
 RWjPJNKm4BLBIBDZc+Et+l7LL4rDGcKtCR+qGcowuFfM7UyNv8vMJeYx6y2ehAtZFmivfwpGCFT
 hNb0/9ME+Gz585cjWwKNkOeeR3rHPWJs8oq5Bj3qHNjoJC7ntNPwpLXgmSP1jG+M0hvml55dwBR
 RYH23RlOx3s5HGO4/DYZzGPjHnRQWbAvqqUafLZV2jGTod5IWniflym1u6DI0IYPUx84v5rOpdM
 exGHy384TunfhgdbfT61K5iNKnFv1ngYMyrwBk0nyBjwZQECSKaMX9FOmJTFsHaK/bUfXjERx9g
 IhDavBGcBHe1qUwW3KVl+NNX0z6cC4L7ksNMtFY4At2Ol/l3aR3b6Zx70ULtRwuiB+8fMA5tqj/
 LzNzHFT51e1dZaDjwEyxPRzi0t2Lu6sT7kt8CZphR8jCnW+iA3JfA0UGDp4jLBUEnzxHovBINmy
 YmrNEUkXRhy9sCEwoiKpxt7o22h3HQNf9Bx8KaoFQCL0dgyMfLdv+7v/SRUD9ggcUteM+Mbqetl
 n41fp9yl0auV3EdWevUdbaKRpI4Rx1CY+g+TjwFjFeSfYJVgIRXbgOnj+PRhGwU/QGcBgxp84aE
 o8Y=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C4F7A4C63D6
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44936)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKiOU-000000000Qt-0H4S
 for buildroot@buildroot.org; Sat, 24 Oct 2026 20:31:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:31:08 +0200
Message-ID: <20261024203109.160416-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024203109.160416-1-bernd@kuhls.net>
References: <20261024203109.160416-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/2] package/nmap: security bump version to 7.992
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/nmap/nmap/blob/v7.992/CHANGELOG

Removed patch 0002 which is included in this release.
Renumbered patch 0003 to 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/db7db3a90c3ad798d0c1017e4282af7faff98239

 ...if-compiling-without-Lua-support.-Cl.patch | 29 -------------------
 ... 0002-traceroute.cc-include-cstddef.patch} |  0
 package/nmap/nmap.hash                        |  6 ++--
 package/nmap/nmap.mk                          |  2 +-
 4 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
 rename package/nmap/{0003-traceroute.cc-include-cstddef.patch => 0002-traceroute.cc-include-cstddef.patch} (100%)

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
deleted file mode 100644
index 54cafdafbc..0000000000
--- a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
-From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
-Date: Wed, 12 Aug 2026 19:29:05 +0000
-Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
-
-Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- nmap.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/nmap.cc b/nmap.cc
-index b94c71223..70206daed 100644
---- a/nmap.cc
-+++ b/nmap.cc
-@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
-   AllProbes::service_scan_free();
-   traceroute_hop_cache_clear();
-   nsock_set_default_engine(NULL);
-+#ifndef NOLUA
-   close_nse();
-+#endif
- }
- 
- int nmap_main(int argc, char *argv[]) {
--- 
-2.47.3
-
diff --git a/package/nmap/0003-traceroute.cc-include-cstddef.patch b/package/nmap/0002-traceroute.cc-include-cstddef.patch
similarity index 100%
rename from package/nmap/0003-traceroute.cc-include-cstddef.patch
rename to package/nmap/0002-traceroute.cc-include-cstddef.patch
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index bbdb81ec4f..f83880bae7 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
-sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
-sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.992.tar.bz2.digest.txt (lowercase)
+sha256  0c12660eddbf7eabeff6996cb0c044a4eadf2bb0c6fbcb340d6cf72b1caee402  nmap-7.992.tar.bz2
+sha512  0c38610b78190b1865d5adb900e9bdc5813a29f6f5d47b768f4b1c9d0d36a26de476f7c7fc55b04e2421c6e6b149890ab0207ea1740786158bbf594a834fedc7  nmap-7.992.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 0dd96d2b95..fc97989834 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.991
+NMAP_VERSION = 7.992
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
