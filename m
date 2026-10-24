Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E29606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G4kNvjTS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 100E180E7D;
	Sat, 24 Oct 2026 21:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0xHnDop7E6W; Sat, 24 Oct 2026 21:02:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 09FE980E83
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875765;
	b=CWGo3prErFOigYN0NhdeKWSs3Gb/bUt1S+wW/6X+PrlV88ZJXJ4SRhwAPQfK6EdKgZJJ
	 otVaxOEmet8UXhVGQQNyVKvfl0vqQa2X2couxffKyjvtJIE8T/9yfMqwtY5+rEahyVkLw
	 F4BVpw5Ldreq7wVRKAnIAc75VFZrtRM8oxdH1Eyo89najM8P1drb448x1tkHtEkt+FXuO
	 c+wXJ/jaH838wXts34izUFX3Ft4LBrGRwckigrynDd7Y1PBbvpmizN3fySml9ZH9nPP1w
	 69HKXKhJwE9YKTSxy1eq6g+4jxwz8BKI4HExLPreWl+TCwAE7d2/8pD6W146IaPesyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=v5uimLhmtI4aK48r6iv2OQErqFVUh2mW8cYfeKu6fkI=;
	b=eBaqZRlEr4wEgxtoEnzLiVWFbRFa915FcgAOmOegr7ldbXuwkIWpAEpvTtnZ968gt1Q0
	 0Q1v+EujSgENvCw/krHxIqlEFF5g5JEnkQajLNgxz3h784Rf+HY/2hlbC9hlQeepusIPD
	 ER4MOIiZsC7VlxpFzV1bYxpHpSr59LqLfycBFp/oowxdTgcy2zyiLbLL16INQL12BIUDk
	 nDls9Q+pBa8+WhWnCbSchVk2r3mM5SIAafbc5g9TBCOYJuD98QxBHqKKGFMyGJgPxlj56
	 8pdl3hduitMk3fgL+3VgV/bNk3HUo1MoeaS3RvO1Hb6PSP7LCaVF/TDsyXpBGKN4N5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875765;
	bh=v5uimLhmtI4aK48r6iv2OQErqFVUh2mW8cYfeKu6fkI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G4kNvjTSAy9AXxIoagzyUauNKpFQctW3WhIxQMpCt4DifLuetcDcordSD7SKvcxw2
	 UcwU1eKcV5A9BJ9ggburBt06xuT3qkKCR8dasU5Ytex6kIMFsDGKRQ/IN3WrYbwloT
	 5L2TzQqP5V7D+pNa3Dem6SaeTc7Rdh54opIw2J6ZZU3qfTihtGTNNGzOpivtyoGvGm
	 Cqo/Y+Oa8vObph6tF5W2EJnF2X311G8+zlthghKx8VW13h4axpAtG+2bBDyyQVcNT1
	 ohhUxV9+R6Rc/ZE6EzmZ+U9x8zAbtk93P6biYhA20v4Q+V/yezmeezQmtwd04TbUBb
	 gTY1W43REMWxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09FE980E83;
	Sat, 24 Oct 2026 21:02:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FF9D3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4625E400AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tMjoBWIOkKA for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7066740079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875758;
 b=PJP5hw7up448s9xs21Wb16aoeVn5wZhhRIqv2lIvqdJXPfTfvI/EBmBfpN2Z4dH8WjG1
 QXTCkyP+pDh1wrZar0GSJ5KD3PxWAHSgX5tLBfb0TShBzi21iC1WYA60nz8LT2D2uuVoh
 lBFkloCBA5EpAWEZ9+eFLe7LUJJElo0OYkeOuC5eJ7+ukA5mD9tvUS4mzdbZ2xYp5WNjp
 UL+YahHOxF3QK/FGKbwksPKKRtKZ9j1ME3+62wtOSOUn0ucmQ7iJAz0xOQCyBm5XPm+Qx
 m9NXGyrABXyi57qlm66F+HpTRENNI5HlO+ItlhOcyF1DWM3VwVQaP8fO2BOlxsbSc1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HMt73sjLh8fSsWmRTJL1aF/BOa3Wbh8jDdTD2Qi+7p8=;
 b=pt3ZxT8vKkvbOeCS8B23FpsXpQ2myyzzGEb7VyjjDkQmeogf3cAzpaqdjYwf4nzz8jNN
 hI5WEW8u3yD+UrNjk80YAY5PtUxgeIGnJ251N44DfrjLyEnjQxZ3EVd5iT/F04AWrHSCx
 +ag2RTlRwRFR3plmLyMTPVzGuqZq9YicbgefM55hqjM0ZmObCRDMcXsflPfZbJlubC5qO
 rOe+8v3e6QRQ+Wq4hRbqWtJ1WLhjbOVPrv1F6y4qCASfUjxpPdDUf5UdP9Q4LYfmFCma+
 q600xnbkIn5n2rPGDn4GGHsvgC+EqE1ijzTQFDtohuFz14IzZy/xpyeNR8Sb1ZHbhTw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7066740079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 586809CC81; Sat, 24 Oct 2026 21:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:58:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0df4a5bd4775926d1b4c421a4d0bb2dfceb80584
X-Git-Newrev: 5ba3feb93ad1a98c72c856a1cecbd195bf98a37d
X-Patchwork-Hint: ignore
Message-Id: <20261024210113.586809CC81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: security bump version to
 7.992
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ba3feb93ad1a98c72c856a1cecbd195bf98a37d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/nmap/nmap/blob/v7.992/CHANGELOG

Removed patch 0002 which is included in this release.
Renumbered patch 0003 to 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-NSE-if-compiling-without-Lua-support.-Cl.patch | 29 ----------------------
 ...ch => 0002-traceroute.cc-include-cstddef.patch} |  0
 package/nmap/nmap.hash                             |  6 ++---
 package/nmap/nmap.mk                               |  2 +-
 4 files changed, 4 insertions(+), 33 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
