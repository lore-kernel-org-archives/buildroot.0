Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40376C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 056A74062A;
	Fri, 31 May 2024 20:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ldlrvlwxgkd; Fri, 31 May 2024 20:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182DE4184D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 182DE4184D;
	Fri, 31 May 2024 20:22:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4151D5728
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 074ED4246C
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP8U0ltY2AJs for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 20:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC08442460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC08442460
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC08442460
 for <buildroot@buildroot.org>; Fri, 31 May 2024 20:21:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0B94413F861;
 Fri, 31 May 2024 22:21:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 22:21:55 +0200
Date: Fri, 31 May 2024 22:21:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David =?utf-8?Q?Nore=C3=B1a?= Perez <david.norena@linux.com>
Message-ID: <ZloxY-JEsihX0386@landeda>
References: <BL0PR02MB542629F97F36146AD2B45C90ECFC2@BL0PR02MB5426.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL0PR02MB542629F97F36146AD2B45C90ECFC2@BL0PR02MB5426.namprd02.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717186918;
 bh=jSyaIKtaSq3G8xG8t6yr6JbDk/44fKTsZ8rSCog37zk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IETaSD/NAYPVaRUbT/69FEYxQRNSEtkjLp4EfeYi54TuA9j95iklYTA6BAUV0x6JP
 BbxYc+bwN+2b7UolpPDukfI6v3gmObkFNMS0gDChfBxcC6e2d9dQD2uULJKTvQIHJd
 8yt8VTywIcWfUczH1See+EhIty1YGg6pVyvOWk+nOuV2Kyn0SYe2UuwWOxchGSqv0n
 q4xDJMJcJfx0mFQiWCAEWaUHCDt0kwxMYDqjJYR0jI8KuU29GeAc49Q8od27wQjNCq
 zxq/X8F/8B72GUF6ww221H6ncXMxeDLbQ+zoUBa/FacTr+bbmC+uKejpqnNdaBmInn
 4QlX8OgknTBCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IETaSD/N
Subject: Re: [Buildroot] llvm-project: add support for lldb and bump version
 to 16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGF2aWQsIEFsbCwKCk9uIDIwMjQtMDUtMzEgMTY6MjMgKzAwMDAsIERhdmlkIE5vcmXDsWEgUGVy
ZXogc3Bha2UgdGh1c2x5Ogo+IEkgZGlkIGEgZmV3IGNoYW5nZXMgaW4gdGhlIGNvZGUgZm9yIGFk
ZGluZyBzdXBwb3J0IHRvIGxsZGIgY29tcG9uZW50IGZyb20gdGhlCj4gbGx2bSBwcm9qZWN0IHdo
aWNoIGlzIGEgZGVidWdnZXIgdG9vbCB3aXRoIG1vcmUgZmVhdHVyZXMgdGhhbiB0aGUgZ2RiLCBt
eQoKVGhpcyBsb29rcyBsaWtlIGl0IGlzIGFuIGludGVyZXN0aW5nIGFkZGl0aW9uLgoKPiBxdWVz
dGlvbiBpcyBjYW4gSSBjcmVhdGUgYSBwdWxsIHJlcXVlc3QgaW4gdGhlIGdpdGh1YiByZXBvc2l0
b3J5LCBvciBob3cgdG8KPiBwcm9jZWVkIHRvIG1ha2UgYSBwdWxsIHJlcXVlc3QgYW5kIGdldCB0
aGUgY29kZSByZXZpZXdlZC4KClRoZSB3YXkgdG8gY29udHJpYnV0ZSBjaGFuZ2VzIGlzIGJ5IHNl
bmRpbmcgdGhlbSBhcyBwYXRjaGVzIHRvIHRoZQptYWlsaW5nIGxpc3QuIFVzZSBnaXQtc2VuZC1l
bWFpbCBmb3IgdGhhdDsgc2VlIHRoZSBtYW51YWw7CgogICAgaHR0cHM6Ly9idWlsZHJvb3Qub3Jn
L2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjc3VibWl0dGluZy1wYXRjaGVzCgpXZSBkb24n
dCB0YWtlIHB1bGwtcmVxdWVzdHMgb24gR2l0aHViLCB3aGljaCBpcyBqdXN0IGEgbWlycm9yIHJl
cG9zaXRvcnkKKGFzIGl0IGlzIGV4cGxhaW5lZCBpbiB0aGUgR2l0aHViIHBhZ2UpLiBUaGUgY2Fu
b25pY2FsbCByZXBvc2l0b3J5IGlzCmhvc3RlZCBvbiBHaXRsYWIuY29tLCBidXQgd2UgZG9uJ3Qg
dGFrZSBNUnMgdGhlcmUgZWl0aGVyLgoKPiBUaGFua3MgYSBsb3QgYW5kIGFtYXppbmcgcHJvamVj
dCwgaG9wZSB0byBjb250cmlidXRlIG1vcmUgb24gdGhpcy4KClRoYW5rcyEgQ29udHJpYnV0aW9u
cyBhbHdheXMgd2VsY29tZSEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYg
fCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAg
ICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
