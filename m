Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E837606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 04:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iol09Dcf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=HwusiZkQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 303A4606A0;
	Tue, 27 Oct 2026 04:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNr8361ZWSie; Tue, 27 Oct 2026 04:54:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 92F9C6061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793076894;
	b=QxiYGeBJMnQJf0ZZHNEHtyQCCy+gs9DiziaCTFA6uw4fdd8+RDKjnMPgxBYVswjtfdaI
	 gQw9fWub9iiatq3RBcjYHtwqJoqR6WfsIs95oCD5KTMDdUFhApjwuLuU/gEuB8I7zxGlw
	 CDb/uQ7LzuTqiZPy66BvLuH/LU7bShdjfoRTwW8XZroz5SRLRtXh1OLzQWSPOb70B8Dik
	 lhUN5+cZoTxp5uCcaNNH9s0gk/fsOglfGF7evoqXV8k0+eJr8rrFGlbsqc6kRAdhxk3pu
	 t0zLaia27uy0623kx9+Xl6CJUL84fSTD28aQxlzkyTvtnr3XIv5TBw9tP/L2dE5GBQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793076894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=fTWjRxEqmxw+MpCuENAIA6vvYfB2uunhbc5bTWLLXiU=;
	b=gX6W7a+GYIXLGoANhJPCTA0YH62smF5FNq+JJKCd+DKXgPx7qO1YHw245S2v6dMEV0DY
	 tT+35snWVZePc2jn4dSFUTv+0h0HOyhZeRapwOU9X6dad5FsiMZ6cnOgFcJZDC3nJieE2
	 QfJBQ4460m6ZvdpDHzsilG/ETUAKN/hsk92gLHVc0RxCmsBwsFqqOS0CRjiLQZ5JFP1jm
	 DS9GOvhL5YGR3tdU6OujaHlFX2WbS7b2CPEkfcvIG4exqvRr7v7mIHzLcyhk6WSb7fq8L
	 OAxp9ISQjxpXL3w2S+uy+jx5qYSIvChPexfcozb0W9eY8m7GFD3WC9bF0nlUxfgqSmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793076894;
	bh=fTWjRxEqmxw+MpCuENAIA6vvYfB2uunhbc5bTWLLXiU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iol09DcfD3XqfmkKnYeg07qkv58bLY05zhIGHxKCP5NRAU5ysvcU9O6Qu3ONxlBXi
	 ClIqxbx7U85YnG7JDD7V/DHnSrJOZOBU147JMuzoE+FSdFP1tIVqHrrpcHFQSaHvdw
	 ZYwT7UHb27VjhteyP1tVQfDxqK46ciDroK/m55qm1vbaz/jg0gOa07BnXMnMkb3Fb+
	 rnVXvdxCy2xpVul/Pze1FFNL3ax/uv0IfKLGf3vEowOsz0k+XUayaMcKQK12C3wtdM
	 3Fc7b/NzM710uV0BdKUE9BwgEU6DLDeL0wbSBXInlLvHVik+lwQxgHysu06B73Bw6I
	 yiegfkXzvc+mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F9C6061D;
	Tue, 27 Oct 2026 04:54:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F43279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 04:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B493340580
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 04:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qi7_FaQABQzl for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 04:54:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C496A40575
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793076892;
 b=Gtsv4MyIRH3UN6K/POx9WwQ+krzGVhcf49Wban/j1CDWOicEGmGGX5SppmuJwsunyixs
 i1K8B6aAxa6VMg4NbSnWoon7NqLPA5YpB/mbRAwDW+ZaD3Gb3dXIn3fRQQpm8ezl0gZDU
 Xzm2JWLQWlClzd5MDPMnCAF5zXSDSyK4QCfDdI68IBpXq4ZK6+NAvriC6k8qNiE/kXrDZ
 0v42UK1lHb0S9COdIYYolMkLTXbYSfe1JeF7JmBKbQjq/w5zO0mtfl+5l6pBpY3jqiVu7
 xDnisVlcykTEM02l6RJ9lZ07Il8LfEDRXP1345bremgMva+hBNVkKJkTGtEH2xD8x3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793076892;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=QMKEwtN9yz3ooefydG88nhlOnLLYJgkSpuOEbdiF/5U=;
 b=sJsLxN8vzlJ1LbkJf6x76bPSdD5LKQhJ/PAVPJ9b/TsQru4sCMsJTRtjpe0yyP6ppuoI
 PHJkHs20uyXMDIzr1FkVgAK7f7gO4AscZiGJA/1OEvrQrrDwu/n3/IM8XgWSZTUHB6EH9
 CWZ6bko+fxFEOZvCfA4ZUtJdjZ8YNafLgVnCqk7q0urClDPJzj1oAz5/u9sFqp268S76K
 ExrTRpuY3VbgZG2mCX/zNosQ61xb1lpk5qP+SrcvOUaDuAmjjxI2a4Rcgf/qBCiukOX+c
 nkKs6WRrdZwFFJHxhBazmllPtchasJsqqNwYVTubTRsUW7XqEyuHI1demotgatltSDQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=umbiko.net;
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HwusiZkQ; 
 arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HwusiZkQ
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C496A40575
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 04:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1793076886; bh=r8yB5ptsGhSkm2bm89OVKWvi1rv33+G61UJTD76mDYA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HwusiZkQYmdt6J2u5B56VhmEn2VBZyFgRse5Tuwoiwq4jT9KT81iMNBSWthBIxa/y
 cfZ4lfFBMgLerWS7J7DI78EXZGXDchReKGpGg612Iw3f8ZpzB5FldRg99VtjwGIIKK
 SWu7K9wmv1EduszjE3RfuwSBd9j9weQkWtWz41eQ=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 32DECBDE23F8;
 Tue, 27 Oct 2026 05:54:46 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 04:54:45 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
In-Reply-To: <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
Message-ID: <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexander, Thomas, Everyone,

On 2026-10-26 20:45, Alexander Sverdlin wrote:
> Hi Thomas,
> 
> On Sun, 2026-10-25 at 21:36 +0100, Thomas Petazzoni wrote:
>> On Sun, Oct 25, 2026 at 12:08:44AM +0200, Alexander Sverdlin wrote:
>> > The revision to build comes from Archlinux syslinux package, the archive
>> > from debian (to save time for git clone).
>> >
>> > Add patch fixing passing &load_error_buf to setjmp()/longjmp(), rejected
>> > since gcc 14 made -Wincompatible-pointer-types an error by default.
>> >
>> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>> 
>> Does it make sense to keep syslinux? Even Wikipedia says it's
>> "discontinued". Do you still use it?
> 
> I'll be fine having it downstream. I just thought, there is still an
> interest [1] in this update ;-)

Yes, there is still interest in this software, and I sadly mourn the 
absence of the don't-delete-host-syslinux patch. I did not reply 
earlier, because Thomas already did a deep dive.

Just some formal things:

You might take a look at the output of check-package:

$ utils/check-package boot/syslinux/*
boot/syslinux/0005-lzo-Use-the-host-toolchain-for-prepcore.patch:0: 
missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)
boot/syslinux/0011-extlinux-Use-the-host-toolchain-to-build.patch:0: 
missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)
boot/syslinux/0013-Fix-build-with-gnu-efi-version-3.0.9.patch:0: missing 
Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)
boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch:0: 
missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)
boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch:0: 
missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)
boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch:0: 
missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)
1137 lines processed
6 warnings generated

These should either be added to the .packageignore file or a "Upstream: 
N/A, dead" line, similar to 
0023-com32-chain-chain.h-use-proper-type-in-struct-data_a.patch:21.

A few of the existing patches should be rebased for 6.04, they do not 
apply cleanly:

>>> syslinux bf6db5b4 Patching

<...>

Applying 0011-extlinux-Use-the-host-toolchain-to-build.patch using 
patch:
patching file extlinux/Makefile
Hunk #2 succeeded at 53 (offset 1 line).

Applying 0013-Fix-build-with-gnu-efi-version-3.0.9.patch using patch:
patching file mk/lib.mk
Hunk #1 succeeded at 188 (offset 2 lines).
Hunk #2 succeeded at 198 (offset -5 lines).

<...>

Applying 0016-Workaround-multiple-definition-of-symbol-errors.patch 
using patch:
patching file com32/cmenu/Makefile
patching file com32/elflink/ldlinux/Makefile
patching file com32/gpllib/Makefile
patching file com32/hdt/Makefile
patching file core/Makefile
Hunk #1 succeeded at 158 (offset -6 lines).
patching file dos/Makefile
patching file efi/Makefile
Hunk #1 succeeded at 71 (offset 1 line).

<...>

Kind regards,
Andreas

> [1] https://lore.kernel.org/all/aq62x3ovAUoc_Lmn@windsurf/
> 
> --
> Alexander Sverdlin.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
