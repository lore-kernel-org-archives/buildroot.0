Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A524C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 08:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E466C810FD;
	Sun, 27 Sep 2026 08:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN3NuATz_1Ir; Sun, 27 Sep 2026 08:41:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C304D810F2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790498481;
	b=tUk6KYgIQ+1TG71CIEwiB8b/4YyUtqLPyTQXWl1HORjx5VOMpDArHySQPl1qIjNhHXHD
	 Xw6pFS2+SKc+qZfcvB8SmSVL3R4dpyHuWUuanJvf7TgicAeMDMdQKjPeeOGRmPEdssEx8
	 KepclP3aMmpGdiZxD4U0+ffp56EBMvSVRyAK9FrbtGOLQroRcTJe57KrT7vnFZdMgcwFJ
	 aS2RX1iOx7gJL/wd0HXn5c5Maa+E90fd7vUZuDgsH3JLOOb771yjIX2fjNoHslvABQw3n
	 D7VKtam6nP85RpljZbfM/8YlxaZr+sg/jMl19YDnE71LAvmyB72QpFcZpnS9Pe5KCQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790498481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RqGtMpN6U3oTQuz9VgBCpCSYy7Mi3xc3f/wq2n1cAlI=;
	b=MH39WLhhWobsCxGQ78WGGZmL5UqyzmBcF+FIqigTSe48S9qCp3g6gWUNt8cGDhflWHL1
	 kmJKBAOw9qcTvKkzalAXGpzzytjUncI+I/8zZ9/hKHutWZqg7C8cMKHDqzQSyT9lxAAyx
	 tDD4WaxK/F8F4BToE7Mresu6kqc0dPUrqrUacWGC8Ay7k+9KqsgEtMvmxtgGZwXvD/ElV
	 H8YAZXnUME+r8YGSV0TaHvMWVQfkyViPNO/HShWJP6oQwrafqkJuqn2kCb/tuNRsQABpW
	 Bzcygfvx9yFLFLPkrOOfOFa0BeqDt0pLdJEFmyrD1gCmJDAHDuIKTtA2r6ITrdlKVDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790498481;
	bh=RqGtMpN6U3oTQuz9VgBCpCSYy7Mi3xc3f/wq2n1cAlI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J9hCxniVuDYpAWK6qWbFP2UyyFi3AFbDWIhdFpZGVMGSfAnlB+ZfAOprh/5VI41Nd
	 RCWAsZ7t+Omo2qb4fEdp5ay3TADaaBdrqAhcZhhQxA20sqZEtaQa/yilXU6yLV2QCx
	 h0T9Yn1PiPHUfs5duG+IPOdcunJVIEGUFIfpCAnse3Wq70zV+c4PhNeYgepLLbO1fg
	 aGZYESXeet/DLHrVT+06BOIvuY/lxMoVyoZuyK+6ycf+9hvKgaoihGnS5vzWuXyCJd
	 5dx3bNwjgNKea4A81PKQT9NnJqQCzDwWhff7itSvy+5SLK4NZ29b1mEY6NkDE1/3SP
	 c4NHxx5yYvzBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C304D810F2;
	Sun, 27 Sep 2026 08:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AF632F
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D6C060623
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zR0wV82JKKCZ for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 08:41:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 23FE56064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790498478;
 b=jl1P/cOk2KwJC/g0o4gBatnUwhc1SnuZQrNfqB+RGRIE3P7nkhsaArKyJriLDAo3n5NH
 NJupfrpBSCEj9Rpk8QGCRua9qMU3goHZoorKkAJjGc2Rw2RCEnLIL45HJtnY3KOl1PRM2
 I0BBeiwPOP5LVPaAR/JkGbHIzpHwvhIvGfEutGuqF3J0D0vGcIjz00vIRtOKCrnAsSAnH
 EZ3cuO7CLhD7zBuKpsvalCAHpqYPgsfzCAqwRo1+1plH254QunAyFtp6lhP9PRzUR+nVd
 5m3i9rw7fHHW7YCh0HeO9p9nTaaWtTbqvInkpa21UgmnhstxvnAa6jb8dd7q2GJHHAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790498478;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=A6OOugdjNLeo0CHbcqAjAih9eBgocBwvGWcmA0SoyHU=;
 b=csTND9C4D82SoENv8oP7RXHC1lxi/qjyipcKv9UYHLj6956ujZWWRjJOAsyOWESUjfDv
 2s+X8nyk/W9Cf1rMLSB1tm7Esk9NhqUpbkMHvdDi8Ez4SOQJtmoyuQlrdIpNFpBmY0eiU
 r/d8PeT/mZNE2a6PcSpVS7XkkKiAqYEH/1BnGVFj7bYR0LJvVZycQqEPQ/X3pzPns1see
 Ze4cKFVZ6qFYoXCT1O1RQqvCbSnl39/9VlJFCVlc8gKj0LbluYGBtm2m4UjZ6bKvm02vQ
 BEnpODfVG0SOkp/XPItZE5DFaFq5TlHPMTqZ7a5FYmJHnVe6JtzPUwB8rHkk/WLs0lQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="g/aZ37Vb"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23FE56064B
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:41:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D1A45780375;
 Sun, 27 Sep 2026 10:41:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 27 Sep 2026 10:41:12 +0200
MIME-Version: 1.0
Date: Sun, 27 Sep 2026 10:41:12 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260926194259.2079812-1-ps.report@gmx.net>
References: <20260926194259.2079812-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <a67088380b78c7f70c0fb9b74c578623@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjYvMDkvMjAyNiAyMTo0MiwgUGV0ZXIgU2VpZGVyZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiAtIGJ1bXAgdmVyc2lvbiB0byAxLjIuNSAoZm9yIGRldGFpbHMgc2VlIFsxXSkKPiAtIHJlYmFz
ZWQgCj4gMDAwMS13c2NyaXB0LXJlbW92ZS1jaGVja3MtZm9yLWJzZC1zdHJpbmcuaC1maXhlcy1o
b3N0LWNvLnBhdGNoCj4gLSByZWJhc2VkIDAwMDItZGlzYWJsZS1QSUUtc3VwcG9ydC5wYXRjaAo+
IC0gcmVtb3ZlZCAKPiAwMDAzLW50cGQtcmVmY2xvY2tfZ3BzZC5jLUFkZC1taXNzaW5nLXRpbWUu
aC1mb3Itc3RycHRpbS5wYXRjaAo+ICAgKGZyb20gdXBzdHJlYW0gWzJdKQo+IC0gbW92ZWQgMDAw
NC1yZWZjbG9ja19ncHNkLWFkZC1idWlsZC1maXgtZm9yLWdjYy0xNC54LnBhdGNoIHRvCj4gICAw
MDAzLXJlZmNsb2NrX2dwc2QtYWRkLWJ1aWxkLWZpeC1mb3ItZ2NjLTE0LngucGF0Y2gsIHJlYmFz
ZWQgYW5kIAo+IGVuaGFuY2VkCj4gICBhcyB0aGUgb3JpZ2luYWwgY29uZmxpY3RzIHdpdGggdXBz
dHJlYW0gY29tbWl0IDU1MDUyNjBjICgiRml4IAo+IHJlZGVmaW5lZAo+ICAgX1hPUEVOX1NPVVJD
RSB3YXJuaW5nIGluIHJlZmNsb2NrX2dwc2QuYyIpIFszXSBhbmQgbGVhZHMgdG8gdGhlIAo+IGZv
bGxvd2luZwo+ICAgY29tcGlsZSBmYWlsdXJlOgo+IAo+ICAgICAuLi8uLi9udHBkL3JlZmNsb2Nr
X2dwc2QuYzoxMTM6MjE6IGVycm9yOiBvcGVyYXRvciDigJg84oCZIGhhcyBubyBsZWZ0IAo+IG9w
ZXJhbmQKPiAgICAgICAxMTMgfCAgICNpZiBfWE9QRU5fU09VUkNFIDwgNzAwCj4gICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICBeCj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMubnRwc2VjLm9y
Zy9waXBlcm1haWwvZGV2ZWwvMjAyNi1KdWx5LzAxMTAyOS5odG1sCj4gWzJdIAo+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9OVFBzZWMvbnRwc2VjLy0vY29tbWl0LzUxMzdjMTU1ZDg4OTVjZmM1MGZiNTc3
ZWU3MjBiM2IyMzU4OWM2NjIKPiBbM10gCj4gaHR0cHM6Ly9naXRsYWIuY29tL05UUHNlYy9udHBz
ZWMvLS9jb21taXQvNTUwNTI2MGNkMTRkMmZjNzJiZDFiYjI1NWI4MjhjMGExNDkxMjk0Ygo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuClNpbmNlIHRoZSByZWxlYXNlIG5vdGUgbWVudGlvbiBvbmUg
Zml4ZWQgQ1ZFIHBsdXMgZmV3IG90aGVyCnNlY3VyaXR5IHJlbGF0ZWQgZml4ZXMsIEkgbWFya2Vk
IHRoaXMgY29tbWl0IGFzICJzZWN1cml0eSBidW1wIi4KaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzFjYWViNjMyYTZlOTllOGY0Yzk4ZTcxYzRkZjAx
ZWViODk5NGYwNTUKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
