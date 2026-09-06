Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4540CC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 061A56060B;
	Sun,  6 Sep 2026 09:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIn0PYW-SjqF; Sun,  6 Sep 2026 09:11:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D6EAD605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788685867;
	b=eoaoYtSUe1jf8A87oVwD+bP312SlZLeCk1j4RexDSo51IakkH5j9B723hRhvZfc2HZYd
	 hSdX8TC9uRbTW6XDQhIZXnizwUrDT7FW2lJvC2llZiogpZ/sgn8L4reldr78HYOiXSgtI
	 NJSgg37lBaSQTuYyeH9eKp1+Tbp3llAId91DAOSGIOyVFr6oRAu2WJYy9wPzgmY8jtJhB
	 fvPYnmWXwLcml7H36zmSR2Fz2x0Y33bjebup5C3O4vZAAPHiG7Z3cjQ9UfFFQKlzIsPtz
	 1aES5Q6GgRxDIpnSjY8AR9dmgLPW3s3fwq+iLdN7UYB1+8w8JkzcDbG9HpZalfyKyxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788685867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=468A7jIOW/zoYXaSEouH6UMfZyYgE9y1jFQ8Vo6xZGc=;
	b=DpWPXFw0bOMdpl10pmxiBpvVzkOCAM2Vv5IpwIo184AS4X0YduusB1XRG+GlIPZuuTZo
	 5fNEgwleVZtzvlQJKCg8Hp2frHqS43N2Aw51XZLNPo4boJAOoIjkkh07gwYHWeYQyNA6e
	 vgLIWJe7WlpHNIhEW0Jr7ISCrTx7Sc2NPuWFiItajoYUvGuL2FAthMHWg+rLOB+ytRKHQ
	 tyXRHwJE2BYPzizuaD2EVfRk9gEfvfdAOuOimPJmVH3vf1Wvn8viDFLQD3Tgz0Re4tvfn
	 88Js8DqoF3TLcG09hgQslF4xuyCJ1usOTtL7+geUp9mFkn7u59CSAIR3NYSEmaPZFXQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788685866;
	bh=468A7jIOW/zoYXaSEouH6UMfZyYgE9y1jFQ8Vo6xZGc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VfvlgZALZCgJLrTwJLafDkqt+lJM2/s7crvsymjjWlhfZuYg7dMy9KRKT8pFJxhPc
	 1ZWDcM7MxlbmPmDkK6X2m8RlEbhe/PX1cacxZFAxpdYE+fDtl/iIWdoSQbvxk3MClF
	 8GZ1wcHJxqErwN5mTT1EMvHaVYbNU4wi2UEdaogYtkqEpCO8Cc/3GJroZETNYoL0e3
	 vDjliB5xx8a8J6q6RydqSQC/6IX6CCDj/SW5Vgh2H/NRJtU0r4iX3jB3eDa5AOynPq
	 1wAKUAIwozusVQgtCkf6ZD7C4MIsT5gMDmeapTzumcRzPkr+v3snBGY7kB1XkUe0BZ
	 s4keJs+fHWRNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6EAD605FF;
	Sun,  6 Sep 2026 09:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 993C072C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E76180D9C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiQP_jVVCpP9 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:11:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1796C80D64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788685864;
 b=c9UHlfvUS5HWDreZnAQRXn5mfdzDMRF4+PbT/CZwZDGhqWVVUTZ43CIEuMNXqCr5ykGT
 Mpd7GUC19pphTrVL/kXwHlDTJfBD3KCvEairxyTIYk6hTFxJztz3ePh/PC7mC0ikCb009
 s5h25TEZ8WwiyF9gqmHV7OvvzoeJT22q9+fv+48VFMuiVga0Y/BxU7yIq17iIL34IQU2z
 cqbbfuFBxXqFRVDQd+vvDBOyUscgyGRr6t5pnwbAehjZzY5Z6bhIx0819VdEq91h0mKj7
 rr1xZrbxgDcpZvMjjEqvk20J12Sn9yHRRykZO4wV+1n+m/P3qN5X25/P3lo4Riw6BAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788685864;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=bP8oXV/8dVvzzCWJUrS3wW95JcThOHwdHYz6NM0VYXo=;
 b=lxGAxvHA5SbViGWdil28hEPr0elaC/fGp7TemGimOL0g+2vKrKdhOQtEIZs8e4FciFB7
 GLBc9y3zLRivIxGGIVfZHWynJobDvEdtqOSoCKRZ3mcmp6u+bZUBhCarBnbTmB/Sj4JKc
 B9I/kqBtACzBwdhOZ9G4/cXm7z4rnEaoqLmMZb0n5UveVdnzSizq7VLGBiVkZjVC0x1C8
 0Ih8k6e3RWZcDqu+dQZU2YSx2yzgY9flim+u+KVzh6jMBWecTH7hVG0cuup+jVgAQLqCw
 A/R+bJIqVtVesQmK6AGUSMlKPdAFnupMojiZgczzvHG9MP1sZaB+bFJ4R485Sg9l9qQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="Vj/LcC80"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1796C80D64
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:11:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 58FB0780389;
 Sun,  6 Sep 2026 11:10:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 11:10:59 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 11:10:59 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260830-weston-v1-1-a6bfd8b2e214@gmail.com>
References: <20260830-weston-v1-1-a6bfd8b2e214@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <152c1a5c8522f3d8800ffe8d27e53787@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/weston: bump version to 16.0.0
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

SGkgUmFwaGHDq2wsCgpPbiAzMC8wOC8yMDI2IDE4OjQ5LCBSYXBoYcOrbCBHYWxsYWlzLVBvdSB3
cm90ZToKPiBodHRwczovL2xvcmUuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQtZGV2ZWwvYWxYcTc2
T1g0ZFZXb1AzTUB4cHJlZGF0b3IvVC8jdQo+IAo+IFJlbW92ZWQgcGF0Y2ggd2hpY2ggaXMgaW5j
bHVkZWQgaW4gdGhpcyByZWxlYXNlLgo+IAo+IFJlbW92ZWQgYWxyZWFkeS1kZXByZWNhdGVkIGNv
bmZpZyBvcHRpb25zOgo+ICAgKiAnZGVwcmVjYXRlZC1iYWNrZW5kLWRybS1zY3JlZW5jYXN0LXZh
YXBpJyBbMV0uCj4gICAqICdkZXByZWNhdGVkLXNoZWxsLWZ1bGxzY3JlZW4nIFsyXS4KPiAgICog
J2RlcHJlY2F0ZWQtc2NyZWVuc2hhcmUnIFsyXS4KPiAKPiAncGlwZXdpcmUnIGFuZCAncmVtb3Rp
bmcnIHBsdWdpbnMgaGF2ZSBhbHNvIGJlZW4gcmVtb3ZlZCByZXNwZWN0aXZlbHkgCj4gaW4KPiBb
M10gYW5kIFs0XS4KPiAKPiBUZXN0ZWQgb24gU1RNMzJNUDE1N0MtREsyLgo+IAo+IFsxXSAKPiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9jb21taXQvN2Mz
ZTNkNzU0NDA0NDUzNDgzZmZiMzYyYmU4YWI4YWZiODlkM2ViMgo+IFsyXSAKPiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9jb21taXQvM2JkNzdmNzgxNzY2
YWJhZjhhYTlmZTU1ZDRmOWI5OGMwM2UyOWU0Mgo+IFszXSAKPiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9jb21taXQvNDYwNmM0OWQyODUxYTk5MDY0Y2Fl
NWU5M2ZlOWY0NjRkYjNhMmM1OAo+IFs0XSAKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvd2F5bGFuZC93ZXN0b24vLS9jb21taXQvZDU4N2RmZWE1YmY0ODE2YWZkYjBiN2Y0Yzk4MzU5
NTYyNTBhYjM5NQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2Fs
bGFpc3BvdUBnbWFpbC5jb20+CgpJIGFwcGxpZWQgdG8gbWFzdGVyLCB3aXRoIHRoZSBmb2xsb3dp
bmcgY2hhbmdlczoKCkkgdXBkYXRlZCB0aGUgcmVsZWFzZSBhbm5vdW5jZSBsaW5rIGluIGhhc2gg
ZmlsZSBjb21tZW50LgpJIGFkZGVkIHRoZSByZW1vdmVkIG9wdGlvbnMgaW4gQ29uZmlnLmluLmxl
Z2FjeS4KSSBhZGRlZCBiYWNrIHRoZSBwYWNrYWdlIHBhdGNoOiBpdCBoYXMgYmVlbiBiYWNrcG9y
dGVkIGluIHRoZSAiMTYuMCIgCmJyYW5jaDoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3dheWxhbmQvd2VzdG9uLy0vY29tbWl0L2ZkZGU3MWVmNTNmYTBjYzc2MTM2NGNhMDc1YThmNjhm
OTMwMzNiMjYKYnV0IGlzIG5vdCBpbiB0aGUgIjE2LjAuMCIgdGFnOgpodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9ibG9iLzE2LjAuMC9tZXNvbi5idWlsZCNM
MTgyCkZpbmFsbHksIEkgcmV3b3JkZWQgdGhlIGNvbW1pdCBsb2csIGV4cGxhaW5pbmcgdGhhdCB0
aGUgInBpcGV3aXJlIiBhbmQKInJlbW90aW5nIiBwbHVnaW5zIHdlcmUgb25seSBkZXByZWNhdGVk
IGluIHRoaXMgMTYuMC4wIHZlcnNpb24sIGJ1dCAKcmVtb3ZlZApzb29uIGFmdGVyIGluIHRoZSBt
YWluIGRldmVsb3BtZW50IGJyYW5jaC4KClNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2M1YzBhNzY3NTFhN2U5YmExYTg4MTZkYTY4MjE4ZGI5
ZTEzNzllYjkKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
