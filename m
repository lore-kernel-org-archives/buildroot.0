Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gJN5aIBX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F1460711;
	Fri, 23 Oct 2026 13:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BD2TKZFDjqln; Fri, 23 Oct 2026 13:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 63FC360809
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761688;
	b=hKYXqgwzzfrB21ctqEVsw9zuTRbd2z8ZRGrEzFOYECohG6iklKsDOe6pcz97kukCbhrI
	 +8vmnnmqBh5n+8uGgV4PEtKyMigMOG8g2fKJ1su8AV3XW76npDsu+kyaLBhcDDRf0UdLD
	 DM12z8CddC96mg1tV68Upm9thnNaOd73s6LR5IGkiuUu5hx3WxuB4Ip8aoo/pYTLRETEn
	 1EmnzaDIBE9T5DtH/wn00Br4fkK220bQKvcTT6DsGwIBFC+xM/Wvf+1M+r+8OhI5/dC84
	 2auuzoPfZ6MQ4qa6yqJbfbxQe5uFKhJf9LYqsYOVJwT4e7zEO0/qnpN+pG/FK7eUr/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761688;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uPw7TeGsQUfplDPvfKLIFfeMCR7gb5oYymmV//STM2c=;
	b=b/PIf21MxMO5TbyhSaWBu1GzGQrKrLHPhPkp2KiTMju8hxHYk8Az9yr1j15lxljUtOFq
	 DaAhijOrAzFRQ/VDjvJ2Bbl/yX1MVac8nLeA6A0jSYhTjNQpHP2RTNgNM7TUQmCqRgQa4
	 wcnYfPxHjYDyzAFKl5jByXHka15ocyQOj+cTYPQC7Cienwo9HMlaDJTdBGb5xTvQMNcCk
	 dTp+boOlXgZ0bLhD35ojEqGV1ytuFLinhxPjwE0EqA+otoWh6dDz+CXk9MiQORR1ceIIh
	 3qs/2xTtfczA+y04SNzWj7SYWiFt2M1eoUOGlIRMXI/SwFFY8NGHYJM9mszfejx9BPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761688;
	bh=uPw7TeGsQUfplDPvfKLIFfeMCR7gb5oYymmV//STM2c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gJN5aIBXL09I3ChCrfAvdksOZfgEReRRx6U07u3QKMPtOEIo3nN0jQqv8R4xCdERy
	 YLYMB2VUy55umz4lcA56R0F6lXG1QRqnLrOvYvKEQyEiIIRyLgl3fyBrUvrMO8PsSy
	 RtE1lp9L/S1TybPojVPWohgVvnw5qET2Q8wunmMwdYbKvLZHRr/YT4prMSdN5pyodl
	 JKP2M0BoW2DHq7WB3e4bRvfEV7grXq3Rl01dzrx4AGoHzgwUCaGQTmYA9XAf33Zbm4
	 tnTjry63bRxNQWoB2a0jFMZ35cHDnCyXhk672feJUys9onuKKadRml8/wR0wNwPU/c
	 iBj4zOTeQ44+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63FC360809;
	Fri, 23 Oct 2026 13:21:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67214356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D5916071A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ih6mR9butm2O for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 12C51608CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761684;
 b=nP211y2WJjchJowvAEg5/jFyF1/coJbVRkJPaAJRi0GK4xZzBgb4REnpixzdASRDc4rK
 3SFjFPkhOQFeQ152jzEt6gT5hFQnC88V8iLb0d8XwNFSQL9c9ieCLqOXJ9ZCTzGNC76Md
 qT9FqrCEctR0iHNGN/iGqYQwi6CuyyXcw255l37rizzJqfphkCD9fZGxdZy5AgcP5eE8d
 Nhz+EnaDK4bT6RSkwXN/uKpGSJw9XatkG/YnsZZxTiOunt6Ua8iADbQjZeFlRNyTipwJw
 nL/KHU6TIU06SZe4S3uCnUrm/nZYdWZCepBmW+3Rlysd8xarnjFUoaTRXoPcXfhN5zQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761684;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=+DdMitNfddi0pJVbxj2Ox24dzfq/KZbmxEj6y17TWUw=;
 b=ni8O6/GJ2QK5lOFLbzN+6zyiupG6486fWemGTmvl8/sUWV3ocRiyPh4Bycpqel93n7cf
 6hoFJOLiILJOUssd4VgzfLrJrnrzTf1pB57U6j/fKex+wonpaUq+5MkjFFY73pzeF0wuN
 E65yRXTRxTouAu2sy1KI85LyIDkhOQJy279cCUucRjb8kGwXhCR6QN0jst6RVZRwpw/UB
 WcHbpOrOi9VpgDVJ2YvlLsfchoNpqA4leJVeKs1zJvhxizIZmpIobmVI1gB+bHh2QvlXL
 HYCWlNGzQuwsTCrKvudXmOy3c+bBWOKnYxxgfDGz7X+Pn/kq4lcOvbMgnAURYKcJbGg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eqHNa8vK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12C51608CD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso5953105e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761681; x=1793366481;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+DdMitNfddi0pJVbxj2Ox24dzfq/KZbmxEj6y17TWUw=;
 b=xMoiQkFTT0YwtWrhLIJkXkA5n1NF4gdRJUF3hY2YgqyJN8KqEn0dF05bo0C9F+qS79
 PIuBRn+gniUSBLpP6GA0BqsNr9My3sQwQZY/lWypk1JfIuIJrsBJ7aQmhbhpG6xlHNxl
 EAsK+TGsmxurMnMfO2b/Do44/wdyrKGkbMoidKYCPm2fLGeQgO7wPrjWE1uwTnGtUqr9
 yjrx5yXzWS4yrscVA3NvXnGKeib+xL/Jr7g2kOpIETzXziWpgS9WyKNU3/iCvY72yzuJ
 GlLDxhTHS1Tgify6Qfkxfbc6dflFoXgkOOrAqZvr+KNU/zLDlk0GRv1AdMSXfdiUzf4x
 RDhQ==
X-Gm-Message-State: AFq9FYJpsaajhS1mY5V5twAclk9A4bEoRJPgTqHzhBKeWfaVflDaZTVU
 inujSuHqh9FHHV5VBYOiEkP0+XVgsaWg6SoHr/HjN+7FyeYNhxShLEXOgvteztc/ycKYO1W56HE
 beWMmAww=
X-Gm-Gg: AYBFou3RYq34CBPic8fUh+yS09eRhvnvPLosKsMxl8Q0CbqgGpGYMhiL7tAzXL7v53q
 5c6Qf9VH012hISYazpkFSpEdG18M8qxY/8M/aro/Jc7OTdysksduXMZNMFfBqm6kFWL2KbempzH
 CDgFiORk8rW0pzBustxmKtNy4iL80fA4KLKX5G6TlLOCiB1R4UdRcxmb5n37VBujODB0ZolLiUJ
 T+ltWPVz1DKM6p6Eh3ogDx+yZh6VXtCS7xDRSNrE+CxfUJxgGEdpcb2OpWwKFpbSZ2vPf7eY704
 eLTW25uVxQAG2vcIX0NcyNjybtA3UzRWAEqJSiUO+AJphVbgJ8+7BOY0+c/L+QdTlxAwZasSojW
 pXP1pSfKd0H2IquW7z6AfEvI6kovCcBr/T0kp2UZJsXg/XdEo7c4656qstzFNlPraGzdpmdgPjW
 jAhPkidl3n0m0FPtiLvRl/WeRUL07neDyJNEehEFnk7d/6Bo/TqT2Byb4j3UbmJk9Xrz49kY9hw
 KRbdYkugbI0lYQgWo4UCfMSXG0PWO71YJ72ldT73raGUD+EwzX5mEH4Tg==
X-Received: by 2002:a05:600c:3f07:b0:4a2:150f:1603 with SMTP id
 5b1f17b1804b1-4a2150f17b6mr28287895e9.25.1792761681468; 
 Fri, 23 Oct 2026 06:21:21 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2a9062ce5sm5238955e9.1.2026.10.23.06.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:21 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:18 +0200
Message-ID: <20261023132120.1607892-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020064409.179420-2-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 2/3] package/python-scipy: fix
 build with GCC14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gV2hlbiBidWlsZGluZyBweXRob24tc2NpcHkgcGFja2FnZSB3aXRoIHRh
cmdldCBHQ0MxNCB0aGUgZm9sbG93aW5nIGVycm9yCj4gd291bGQgb2NjdXJlOgo+IAo+IC4uL3Nj
aXB5L2ludGVycG9sYXRlL3NyYy9fZml0cGFja21vZHVsZS5jOiBJbiBmdW5jdGlvbiDigJhmaXRw
YWNrX2Jpc3BlduKAmToKPiAuLi9zY2lweS9pbnRlcnBvbGF0ZS9zcmMvX2ZpdHBhY2ttb2R1bGUu
YzoyNTU6MTA6IGVycm9yOiBhc3NpZ25tZW50IHRvIOKAmG5weV9pbnQzMiAq4oCZIHtha2Eg4oCY
bG9uZyBpbnQgKuKAmX0gZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIOKAmGludCAq4oCZ
IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+IDI1NSB8ICAgICBpd3JrID0gKGludCAq
KSh3cmsgKyBsd3JrKTsKPiAgICAgfCAgICAgICAgICBeCj4gCj4gVGhpcyBoYXMgYmVlbiBmaXhl
ZCB1cHN0cmVhbSB3aXRoIHRoZSBwYXRjaCBbMV0gaW50cm9kdWNlZCBpbiBzY2lweQo+IHZlcnNp
b24gJzEuMTMuMCcuIEZvciBtb3JlIGluZm9ybWF0aW9uIHNlZSBbMl0uCj4gCj4gQmFja3BvcnQg
dGhpcyBwYXRjaCBpbnRvIHRoZSBjdXJyZW50IDIwMjUuMDIueCBzY2lweSB2ZXJzaW9uLgo+IAo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vc2NpcHkvc2NpcHkvY29tbWl0L2ZkZjNiOTA4ZWViOTMy
MDNjMTg0N2M2ZmI0ZWZkMTJlODhjMzdjZTUKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3NjaXB5
L3NjaXB5L3B1bGwvMjAxMzUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9t
YXMucGVyYWxlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIDIwMjUuMDIueC4gVGhhbmtzCgo+IC0tLQo+
ICAuLi5lLUZfSU5ULWFzLWludC1yYXRoZXItdGhhbi1ucHlfaW50MzIucGF0Y2ggfCA1MCArKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1zY2lweS8wMDAzLWludGVycG9sYXRlLWRl
ZmluZS1GX0lOVC1hcy1pbnQtcmF0aGVyLXRoYW4tbnB5X2ludDMyLnBhdGNoCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNjaXB5LzAwMDMtaW50ZXJwb2xhdGUtZGVmaW5lLUZfSU5U
LWFzLWludC1yYXRoZXItdGhhbi1ucHlfaW50MzIucGF0Y2ggYi9wYWNrYWdlL3B5dGhvbi1zY2lw
eS8wMDAzLWludGVycG9sYXRlLWRlZmluZS1GX0lOVC1hcy1pbnQtcmF0aGVyLXRoYW4tbnB5X2lu
dDMyLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mNzIy
YzRjYTM3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNjaXB5LzAwMDMt
aW50ZXJwb2xhdGUtZGVmaW5lLUZfSU5ULWFzLWludC1yYXRoZXItdGhhbi1ucHlfaW50MzIucGF0
Y2gKPiBAQCAtMCwwICsxLDUwIEBACj4gK0Zyb20gNTM3OTY3NzJlZDczNWMxNTY0ODYzZmM3Y2E4
ZDkwMmFjYjYyODE2NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogUmFsZiBHb21t
ZXJzIDxyYWxmLmdvbW1lcnNAZ21haWwuY29tPgo+ICtEYXRlOiBUaHUsIDIyIEZlYiAyMDI0IDA5
OjEwOjQ2ICswMTAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gTUFJTlQ6IGludGVycG9sYXRlOiBkZWZp
bmUgYEZfSU5UYCBhcyBgaW50YCByYXRoZXIgdGhhbgo+ICsgYG5weV9pbnQzMmAKPiArCj4gK1Ro
aXMgZml4ZXMgYW4gaW5jb21wYXRpYmxlIHBvaW50ZXIgaXNzdWUgdGhhdCBzaG93cyB1cCBhcyBh
IHdhcm5pbmcgaW4KPiArV2luZG93cyBDSSBqb2JzLCBhbmQgaXMgcmVwb3J0ZWQgdG8gYnJlYWsg
dGhlIGJ1aWxkIHdpdGggR0NDIDE0IG9uCj4gK0ZlZG9yYSA0MCBpbiBnaC0xOTk5My4KPiArCj4g
K1VzaW5nIGAjZGVmaW5lIEZfSU5UIGludGAgaXMgZG9uZSBpbiBzZXZlcmFsIG90aGVyIHN1Ym1v
ZHVsZXM7IHRoaXMKPiArd2FzIHRoZSBvbmx5IGluc3RhbmNlIG9mIHVzaW5nIGBucHlfaW50MzJg
Lgo+ICsKPiArQ2xvc2VzIGdoLTE5OTkzCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIu
Y29tL3NjaXB5L3NjaXB5L2NvbW1pdC9mZGYzYjkwOGVlYjkzMjAzYzE4NDdjNmZiNGVmZDEyZTg4
YzM3Y2U1Cj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWlu
ZC5iZT4KPiArLS0tCj4gKyBzY2lweS9pbnRlcnBvbGF0ZS9zcmMvX2ZpdHBhY2ttb2R1bGUuYyB8
IDQgKystLQo+ICsgc2NpcHkvaW50ZXJwb2xhdGUvc3JjL2ZpdHBhY2sucHlmICAgICAgfCAyICst
Cj4gKyAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAr
Cj4gK2RpZmYgLS1naXQgYS9zY2lweS9pbnRlcnBvbGF0ZS9zcmMvX2ZpdHBhY2ttb2R1bGUuYyBi
L3NjaXB5L2ludGVycG9sYXRlL3NyYy9fZml0cGFja21vZHVsZS5jCj4gK2luZGV4IDBlOTEzZDFj
N2U0My4uZGM3OWIyYjI4ODMzIDEwMDY0NAo+ICstLS0gYS9zY2lweS9pbnRlcnBvbGF0ZS9zcmMv
X2ZpdHBhY2ttb2R1bGUuYwo+ICsrKysgYi9zY2lweS9pbnRlcnBvbGF0ZS9zcmMvX2ZpdHBhY2tt
b2R1bGUuYwo+ICtAQCAtMjgsOCArMjgsOCBAQCBzdGF0aWMgUHlPYmplY3QgKmZpdHBhY2tfZXJy
b3I7Cj4gKyAKPiArICNlbHNlCj4gKyAKPiArLSNkZWZpbmUgRl9JTlQgbnB5X2ludDMyCj4gKy0j
ZGVmaW5lIEZfSU5UX05QWSBOUFlfSU5UMzIKPiArKyNkZWZpbmUgRl9JTlQgaW50Cj4gKysjZGVm
aW5lIEZfSU5UX05QWSBOUFlfSU5UCj4gKyAjZGVmaW5lIEZfSU5UX01BWCBOUFlfTUFYX0lOVDMy
Cj4gKyAjaWYgTlBZX0JJVFNPRl9TSE9SVCA9PSAzMgo+ICsgI2RlZmluZSBGX0lOVF9QWUZNVCAg
ICJoIgo+ICtkaWZmIC0tZ2l0IGEvc2NpcHkvaW50ZXJwb2xhdGUvc3JjL2ZpdHBhY2sucHlmIGIv
c2NpcHkvaW50ZXJwb2xhdGUvc3JjL2ZpdHBhY2sucHlmCj4gK2luZGV4IDA4Y2IwYzE0MWM5OC4u
YTk1MzVhODNmNDc5IDEwMDY0NAo+ICstLS0gYS9zY2lweS9pbnRlcnBvbGF0ZS9zcmMvZml0cGFj
ay5weWYKPiArKysrIGIvc2NpcHkvaW50ZXJwb2xhdGUvc3JjL2ZpdHBhY2sucHlmCj4gK0BAIC0x
Niw3ICsxNiw3IEBAIHB5dGhvbiBtb2R1bGUgZGZpdHBhY2sgISBpbgo+ICsgI2lmZGVmIEhBVkVf
SUxQNjQKPiArIHR5cGVkZWYgbnB5X2ludDY0IEZfSU5UOwo+ICsgI2Vsc2UKPiArLXR5cGVkZWYg
bnB5X2ludDMyIEZfSU5UOwo+ICsrdHlwZWRlZiBpbnQgRl9JTlQ7Cj4gKyAjZW5kaWYKPiArIAo+
ICsgc3RhdGljIGRvdWJsZSBkbWF4KGRvdWJsZSogc2VxLCBGX0lOVCBsZW4pIHsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
