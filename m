Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45681CCD184
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 06:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B8A40A5F;
	Fri, 17 Oct 2025 06:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXyr6SFB1Uue; Fri, 17 Oct 2025 06:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D582140A5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D582140A5A;
	Fri, 17 Oct 2025 06:46:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 079661EB1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1AEF60B96
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whDNQ147i2uL for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 06:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB02360B94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB02360B94
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB02360B94
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:46:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4DB2CC041DB
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:46:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 91F1A606DB;
 Fri, 17 Oct 2025 06:46:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54655102F2334; 
 Fri, 17 Oct 2025 08:46:18 +0200 (CEST)
Date: Fri, 17 Oct 2025 08:46:17 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 nicolas.carrier@nav-timing.safrangroup.com
Message-ID: <20251017084617.7113dd26@windsurf>
In-Reply-To: <20251016-libldns_drill-v1-1-21bfa8c53896@bootlin.com>
References: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
 <20251016-libldns_drill-v1-1-21bfa8c53896@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760683588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9vMBDkpQrlWMdayFHCKfdawoCIhSAnQRHa3bO3J6oUw=;
 b=jXDMWWQwo8ClM5V17hpyYykGRK9o6KY/HWDk4pXrCejQ3uywdeJktK23RTeQwgATzPsRQE
 I/sxvHmFNGA3WcfwcjB8vbwLtg7YsZPOM2KnT9sjGBxf2SIaR0lm4KounvhxPzb6L7AtuR
 yvR5iY6IPPysYKpVywqVEeFcFz3z6QX9edq5gD3+iojZHLkLIWrgfqwOmPF5nCTorPzTfI
 3ojj5fKfho6t98ePX0QxuYNx6PEgsij6i6puSSafkzLDVuuk/aSiop32bo2OR4epIC1Ptc
 jybs8KHTCI6Hll0PXDaFBybIUiNSC8k0c35Ep1oUx/OutytQ9SWSvoQYKSYQBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jXDMWWQw
Subject: Re: [Buildroot] [PATCH RESEND 1/2] package/libldns: add an option
 to build and install drill
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGlzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpPbiBUaHUsIDE2IE9jdCAyMDI1
IDE3OjI3OjAyICswMjAwCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+IHdyb3RlOgoKPiBUaGUgbGlibGRucyBsaWJyYXJ5IGFsc28gY29tZXMgd2l0aCBhIENMSSB0
b29sIG5hbWVkIGRyaWxsLCBhbGxvd2luZyB0bwo+IHBlcmZvcm0gRE5TIHJlcXVlc3RzLiBEcmls
bCBidWlsZCBpcyBjdXJyZW50bHkgZGlzYWJsZWQgYnkgZGVmYXVsdC4KPiAKPiBBZGQgYSBLQ29u
ZmlnIG9wdGlvbiB0byBhbGxvdyBidWlsZGluZyBhbmQgaW5zdGFsbGluZyBkcmlsbCB0b29sLiBT
ZXQKPiB0aGUgZGVmYXVsdCB2YWx1ZSB0byBuIHRvIHByZXNlcnZlIHRoZSBjdXJyZW50IGJlaGF2
aW9yLiBTaW1pbGFybHkgdG8KPiBsaW5rdGVzdCAoc2VlIHRoZSBjb21tZW50IGluIHRoZSAubWsp
LCBkcmlsbCBmYWlscyB0byBidWlsZCBjb3JyZWN0bHkgYXMKPiBhIHN0YXRpYyBiaW5hcnksIHNv
IG1ha2UgdGhlIG5ldyBvcHRpb24gZGVwZW5kIG9uIG5vbi1zdGF0aWMgYnVpbGQuCgpNaXNzaW5n
IFNvQi4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibGRucy9Db25maWcuaW4gYi9wYWNrYWdl
L2xpYmxkbnMvQ29uZmlnLmluCj4gaW5kZXggNjk2ZmVjOTdiNTk4NTdmYmQ5OWJkY2FhYmFiYTA5
ZDQ5Nzc0ZjNhZS4uN2ExNjljNDk1MjgxYmUwMWIyZWU3MjRmZDJmOWUyN2I4M2Y1ZTJlYyAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmxkbnMvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9saWJs
ZG5zL0NvbmZpZy5pbgo+IEBAIC04LDMgKzgsMTcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQkxE
TlMKPiAgCSAgZXhwZXJpbWVudGFsIHNvZnR3YXJlIGZvciBjdXJyZW50IEludGVybmV0IERyYWZ0
cy4KPiAgCj4gIAkgIGh0dHA6Ly93d3cubmxuZXRsYWJzLm5sL3Byb2plY3RzL2xkbnMKPiArCj4g
K2lmIEJSMl9QQUNLQUdFX0xJQkxETlMKPiArCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJMRE5T
X0RSSUxMCj4gKwlib29sICJkcmlsbCBiaW5hcnkiCj4gKwlkZWZhdWx0IG4KCmRlZmF1bHQgbiBp
cyB0aGUgZGVmYXVsdCwgc28gaXQncyBub3QgbmVlZGVkLgoKPiArCWRlcGVuZHMgb24gIUJSMl9T
VEFUSUNfTElCUwo+ICsJaGVscAo+ICsJICBJbnN0YWxsIHRoZSBkcmlsbCBiaW5hcnkKPiArCj4g
K2NvbW1lbnQgImRyaWxsIG5lZWRzIGR5bmFtaWMgbGlicmFyeSIKCmNvbW1lbnQgImRyaWxsIG5l
ZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKCk90aGVyd2lzZSwgbG9va3MgZ29v
ZCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
