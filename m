Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72120C369D5
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 07:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39F2C429D7;
	Fri, 25 Apr 2025 07:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7YcvERXtz1L; Fri, 25 Apr 2025 07:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68A1042A0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68A1042A0F;
	Fri, 25 Apr 2025 07:53:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F6D159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E07AE429D7
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yq5HxxQCQKx3 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 07:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECEA34297D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECEA34297D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECEA34297D
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:52:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6695D1FCE8;
 Fri, 25 Apr 2025 07:52:55 +0000 (UTC)
Date: Fri, 25 Apr 2025 09:52:54 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Julien Grossholtz
 <julien.grossholtz@openest.io>, Martin Bark <martin@barkynet.com>
Message-ID: <20250425095254.32b2a78b@windsurf>
In-Reply-To: <20250425014342.2468690-1-gael.portay+rtone@gmail.com>
References: <20250425014342.2468690-1-gael.portay+rtone@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedujeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehgrggvlhdrphhorhhtrgihodhrthhonhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopehjuhhlihgvnhdrghhrohhsshhhohhlthiisehophgvnhgvshhtrdhiohdprhgtphhtthhopehmrghrthhinhessggrrhhkhihnvghtrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745567575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hLcuuixlUgKWPAv49ffgCN8MShA8EuaU2RRShivVAk=;
 b=GeZXo/clmwvYsBMlpYlBVFr8nbPGfDfW68KV/6tiDszJHJd3fOPeDhlkPvc4CziEiNpn5h
 IKTQYorXkKROOlqRkcY/rrTqRBpQi3jRBB3XHNUgDE4CAjqhS4ImtzK7KnO30S0B4Y672Y
 3r2Ge8wfHETlQHYJ4j3ehcxHL/h6xV5NvF0uo0aTUR8InvBBBxR954m/qACupWBZ4aNJHx
 oJxjhrTTDR1Jvg8uKFELERoE0Jovbxmy+rMrl9NphMpYKPIu34T1u0vfMm0vM5VsgyMVzo
 vF+AZ+1nwIO1IYsz6g5sVyhw5weG+0sYxqJIonzvr4di4D9PyyzydV2VLQyL1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GeZXo/cl
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypicm5io: new defconfig
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

SGVsbG8gR2HDq2wsCgpUaGFua3MgZm9yIHRoaXMgcGF0Y2ghCgpPbiBGcmksIDI1IEFwciAyMDI1
IDAzOjQzOjQyICswMjAwCkdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29t
PiB3cm90ZToKCj4gVGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIENv
bXB1dGUgTW9kdWxlIDUgSU8gQm9hcmQuCj4gCj4gSW1wb3J0YW50OiBUaGUgZGVidWcgVUFSVCBo
ZWFkZXIgaXMgbm90IGFzc2VtYmxlZCBvbiB0aGUgQ29tcHV0ZSBNb2R1bGUKPiA1WzFdLgo+IAo+
IAkyLjIzLiBEZWJ1ZyBVQVJUCj4gCj4gICAgICAgICBTcGFjZSBpcyBwcm92aWRlZCBmb3IgdGhl
IHVzZXIgdG8gZml0IGEgZGVidWcgVUFSVCBjb25uZWN0b3IuCj4gICAgICAgICBUaGlzIGNvbm5l
Y3RvciBwcm92aWRlcyB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGFzIFJhc3BiZXJyeSBQaQo+ICAg
ICAgICAgNS4gVGhlIGNvbm5lY3RvciBpcyBhIHRocmVlLXBpbiAxbW0gcGl0Y2ggSlNULVNIIGNv
bm5lY3RvciwgUGFydAo+ICAgICAgICAgbnVtYmVyIEJNMDNCLVNSU1MtVEIuIFRoZSBzaWduYWxz
IGFyZSByZXBsaWNhdGVkIG9uIHRoZSBib3R0b20KPiAJYXMgdGVzdCBwb2ludHMuCgpBbmQgQnVp
bGRyb290IHVzZXMgdGhpcyBVQVJUPyBJZiBzbywgaXQgc2hvdWxkIGJlIGRvY3VtZW50ZWQgaW4g
dGhlCnJlYWRtZS50eHQsIG5vdCBqdXN0IGluIHRoZSBjb21taXQgbG9nLgoKVGhvbWFzCi0tIApU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
