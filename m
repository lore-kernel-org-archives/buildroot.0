Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602B8C636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C094103D;
	Mon, 30 Jan 2023 21:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C094103D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhEQTfIdhCif; Mon, 30 Jan 2023 21:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2385740C48;
	Mon, 30 Jan 2023 21:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2385740C48
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A8911BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 139D981FF1
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 139D981FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oqOow8XGtSYZ for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:55:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D215581426
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D215581426
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:55:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 814701BF203;
 Mon, 30 Jan 2023 21:55:32 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:55:31 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20230130225531.2a78b9bc@windsurf>
In-Reply-To: <20221128141152.1566171-1-vincent.stehle@arm.com>
References: <20221128141152.1566171-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675115733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQI4EUMxTNTdFvflywdZC/C95kgAtvJcPr2g6lxYUfA=;
 b=IJn9YQvECS8e9MC/YGNmtXqStkNQ792TZdpVyguaKJ6/1eOsMiH6tHEOl0Uh8u4HPOYav3
 UA1RPPTJejk7rrNRYVRWmbSFDc9ab3aSlTcM3Dt8nxh0dc9TvfKgVd1pdtkfwMq+a+SZ3e
 p+G6EP5eUpOFLvkmMBDR9Z0g24numrfsWl3Sq/PaykP3aKujeflUQDUQXJE3n7DaCJ7yR1
 HmSb+Da2Ebt2AR/2bCbf9yk/RpmwUM5ik7KczXNmyvDJ0SBUuYjdk9kG58J1Hx/L2mgBMq
 dTjKUDZe5vBK6FCY6raQU3MEuzrQphvmSe10UmXvD9ihydjh4Ko66aj+IyqrRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IJn9YQvE
Subject: Re: [Buildroot] [PATCH next] configs/qemu_arm_ebbr: new defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyOCBOb3YgMjAyMiAxNToxMTo1MiArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBBZGQgYSBkZWZjb25maWcgdG8gYnVpbGQgYSAz
MmIgQVJNdjctQSBVLUJvb3QgYmFzZWQgZmlybXdhcmUgaW1wbGVtZW50aW5nCj4gdGhlIHN1YnNl
dCBvZiBVRUZJIGRlZmluZWQgYnkgRUJCUlsxXSwgYXMgd2VsbCBhcyBhIExpbnV4IE9TIGRpc2sg
aW1hZ2UKPiBib290aW5nIHdpdGggVUVGSSwgdG8gcnVuIG9uIFFlbXUuCj4gCj4gVGhlIGdlbmVy
YXRlZCBmaXJtd2FyZSBiaW5hcnkgY2FuIGFsc28gYmUgdXNlZCB0byBpbnN0YWxsIG9yIHJ1biBh
bm90aGVyIE9TCj4gc3VwcG9ydGluZyB0aGUgRUJCUiBzcGVjaWZpY2F0aW9uLgo+IAo+IFsxXTog
aHR0cHM6Ly9naXRodWIuY29tL0FSTS1zb2Z0d2FyZS9lYmJyCj4gCj4gU2lnbmVkLW9mZi1ieTog
VmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gLS0tCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
