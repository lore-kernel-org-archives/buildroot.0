Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA49606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IXlae52E
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1632606F3;
	Mon, 26 Oct 2026 22:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kr8VOEeRp8sI; Mon, 26 Oct 2026 22:01:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECD9160607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793052066;
	b=p1xWVDI8n0qVd4kHAWDrgX/+58a82xr/xSK+lVzsx60RcMAapXyfvYm/3aidw3SNXSnr
	 MNwxXvDBWYgrM3KEqwl5TkNy7PxP8Z+Vo6wVGlsDTxIW82bPxOJWgOKY1i+rjv9arzL63
	 94QvC/3i3rZy26OUBuXntAiO9ckT8xbWR3J9zWDQYv0tAnRORKJx3QlZ8KamfjPr+h24Y
	 NWqnZjJtQB+WwXZqeaMMh0W3c0q0/7HWsowqd20IbNk3bcxprkFw+3dcRjJcPNids4rLn
	 vCW7De/2xoLg3Enr58rY0fkOwfJsUuPVBjSSWYlshgDbwPiS2HW+X/HaUofaStHgMZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793052066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GR6tqk+7oMKTxHMEnRTtHWHKH0peqUTsbZ+ResxzQbQ=;
	b=SZUFH7BVlIEta3jDiHg9AaMNqF1Se966aXSUeAqNrp9RDDBVI71XoouKCRtcrKBliC/c
	 VkKWs2liy5NTBWgHYlA/Mh23UhkdLtZWb/Mt1s7caiM2hhXKh91+gZzCTBwqxLLpJ3IFY
	 jZrl5Kpb8G+B+uPD9njSMVEQSvjZvO6IWY9RiweEJoO7TtHmidNuRYEvL2oVj2eM9zZwG
	 bICvM8KUZMlp9wR+saRhuVjP0SPxqQmdU4Off5nQ6ZKQ+ohU5/MLwpmZz7zYOcVxUUiU7
	 Wd7WdtHykvN+0VS9nNmsTWV0MeZ048qfGa136JFPG9YtMp5jbVhGY8ZjKGvTAWTXy4g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793052066;
	bh=GR6tqk+7oMKTxHMEnRTtHWHKH0peqUTsbZ+ResxzQbQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IXlae52EDY4UWRUOifw8+XJiL631lYduTRHBvGntWONrGlg+DuVqLRA64JASYKb2Y
	 onV8db+p98InzMGthvtl6WiPkHkdqa1enZJc2gJFIfJY/I776TuV8USCcPuy2Uat4y
	 MHZoc04VzWLhzr+u88u68WV5uOmaARDIhbj492vMPY5RJNu4Rj39G9Hhzvs3wcogOZ
	 N8pLKVZwMLdsj/fr0S6kCPF4Qwa00WWwleFhx86hWMP8YZiTCzBzRtxItDDEdeNati
	 0bXs8eJumVZACyit8rJHO69qWakzw4ewZd6R0DNKksCeMgIy9b27J+eVGYnFubcTSx
	 cEhmb8vJXhcqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECD9160607;
	Mon, 26 Oct 2026 22:01:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFED33421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C60F260607
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbzAyNhNFAwm for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 22:01:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 490AD605EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793052062;
 b=ePormWCVs3vt9UmlfOqp/0LWHoSZFc03TECJrnWXx02VGxbZ91Ls8RHyu6ccntRJJbQ6
 wjEgQBD6OoRS69S4dWP5WD6wGTeZ6REIiGMTrsMgBWROsVNestHjSwQEpKQkd926C+/rG
 7iNjCYlfOZmYkFMNATFUdm1sz6maeIugDTTU6GTQhSSAo+b3SwTUeKSStUwUIffaRpOBr
 1EVmnrpXcq5A3TrbqHFBEGryIQAsMHp8pbRYY+o3u8gFEdNOdiDQ5vnd4KAOPfE8Mysy/
 8yutNRsoquSm8I6J9ghzKuuw6+VLRXNRg3EvHWRtyLRerfsBubT6eMrvHAHrVO/zPOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793052062;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=ZMiK656Jh/RovOMDcuHQIbYHrPZp7ZT6aMKq3JVDnD4=;
 b=jvrKMQdskqaaHM4aQeBM+OBLKkRHPBz/CLEeV8nexF7LdtAqvkGyIL3wWds+jLe/AFIr
 Cvg8p1ZnRhhUjmYkjpi53KWMpXaqPQGlekBzc6sz42lUS6DXuAtlNo6NqAk+/mNX4bmA3
 ovZkjZXcu1IKwrhuX9hsuHBYOl5EOHEOmEfugWOLdnIvoRajX2oQErG6kRV+7EO3QvQ9p
 9Tgy0vvptomR8HMMuyC0NQwPt9kPboFr1FkM28n11vGFujJsxp0jboxGHCt0q7AwDG06J
 il7PeZZXi/vJ+eJGwJFFRxg8ZB0mRos5L5Jm7bnDDX5H+MyG7BTcZWS3X5nVTU7HRTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Mc07wYgK; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 490AD605EC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:01:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 56F8EC79AA7
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:01:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 161F060740;
 Mon, 26 Oct 2026 22:00:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2307710329061; Mon, 26 Oct 2026 23:00:52 +0100 (CET)
Date: Mon, 26 Oct 2026 23:00:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at_M-qMJUcg8AFGN@windsurf>
References: <20260620133605.3948549-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260620133605.3948549-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/lmbench: bump version
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgpPbiBTYXQsIEp1biAyMCwgMjAyNiBhdCAwMzozNjowNFBNICswMjAwLCBCZXJuZCBL
dWhscyB3cm90ZToKPiBSZW1vdmVkIHBhdGNoZXMgMDAwNS0wMDEyIHdoaWNoIGFyZSBpbmNsdWRl
ZCBpbiB0aGlzIGJ1bXAuCj4gCj4gQWRkZWQgcGF0Y2hlcyAwMDA1LTAwMDcgdG8gZml4IGJ1aWxk
IGVycm9ycyB3aXRoIG9sZGVyIHRvb2xjaGFpbnMgYXMKPiBkZXRlY3RlZCBieSB0aGUgR2l0bGFi
IHBpcGVsaW5lcy4KPiAKPiBGaXhlczoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvZjliL2Y5YjIyYmU5MTAzNjFmMGE5ZjAyMDgzMWM2ZTk2MGNiZjIxMjg5ZGEvCgpT
aW5jZSB3aGVuIGRvZXMgdGhlIGJ1aWxkIGlzc3VlIGV4aXN0cz8gRG8gd2UgbmVlZCB0byBiYWNr
cG9ydCB0aGlzCnZlcnNpb24gYnVtcCB0byBzb21lIExUUyBicmFuY2hlcz8KCklmIHRoZSBwcm9i
bGVtIGlzIHNvbHZlZCB0aGFua3MgdG8geW91ciAidW51c2VkIiBwYXJhbWV0ZXJzIHBhdGNoZXMs
CndoeSBhcmVuJ3QgdGhvc2UgcGF0Y2hlcyBhZGRlZCBzZXBhcmF0ZWx5IGZyb20gdGhlIHZlcnNp
b24gYnVtcD8KCj4gb3IxazoKPiBsYXRfbWVtX3Bpbmdwb25nLmM6IEFzc2VtYmxlciBtZXNzYWdl
czoKPiBsYXRfbWVtX3Bpbmdwb25nLmM6MTMwOiBFcnJvcjogdW5yZWNvZ25pemVkIGluc3RydWN0
aW9uIGBub3AnCj4gCj4gYndfbWVtNjRkLmM6IEFzc2VtYmxlciBtZXNzYWdlczoKPiBid19tZW02
NGQuYzoxNTQ6IEVycm9yOiB1bnJlY29nbml6ZWQgaW5zdHJ1Y3Rpb24gYG5vcCcKClRvIHNvbHZl
IHRoaXMsIEkgdGhpbmsgKGJ1dCBJIGFtIG5vdCAxMDAlIHN1cmUpLCB3ZSBjb3VsZCB1c2U6Cgpf
X2FzbV9fIF9fdm9sYXRpbGVfXygiIjogOiA6Im1lbW9yeSIpCgp3aGljaCBpcyBob3cgYmFycmll
cigpIGlzIGRlZmluZWQgaW4gdGhlIGtlcm5lbCwgdG8gYXZvaWQKY29tcGlsZXItbGV2ZWwgb3B0
aW1pemF0aW9ucy4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbG1iZW5jaC8wMDA1LXNyYy1sYXRf
c2lnLmMtZml4LWJ1aWxkLXdpdGgtZ2NjLTkueC5wYXRjaCBiL3BhY2thZ2UvbG1iZW5jaC8wMDA1
LXNyYy1sYXRfc2lnLmMtZml4LWJ1aWxkLXdpdGgtZ2NjLTkueC5wYXRjaAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMDg3ZDllOGFlNwo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9wYWNrYWdlL2xtYmVuY2gvMDAwNS1zcmMtbGF0X3NpZy5jLWZpeC1idWlsZC13aXRo
LWdjYy05LngucGF0Y2gKPiBAQCAtMCwwICsxLDQ4IEBACj4gK0Zyb20gZDRiYTQ3Y2VmMzg4YWNi
M2E5MWViMzlkZTRkOTMyOWEzODEwZjE0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJv
bTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiArRGF0ZTogU2F0LCAyMCBKdW4gMjAy
NiAxNDozNTozMiArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHNyYy9sYXRfc2lnLmM6IGZpeCBi
dWlsZCB3aXRoIGdjYyA5LngKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0
ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKPiArCj4gK2xhdF9zaWcuYzogSW4gZnVuY3Rpb24g4oCYaGFuZGxlcuKAmToKPiArbGF0X3Np
Zy5jOjIzOjE6IGVycm9yOiBwYXJhbWV0ZXIgbmFtZSBvbWl0dGVkCj4gKyB2b2lkIGhhbmRsZXIo
aW50KSB7IH0KPiArCj4gK2xhdF9zaWcuYzogSW4gZnVuY3Rpb24g4oCYcHJvdOKAmToKPiArbGF0
X3NpZy5jOjcyOjE6IGVycm9yOiBwYXJhbWV0ZXIgbmFtZSBvbWl0dGVkCj4gKyBwcm90KGludCkg
ewo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sbWJlbmNoL3B1bGwv
NjAKCkkgdGhpbmsgeW91IGdvdCBzb21lIHVzZWZ1bCBmZWVkYmFjayBvbiB0aGlzIFBSLCBjYW4g
eW91IGZvbGxvdy11cD8KClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
