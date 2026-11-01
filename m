Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FEE606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ThF4vCJW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 881BA607DB;
	Sun,  1 Nov 2026 07:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zt3W263T1Bv8; Sun,  1 Nov 2026 07:53:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 49BA360748
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793519598;
	b=hC024FrSwZnjMNN1wq37WDoDrLV8e1RNhH43OLKrLMHk8Yu6GrjWB67a+4ii62R3B54r
	 Xzqc0u/q8cGI1s/HTeA0Cnz/DMAlrwqpLKpkH2n5jDlCyi19b8EHqWrrFm8c0TwfE+0Yx
	 ZBwVDwHDBJ2yRvauKJ4h4LKXIo1jxImAwKy1QmzjJmbBk9RFjes+jtGMkIaUJue5tq5z4
	 wmPIQNWdRhSzw7XHBOJsvhwOO7CgHFqzJuPSUS5vz7RdDw81ljTD0N2r6mp69FBSBecAB
	 Qjbk+ZFlf/hB1xgEh+wc1P6s2Fr7y2h3tA8YJ3PXHKQMcTMnodT1Gm06GQTQnYoGHJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793519598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xgnt4D8uIFHpuTtZFUnImBBQlO9p3MH6mGY3rYXVJCo=;
	b=Amtz7dXmVIFUx68OY7O99XdW9S4phDOWPdCh1TD2y8mLhCSMQVT62JPxXm/zDzWwy8Gz
	 BtgyBPa7Sj7WbaQRBv10EuNJp2SPgapOxTHVFLY8eNewsSb1607WHgTbxlkhNeViehmbU
	 Fw1vDPQa8e3AoLrGwfY8C/JPfsmGsFV6e/PB0TDdf3oeK5Ajk0qFhScH3PzYHgQlWi3xH
	 7Blpsq1D9TDxzGCkCd3QQeScRbl0/eK13uKVcNzdEjhc2nE+BqwzXHHAUEveMu7GTJCr4
	 Ht+n5PL3hpc96xCdigmAXB9YIDYpFcmtHSOdZ3uouezIFIB4/pefxSvkYBYpyvQAb8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793519598;
	bh=Xgnt4D8uIFHpuTtZFUnImBBQlO9p3MH6mGY3rYXVJCo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ThF4vCJW/tZYSKum72HmLU2PEvm74wa0NAudEtRCRivnX12i5IEB8Aa08pA6m6qRS
	 m2xE+iHuvANFjVIiGg+5l+Ykuxq31/VSd165fmQ2QI7xJfqD+2puNLwEk+XB7KbF9i
	 sWWViRqhZSQyxTpuAvEpW3iSQM7y8z2aIOV04Kjoa5BBQNGcs0aOSfRCxEsm/aO1Du
	 TLmW/K5g+pyeuT5Axb6hhQNtzuTLmfCl4ffR7dMQ59Jg7sSL25fk4sjuGkaFbyAvdA
	 x2NP8IVFUnC8/Z6gUW+BqFIP0sipmYVrUz6pcShSj545b9gjsVhEVyV7R/IbnIV285
	 usWABwbLbGPlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49BA360748;
	Sun,  1 Nov 2026 07:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24290156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 07:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C68810C2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 07:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DALWPP4_nRBu for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 07:53:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED272810C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793519596;
 b=nLi87xHJHcw54iLqmkoy6W2VzmbQAubpmgtz9ryGEihrZ26jBHt15DGDklrr/fMaD/Gv
 1cYAW69N+aW2SqUBGANyC6khsFhlWNlpvqJPC+dv7JqbgvCCB0DV4/lMXByQFVxBJnkfX
 /pw5tuVyforSH+JJfqb0nATtQojBkHowcrz/KYhSGs5rRrb0WszLq1e+xLK5pBeRz1kI5
 i4eTYMrykiHkW3QQl/v7XJSDfpNoSHfz9SBzHSswZFsNzonOOM69dC6VGhmaIMDcy92A9
 yXvxoTtdR+psrKlMwRqVqG+EJ9SfuDqBtviR4RF1NZU5gn1Nkmn4gjdXmSMo1H8NU/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793519596;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=WTNlO/CBO4Ll6h0pFd+bydwx447z3UCCCs/UO/7F+0g=;
 b=c6gBINgvHRoTaF72QutIEQRHmvYHVBjYcj1zmQhfaAJP70CS8C4PGP/n/Tnhpisa5CxD
 N959UGsiZRunRbAlNhtl2bKtNlrPEnD3+0++BzWWswT4Bmh8i7tpcAqXaNcmOcbJvFmfa
 okEPIqLg346cdqrHP9PKbVX1x8LukzcIXxPnbxujypOcCv+im/le6V5tP+Fq0CH9o4r94
 3ERYr+KKyTL5Esu3rMQA9UJrX7o6kT8pdzdh+1fFMkrNh++BDWvLW6qEqf0nrnQ0yqSqg
 eCTNEggrcaxtdZhlYUhX09JJM2hfYgbEdRGA0ZHsJsP5B/mO2B6IKnWeWpnn25Hbz1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=OY2r5wTH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED272810C1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 07:53:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so2615782a12.1
 for <buildroot@buildroot.org>; Sun, 01 Nov 2026 00:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793519593; x=1794124393;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WTNlO/CBO4Ll6h0pFd+bydwx447z3UCCCs/UO/7F+0g=;
 b=BTPJs8YpS4/hgflPZqfc+DjjZHLR05fWXlBEKkbx5vOccQUFk7REFRPdjxbrZPNVpQ
 ERpnGEzodZJtxEvf8AFbmMHTiIIstXJexCXBxhHyW87R9622QYPiE4A/YH8xcLfD6BPb
 PXPhmBhTHZbHr6YzZrZZrqmPcMRhFdTWXKPX6YmeQl23MeTW3241ekPPIOv7FzqfYP+p
 N7IXNgb6Nqxl8H3YFDHlHZJwp0cUP0JP4GsJsbl2dQ2itDhUyG8gElXesMiw1kA7ZI/J
 yxB/626ZqwY+5bRujhs0aVHzivuZllDPtgGNt550xlfIegcBKpujNX8f1Wbr/4SnjDr7
 /Cew==
X-Gm-Message-State: AFq9FYIaOTYfsXTrhQv++Em52YIf4akWd4tnAgmt+TCtmtfpejgEHmEt
 w/ghFZvy83gXsAcjVPeDrW2n+C2iqjjE06KhnM3yyYi84tmjMQSKXIFjJaCBYQ==
X-Gm-Gg: AYBFou1dncX4G1duemPk2oTR3r9saFY+FSsip/mOWu7CEDzciTGZP8tgpvyWO5xMMo5
 9sGT8GNKk7O8ffrznFjU/d8Bnvp1i16oNh88+d+p5QS8Txm0qD/hQ9XF5hS1KMSfHqH7qDV6b4W
 7tNnwPR3JeBVpZsRWBQAdEviMWk6zpSv4Zg6NVAwZBQKbu+2grc6hKXNTo8Q3PmCNkLx0W0NmaI
 CNMXkw3N/Yt2R3InfLy5Qnoym3BmaI+ujfUVmGigBle4VBaSVOI7zr+dcVBgUzTU60XyUid6gX9
 noXnSpXpuOmOqa8n30ahWS2QV4ineOATOsVYbsFjm9ZzrlMsLw9186euv1aLzTxf4NOjiUBIIu3
 uakm0PQtFbm2mEkZc6v5ltzbAPu/3rQDE9WA4KyxjpjtHEUZ1uKWR+W4l+qh1SgAXtY0RNrrNZB
 rL9ZxDURsNZOLJYNoPfI9ITzwcGmnzerWImAJtNdlRChB1phjpHGp2YskVIKFt3pqaW66nInYMM
 wM99+E3i4/Gjh6cL/Bm2qAmXWukbXRMpaGggMiqrc9ip1ButHyU+pe3PA0ctw97FHv8Ru3rLjwd
 SeMOmrLLlM2RAqoE5qG6GZUC6vmQk3wlMcjQgf4a9rr/It60ayQFS3jvytbg9aVZJ1O5O+um74c
 CJHhF5OqJQRkQmm7+v2OdaxvJj3NaeA==
X-Received: by 2002:a05:6402:513:b0:6b4:1df2:244e with SMTP id
 4fb4d7f45d1cf-6b4d5ed9239mr3820046a12.38.1793519593167; 
 Sun, 01 Nov 2026 00:53:13 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4eca2112bsm1913804a12.32.2026.11.01.00.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2026 00:53:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 08:53:11 +0100
Message-Id: <20261101075311.1884920-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-snappy: fix build on
 architectures without Rust support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2luY2UgdmVyc2lvbiAwLjcuMCwgcHl0aG9uLXNuYXBweSB1c2VzIHB5dGhvbi1jcmFtamFtLCB3
aGljaCBpcwp3cml0dGVuIGluIFJ1c3QgYW5kIHRoZXJlZm9yZSBkZXBlbmRzIG9uCkJSMl9QQUNL
QUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMuIHB5dGhvbi1zbmFwcHkgc2VsZWN0
cwpweXRob24tY3JhbWphbSB3aXRob3V0IHByb3BhZ2F0aW5nIHRoaXMgZGVwZW5kZW5jeSwgc28g
aXQgY2FuIGJlCmVuYWJsZWQgb24gYXJjaGl0ZWN0dXJlcyBmb3Igd2hpY2ggbm8gUnVzdCB0YXJn
ZXQgaXMgYXZhaWxhYmxlLCBzdWNoCmFzIG1pcHM2NGVsIG4zMjoKCiAgV0FSTklORzogdW5tZXQg
ZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgQlIyX1BBQ0tBR0VfUFlUSE9OX0NSQU1K
QU0KICAgIERlcGVuZHMgb24gW25dOiBCUjJfUEFDS0FHRV9QWVRIT04zIFs9eV0gJiYgQlIyX1BB
Q0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyBbPW5dCiAgICBTZWxlY3RlZCBi
eSBbeV06CiAgICAtIEJSMl9QQUNLQUdFX1BZVEhPTl9TTkFQUFkgWz15XSAmJiBCUjJfUEFDS0FH
RV9QWVRIT04zIFs9eV0KClJVU1RDX1RBUkdFVF9OQU1FIGlzIHRoZW4gZW1wdHksIGFuZCB0aGUg
cHl0aG9uLWNyYW1qYW0gYnVpbGQgZmFpbHMKd2l0aDoKCiAgZXJyb3I6IHRhcmdldCB3YXMgZW1w
dHkKICDwn5KlIG1hdHVyaW4gZmFpbGVkCiAgICBDYXVzZWQgYnk6IENhcmdvIG1ldGFkYXRhIGZh
aWxlZC4gRG9lcyB5b3VyIGNyYXRlIGNvbXBpbGUgd2l0aCBgY2FyZ28gYnVpbGRgPwoKQWRkIHRo
ZSBtaXNzaW5nIGRlcGVuZGVuY3kuIFRoZSBvbmx5IHJldmVyc2UgZGVwZW5kZW5jeSwKcHl0aG9u
LWF1dG9iYWhuLCBhbHJlYWR5IGRlcGVuZHMgb24KQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJH
RVRfQVJDSF9TVVBQT1JUUy4KClRoaXMgaXNzdWUgaGFzIGJlZW4gcHJlc2VudCBzaW5jZSBjb21t
aXQgYThjMzE1YjYyYzBjCigicGFja2FnZS9weXRob24tc25hcHB5OiBidW1wIHZlcnNpb24gdG8g
MC43LjIiKSwgd2hpY2ggcmVwbGFjZWQgdGhlCnNuYXBweSBkZXBlbmRlbmN5IHdpdGggcHl0aG9u
LWNyYW1qYW0gYnV0IGRpZCBub3QgYWRkIHRoZSBSdXN0CmRlcGVuZGVuY3kuIEl0IGlzIG5vdCBw
YXJ0IG9mIGFueSByZWxlYXNlIHlldCwgYW5kIG5vbmUgb2YgdGhlCm1haW50ZW5hbmNlIGJyYW5j
aGVzIGlzIGFmZmVjdGVkLgoKRml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy8xMTY3MDcwZDRlZGUyZDM0N2YzNDM0MzhhYjYwOWMwZmIzZmRhNTE5CgpGaXhlczog
YThjMzE1YjYyYzBjZGEwMDQ1NjE2YmY4MWFjMDhlZDA5YzM0MzYyMSAoInBhY2thZ2UvcHl0aG9u
LXNuYXBweTogYnVtcCB2ZXJzaW9uIHRvIDAuNy4yIikKQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1
ZGUtb3B1cy01LTUKU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdv
b2dsZW1haWwuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLXNuYXBweS9Db25maWcuaW4gfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLXNuYXBweS9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvQ29uZmlnLmluCmlu
ZGV4IGEwZTgyODk2ODAuLmM5OGEzZmM3MWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNu
YXBweS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9weXRob24tc25hcHB5L0NvbmZpZy5pbgpAQCAt
MSw1ICsxLDYgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fU05BUFBZCiAJYm9vbCAicHl0
aG9uLXNuYXBweSIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FS
Q0hfU1VQUE9SVFMgIyBweXRob24tY3JhbWphbQogCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05f
Q1JBTUpBTSAjIHJ1bnRpbWUKIAloZWxwCiAJICBQeXRob24gbGlicmFyeSBmb3IgdGhlIHNuYXBw
eSBjb21wcmVzc2lvbiBsaWJyYXJ5IGZyb20KLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
