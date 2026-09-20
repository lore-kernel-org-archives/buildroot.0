Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E7BC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73C4340619;
	Sun, 20 Sep 2026 14:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HmXfcOksuSJ; Sun, 20 Sep 2026 14:10:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7F4E440B97
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913431;
	b=Ur3jSKl5t5os69AikwBYI+CmQvYP+nd4kygZZP+uI/c5JW6gV15ZaTBpgPfGof1WEk4u
	 gPbMpCe1HytVaxjrpVksrj/0dgufcJptDJyCzbEvoK+hXnhQ4mKzPkEZ9qnnXI+QqkPic
	 E6ssqjIpnVvd4I1y3A64czlb5u5WWUsP7eOPzY4enQRTXoLdm7FlzYJEtRH45eUd31rv8
	 5mHkm8Hu2EiCiobc/EA/Zsu7bn1mlWUlHr9iWXZDZrfKPzIEImojktPC20Q1ntItjNDj+
	 FfLXhgpHoT71r5O2bOgheMfNkSKddDlKFufX0MmaJI2KkjsHllWgMCZyF/h+3hVcTxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	b=N2DOhfTdgrYmjRgK5fKRfKfqrCbE5AwYmFZEH3TWlnsB4o7cTWILXULpC97nlAvH2XLW
	 dwS+a/k2ADyYLzWSb+mmCLOufTPDMJ6CwSZLwiTCGr3CX30AZHAQEqaYLBxnGd67kzbIR
	 gJC2dVa8AP2HWIka8fRs8y64HFalXxhFJOP7OC7elUyVbeDEu7i7NAz9JVGwh3HxNgBzp
	 NJtk9cXUxk5fQyqoaIM9Jcr+8wngDG1Kjy+HYxYN7f8WYvCZyPIeLgbHfXDz0jMNfFiPO
	 6XcVPE6HzYORaM/VSWsncaAyKhEgBilsX7rr1rv4BCUbSsUCb/s3EwrqxsEsRWcMNKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913431;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HCD1brpLbRpkX1TCK7zHxUvRodevh4jgrIhpAJBhRr/lQ+yh9y9pbdn0rWKmI2gmJ
	 SdggztHVKiBGVn9RlfJQyY0abxRVAmXN7VHRqDLcxG2FVJ77bzklfD40d2PtbTPaIl
	 bfzAAu8aJUwd2cOQLEK73scWD4PtZGGGDv3TBIywluMvleMAABY6+vOmnKiyKivvN8
	 QnPMjgb7mN0t/nLzyA9SXhg+DobKAxzYJQwsEg6NelThWGNUCm4j2ENa/mn3xbXpqu
	 6JNJyIVIUOzitIuY/JItTdA3dJqNSEmvyDOPeFi7fTWNc3fpA4s9WVqkpdryqOYroi
	 +WAPNEhW8z/0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F4E440B97;
	Sun, 20 Sep 2026 14:10:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 877A2392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7911D80F2B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aR8g878m2Op2 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:10:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 16F2280F19
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913429;
 b=S3pvj7GCjXY/T8rRnlWJukfyMmkLzFtOBCrLNu4/hn8qw30DBuqcXfne8OKZiHhfxA3n
 /0RU1V8IPogfvWaVeZNiQ/l7btoGeXGRqmP64MtSMPLyKWlgjOt5w5iRV1Kj4jRq9WQxn
 cMGXeaGpm1aB9J4hi+ZfNsaXP5khdltodrHP9Jdf2RLMoBTjv06IiiBvsD+aUGDTYXW2L
 Y9oqSxgZKudDceIZf2KEK0lmWhfcKCQfmOTvedSbn5vjMYOMm4EiBIOi3IbJt4Bv0HlQf
 DICVXySnBoaznPbbCIhTUt7D1LzfVICxTtC0Df2qqZMTfRxRmAIQMYy5Gv6bqn+w5iQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913429;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 b=Mc7tgAS3Kv8TDx1AQAxvwJ5ONlTr2PmoUwRVOvHpr8lIc93uFAmPLl7Y9hVV55SqYy+I
 RU2aDx0TBYhh/FxhrNQu1QVhPCrjdmBg9mPi4MOO0T4bOaM8PiXkZDTvdPktiCEneHmzG
 Jluw0GxESak6/QXbOeokcq6SwUdDYmx7/Aw/ujBmzX2Cf9tIiVg6NpNqss6uB6hFl/i7T
 fqQHVVVwHnLmTue8tWMfnp9zFgdZX2Zh93HRW6gm9K10cbE/NwUn1EEX9Q8SnHtgOe5WA
 p3DCEnO6501XBxOGaEm4pJtoJXce1S0wgJ6/e7NwQ1s0Jxmv0AXRqnz0rVbmM+xur5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=H7S+41tT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=H7S+41tT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16F2280F19
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913228;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=H7S+41tTe+a16wSSDrApLX1zy8vPbDPIQ6iSkJW8Aa8EMRu8kV+GsMiIPCGid/W9Z
 YYsVXwIKiNXW18sYC+SfpORKxizx/xdc1sc6vx5POvdEi7qRRMKeKGYV5gncmAv7GH
 uFU00ZDDoyCpgb8gZGybYQShzUsGSWUD0poKrozOaw8wzgLFnVA0Jsy8HpRH2UDhM4
 xRsjTQkx7sLr8qxzlBS5qOTbSPXmouksoYGUeljWxLGGlBJu4sk1Rmp239s4O74dJL
 YUQXBmjLnmifR3lrX5auXqlh6Y0UhEEQBHpie+ODLZrrxw1L5yricA2gip5oYL294m
 tuMxpbXOMnokw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:VknUeaGj1uiDI2DrePlMF6den3SIEqmIZ7bEsNmvWTp9AfSUVs7sCfoUvOcI3k1OVWM8VxWWNSJI0HRi8oI6lqpnk+TBfU77yFYHuvSXFzxlecfdIOkVoRGEMR8vercun8wdo8BLBZ7zydJjC/xaIngdaI5Ukk+wyekoguAdpzhS+vtESMqMdYy3cvT/iWfd7K3nPv7fW6Y8JLrR1wSZZiuu70ZtQ+nCxXxlX+Vc1Gt449JjE1EBxbCNp/Kh6amO15eFzrC3ncQ/uYjIXFe9qqjTftFqx+J1bUgP6C/UJzlHX9gYus1biE1RhUincWH8hlauy/8DYac9R3SbG0yf2J60OAj4VsLZlx29qNTvdAnqfDScmGAWBpRigcwUNUV27XtWQ1TkC5ubYcDnnaYJr9ngDFHVw53Dpedi9VZ64sO6mxFft1HW1BeSore6vgTL70AEviDm4hKgT1YDbcOsarlbl4vIkNEk/aU3SiawW64fCGOXh8l3Jfwv8S0heoAYKPser91NOy/mBTw1+Yem8nogIA1ffZGYHcqPybOl9+2kVRgLXXpNf27xWZuGO8pOaOEczErkG8fdb4IP1GbFv9Rd78oyNtzMGEn/8nC/Axhe1I
 x0EXzb+mBVdrgB92KYp0RSVgFjF1hJyIsO/Q0YoWjcM01dzVdXVxdX9EeuWVGpdim9a/gIiOk=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72B80A4C4862;
 Sun, 20 Sep 2026 16:07:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBF-000000002J9-07Qk;
 Sun, 20 Sep 2026 14:06:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:09 +0200
Message-ID: <20260920140605.3005461-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v3 11/66] package/nmap: bump version to 7.991
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added patch to fix build error introduced by upstream commit
https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
which was first added to this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...if-compiling-without-Lua-support.-Cl.patch | 29 +++++++++++++++++++
 package/nmap/nmap.hash                        |  6 ++--
 package/nmap/nmap.mk                          |  2 +-
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
new file mode 100644
index 0000000000..54cafdafbc
--- /dev/null
+++ b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
@@ -0,0 +1,29 @@
+From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
+From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Wed, 12 Aug 2026 19:29:05 +0000
+Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
+
+Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nmap.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nmap.cc b/nmap.cc
+index b94c71223..70206daed 100644
+--- a/nmap.cc
++++ b/nmap.cc
+@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
+   AllProbes::service_scan_free();
+   traceroute_hop_cache_clear();
+   nsock_set_default_engine(NULL);
++#ifndef NOLUA
+   close_nse();
++#endif
+ }
+ 
+ int nmap_main(int argc, char *argv[]) {
+-- 
+2.47.3
+
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 17f9eb7f5e..bbdb81ec4f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
-sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
-sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
+sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
+sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index b04d8b080d..0dd96d2b95 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.99
+NMAP_VERSION = 7.991
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
