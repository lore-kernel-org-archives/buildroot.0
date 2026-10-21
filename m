Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2821D606A31E
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Sl75bPc/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E2180DBF;
	Wed, 21 Oct 2026 17:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LfQV-ndWoKy; Wed, 21 Oct 2026 17:59:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C180480DE4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792605547;
	b=mrH4DpomUe+KYgEk3c6aGY2we5t6G09E6syuf/MmOaTdAZfhzyIBJPdcJ3XjSG54JRgz
	 iSEnTAcg4pf2iEXXxYQYnhx3HL/jnc4m9GRxW9jD4JQUCsyww6+lKz4zJ5k1SBxyj/FeR
	 XIJeMeYoW7s7AA7TbgrmuB0Sl4TXYBE6KGRcM38Z1FD7pGyXyUmxDKYyhyVswZvNTiOz7
	 ZLFkvmGvDguTKvIgWuJCzaEuC/KQpzl9TBRv+ZvmsD5P0Jrv+I4zgfCcHFM+gstX9OY6u
	 tHQ/WN1dyFnT6OCZ/Yz0AT6SlM0Z51aBEIDC2tQY3ea9sn37FCBODQykOd15fR8aX5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792605547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=E4YXjZoZZxVcw0DXAtY8XtnPvqE8G9DExVm8AMzROGg=;
	b=g/sdUZKc1N6mU3UZU8no6AoHTDrWAt3mXxE9tuvEe5R6tvfoLHvMwUO6Cnqz/CUks8rc
	 tCox1VFzMhKLxvYHplwTn3JONeDlpR3MWVU+srl5rQ8Q++M0E6PgLDYschhayF2/sS3SR
	 OR3rb5chqhPn6m/Y6P6zSXVud7f3BNSbItuX5Qcl3s9D70rgHmWwJVBANFVzK/FQgiwfS
	 FSgPs+//jKlk1LThllggQuZGF0Bz1q1X2vWbzC7f/4he9G1uuFXc8vDw9ZnHvhyAo3lCm
	 eZfkGMzGJPuZVZmRiSrN8/MumwL8Ox0c6sDDmJ/a7Tm6MZapyyJjoRWWUh08Fc0w7Ag==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792605547;
	bh=E4YXjZoZZxVcw0DXAtY8XtnPvqE8G9DExVm8AMzROGg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sl75bPc/M8E+L3cLHPpneR1CSsI7KUyZF65kvV0UMXq+9cS4CT4triEOQCipJGvSP
	 R9UePJTzt5c9ktyJJY4aODuhkUmeayxZHXrnvU0VmlaX3OQLV+brl7hJaHtII1OwDm
	 3tkeoheOz3vWoH872D8K6Vgv5aNyRR1UAUw6zFzYjRpfVT53251mTNQN0QyA5AT+Jz
	 1RSSM1f2nhCjeaG+qFtkyVGjuaJ15uUkzkD3QP+UOI14MnDAonrUHbqOJuQgL5lJEj
	 e9ZQVa3X49UrOyeazRAQpQTnafBN67equ9CAX7Ow35IdsGRR/hJiRnIQOmGEPRDo6z
	 hNff44YOY0Yew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C180480DE4;
	Wed, 21 Oct 2026 17:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 657EF3C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6302E60818
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmk-mWt-QTPV for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 17:59:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87A056066A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792605545;
 b=G+fHdz14kgNEeABGAwfz8Gir5vujRCqEOBAwcBwsuNo6WfaYSwzNMBRrbefRlUv7zs8D
 IA6e2M7VYGivNjUvRY7qtIwrRfMCyRx/+aINN/eEA/Nv3yfOTScgusT0IvThhr2cmL6Dq
 V952BBg4DcHlSlzZbi3trYZwkNFwCB7v6YzmWJeV/X1gqhSXxGCY8zgp1LOIuaYfz1S8o
 hw8s3qc6ckCKJIOhKh7rtCftVpAo/cThjoB+uamOypjgDEm9QDstIHIfefmMlaZdWekWu
 qUi2D9zQbtK3nijBn4APrITxUz2Ly2LcXrSwnkRXdE0tmeVJO+PdqoihlNrqdMySW4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792605545;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Bh2bgOnzwWALbUDj86YnF3F7nXvAYEwgdUVoBIep8Rk=;
 b=Fb8xVTybMSzQT9zhc+D3TqWqAapXyjFqeDjn54EqvMrwc+QOm0AoknCJQRITFNt2VQA5
 I239p+IhngQMmunx2z9Q+P57O+qF8lUelZGjrlvL8MvSEMZn5bPFDpfin+YHTNM9aMUcW
 ITqGNdcUWlDQtSwuQMSx7LK3hKCxw7o8ZTs8qR3/YKNw+1DbKgOoP5KEsbNiTIA6+IrIJ
 jfSqbK/lHhq8cm++vx4dl6qDW+JXgsVvUZhDkNzaKpHX+sts2qIdDEYBstyrzHCnMbBUG
 ubv4xZog/3QpY/w8YwbL8fTTrZnvHTgNeJQajg6Am3SdmVyCyUW+OdYmKkb7Jgp3Ykg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=miggBtv1; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87A056066A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:59:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1x3ZLC2R7u-00SJGC; Wed, 21
 Oct 2026 19:58:56 +0200
Message-ID: <3f8bbede-88a4-4165-8176-441018729240@gmx.de>
Date: Wed, 21 Oct 2026 19:58:55 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, yann.morin@orange.com
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
References: <20261020144902.10111-2-fl@n621.de> <athMFB-DQ98pvKhX@yd-6wlzhs3>
 <20261021133405.njzdmebr5dbaqqn2@n621.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261021133405.njzdmebr5dbaqqn2@n621.de>
X-Provags-ID: V03:K1:4t9oHE8M6CfdLO4hLDBFbkFBAYYqzDwnf5iNFq6wih4gKkxEjCw
 jj9L68KdKHvLMxqhlEVqQoBYJ69uPfmPMY7eVLgMJIHbqlDqnqfYeL9j4ankk6FuBmLoT9A
 kY6dEtGqazVF1PadF2Y0xraG638MBqA7Otv7Xr/az6xHJJsDxcAvIE6myGTSvsymNsLnU1S
 3mKPCBOgKQ3kW2MpFxeJQ==
UI-OutboundReport: notjunk:1;M01:P0:bjf0VRTbKlc=;mKxANbo07tWIXze+nEEPqKmruu1
 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
 qbCqyWwrFWY/TDU4IeL1Y/YD8F9FvRS/
Subject: Re: [Buildroot] [PATCH 1/1] ca-certificates: remove roots chaining
 to eMudhra intermediates
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 21.10.26 um 15:34 schrieb Florian Larysch:
> On Wed, Oct 21, 2026 at 07:22:28AM +0200, yann.morin@orange.com wrote:
>> There is also 20260816+nmu1 in sid, which supposedly has the leaked
>> certs removed, so maybe we could also bump to that shortly?
> 
> AFAICT, it does the exact same thing as my patch[1], so this should be
> equivalent.

Yes. I'd say replace the patch with that one plus the usual Upstream and 
S-o-b trailers so everything's tidy, and it can be merged. :-)

Best regards,
Fiona

>> Well, I better get errors about legitimate certificates, rather than
>> silently connect to compromised hosts.
> 
> That's fair, I made the same call for our internal stuff.
>   
>> And those who have legitimate certs will have to ergenerate new ones
>> with a trusted CA anyway, since theirs are no longer trusted by major
>> browsers already anyway.
> 
> Since the certs that were *actually* compromised are intermediates,
> removing the roots (which haven't actually been compromised) is a very
> coarse way to resolve this issue that causes collateral damage for CAs
> which are actually fine. I think the way browsers are resolving this by
> actually only blocking certs which have the broken intermediates in
> their chains.
> 
> However, there's no generic way to do something similar for an entire
> Linux system, hence the root store hack.
> 
> [1] https://salsa.debian.org/debian/ca-certificates/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c
> 
> Florian
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
