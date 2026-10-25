Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30A0606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qzo89EQk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BinkP/pF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2B8060687;
	Sun, 25 Oct 2026 22:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AL4_Rd4qWQQY; Sun, 25 Oct 2026 22:11:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C0E4A60640
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966313;
	b=VJ2F0exDBlCjfMAx2chis2kLnu4I5cEBsYNmDkNlI2gLNkhcYxjh8JO2uSy0Z+qpE84p
	 keSA+F+3zBTMIR0Ilcy6LMVBnQzANxYIVhyF2Ydchxea0YjsqtEVM8ry88LFW4lzAgm0B
	 nP9a5GFqDSZX0MSyWW4GSk3d7cOs8Ff/H9qTmX4YTp/1CeHOQqjIxJUgPxkPir2Q4ZDzp
	 4QwqkMRH4AJILFLkMbWCO1H4XvF4adWLy57WfFpQ2bXsRvkQrc877DyrxTfQLa00oWQvp
	 hCgy293ksAcP0xfUtkI6EVFU6+/XrHxnc5DuZDUpnM7TM8So/2iUQ0npA1ySgdUVySA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5cZHqgUVGjj26GsC93XP/8ZUKU1szbIdlOjYe83CLJA=;
	b=Ur+nOSYFC4/AEPjwxNJHm7ydyxg5ktL3tFbS7+msXPcMqwD+IrZgbRrMeRafGa/1LTDu
	 LZTL6BXpnA9D370RyQL2oQenkeBYD/Aesu0W84GCMb3gNrXWQ5cTd45dt2yGCrAHvgtST
	 pmCTBkKVnJ9+PhNbVf2gDdwM6hjKM+bifNt0dtxGBFokVttjKdeq/bMRkuhe5f7mCGS5/
	 Srof2nhdFQEgGGFH8j2p7ToPdRM7zsg1wp/AhDDdFqkPo3L2n4Hyy101koELzaXsoIHSn
	 eA0IqZoZkiZPkvyI4oAtYB1spRATHb0BFWwtfU3cmUE36hTHeLPPM7a5pegbhwhHWDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966313;
	bh=5cZHqgUVGjj26GsC93XP/8ZUKU1szbIdlOjYe83CLJA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qzo89EQkuXIKwfxQ/zyghjQO2vZjFM9WhWvJnDUT9tay/R+aAG/2u4ibpgl4oAB3K
	 u2yVIvQdjUZiuwzJwxKm6+vEPhTPvYF6L4CeCm2INCN8sDCGehbE40mZ7tziFLgZoX
	 7IVZrr6jVKKuMyH1A8HGDM5sz9SlzkiGxpgbNMT/UAnrl6E9OXhJEX23g5vwTigYbz
	 Wa1oofm5siwJdZpvl4vlvKWf9szESNxSFMSJ6w7oScfXLHaimhxm1WIL/mY5/6RH2h
	 sxReaRjTEDRWq1v9G1CIZhqRzwoTLew3+/4iVDRmoCB+Vzzu3QMTAY7NZVv49li93z
	 v5fqM1/eZNcPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E4A60640;
	Sun, 25 Oct 2026 22:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 406C3356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3277480D91
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ub-09DlxSwgl for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E82880D1B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966311;
 b=ArwzksoPUHEB0GFYXr8PVxPG4dUgupVfTPLVSDk7MYRH/rMe1jgdkXQuofMniOMuZQFU
 Xipqxp4pfwQcLT12eso6B1LpBJqhPE/lvDrY8KgV3zZK9KNBbVDONh2UwIogTGbzpJg+t
 88K7s9vsDGYCvgHmMIdSDSxk4HudswrGsIbf4zZgyvjH+EIFzyUa1PggizpZOarkH8OYR
 ik/4/NkkPU/uNyVe8q2Z+M6AwwfAfJBMBlY1r79tDNOvXhcdhYxqX3ASBdTi9lUL1cgd3
 RblGmhy1ruhAgzzKls2jSK4LnV/kfgkLaj2JcBCagNZHJGoSkUueKzrQQ2bc+PZ1FGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966311;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WiKPCvUSkWP0IJl1ITHYv6N+bB9g8i6hPG+QT7xc8h4=;
 b=pEtWuJ5uhxR9nfh/+88uEP08uLT5hGVdyHgYJNf/fg+fvnAOY2UscD5AEAoS+YSEvnb4
 mXPJU2CBz9Ue4QHToduzy1zv4pCw+KDjHPwU5h2ln1y9U9gln9y6rzLH6wehnEspMnZeR
 bhq6sV/x+HOlIRQwZFbTU2b3VRqY64jkEHSuoz9aBcl/tunRQR+8WesI/DdNvACK2cp/Q
 a9SM8vKLNWKsR9lfyn0AXuz+17qUAdT8UEZew3HwFI/oatgl1+ecctgWNzWCKr4ww5u/p
 xZISSPDhnEtuk5F4z3kp9bI0k+5+n3TudhEbAzHKxYROmVVCW9B3/AayqVM3Hpxypwg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="BinkP/pF"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BinkP/pF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E82880D1B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966085;
 bh=WiKPCvUSkWP0IJl1ITHYv6N+bB9g8i6hPG+QT7xc8h4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BinkP/pFnyyOp/bAcmHVWueWtydUAGFfiQ/5tDWTvDOjQw3l782Wws2bsn0i/nA/Z
 fJ8AikxNq2gJNLiRv0ge25LDSErLMQ6VhYP2BvLeDpuw23l0tKNeOgJciRTLYF9QTT
 bRMdjgkeTPUmLZXbXjp2gQVvLdFxOpVCl5DJ4jeB1ZazEwgAikjv9nppJfYwwdHfR6
 zAIYz1GrDEHy7CyX/aydthYj1885MFlDsDfaD3DK4SzBqWpRIWDgMJJHq5Yuu0Msaa
 Kgj6Z/av2W+2nBqmHG/A271Xkz7t/JkqhchSvYQT6rfohrRp3qGAT7vRX8/VIs3PrX
 sr/wfF6hnKEOA==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 TaDpQ8Xv3EDq069qhj+1vGbtz7WX8DptMMWf6e7DEd6xC9lLowDMN9SkGE535zlNzkJ3WAjl8GR
 hQMvgQ1YtY027o7FDCCy6PsMXaR7dSPjCT+UuMbtn6Xay7LeG65mOUknSnT1lx8pyMBfbdq+KyK
 SXhoUwl9mZTqA1JsIOPRSTLgDmwp38uoQEXU4EYVD5dNCt2TzeybReUByiO2N5oeu+pJOOxA/VU
 PTeW4HlWX2n349vTISVtP4xyuG2y9ZHiaz7zqQZCT1zvpjRFrsCUyYKj+ITRGqKIeMXPCO4n2zN
 m9ytxDguCUj5UDEYUSMLsH/MYdvlDRp9+AWx5nWXm6rxf4iM/etleLyYt+jydTyKWxk96eC8VSP
 LtSTQxkGzVnHtkwMSWp3gC3uKmx0zGRSn/MloLWUdFhT+nl8QG0j2Dbgvvm0zX8xc/4E/ac6WKb
 MOOdO3M5vQpqMcgP3j5ogLLBqRindDjxQ5HL6f6vOCQcShRe2bQef9V8RXJUBaiwT0GvUEHy3qR
 WiCkiEx3jbHs0SeVmIfxLTeGMCBHdUyZuxsnrHlp45YLLj/fqSyBda496lRPC+udBeB7VKityVe
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D8F5A4C6A9B;
 Sun, 25 Oct 2026 23:08:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-1Iuk;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:10 +0100
Message-ID: <20261025220723.1332924-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 21/34] package/docker-engine: bump version to
 v29.5.3
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKUmVsZWFzZSBub3RlczoKKiBo
dHRwczovL2RvY3MuZG9ja2VyLmNvbS9lbmdpbmUvcmVsZWFzZS1ub3Rlcy8yOS8jMjk1MwoKU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvZG9ja2VyLWVuZ2lu
ZS9kb2NrZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUuaGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5k
ZXggNTg3ZmE4MTZjYi4uMzRhZDk3NTVjNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5n
aW5lL2RvY2tlci1lbmdpbmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2Vy
LWVuZ2luZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgMTIzNWVkMzI1ZDMyNGM3NmY1MmU1MmJlYWExZGFjODVjOTJhMDczYmYyZjlmY2M1YmI5ZjY3
ZTM1YTY2ODAyOCAgZG9ja2VyLWVuZ2luZS0yOS41LjItZ28yLnRhci5negorc2hhMjU2ICA0NjBl
M2M5NWZiZjg2NDE0ZTg4ZTdjYjU4NTUxZGYwNjFjMjA2NTkyYmM2NjY4MGZlYzc1YzVjZGQ1NTFl
M2JkICBkb2NrZXItZW5naW5lLTI5LjUuMy1nbzIudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFm
Mjg5NzEzYWM1ZGY0OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1r
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggMWE5N2RiY2Zj
Ni4uNTAyMTBmYTk5YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1l
bmdpbmUubWsKKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfRU5HSU5F
X1ZFUlNJT04gPSAyOS41LjIKK0RPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI5LjUuMwogRE9DS0VS
X0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksZG9ja2VyLXYkKERPQ0tFUl9F
TkdJTkVfVkVSU0lPTikpCiAKIERPQ0tFUl9FTkdJTkVfTElDRU5TRSA9IEFwYWNoZS0yLjAKLS0g
CjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
