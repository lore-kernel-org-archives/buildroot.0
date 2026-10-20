Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0794D606A31F
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i6bZ7NCI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D80540820;
	Tue, 20 Oct 2026 09:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I30qC5U8YGMf; Tue, 20 Oct 2026 09:06:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A11944081F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792487193;
	b=IXWBniGQTwwAOuSU0x/fGuZfhSVSo4bE+V9NY0L8F6biZsFFufICmaMgWDB1zO6XHLDs
	 7faU2+Rb4TdwNSgEPEYwg/pOYmV9qXKalZsZs8l+60dkUq7JN1u09RrADVH2j/6VSHPL3
	 eRKG4137a5pz+yN7PN61BqrxxX4Aw8tleKgsFXrLqY5RoAgM59hcb7biGpdHVBEb1FHl3
	 ODMAATTlyWhO5RagWLslzk+quQDwETtkUFTTb2TfpSv7NgT1QyadAUcq5OAfdoPThXY+0
	 EWQThlM2Jvz+3iEF3IJXZZRHa4HCA1odr76z+Qp4kwMSZO+GLN3e3KS00SnWYVEdkXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792487193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mO/c6A1fiaXTv7UGBBafiMloQcE9t9c1Lnir36mGCGg=;
	b=VyhElfsJQmssUalTwYPaD34yz3p/URoa2QDTDovQpGnVH5sgp3ycMEqC3R3dlwPKdOJb
	 xOImeHtSB/epOdGcDJA9quRxv7Q5uTNIsduh8f2x/0TUTGEQWlVMReSjATOupVgFwZWy1
	 7fPRrYS5c2YBWLrNzNKNnzCalgySpfKPGg0aQaxoeYasn2oR3gWO1w67Kp3YfM+u0tT3c
	 F/yOzIOIisefSV/28nitdiuarSKQArJrCZlfcVz8WtLcTHfXiyx3iSxmQxyQlL88Sq4x+
	 6mWpTEcwlSkhMgwJFbgnYJxiadQvSSWUTrYm7p8LIZB2+Xk4zcC/l16t2xaZpsZGHsA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792487193;
	bh=mO/c6A1fiaXTv7UGBBafiMloQcE9t9c1Lnir36mGCGg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i6bZ7NCIgU+AlNq0uco3jNyGlahpOiDfZ7jQ1HktZGVhg4dSQY1YP2/qbF9+7ekdz
	 WyRMLw3orf8f0N/ugNcvJJJZL97v26eN8BJ2Wxxh/d7wTFHtOWb1tBkzwQvMR3FL7C
	 m3vUhqrv5cXyL+RPBIZp16w6t8FBMMjdVD8K8V2rPKwf7M5my/YBFUHW/BFJGARwmn
	 Oa7giGrDcEdrGlH2lmM9NIaEfqcqkoIFanf5PQvsyTeSytEAHik5dwLk57p03Ff4Qq
	 rfzR8/zv8S10V3JZnlUXh+9rxb+BhMAXbm6AtEd1IbYby1WlQ77QFFAKrR65ci8icz
	 9nnOlUimFRIOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11944081F;
	Tue, 20 Oct 2026 09:06:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5B7B1DE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9714840328
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QTy8XrZPCjS for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 09:06:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 43B524016F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792487190;
 b=UuMxOm1knjmxVQUSwfE8nuLA14ddl9Iqq+pJUvtc8iByL35fNfNchQEScUExkbcJKHrD
 YRoeLgxQn/RCsphGVRRwn0US+YfSSR/u5XEnjGzgI42IX2tX/EN3Oqiim7U2cMA9DLO86
 Si0IlAzLGudKURrpgJO+1QnlXIyzGU99bTl9R9lH4kJ7oXIdmqazClHzD9r8orSyGN5y6
 VVBOGMgg6TdRUiXzIlklhe9zDqKakloXQsIqs4VkpiGN2NlKqSq8g53K6fqUWXC/xSvjU
 LWBD3KCqv+kFD13iuYzkeYgjb2OLkG7/l+wenX4hY6SvGKABar/oInXTVl2Q5/SbsXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792487190;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=NcDu5VKCSBKm/lS/6vzpFyakXS5qkN9Mr6aLSHG20DE=;
 b=lGGnNYKwcecwgEbcthuv3qWVKH6sEsZiIqFZVgZ8iysvyU3Om6NG2oG1e+Fj0pGdZrTg
 WWbnyqyHm3fQ8X+W4UbBDQ6+8hlo8YW2HF2em0vZEVxw0UUD9GhgAHc9bV7kyIknBDYoL
 Cz3FiherescQcWSjkAtULZO1vUvP2aeSKvqcfHvmNAivaCDl/ic23gjldw3f230QSkIyd
 VQ2HFLAOl7bh4DpDegJqdBC+ppAAm1gFotul1KyLKhzqdXWAsPk4E/686m12qSezeFjF+
 vLGAIoC1byu7xa6NKESUS3eohL/6uPbCHHtPTX/OfBwq/uGIvAzlRwfo/b/H8GyJIvw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Fr014eRl; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43B524016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:06:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E7E6D1A12A5
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:06:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B41B360393;
 Tue, 20 Oct 2026 09:06:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B2D810328D1B; 
 Tue, 20 Oct 2026 11:06:26 +0200 (CEST)
Date: Tue, 20 Oct 2026 11:06:25 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atcvDaG0ITZz3FPm@windsurf>
References: <20261020081557.2965981-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020081557.2965981-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/iperf3: fix build with LibreSSL
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjAsIDIwMjYgYXQgMTA6MTU6NTdBTSArMDIwMCwgWWVnb3IgWWVmcmVtb3Yg
d3JvdGU6Cj4gaXBlcmYzIDMuMjIgYWRkZWQgYSBuZXcgImdvdG8gZXJycmV0dXJuIiB0byBkZWNy
eXB0X3JzYV9tZXNzYWdlKCksIG9uCj4gYSBjb2RlIHBhdGggdGhhdCBpcyBjb21tb24gdG8gYWxs
IE9wZW5TU0wgdmVyc2lvbnMsIGJ1dCB0aGUKPiBlcnJyZXR1cm4gbGFiZWwgaXMgb25seSBkZWZp
bmVkIHdoZW4gT1BFTlNTTF9WRVJTSU9OX01BSk9SID49IDMuCj4gTGlicmVTU0wgZG9lcyBub3Qg
ZGVmaW5lIE9QRU5TU0xfVkVSU0lPTl9NQUpPUiwgc28gdGhlIGJ1aWxkIGZhaWxzCj4gd2l0aDoK
PiAKPiBpcGVyZl9hdXRoLmM6IEluIGZ1bmN0aW9uICdkZWNyeXB0X3JzYV9tZXNzYWdlJzoKPiBp
cGVyZl9hdXRoLmM6MzQzOjk6IGVycm9yOiBsYWJlbCAnZXJycmV0dXJuJyB1c2VkIGJ1dCBub3Qg
ZGVmaW5lZAo+ICAgMzQzIHwgICAgICAgICBnb3RvIGVycnJldHVybjsgICAvKiBvcjogcmV0dXJu
IDA7IOKAlCBuZXZlciByZWFkIG1vcmUgdGhhbiBvdXRwdXRfYnVmZmVyX2xlbiBieXRlcyAqLwo+
ICAgICAgIHwgICAgICAgICBefn5+Cj4gCj4gQmFja3BvcnQgdGhlIHVwc3RyZWFtIGNvbW1pdCB0
aGF0IGRlZmluZXMgdGhlIGxhYmVsIHVuY29uZGl0aW9uYWxseS4KPiAKPiBUaGlzIGlzc3VlIGhh
cyBiZWVuIHByZXNlbnQgc2luY2UgY29tbWl0IGNiMTI5YTY0MWI0MCAoInBhY2thZ2UvaXBlcmYz
Ogo+IHNlY3VyaXR5IGJ1bXAgdmVyc2lvbiB0byAzLjIyIiksIGFzIHRoZSBicm9rZW4gY29kZSBm
aXJzdCBhcHBlYXJlZCBpbgo+IGlwZXJmIDMuMjIuIFRoYXQgY29tbWl0IGlzIG5vdCBwYXJ0IG9m
IGFueSByZWxlYXNlIG5vciBvZiBhbnkKPiBtYWludGVuYW5jZSBicmFuY2ggeWV0LCBzbyBvbmx5
IG1hc3RlciBpcyBhZmZlY3RlZCwgYnV0IHRoaXMgZml4Cj4gc2hvdWxkIGdvIGFsb25nIHdpdGgg
dGhlIDMuMjIgYnVtcCBpZiBpdCBnZXRzIGJhY2twb3J0ZWQuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzZlZDhmNjBmNTZmN2ZjZDExZWFhMWJh
MTYwODM3Mjc1YjgxMTNlMWEKPiAKPiBGaXhlczogY2IxMjlhNjQxYjQwM2NmYzRjMWIyZWE5Mjgw
Yjk2NmUxOTgzN2I2MiAoInBhY2thZ2UvaXBlcmYzOiBzZWN1cml0eSBidW1wIHZlcnNpb24gdG8g
My4yMiIpCj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy01LTUKPiBTaWduZWQtb2Zm
LWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+CgpBcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzIQoKQmVzdCByZWdhcmRzLAoKVGhvbWFzIFBldGF6em9uaQotLSAK
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
