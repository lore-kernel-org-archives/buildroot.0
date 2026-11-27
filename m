Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A35606A335
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 18:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s7/mcTJD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9430D40AF4;
	Fri, 27 Nov 2026 18:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZzCkXJOnCzd; Fri, 27 Nov 2026 18:55:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A7A5D40AD7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795805747;
	b=bvSxNTofYg5wdl8LTj+LtqN4WytLDCTNBalVFabhaN7whXHuerLdOHrknxBLJsLcGqX2
	 T/wjoTpccQXl1rC7zedddxBFN4pCKMYZOut5R9PnSSiprRIvLUK6F1VoUmoL4HCDDPXjM
	 GsvZa+y1iGpJRAkUqER09Hz4qFgXIT18OxIzeU1PYP00FFeMz0TerRRQ/t9NQpRb+9pOn
	 SFYIx/OSV92u9K0r0+5dJbGB4vctFCUOUXWJ3xxCGfPisJxEscgjKFYDqqcH8VJUDEkEY
	 i8y2d8adQQFMgF1LPZwgN7590qqDpbgQzH8fmNV/Wkve4rTedWGLmWpj5/lYoX5gQSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795805747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=VMf3eJzIq96PtktiijHAFFAqFbE1JEvcPpxRMWQTVJU=;
	b=YzIRTAfPYGS43UskCNO0etmvLL3ZkN2kcMvM7/O25kzDT38F6ftxUi/xA7Vj595wEOi6
	 rWKt0XiKF2BOO6W4AGgJh6X14TIoJ2Y8o4SpzvlWPORqBa0DLMBOFD0PibdvSUUT5vYaF
	 dr4H3FRf2gZmlj5x1Y6zsHR2WpSMiGUm/iueeE2+WpJRPVTsoCJy/mBbr4lyyzBSvW+od
	 b6ibnl2Pu9GR3j1n9/UeOgMDg0lWQ9OxDhx+Ah8HnQGoTaCVoGDXqmpB03eNAncif0vlG
	 bR51O2qfnUUzCWIZ4kQRZ4ZJ9/wtDt30mQ0bK0yD8Iz/27BaAqtx7VxI8C2EkAzX5LQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795805747;
	bh=VMf3eJzIq96PtktiijHAFFAqFbE1JEvcPpxRMWQTVJU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s7/mcTJDwD33CQou1uGXdYzqVl5mgaq8LLH7fL5vhTa3yMEKYcRef0MEHVD30VXwc
	 5CLIIhyDdK9GA1iSL3gRcHv4rQCgKTDNFbcCl4Uqtn/zhZhVm5iAri+YJpXEIrwU8M
	 3GDVWiBkBsJ0H/j0MZm6fEHGh8/RQhAuYbmHHzJDgMwAT59eXwd1EXjNHi3PeOoAdg
	 ElvWxJ9Ean+V5UhrjC5kxh9X2cMdcOHH/e2CggtpJvOTmh0ok9aG6zf4LaJA5egsBd
	 qfKPT9aGATXkJwselygton4ygdc2ny4bNXRLpCcEjDsiUyQ+9sBqTOdDEkoxH3yWAE
	 1aFJOhY64LUzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A5D40AD7;
	Fri, 27 Nov 2026 18:55:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B30962BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4F7260D7F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfINR7uZDGPo for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 18:55:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F0C0960D64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0C0960D64
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:55:44 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795805742; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:RQ6b3QuAbSnuC7WbdA8c1H6NVppy
 clboSEbrxbuB8EdDYTQHNcOIoBL9m3Oo45RqbhTLS56K2Yp9XLr5WqYgvzPl4JZIBsxBZK7Ijiy
 6FkSnsAxnslsEPW+hGLU1MD4IsfqNM2h2xt+uZPxxgX0eh5KpI6rg/r+0uKyQMKOKyCIYTs/bWb
 tYZL9dQ+BIRzckgpQLpiH5LGOj2tnwIya1KYWrJ4zUXmtmzS5KmA8CWN0Pboodcqbf0soXa+Uzw
 qJYxG2NxWWEmVLlydhZ4cCPix3kIPAMape4u8c+JJk7mHuWIRwPjuR4bppG8hs7lkapbVQgaCmC
 JHwKRWpKenS98Q==;
Message-Instance: m=1; h=sha256: EWPE7li9depaJiugck39XDK4JXLDJ8TWcEHZYF0KQH0=:
 BZoBiFfbyrmZApX1ZgYYK3u+7FVMPIjhHdD6WUMkxTs=, sha512:
 Nro/qdzBfQK7t9rAT4SjF9igSgXTEJ0UvRvEHmPNtk0BFQ7CjcN6h4CuTPWTewdp8l1EIZRtdGXFSumcPNCDpw==:
 NhROp0zkYedSMp4yWlqMm6zHeQzxPpFxAI+J4ZclyMgVY4UAx96DxiUhVIQrhpefJy4WtdFq5554cyQeQNky7Q==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fMY-1xZkvu2ml8-00FtjY; Fri, 27
 Nov 2026 19:55:40 +0100
Message-ID: <89a8e471-1a73-4e33-8390-6fb15883f6d8@gmx.de>
Date: Fri, 27 Nov 2026 19:55:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
 <196d4d9f-94b7-4d49-b762-55c506a9091c@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <196d4d9f-94b7-4d49-b762-55c506a9091c@bubu1.eu>
X-Provags-ID: V03:K1:LtO0qKu8GHjGq/KsMKkXLen04WjBXXlrmXpbGQeEa71kalPq3Up
 YnWION+z6NxhXvEqUqxo1QCkr7z3fgXYPtIPwLNGp/ECgBe1nfb9oS6M+1IWhJg34+on2iL
 +cxjc51ACh8RC5xSAXa5Co7ymykf9EbLxZEHVNURZqDk0yCcRmmhIegWOKPdOBQP7FCaBu1
 LEJBZTeNUM8LWmrwuh6hg==
UI-OutboundReport: notjunk:1;M01:P0:LQ1HyaXF/Wg=;KdrwgQc95ivJpxYOYQwMvNOi2m2
 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
 rIf4eSftmzScNb5MWDy7WC3WFPLlFlkEC
Subject: Re: [Buildroot] [PATCH 00/10] Update dracut to v113,
 enable proper cross-build
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
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 27.11.26 um 02:01 schrieb Marcus Hoffmann:
> Hi Fiona, all
> 
> On 11/26/26 20:24, Fiona Klute via buildroot wrote:
>> Several parts of the dracut code expected dracut to be installed a
>> sysroot, and to be able to execute binaries from sysroot. This led to
>> things like the busybox module being unable to install applet
>> symlinks, because it tried to run "busybox --list" to find the
>> available ones. Most of these have been fixed in v113 (in no small
>> part by me, see [1] and the various PRs split out of it). A few
>> remain, for which this series adds patches.
>>
>> On the other hand, Buildroot was not building dracut-util for the
>> target, which is a helper tool to be installed into the
>> initrd. Missing it breaks a number of modules at runtime. Including
>> the cross-built dracut-util into an initrd built using host-dracut
>> still needs a patch pending upstream.
>>
>> The first three patches set variables that already existed in previous
>> dracut versions, so they don't depend on the update, but they aren't
>> terribly useful without the futher fixes.
>>
>> Technically most of the patches after the version bump could be
>> squashed into it, but I hope they will be easier to understand and
>> review this way.
>>
>> The result: Most modules (from basic ones like "busybox" to
>> "systemd-*") now actually work, and I'm including a test to prove
>> it. :-)
>>
>> This is quite a big change to still make it into 2026.11, but v113
>> also contains security fixes (how relevant they are depends on
>> selected modules), and having (most) dracut modules actually work
>> seems useful. But I can live with next if I have to. ;-)
> 
> What about the stable branches? Do you think we'd want to bump dracut 
> there as well to fix the security issues? (At least one has a high 
> severity CVE[1], not sure if that'll show up in any monitoring, it seems 
> to be a RHEL CVE).

I think that's the simplest option, or at least up to patch 5 in the 
series (fixing the "busybox" module, leaving "systemd*" and "base" 
broken). Up to patch 7 should also fix "base".

> Or do we want to backport the 13 security relevant commits/fixes 
> separately? (They apply cleanly, so doable, just a bit annoying.)
> Thomas, Tituan, thoughts?

If you want to go into that kind of detail, it might be worth checking 
if the affected code is even reachable in the "broken cross-build" 
state. But that's not trivial. The "base" module (the one affected by 
that high severity issue) is definitely damaged without dracut-util, but 
it's not obvious to me if that damage would prevent using DHCP (and thus 
the vulnerability).

But as I wrote, not sure if it's worth the trouble.

> It would maybe help if anyone currently using dracut could chime in 
> here? I've never used it and I don't know how usable or not the current 
> version in buildroot is.

At least from what I've seen, very limited. Putting executables and 
scripts into the initrd and resolving their dependencies (interpreter, 
libraries) should mostly work, but little about the actual modules 
(which is the main use of dracut over simpler initrd builders). Because 
of the broken "busybox" module I had to manually add /bin/sh (in the 
config) when I started working with dracut.

On the other hand, nobody complained about that being broken so far, so 
I'm not too worried about regressions. Make of that what you will. ;-)

Best regards,
Fiona

> [1] https://github.com/advisories/GHSA-8pxm-cr92-crx8
> 
>>
>> Best regards,
>> Fiona
> Best,
> Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
