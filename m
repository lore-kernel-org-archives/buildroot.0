Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D071C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 580DF405F4;
	Sat, 12 Sep 2026 13:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6HTI0a6cxxJ; Sat, 12 Sep 2026 13:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 71C2E4063E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789220758;
	b=MMJcN9SpaW0JRrIigo6c1YVj2KbtJm2zjnvc7L+FhqtMZjdPpLAcMLjUgvI0SqyVRPZp
	 aty1HS+fHzKpylnbCZptpRpgsSZ/0fW2PXu09+iWVMLy97lW15LpoS/Q0ovtbYj8+PmPb
	 wfd+7Qt+nYTv5YaI17hMJo07kFx9fQN/SjcsYzvAt7pT8hvEf6PyOVHUEwa7opmSkSQ/a
	 2SqxOB4aeDTr7gI+iPBq1Z07E4hBCiJgaXZNu7QLUIWd+mmmfw4LX1rTdZQIMpxQ5T+iG
	 gttbSuAtYGKZjrsweXfqE6txqBHCgjodQ6WXC3V5kCtF/A7ci8DW4ndyX/YDf+Tzmtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789220758;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=j/cqcznkmjfKzmMIXzFD69WETPNUtd6oP28oify++60=;
	b=qSc3MA29q4GDQn3VEKLiB/eQKUO/gleKvAIXDB9cAuTzE+6jXYgIT2TjU8LM3HeQ+G0S
	 VmRRsDDwUKyYKyU+npzI2owKhs7KuPuW8uFLAt8eVbxbyktnTYiFVX3kp2pX3JG0roG0g
	 8nZ2RTBJE7u8020EJ9/1+qxB7kR0MZeFANjqGz46DG05wvAsxdspFxkFcz1nIbGKfrryO
	 SbBGVM85gA12CyCLQ1dGXn4cVIQ6dxl08MBhoWy4m5QoB+/eFuBTGX9DzqY0L9pwJUcZe
	 rJj0RHYW2DzT2te9m/6QKpUiUqh37payQMwJeeEVqg/5LBv00cxqIqOfYTxJY0O6zGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789220758;
	bh=j/cqcznkmjfKzmMIXzFD69WETPNUtd6oP28oify++60=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q3FtbzR6DyRpKnT/r8apbrwaC6ArIWERlqaLkNIr+Nl6mK0sSRyqRPNzwKFVnEMTm
	 p/92Ek54gzxm2xO6NuyM+IhSrkCGR5NUBxEamMkUjYQakL1HzGkKyfPyl7IsCo2Zhz
	 k2XCCMhVAdlr2RTw3KH7RqLOyVR9tgxMhuiz7Rxc84ZRK1NAKN9GrPoNrE/Uw0e8VP
	 qWLimjAyz7VhFPd+bckDPGUamOqj/J5++XGl7z0RFh2oWNkpLgPlKkkuIlc9EvYZKS
	 iIhcKC7OhYMmc7oqGY0KEG8aKtQUXJeWVH1MdrUU0fQ5XVw0EWi54Z07UQXWsYVw91
	 WTu5WKvMk98Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71C2E4063E;
	Sat, 12 Sep 2026 13:45:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16FD523F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A2260621
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeZv_TFNlL2n for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:45:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E955A605F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789220756;
 b=c5ePQgmJ2yzcioMb6x8NED6LakayacSpGmMLEv9HmbtIZEU4qE7dfKbwBwp2J960p/zS
 23I2NGJqun4w3WAZlKCgSouw6nw63RJ+lruCBfde3ATiCJ+23bB1DI0rHtPc3WJ3CrLEl
 HAgsLixDyiEnEhFuARC08WUpThqtanjVzPicSgYuGybLWnXO2lT57G9NOujNuPMHlezWI
 wQpa6tGZ3udBAt/pUu+QdBX5asoHKT2qHeornkZ2qqmLbH3qEYR7FAV9okRhcyB8bcHfS
 vnCBm+zqb084/2lFJVXoQVgLIs/4a8QbllM4qhiFTRxOC/YzXX3LptCiZ5nKWAxCTZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789220756;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=JGJWhEw4LphvtkD+Icwp7xKbPiGvZKDdoDxfHHOmHRk=;
 b=k9qGZCZnGdkZwvuBMmy3JtMO15UzSQrW7OqqzrmTW4SSPnVCAtFa0r2yFT3m6vl6q9JO
 9HsAvCjyGXK9ICq7U6LMVIuyScUFKaFLg2u1E5yD0yedmkVuzbWAeFxJapdTPVB8euxWq
 w8/w9Xb0oF4yRyaEzdA4nHWfvS0dC04FidCezz9oszMSErlNncJu7PojnVKLpA/u/BNmh
 9a5VlPfsxSOmizIK9l4blKaU4FnX13ZGVrPPhXr10dkc7wzW/IRim1YiKiWh05fMj5sF3
 iZrhXP2mU8YICsK/0m0x7ngQdhyB52N1jzuBDFPb4lb3UwsIK+Cd5Jf31vKefLPlJYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gA9IIRHD; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E955A605F3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:45:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C90B5B00539;
 Sat, 12 Sep 2026 15:45:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 15:45:51 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 15:45:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904195503.1375486-1-bernd@kuhls.net>
References: <20260904195503.1375486-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <e1bf1e40016790e98f3847a7bdfa8c63@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/thrift: bump version to 0.24.0
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

T24gMDQvMDkvMjAyNiAyMTo1NSwgQmVybmQgS3VobHMgd3JvdGU6Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL2FwYWNoZS90aHJpZnQvYmxvYi92MC4yNC4wL0NIQU5HRVMubWQKPiAKPiBQbGVhc2Ugbm90
ZSB0aGF0IHRoaXMgYnVtcCBpbmNsdWRlcyBDVkUtMjAyNi00MTYwODoKPiBodHRwczovL2xpc3Rz
LmFwYWNoZS5vcmcvdGhyZWFkL3Z3c2Jjd3FkcHdkdHA4cWtqbzExb2w2cm9kYmZtMjFmCj4gd2hp
Y2ggZml4ZXMgYSBzZWN1cml0eSBidWcgaW4gdGhlIHB5dGhvbiBiaW5kaW5ncyB0aGF0IGFyZSBu
b3QgdXNlZCBieQo+IGJ1aWxkcm9vdC4KPiAKPiBCdWlsZGluZyB0aGlzIGRlZmNvbmZpZwo+IAo+
IEJSMl9hYXJjaDY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMX0NVU1RPTT15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9ET1dOTE9BRD15Cj4g
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9VUkw9Imh0dHA6Ly90b29sY2hhaW5zLmJvb3RsaW4uY29t
L2Rvd25sb2Fkcy9yZWxlYXNlcy90b29sY2hhaW5zL2FhcmNoNjQtLWdsaWJjLS1ibGVlZGluZy1l
ZGdlLTIwMTcuMDUtdG9vbGNoYWlucy0xLTIudGFyLmJ6MiIKPiBCUjJfVE9PTENIQUlOX0VYVEVS
TkFMX0dDQ182PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0hFQURFUlNfNF85PXkKPiBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMX0NVU1RPTV9HTElCQz15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9DWFg9eQo+IEJSMl9QQUNLQUdFX1RIUklGVD15Cj4gCj4gd2l0aG91dCB0aGlzIGJ1bXAgZG9l
cyBub3QgY2F1c2UgYnVpbGQgZXJyb3JzLgo+IAo+IFRoZSBHaXRsYWIgcGlwZWxpbmVzIGRldGVj
dGVkIGEgYnVpbGQgZXJyb3IgZm9yIHRoaXMgYnVtcCB3aXRoIHRoZQo+IGRlZmNvbmZpZyBib290
bGluLWFhcmNoNjQtZ2xpYmMtb2xkOgo+IAo+IC9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10
ZXN0LXBrZy9ib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkL2J1aWxkL3RocmlmdC0wLjI0LjAvbGli
L2NwcC9zcmMvdGhyaWZ0L3RyYW5zcG9ydC9UQnVmZmVyVHJhbnNwb3J0cy5oOjExMDozMjoKPiAg
ZXJyb3I6IOKAmHB0cmRpZmZfdOKAmSBkb2VzIG5vdCBuYW1lIGEgdHlwZQo+IAo+IFRvIGZpeCB0
aGUgcHJvYmxlbSB3ZSBhZGQgYSBwYXRjaCB0byBpbmNsdWRlIGNzdGRkZWYuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCkFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
