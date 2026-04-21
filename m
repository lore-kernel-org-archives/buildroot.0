Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9ACF94CAB
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0840C61407;
	Tue, 21 Apr 2026 20:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeXmlp1G61_G; Tue, 21 Apr 2026 20:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AD16139E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776803032;
	bh=jbNzMCrvMC+qzToDYj4FT01YbRhYpyAhceSPd/rh4FA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e8tAFHlfjdCLiCNEmyMf9GxnFGU8NTzvxBsyeFifRs0EdFnFb9tzfy1IAsBQ+IAw6
	 S3d4x0fL+I4LGzDTDy4lG3SUtiE8cyueM/o3hC0v4orRLCcWM3kb9jXucyajuNe8rT
	 AfKG+7h+HpM7jAY7eJ+dYEARG8E9oNvXuEXed2wiZrYFipDpy1MKZHP6cEUGPjOlq0
	 bRGvfTkBJ2vfluZeDBABgk/rejApYhIFAEIw4UErCOoXVEfdNZww00t0mF1NlatYL4
	 U6mo5SWt5trPxjmFhiNcB5Zd6gn+ebS3THh2emngT1jdaBGCQEg/cb5XTdmG8FACqz
	 aQQbvoNCqDa2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6AD16139E;
	Tue, 21 Apr 2026 20:23:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0181A183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E70BB420B2
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GoHMeJtSgA_F for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 20:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB02940403
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB02940403
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB02940403
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:23:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 56503B00571;
 Tue, 21 Apr 2026 22:23:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Apr 2026 22:23:44 +0200
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 22:23:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Qais Yousef <qais.yousef@arm.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260420184450.3781485-1-bernd@kuhls.net>
References: <20260420184450.3781485-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1e18ca8becb9c20a5e6f2f2e73c0a084@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776803027;
 bh=vuOn+yYnHvtXGHbklC1f9NLygVDumvtjqUt+RjUgcPs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UxyG1TOz/dtA4+l5midBMb0t/+zsZkAObUa7KU85nIZH5CB2CuQf54jGRjYMt0goB
 0RzkYbIQIcp/ePqG72x3R/lrncoXoQdZEE3BiJek65FjODidLOlbx4uoAog7uoV0FD
 MlcqpTU7A9XcX/TqtzKQPeSEymgfMo7p2w+OoWALRg7d9NNtPf8osGcwnDuQMnkvPZ
 YlL95iEPs3l56CycXEVE5a6ACPRGbTHiegQi1mN5CvruhAjzpB07mzFzpGA7fCzDnO
 735gsqg7d4bsB+GcxNcdIII2l1Q8OnSAfp9WiptK8GsiWnpY8t4/iixHgsPfNFqJIQ
 fSYyiiTAWOUsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UxyG1TOz
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftrace: bump version to 0.25.1
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

SGkgQmVybmQsCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCk9uIDIwLzA0LzIwMjYgMjA6NDQsIEJl
cm5kIEt1aGxzIHdyb3RlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9icGZ0cmFjZS9icGZ0cmFjZS9i
bG9iL3YwLjI1LjEvQ0hBTkdFTE9HLm1kCj4gCj4gQWRkZWQgY29uZmlndXJlIG9wdGlvbiBVU0Vf
U1lTVEVNX0xJQkJQRiB0byB1c2Ugb3VyIGxpYmJwZiBwYWNrYWdlLAo+IG5lZWRlZCBkdWUgdG8g
dXBzdHJlYW0gY29tbWl0Cj4gaHR0cHM6Ly9naXRodWIuY29tL2JwZnRyYWNlL2JwZnRyYWNlL2Nv
bW1pdC82ZDUzNzM4NjI3ZDRmODBjODNmNzk5ZjllMDQyZjZiZGQzNzNhNDMzCj4gd2hpY2ggd2Fz
IGFkZGVkIHRvIHZlcnNpb24gMC4yNS4wLgo+IAo+IFRoaXMgYnVtcCBpbmNsdWRlcyB1cHN0cmVh
bSBjb21taXQKPiBodHRwczovL2dpdGh1Yi5jb20vYnBmdHJhY2UvYnBmdHJhY2UvY29tbWl0L2M2
NDQyY2RlNmU0NTk0NWUzY2ZkNzJjYjJmZGJjY2E1OTA0NTRkMGMKPiB3aGljaCBhZGRzIHN1cHBv
cnQgZm9yIExMVk0gMjIgYW5kIGZpeGVzIGJ1aWxkIGVycm9ycyBpbnRyb2R1Y2VkIGJ5Cj4gYnVp
bGRyb290IGNvbW1pdCAyNWNiMzgxM2U3ZmM2ZWQzZTQ1NWY5ODNjZjBlMDljN2JjMDJmY2NiLgo+
IAo+IEZpeGVzOgo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy81OTkv
NTk5MjBmOTA5ZDgwODkxMWVhMjcxMDkzODI3MWVjZmFiNDhjMzY3Zi8KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+IC0tLQo+ICBwYWNrYWdlL2JwZnRy
YWNlL2JwZnRyYWNlLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvYnBmdHJhY2UvYnBmdHJhY2UubWsg
ICB8IDUgKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pClsuLi5dCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnBmdHJhY2UvYnBmdHJhY2UubWsg
Cj4gYi9wYWNrYWdlL2JwZnRyYWNlL2JwZnRyYWNlLm1rCj4gaW5kZXggN2IxYjQxNzgxYS4uZTMy
Nzk4Y2I4MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2JwZnRyYWNlL2JwZnRyYWNlLm1rCj4gKysr
IGIvcGFja2FnZS9icGZ0cmFjZS9icGZ0cmFjZS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4g
IAo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gCj4gLUJQRlRSQUNFX1ZFUlNJT04gPSAwLjI0
LjIKPiArQlBGVFJBQ0VfVkVSU0lPTiA9IDAuMjUuMQoKV2hlbiB0cnlpbmcgdG8gY29tcGlsZSB0
aGlzIG5ldyB2ZXJzaW9uIG9uIGEgYWFyY2g2NCBjb25maWcsCnRoZSBjb21waWxhdGlvbiBmYWls
cyB3aXRoOgoKL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnBmdHJhY2UtMC4yNS4xL3NyYy9icGZm
ZWF0dXJlLmNwcDo0NjM6NDE6IAplcnJvcjog4oCYQlBGX1RSQUNFX0tQUk9CRV9TRVNTSU9O4oCZ
IHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZQoKU28gZWl0aGVyIGl0IHNob3VsZCB1c2Ug
dGhlIGRlZmluaXRpb24gZnJvbSB0aGUga2VybmVsIGhlYWRlciwKaW50cm9kdWNlZCBpbiB2Ni4x
MDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxl
L2xpbnV4LmdpdC9jb21taXQvP2lkPTUzNWEzNjkyYmE3MjQ1NzkyZTZmMjM2NTQ1MDc4NjVkNDI5
M2M4NTAKCm9yIGl0IHNob3VsZCB1c2UgdGhlIGRlZmluaXRpb24gaW5jbHVkZWQgZnJvbSBsaWJi
cGYsIGFuZCB0aGVyZSBpcwphIHByb2JsZW0gd2l0aCBpdC4gTWF5YmUgb3VyIGxpYmJwZiBpcyB0
b28gb2xkLgoKQ291bGQgeW91IGhhdmUgYSBsb29rIHBsZWFzZT8KCj4gIEJQRlRSQUNFX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLGJwZnRyYWNlLGJwZnRyYWNlLHYkKEJQRlRSQUNFX1ZFUlNJT04pKQo+
ICBCUEZUUkFDRV9MSUNFTlNFID0gQXBhY2hlLTIuMAo+ICBCUEZUUkFDRV9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQo+IEBAIC0zMCw2ICszMCw3IEBAIEJQRlRSQUNFX0NPTkZfT1BUUyArPSBcCj4g
IAktREJVSUxEX1RFU1RJTkc6Qk9PTD1PRkYgXAo+ICAJLURFTkFCTEVfTUFOOkJPT0w9T0ZGIFwK
PiAgCS1ESU5TVEFMTF9UT09MX0RPQ1M6Qk9PTD1PRkYgXAo+IC0JLURVU0VfU1lTVEVNX0JQRl9C
Q0M6Qk9PTD1PTgo+ICsJLURVU0VfU1lTVEVNX0JQRl9CQ0M6Qk9PTD1PTiBcCj4gKwktRFVTRV9T
WVNURU1fTElCQlBGOkJPT0w9T04KPiAKPiAgJChldmFsICQoY21ha2UtcGFja2FnZSkpCj4gLS0K
PiAyLjQ3LjMKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
