Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3C1C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AFB60619;
	Sun, 20 Sep 2026 14:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82CvgLre4Xbe; Sun, 20 Sep 2026 14:47:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AF11C60706
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915639;
	b=gAzdtcp0h+YU//Xn8UrUugoUcNWJjpMRmppeoE1aNWpIxqqFIk9YGumoUo0aTDSccy6k
	 izlGi890s6qHhtSTpKIWaPFAgP3iJERhjurpma3KmcHo5LUzpU0CVaEsguXypbtdl53ZC
	 Ajy34ZXmUkYNFyU7r3WAk6Z8dZElHfcdplzZ9ClbDF/V+yHiaIgK/qBxpThmqpSkfaKc3
	 uPM1Af5ozFV0IwQjS8tcgHLTXW6fFIJmcSU7K1oev1ZT4yKKYGbAwuoN80UNUFbvNGRiG
	 JNPteUhHNM9uUnPh9GXflfxwbt37lN4UnlONHLgbLXIw45IElc/MzbzD6BbBitGNaqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915639;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	b=WDD2N+/Q9B1rvpspPKFAvA18ST9A+8LQAFgBGqzYBAyRDd3c4p0BSiIk5ixCBVtkOMnj
	 SxVJsaU0ywHZZyN0mJoSvHjE+IsbiMXUhjSfbqSBNz6AmfxNKxX83/zOoRuOZ7WvIiFAf
	 4nTJNLXPq9G+yPAUp4K6jIvhwxRFWB6IFVH33zDzVivTGM7jG7U/g39Y9rHzHC19KQkGZ
	 zoHkPPiOHG5ipJwd8P0ZD3Jtj/CG5pn5JA0DInr/bf8V3GQUmh50t8ZEpYK9KwXUz0EIY
	 Ixk36Zvzu2XA32ghZC5BcBYs3JCVJi3ACgE7aDDNP770OLWftUBJ1r/u8uxddsWuEng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915639;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NN8cs3L+azN13n4iy7bBPL5K4/B+vztD1kxHpN8XbR0JBdWpRys0O01c9jmEKx+u7
	 7cZGf5ArP608IlfGCM9XXSCRvXU7xn26o04dlhffeNaWU83ElK+Wsja48MqcKxVKB6
	 9NumUKdjzfokhID0zMZnBM8L1ADyIMvPNTqmJMOZWyi92aPPa/SqfIL6zBIjdDGOBV
	 lQ9pVV4q6piPiq/nxCK+CfFsGUyQylIM8Auj0I/nwNuEMhGG8/zH4OpdhmfG2hkT1M
	 qNGKBy9tREHcMdEKwRw2Bs/EXEnbXC6lNVnltizLvf/dfkF04w21YsImBLD6vpSFnO
	 b1TfbJ3I5otUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF11C60706;
	Sun, 20 Sep 2026 14:47:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2458824D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 078144009D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4k5zVZ6Xh7nz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:47:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 254664002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915638;
 b=PktWJWvGw1IHoxQIOEkNovnMt79FXlSNGchhkd+MGmmO8bI2MBblHTyqkUAp6fL5HDSk
 T6V+ECRuB7OP0BcRtgIs/gyGE2LHmKjrT7H8Rp9nkeIPgd1cmOleHFwTL0B0TpzcuGMQT
 Oog/9VygJNOolwmHt+pPZiUInn7TmDEf0dhuHwx8DgOKIl/ueNZcWrrSYfR4hFdmqhMEu
 YPwnPqHl5dkpw4MxbegX60EzpfAsXGifk+PlzJoAESwE6Qf4p7nN3WVsb4E179VxJNJ8n
 e4BPs7lybZgHciLkrqO94qotT6NH0q6yoI20uACkYavTrDyyaaPG4CYYWioMRYdL8hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915638;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 b=pHaJvY0ZFXU8kdIfRUZvkz8Qgz/uQ/mkkSiqp729ty6Rge2+QNk9vYbA2Rw/0zwmL/E9
 tOQ/RQb2MNBo3tG2qNCHMwlaiyqC/bxGyQwygsXZUOw+JPwmdZPBm7Bo7I20oOh9KKI8g
 ttzlVj0MJWsqkBLqVIdRQgFiyose2viFBxOMug125rct3cYBq18VeCdjOVhCuUCgYFsni
 1X0yzMD7IWVzZMintThIarqkclX2pwQZOG+GZlGS6xRiuKYWN6dfwxk93+otselSdJBw2
 NmK6/AezkUQ1tmzJZXiQezPCVBBwkdsTykxUmbNh7TqBwBVTDBOgjCwzv6P0TB/Rj4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Hb+llB2l; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Hb+llB2l
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 254664002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915491;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Hb+llB2l1YqeDz/INBcDPh0BOp9N5ft6Epdi0P6wIf52t8ersAlNhZIvBq5d96w9j
 pA1Fb2pJjpzkrzp3Nj+lPweUxpH1lwAFYYrcSNhZQlcmRl7JXxakq1Z53INB9TBfUh
 lRHpmJuzCZBlrDLtLCpX5/83k7BeHopf51DAuJqA9vj1lDvHtsOkVtAVJsMeUFgr81
 hqql/0Xv6FRmiBv2xn7t6g62E64IY5jVXXUtIwzyo1rI5UXRoestzWUpvPDhQvuTQw
 SzdYSS7SvjF/LQFOZFSYq2ZK5LOrv/tJmJdvMMd341WqaKWPIp1ugU5g1O0hOdPEN9
 VSOt3ntzyj3Bg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:7xDAegeTaNnUhUQ+buKMSkS+6eNKTgO5w5A+n9F7FnDP8NnOVve8c6xvpn0YoqnIB6IigfLEs1Pl2di2Wqp1fmRh9jgUbqwC+EgzQdSSkEn7uJrxe0JmMMeD9vyQ9c53jx9VY4L9Ef101thxY+MFCIyY6hY8Pzq0pJoPF2lw92i97inp27HaJ1dpSKDwtBBlSR/MHtAn+derENY7QWDRhABJ51sO9uReO8WywLrcHKecUtKCvaOYjqDoiobmdmy7EmXeXkQaQtevfGorwpQ1t+88De3t3YFmwnZsYvc9UxVFwn+cC8aItO1fQju2ZAupLwcvRgjD/2ewIRX92bNpJtokCe+q86eQ/20NpsREKYkfSrLW7RMJGKEL8uBLZi7NmynnZEI2ngUQPQt8pBS9xVmAFV2hEA2H3jk+j60prw7qaJ7qLf1Rtwge8SqZGcmSJ0juFLc8aEAahavrUWoVP0z/MUjojxpsJ9TTMd9KbbF5v05vDiDMKV/hXZKj+3eqHZ8jg95g0SC3u9HGmpq+h67ypet11tgxmQAZ4B9ybkshkGS6CqFuUFB1BYBoWF/zuQ5FZpj7aFtaycelH9FSr/mIyNn6Yk9OgW5AXvHscg6EWu
 mci7sGOBaL0y3txCQV
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12DDEA4C4863
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Img-000000000hB-3PuZ
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:37 +0200
Message-ID: <20260920144428.3009612-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v4 16/66] package/resiprocate: security bump
 version to 1.14.0
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

https://github.com/resiprocate/resiprocate/releases/tag/resiprocate-1.14.0

Fixes the following security problems:

Use CSPRNG for security-sensitive SIP/STUN/TURN tokens (CWE-338)
    Use crypto RNG when generating certificates and nonce
    Use crypto RNG to generate various IDs that are supposed to be unique
    Improve transaction ID uniqueness
Authenticate STUN Binding responses (CWE-345)
Add Digest Authentication Support for SHA256 and SHA512/256 algorithms
Add new DigestStream class, capable of MD5, SHA1, SHA256, SHA512 and SHA512/256 hash algorithms
TLS handshake fixes
    Avoid using undefined client verification mode in TLS connection
    Disable TLS compression by default
    Correct TLS logging
Allow applications to get TLS connection/handshake errors
Propagate SSL Certificate Validation errors to ConnectionTerminated event/message
Cleanup SecurityAttributes
WinSecurity: expand constructors to allow setting of defaultPrivateKeyPassPhrase and DHParamsFilename
WinSecurity: perform normal preload process so that domain certificates can be loaded

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/resiprocate/resiprocate.hash | 2 +-
 package/resiprocate/resiprocate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
index 93a7131141..be09ac4624 100644
--- a/package/resiprocate/resiprocate.hash
+++ b/package/resiprocate/resiprocate.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
+sha256  f132e4d0fcae0c155f91e5dad608a9985e199e4e3c09b6029a70b1b3b6d0b156  resiprocate-1.14.0.tar.gz
 sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index ab8299302a..4af7bb7e76 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESIPROCATE_VERSION = 1.13.2
+RESIPROCATE_VERSION = 1.14.0
 RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
