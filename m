Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0BCEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C0C40B9E;
	Mon, 10 Jul 2023 20:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28C0C40B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXdo4Sf74hpV; Mon, 10 Jul 2023 20:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C14E40B85;
	Mon, 10 Jul 2023 20:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C14E40B85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 833C61BF399
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CF3982047
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF3982047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3cG_vslKsPfL for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:08:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070E681ECF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 070E681ECF
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:08:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E659240002;
 Mon, 10 Jul 2023 20:08:10 +0000 (UTC)
Date: Mon, 10 Jul 2023 22:08:10 +0200
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20230710220810.2cc28384@windsurf>
In-Reply-To: <20230705080328.uodcxfs7o6a5cmqd@zenon.in.qult.net>
References: <20230705080328.uodcxfs7o6a5cmqd@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689019691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3RJBEeWEkzyIKe0WMNP5lteI70P7pyj2FQgmI+8uwAY=;
 b=MmFuOOPtBRZ9Eh+409cYqkICkrYuCEoYZlB8f/UglfnREiJ9xQgb2IXGagTu/uOZGqsq6x
 hNLEBh3t1vQEUk+B1RHXDMphcsxxZ1h+afNSp/3Wk8fXwU9afAMM4euL5enq0Hz5dvHlgv
 +LeOpSYJO9F84+IkUjWV1QfYv5CxhvECFPSCBYFPO2RsRG07nuwaNKpyJVxUrMQE+IVBOB
 v8mUtAFrwdNElS3Ov4kPKixSnS237CwX9K8QNcUmUtXMTOxSQz7tDRi66fSiZvnGvZEbgU
 nupMtSHlrrWHxciKsiTtZUSmiGrK+Pk4CvXHx7fKcOvt/SDA8f+6P0cKa47SrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MmFuOOPt
Subject: Re: [Buildroot] [RFC 1/1] package/bpftool: enable support for
 arm/armeb
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCA1IEp1bCAyMDIzIDEwOjAzOjI4ICswMjAwCklnbmFjeSBHYXfEmWR6a2kgPGlnbmFj
eS5nYXdlZHpraUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4gd3JvdGU6Cgo+IFRoZSBsb2NhbCBj
b3B5IGJwZnRvb2wgdXNlcyBub3cgY29tcGlsZXMgZmluZSBvbiBib3RoIGFybSBhbmQgYXJtZWIu
Cj4gQWRkIHRoZXNlIGFyY2hzIHRvIEJSMl9QQUNLQUdFX0JQRlRPT0xfQVJDSF9TVVBQT1JUUy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBJZ25hY3kgR2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3Jl
ZW4tY29tbXVuaWNhdGlvbnMuZnI+Cj4gLS0tCj4gIHBhY2thZ2UvYnBmdG9vbC9Db25maWcuaW4g
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
