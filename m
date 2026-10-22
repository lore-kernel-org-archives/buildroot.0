Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45380606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qvG9wkf6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eVw3418i
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA7A6070D;
	Thu, 22 Oct 2026 16:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJQoPJ-9_G-2; Thu, 22 Oct 2026 16:28:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E42C606A5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792686501;
	b=XvJMsGCg5pIwdxkUMkyMtXvr1aZ4wkog52AEBCgDddcXq1TlEy358TPXilNXk+EVmOjH
	 XrEtAyGwW5yDiI3TqvYdt2D0MxgnynMu2aiN4YRsnWeizCy/H4qGCbnM1d2uXsmRlkBLa
	 BQOG4/SWVuA5L18Bm08Ov+MCXNVJecdLgMaPScSfOfOEZBRKvJLfsF56mJoGyAXfeVWXn
	 kJzCsPb+UoJnhNeUgVsW1PQubUiqCw7wgKRDqbfzZxh4oaX6QVLjqUBeleN4r81BlEGau
	 1IyY+vw8feAQtCqPo8sFeCrv6BKDxkWsYymtfV6f6K66RZNF1h/OLU1WMM4uhztaJrw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792686501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=TlFKfOdKpe0PiJP1N0gl1N5mSQLDssxN/X/BAMP1hV4=;
	b=pGKir+9SrXvr5geBtQQEoQoDG6qSJJsPeuTCNbhm4o0n8LOiJm89WUfhi02BCTohn6F0
	 rK0VfgZ3ja4tpQqEKJbHvE98UpsKsRLhz5CTt07EPUUe1qRmGO3/2fEaY3HA3MarzyGiI
	 21zaPq4WMu2MDkeNIHVwTU3BHw2QGeR+78v0EQlAVz01PAXl/9MgEUge+TELu76IkSrqz
	 WJL+NVlBaNpg1Fg244GRlcdvfGo8P6/auz+QHa0BVf8ewGx2cq9UuSDsrjgqN1KDeyCb+
	 cRgUkrLZCkE9/rf1wP2D7QvmWnR/OzMmP7riKiFn58Cjd8QSbtKn0rfuAF3q8w1BcNA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792686501;
	bh=TlFKfOdKpe0PiJP1N0gl1N5mSQLDssxN/X/BAMP1hV4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvG9wkf68dLPa2vtmH+q8me1RzBatnocTQoy9xEyoZceBp4CSVwjsir8ZLBPjkf48
	 oF90mmEh6omkbivhPKx9Ue5g6kMhstejjMIKb0KdWiQ8Auz/QK81U1k0C/3pH3u/Ib
	 tGfTccRZZb1yYCgdDIGhYjIxjXfabNzS7VYRDJN3T5nI8wl1tWO+B4yS+a1NGY3MV3
	 a5oD68APV32fqfgMEHbQt7aI683rBRc9904RUPebKNHwXAHxj5TvyB6lfDi5SFrKp+
	 gBXwkRHDknnwB/6KxyYbm7lP95DGpixzkgKGXAsz7Hxy9zS7yr0OrX329QDSdauFfo
	 Zc7/vq5iRM0Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E42C606A5;
	Thu, 22 Oct 2026 16:28:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A95A3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3852681192
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNVPw-2_wkYx for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 16:28:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F50081182
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::a31"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792686499;
 b=WBFj5PPFeHJHXzshHO+cvflzeeT22MnovlLmRUikgvK0uo6PPUqwJcnZxVMu5vNt3QGK
 MRJCBEejfhXWz5AZkchaeR+V6fP+CEqRGzogbK9P4JmGMwcFioxn4jS0wuc3MFG3Hckd2
 cUpC0KwW3CoR41N8+j9VoYEYmwOJmKwJdY4bqAO7pnkISkZWtrwCb2xOml0GB6g6DmZ/R
 femnU0LYFW7ZZkW+0O5Y3cpvfmcBFWiEaML/pHMP7sG60sdFw7cSZLZInjnrP9oGxR8RC
 v7UseTfx67gsoH0oZONJwfo9IWtsBz3Z7xBx35h7sGbCEwIv7owS/j7qy1U2U3NTTug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792686499;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=Hqsq73EyV0Sp9nPUF8FIh7AXuRyXmKB4PbZI7VPyFfk=;
 b=OLhz+1pIYYJm0uFr+tLrIYCUG5a2DCqk0lOJybz6HvS7Yrhb9HuBQY1Rmgz8z39a4IZ/
 YejEBYL3KgNXy0squYYqlYwrTwLgmf4XYXc/OJk1wi5V1fFS9/Ix110m/jH9UeN2AXTio
 z+vnur49irOzSq1fdzQ2iDWF6DZwjeSm1V9N1/AuFFbsqHbiHycf/nu40few5a4mKJRA9
 /ywiPCTgcEqmjf/5vGdPIIgeMdyUWW499T3pRr4D8P1BhUOweaxVdv/7ysN45WfI+G3rh
 W/W4+fY+EeyCl1+spiiJOFWN6DnicoQ2NatNIN8ZFx6+9JeemH/cOM1h81Fz/tl5ykQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eVw3418i; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::a31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eVw3418i
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F50081182
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:28:18 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-5eaa5e03c47so935405e0c.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792686498; cv=none;
 d=google.com; s=arc-20260327;
 b=kvonVLUekH+bwXzqMSvOP5X10Ym0AHlpb17Fban7ZhMGk1dzC9u9c46HWiRQgI1ERa
 KLEhHkYKLFz/aQNHrYn97rlkDEVearWpbnQgBqRXwXxHprF5kSSYTzHz/on2hYKhi7/+
 r6Z34Ybn30F7rsD5P9IErMyOVxgWtHs6/Hjl6rGtJv2L9EvVW3kYUMzTWj1kHWrq4UT+
 GQ27DPZsjVMZfszqVkqz0Zjv9pq6N7IHxQ9wjvFUaZFfLWVQ986O4lhnyFJ9hN7+7/iT
 7KPjKfRccRut2BYFMm/25Cf/3KsTDkT0G+qYYNN7cap6WDRijpt+CB7mFiJGM2QA2n2z
 LFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hqsq73EyV0Sp9nPUF8FIh7AXuRyXmKB4PbZI7VPyFfk=;
 fh=OXSws1DiqHrDxxvsXcR/G1RKX9FNqHpIGkAabcFCpqM=;
 b=g8IgfkCOMEIc9vwIqWk8loyDVV3/2rcjUAet4DiZrcWCj9bBrQvquHs59Srv1Ouewi
 UMBcLkSjRN/DA2/rAiJOGdW9SqVegOJ7jRUwTpbKm5RS1BeY22fROuo7iUBu/e2I7lKh
 JGQhrm1xGsuvyqISrMVCEQWtfe1Lnb91hxm9rhmIw+p6jPYIs9ud+S7hEfvY7J2FOuvT
 +l14zk9HnnsMsEI7vg24A8tUvrkNGEMShSZbdtdV5M8A+/MBy8CH8kY71yys3LGKrVyU
 zZvckg+/EVNHQ0M7ftzDB8EwoTerZz8a9dcMqjbwVothbLnj5umGSVLIybfad2jl2eJl
 D7GA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792686498; x=1793291298; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Hqsq73EyV0Sp9nPUF8FIh7AXuRyXmKB4PbZI7VPyFfk=;
 b=eVw3418iWof1iUuAWomQ/NVK+RatQR8961pXtfYS+GOB7bYu6Lon6rkO60SPy3CKAr
 eaiAEGNhq26tRhWwYSe+1l3L8UqraJVLn88+GFUw65zqmyXrXaPRYY0ha6oLe2DHdwgl
 otop1yBTVB/LRNJeSq35IqpA2zqzUUVEJoKCoWAK/Di7ZL1owDC8dqfusa/mIm/ioNZB
 wSLxj+FJoIXcZqpIS6aAhBi8qtgM5nbsqvfher+OpfE+mx/zGz1fTf3r96LPC5qxQw2L
 22ULa8gT7du1r90i9k76TFD6CFJCc90reS/19XCI34lFaCrVC8geyRKbPAxjHexPyFGn
 uHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792686498; x=1793291298;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hqsq73EyV0Sp9nPUF8FIh7AXuRyXmKB4PbZI7VPyFfk=;
 b=IvUvEq8ankIlTVQCCPmZrvxspYoAgFz5//9sRqhLF26KRBBfti1okNn7hl43mg6gsC
 V2QXfx1X3k/9wA76gTyICsBdl1i5UGjkx8BXkjpAQx8cCK1Qj5WNi5/wrBKpW9njHEeN
 sgkLbHUD6Jp9e8R/hPz6tFvEDwQ2h4rI+NsbSsoYv7B3C7Sgzd0nlCbmJDVKPndC3NFW
 N7GWEc/QPz6RDDhIR+pSKjQDAAhQTGyORCc81z6cAKgf4LPjJIQFnfYolXR2oJe6Gbbr
 wAPF6mzKsR8X1N+QaHq0zx+JcrEMa9ywYJQkPzNwFigNwcYbeos9rwiH8DPtRMYmrBRT
 LGpg==
X-Gm-Message-State: AFq9FYKU7d6iCADjRwD39qDportU8z4JE5rQK4369SM+YWTGJc5caPIg
 x3Df6klSuXbLX5e34CG1JZtBkmLy2X6bxao4OHMHalNFI2zxR4G2C8SFnxp27SbQdrTCX+uvPi7
 GIiquzSU4vRLWtjOfjisI6IMpgpITh73Z5VYaDQ4=
X-Gm-Gg: AYBFou2fvHwqeRcIjQ76FjmUNk76Z0PBLGUyUS0yZ19XD9K+8qY3SbSYzKB4UbQwnw/
 VlNz+Jez0uO7o3/whzGnDAGI4fW9+rVvm/vbzHLVFP5AQwf8rAKRKBTtjfyzuATl/WlBq0U12Uk
 CFWM5ylirWK22CdZsL4SQ+F68WUgxArAimS5IlT1Em8rYfwap4cmmD/QRVolbs9hUqV2Wfr+0li
 in4EqU89EXSGj/yI+t12etg3aDW/jr1zcfXMfty01t6AOe5VPNRRoX2mLGwONhz3nmbdOrHzg2O
 17Y+EG05bXkesOmGF9MSnbcytGRlxUovaKkPPrOEPq19xjV3t61BdKfq1uMs4PVwQqbMMYFtvu6
 6kLUunm4MNp0D4HQp4O20IvmvNFPwTPi37ql6mGyGGFaVX8WhcnZEWJYX4Klk5XXXapoeoj0zlj
 t6dPGGGa5+8MQPc9JwtRPaornKH6YMH/hKJNsbyKceOSkpYQZTErl6+iqoxLO1aEiDTWSBh1w70
 5rp5M/gYZX/AX/P1YH3GCoEgIs5eVs=
X-Received: by 2002:a05:6102:418e:b0:7b9:5abb:eb17 with SMTP id
 ada2fe7eead31-7cca97387fdmr841964137.3.1792686497670; Thu, 22 Oct 2026
 09:28:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006195933.2225477-1-james.hilliard1@gmail.com>
 <asX6R74TC4XMSXDo@windsurf>
 <CADvTj4qdSJ-iWg8qTr-9uZNbRhMEN_SpzTTR7sPnN_+MoMizbw@mail.gmail.com>
 <ato1zt06yaEmJRzt@windsurf>
In-Reply-To: <ato1zt06yaEmJRzt@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 10:28:06 -0600
X-Gm-Features: AclHuK8mFcw964peDuAK5CKGd6gykrrQ_8u8rQ45viPQ4v6saJDR-AvEjZtkVGk
Message-ID: <CADvTj4q=xKwn++s2GoVK_99U+gaia=uWS1ZdPW34b_2bTS79mw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: use cargo environment
 during installation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgMTA6MTPigK9BTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gV2VkLCBP
Y3QgMDcsIDIwMjYgYXQgMDM6NDU6MDdBTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4K
PiA+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIFNpbmNlIHdoZW4gZG9lcyB0aGlzIHByb2JsZW0g
ZXhpc3Q/IE9mIGNvdXJzZSBpdAo+ID4gPiBleGlzdHMgc2luY2UgeC5weSBzdXBwb3J0IHdhcyBp
bnRyb2R1Y2VkLCBidXQgZGlkIGl0IGJlY29tZSB2aXNpYmxlCj4gPiA+IGJlY2F1c2Ugb2YgYSBu
ZXcgcGFja2FnZSwgb3IgcGFja2FnZSB1cGRhdGU/Cj4gPgo+ID4gSSB0aGluayBpdCdzIGNhdXNl
ZCBieSB0aGlzOiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QvcHVsbC8xNTYxOTYK
PiA+Cj4gPiA+Cj4gPiA+IEFzIGl0J3MgYSBmaXgsIHdlIG5lZWQgdG8gaGF2ZSBzdWZmaWNpZW50
IGluZm9ybWF0aW9uIGluIHRoZSBjb21taXQKPiA+ID4gbWVzc2FnZSBhYm91dCB3aGljaCBjb21t
aXQgaW50cm9kdWNlZCB0aGUgaXNzdWUsIHNvIHRoYXQgb3VyIExUUwo+ID4gPiBicmFuY2ggbWFp
bnRhaW5lcnMgY2FuIHVuZGVyc3RhbmQgd2hldGhlciBpdCBuZWVkcyB0byBiZSBiYWNrcG9ydGVk
IG9yCj4gPgo+ID4gSSB0aGluayB0aGF0IHdvdWxkIGJlIHRoaXMgY29tbWl0Ogo+ID4gaHR0cHM6
Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvY29tbWl0L2U4YzhiZDliYzU2YTgyN2Ri
OTBjM2JiMmU3MWU0NjEzYTVhMmM3MzAKPgo+IERvIHlvdSBoYXZlIGEgcmVwcm9kdWNlciBmb3Ig
dGhpcyBpc3N1ZT8KPgo+IFlvdXIgb3JpZ2luYWwgcGF0Y2ggaXMgYXQKPiBodHRwczovL3BhdGNo
d29yay5idWlsZHJvb3Qub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjYxMDA2MTk1OTMz
LjIyMjU0NzctMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLy4KPgo+IFRoZSBmYWlsZWQgaXNz
dWUgaXMgYXQ6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzAyYi8w
MmIyZmM2YmE3MzI5ODUyZDdiZjZhZTQ5MzVjMTIwYzRkZTQ3YjNlL2J1aWxkLWVuZC5sb2csCj4g
d2hpY2ggZW5kZWQgd2l0aCBhIHRpbWVvdXQuIEkgc2VlOgo+Cj4gRGlzdCBydXN0Yy0xLjk4LjEt
c3JjCj4gICAgICAgICBmaW5pc2hlZCBpbiAxNzU4NS4wOTYgc2Vjb25kcwo+Cj4gd2hpY2ggc2Vl
bXMgZXh0cmVtZWx5IGxvbmcuIEkgZGlkIGEgYnVpbGQgb24gbXkgKGZhc3QpIGJ1aWxkIHNlcnZl
ciwKPiBhbmQgaXQgdG9vazoKPgo+IERpc3QgcnVzdGMtMS45OC4xLXNyYy1ncGwKPiAgICAgICAg
IGZpbmlzaGVkIGluIDExOS4yMzAgc2Vjb25kcwo+Cj4gYnV0IHRoZSBidWlsZCBjb21wbGV0ZWQg
c3VjY2Vzc2Z1bGx5Lgo+Cj4gRG8geW91IGhhdmUgbW9yZSBkZXRhaWxzIGFib3V0IHdoYXQncyBo
YXBwZW5pbmcsIHdoeSBwYXNzaW5nIG1vcmUKPiBmbGFncyBkb24ndCBjYXVzZSBhIHRpbWVvdXQs
IGV0Yy4/CgpJIHRoaW5rIGl0J3MgZHVlIHRvIG11bHRpcGxlIGF1dG9idWlsZGVycyBob2xkaW5n
IGEgbG9jayBhdCB0aGUgc2FtZQp0aW1lIGR1ZSB0byB1c2luZyB0aGUgc2FtZSBDQVJHT19IT01F
LiBUaGlzIGNoYW5nZSBlbnN1cmVzCmVhY2ggYnVpbGQgZ2V0cyBhIHNlcGFyYXRlIENBUkdPX0hP
TUUuIFRoZSBidWcgaXMgc29tZXdoYXQKcHJlLWV4aXN0aW5nIGluIHRoZSBzZW5zZSB0aGF0IENB
UkdPX0hPTUUgc2hvdWxkIGhhdmUgYmVlbgppc29sYXRlZCB0byBiZWdpbiB3aXRoLiBJdCBqdXN0
IHdhc24ndCByZWFsbHkgdHJpZ2dlcmVkIHVudGlsIHRoZSB1cGRhdGUKd2hpY2ggc2VlbXMgdG8g
aGF2ZSBzdGFydGVkIGxvY2tpbmcgc29tZSByZXNvdXJjZXMgaW4gQ0FSR09fSE9NRS4KCkluIHRo
ZSBhdXRvYnVpbGRlciBsb2cgdGhpcyBpcyB3aGF0J3MgY2F1c2luZyBpdCB0byB0YWtlIHNvIGxv
bmcgQUZBSVU6CkJsb2NraW5nIHdhaXRpbmcgZm9yIGZpbGUgbG9jayBvbiBwYWNrYWdlIGNhY2hl
Cgo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
