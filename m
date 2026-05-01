Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD79CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052A0615B0;
	Fri,  1 May 2026 11:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WG6C3JDqYCI; Fri,  1 May 2026 11:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24DDA60D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777634122;
	bh=2fs0Bd7URur7U4Cyc/WJCFGBcqyR6MdM5CioIQzAC6o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W2duTyHq3vM+jL81UsCAQHslQPl4W1WHG6hfFK4rE6SMejTAVDA9u8zYOYYyNu2fN
	 laaSxAB1TIXMO7dnqgoAKpiHIuFPHMaeUp43qKfrP/KFnZzEu/uX7CQ+/pc7VSeV6w
	 aJtwOhYbhlfYLaaBONgo+UJ6dbcywEFs7DXrzmw/iuwmg4Mt6RYWa6QpLU44RNA80h
	 ZSd6tWKT6+bQIzVeGmu5ilbFfXrXcUZkB50hgqKe9/NFygV1pqKFkbBrCURV/Tlmyz
	 ZDzp18+O1HBpHVf5OAKysvS4xAciZJAVqbvvx+0CjlIsDkLiq+mLs3raRk4uPBjRTG
	 q1UGjIdHpJT8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24DDA60D79;
	Fri,  1 May 2026 11:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C13B0204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 11:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7530844E4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 11:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLkd-KDKLaCp for <buildroot@buildroot.org>;
 Fri,  1 May 2026 11:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25A9C84016
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A9C84016
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25A9C84016
 for <buildroot@buildroot.org>; Fri,  1 May 2026 11:15:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wLT-1wHOvo35H1-0091nU; Fri, 01
 May 2026 13:15:15 +0200
Message-ID: <16a4b9ba-9ef1-446c-8a8c-7b6f7edd6012@gmx.de>
Date: Fri, 1 May 2026 13:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-5-fiona.klute@gmx.de>
 <f17073a5-410e-467a-8b29-befc23b3dc0e@bubu1.eu>
 <cab73423-6879-4382-8d7c-64d8db5940f6@gmx.de>
 <aa4a5ba1-eb8c-46e1-8aba-572b1cf23835@bubu1.eu> <afRWU1jyiPy6AMtO@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <afRWU1jyiPy6AMtO@landeda>
X-Provags-ID: V03:K1:987CcAf3bYj+PIGTLr3vD1qGUeYW7GJWotbt/HsaPNKy1MCcsSE
 Iq7ASZsICDEMy7tHVACgGxkB9Zu/0kcqjTs8vcUsWQH/a1L/41aIhg1/LOg6bL7IYvNZ8nH
 Ol2f6LNwB+OfiMdYs0p0wJ6rnl+EtFcUqPb/yj/s5xR0IVYSSwfej7Xye25eJbjbu2mmzOW
 T5S+4tpfPPJTE6+JoadYg==
UI-OutboundReport: notjunk:1;M01:P0:ZMa8HlBGsC8=;9VygHMfFILn/WCdPQ7ey9HHJstP
 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
 q33k/bp8+UahS1A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777634115; x=1778238915; i=fiona.klute@gmx.de;
 bh=4kES+sOHyCllgquZWWPSlypzE7dXEfqdBX0iU4TWAUc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lfmqH1aszUXAoSrYP1jQMOQGdmE9SukGqGudcDUdFNN6cE2QhUh/HcLaSD3a4hT7
 lbLBI4Grq9zlQYEbQZjX3n3CRBsEssIP27aP8akIP+EM0zyTiQ8pDzKWRFedtPY7x
 2E1nlP7nWRiq3Z4cbD5ltz4Kc6HaYNXTixuhi/dE6vvRcPHpqfNfpOpoeicyBLqSR
 4MAkL00BpfkxGoafbHNV2MNOK9wW/TOzl2DyRUF+eeuvq+4Bfo6LtQKksPi/e6Gx0
 J45SJVauyLPovXi8Xs+xntniZ+g0Z6BI+92D8CEsmu8U7zsff/8MTtt8WAVzUWDoY
 gNrist0DcL3zddMCsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lfmqH1as
Subject: Re: [Buildroot] [PATCH 4/5] package/kmod: switch to Meson build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, Marcus, everyone!

Am 01.05.26 um 09:29 schrieb Yann E. MORIN:
> Marcus, Fiona, All,
> 
> On 2026-05-01 00:22 +0200, Marcus Hoffmann spake thusly:
> [--SNIP--]
>>>> Is the bindir/sbindir logic still required actually?
> [--SNIP--]
>> Yann, maybe you have some input here?
> [--SNIP--]
>> In general, this is a bit hard to grasp from just reviewing the .mk file
>> without building different variations of this, so uhm, what symlnks are we
>> trying to create from where to where and why?
> 
> The reason why we care about all this mess, is that busybox does
> install its tools (lsmod, insmod et al.) if they do not already exist
> (the 'install-noclobber' install rule in busybox), so we have to have
> those exist in the place busybox would otherwise install its owns.
> 
> Otherwise, we'd end up with, e.g.:
> 
>      /bin/busybox
>      /usr/bin/kmod       <- the real stuff
>      /usr/bin/lsmod      <- symlink to busybox
>      /usr/sbin/lsmod     <- symlink to kmod
> 
> And then, depending on PATH, one may not get the lsmod one expects.
> Hence all this dance with the symlinks...
> 
> Tis was introduced in 78f5ac2908b3 (kmod: add option to install module
> utilities), at a time when individual packages would depend on busybox
> to ensure they would "win over busybox", but the comment about the above
> was removed in 273f23a45252 (package/busybox: invert dependency with
> kmod) when we switched the dependency over, to avoid having packages
> replace files from a previously package (in the hope to have a clean
> PPD build).
> 
> I agree that the handlng is not optimal, but mostly we're comment
> explaining the reason for this dance is missing.

Thank you, that helps! With that reason we should be able to simplify 
the dance to:

ifeq ($(BR2_ROOTFS_MERGED_USR),)
KMOD_CONF_OPTS += -Dsbindir=/sbin
endif

Busybox places its symlinks in /sbin, so in the non-merged case we need 
to do the same in kmod. In the merged-usr case Busybox will follow the 
/sbin -> /usr/sbin symlink, which matches the kmod default. And in the 
merged-bin case both will follow the /usr/sbin -> /usr/bin symlink. :-)

I wish all packages were that well behaved, I had a very annoying 
discovery in eudev while testing the merged-bin case, where it was 
clobbering its own udevadm binary [1].

>>> Whether that makes sense with the kmod binary in /usr/bin is a different
>>> question: If /usr is on a separate partition (the ancient reason for the
>>> split), the symlinks will be broken until that is mounted. I simply kept
>>> the same behavior as before. If placing the symlinks in /usr/sbin in
>>> builds with BR2_ROOTFS_MERGED_USR=n is fine, we can remove this whole
>>> mess of conditionals. :-)
> 
> Check where busybox installs its own symlinks/hardlinks/scripts before
> you drop the symlink dance.
> 
> As for /usr on a separate partition, I think this is completely ruled
> out for the merged-usr case anyway. With unmerged-usr, I am not sure
> Buildroot ever officially supported this anyway: as you point out, the
> kmod binary is in usr, so usr-on-a-separate-partition-with-kmod never
> worked since at least 2012, when 78f5ac2908b3 was introduced...

Okay, if nobody saw that as a problem since we can probably leave it 
as-is. :-)

Best regards,
Fiona

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20260501002320.1761716-3-fiona.klute@gmx.de/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
