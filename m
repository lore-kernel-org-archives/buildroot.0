Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900A0606A332
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 23:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=djybeSm6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=i9Wrwt0u
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F40B60DE6;
	Fri, 13 Nov 2026 23:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WunH5LZb1L-g; Fri, 13 Nov 2026 23:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F9CD60DA3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794611211;
	b=Z6Pbb+Vjl0Xi13SUFU4K6gdapeFz7mt0Yk46SEY3Zkr5y4Kkdi1UFD+eBtrw6zRfNNYc
	 00KEA2Nn44ii8ARXeJjW2n3hyr2qndic9pGSD8dQbxYvICS88U8GML7KC6cL9nx1mjTfy
	 d3lzJMjHrQHfC4DxtS72DHthf7FraxCADdJ0T4R4WdDX87PT3W7k4n5HFeURuAj1P3l2J
	 zbNXCesT3ufja0RefY3/KPxpZcKMeumQ2J1QvGWDnGqsfcQ2UG4Z0KaMdqAqJABEJo4VQ
	 iwvAYIne1MoWA3CQN3uoBHWRiMrmZWPIO3CUxXCiNW28cV4j6cLQaDqy5V/XPzdvFbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794611211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CZJ6j/HG9gilwcd+kZbLjqwcZwQwrfg5DiM97BHpn3M=;
	b=PCCrEJ9SB4OqgBXOZeIJKIoNdICrP4/5WSBao+QGUY1RKQV2GLIeuVNYOwcpE7NUhnMl
	 AQORpLVIkfaP86MStJvzjH16DAdBP/z28lwdDCCc+RbvQc3dhg6BNRLPUKyrhyTkgoaVV
	 3hLna1Ls2I0znazMCBWfSfnlL12tw00bPx8Ywv46Hy+PSoRPa29j/GyvYs84PNkhSU/06
	 KZRaRiLo0tDCxFagixYK0ISmIY6PPZxF9FxLP2/oBGXI1qEDEWweqkW1NIe4M6o8ZrJdv
	 CCoy7uAjEwB0YkXPzoeuTvNPLUYLjP/EWj7l5y+0YJmQ1V7IIjfEEztmKu0Yta/pbEg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794611211;
	bh=CZJ6j/HG9gilwcd+kZbLjqwcZwQwrfg5DiM97BHpn3M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=djybeSm6QwSmFnzu0WyWOWAjfAM/ACMKJvwyX8M8lowkr7486g9HPoU3ak7L7mmRQ
	 FsEs4kON42VFQs1Yt6SvsSalT0BqQyBSzpeq8UZcsGFlUDx1U+JZABpqpWl1l2XV0S
	 YXlMgqw2hznf6VUac8LaOXx2S7WTSZVLUe8L2SRkeiH8eoXa+S0zF1jhVy1TgoTe67
	 WQ29PNxPex2UeiwT7Dns5wjVnIon4eVke+gKnaxQFQzy/DPX6ZnhrxqVgYQhAZcIYv
	 vsfZgL6P/e4n0INTiV0Yq961ftAzUELxUlLSZdtaubthksipKtEqaPmm1leqYHC+fk
	 ceZjDJQUDFxfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F9CD60DA3;
	Fri, 13 Nov 2026 23:06:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26D2528C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 23:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0697A40254
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 23:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-r2rQIxFt4h for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 23:06:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1EA5D4021D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=i9Wrwt0u
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EA5D4021D
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 23:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794611203;
 bh=pA4D5biZqE/l7LOnlQmoUiNPKMaVwXVt9FGzuOGf7ms=;
 h=From:To:Cc:Subject:Date:From;
 b=i9Wrwt0uFU2uKM9+lUAsJPdoHVY+PTVfGYD9yekqmeUsbPGanv9N0r00smKlM+Gbt
 AmPOghBL1Cs4QyTl4OserEnpmB9W06Y/1PjB4gEnfVrscQSKy0306KGOs6UWz+LEnH
 Tqp2kpOTbO3EdAyOBBNjoHs7+Mo84Jit8fhHjceIIKBYBzbczUE8U5IUM1UgpdCsTn
 U7l6u6OHxQ4F3V7FvtLQK3q1yhDF4AYlsZOvlCSnnV9+qtS/ROpdHeEaVYjl0tEWiw
 UfZFMIvLts/uIoTIPNnGhIcozdgds7Ty+ICNti/SPhz02WRGyRZHAWpucFxx5VL1vJ
 kFclpIc+JcrXA==
X-KAS-Sym: v3:f51bdf72230551df:NTgyvyc9lqcijvllg8zttPtRXn3OrI6K7URoCyiNpw/XT
 xPCGRN+qbj+jpht+TBYxI5ITZgqKVjSWrmNLBpR2b35/1MatyajmKL7+88bJ78AYRySTZSkg6j/
 r+tjmWWrNSbRyz3kUZzQ+p9nUAvT8gYpwk9aB99NRef3k8FWd1Gg3y2Xb+Cc++90BDA7y51t2y2
 KmT+7d6wh7hOeUkehIhn9JsdR3sKOk98v5Nc8LcoEkBbHVxnJ7iF4ybtteXGQJ7AuIUB5lmtZVo
 E3Q8mmeTotBJtGkmgWyBV7yMKo0QBZyKjd96C5rb7+SMZVOLenpJkqWFSwJVeAinH9ohW61Q==:
 SgjvQzoxn669T7mAYm4cZ+QJxr4AXXhiHeiP8mpYdalLOgeOEILJjDS/vW12Sg20Z+t2ggCw8PC
 Ckbz27XfP9KbDghnGezRzSCPXNlrtDasU8UME8QiaNCME/Ye14g+HNHpovG0TLs039IHWMeUUZh
 AIWx4o9kTWewD9iKMfv+LpXCDOJAUbzJZg8IXyDddAOnMbcxF/DZ+hPjIFG8d0ODUuBwo+G7U17
 RRskwoXr00ZwOwnNFFkACu4XW4t2f+wRtLxMS+A7covgfCzAK+B79Sh5xdqfyVggmAlZtI5KNPR
 C+lhnC+AM+1JK0spmND6jLNLj7Z5MR4FHZnODq/K9AY2kksqlcE+jYodkKA0CgXh4Rj8GdKP5Kf
 ffKyfKFN5i+bd0lZ4e2MBvS+Uxx9eaAjSFyag+3V1nHnAtdWSYuNYtb3oEP0NKx4a8xN2CzHoyR
 aKmqgbmHUwkeAkFNjgojVx+2Vu8ORKKNjFmzIKxB53vvgPgmGLfvRsvYKvCpARSCYN1nvYZk79R
 Bkj2QpXp+7BYOTH27iJEl6SxSkWO55OwUOoCgBo+ol9rssjpFTPKZl+BhbmT2gTk7xl7f6Idcwg
 H40w
Received: from fli4l.lan.fli4l (p54a1be1d.dip0.t-ipconnect.de [84.161.190.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF3FFA4C43CD;
 Sat, 14 Nov 2026 00:06:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55210)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xS0Lz-0000000008E-08ej;
 Fri, 13 Nov 2026 23:06:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Sat, 14 Nov 2026 00:06:43 +0100
Message-ID: <20261113230643.3815452-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.17
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.17/ReleaseNotes?ref_type=tags

Fixes TROVE-2026-075.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7ca1b0385264ebae4bc06a15d07a11142260081c

 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 648c28ae80..ece9622824 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.16.tar.gz.sha256sum
-sha256  6180e193152f4525bdca5475168419b2a2035b963c3c60162a187f86e6160e48  tor-0.4.9.16.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.17.tar.gz.sha256sum
+sha256  ff372c41ee7013557fe5b7acd96c909950b27a7959c59fcb87c02591682fabe2  tor-0.4.9.17.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 17a80d5bce..fa505b5284 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.16
+TOR_VERSION = 0.4.9.17
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
