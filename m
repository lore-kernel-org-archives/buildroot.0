Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44037E77198
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2B9761081;
	Tue,  7 Jan 2025 21:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfmk0m16kDZh; Tue,  7 Jan 2025 21:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD98161020
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD98161020;
	Tue,  7 Jan 2025 21:23:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B03436B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 901E740424
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzGILOdnRTWX for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 21:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3BBB4011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3BBB4011C
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3BBB4011C
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:23:15 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 016F3240C91;
 Tue,  7 Jan 2025 22:23:13 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id CC77326044B;
 Tue,  7 Jan 2025 22:23:13 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id B890B240C91;
 Tue,  7 Jan 2025 22:23:11 +0100 (CET)
To: Han Gao <rabenda.cn@gmail.com>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 07 Jan 2025 22:22:08 +0100
Message-ID: <3335914.44csPzL39Z@kilian-laptop>
In-Reply-To: <CAAT7Ki9Y3ZfcbnQnYytgUon6iY8P8o6o2YXCXOeTw++gsoHJUg@mail.gmail.com>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
 <10590208.nUPlyArG6x@kilian-laptop>
 <CAAT7Ki9Y3ZfcbnQnYytgUon6iY8P8o6o2YXCXOeTw++gsoHJUg@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4546
X-purgate-ID: 154282::1736284993-3953D89E-E2A2FE87/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1736284993;
 bh=MDOpnVBzbSiV6odrAqdAKYYuTy/E1oLPQUNIZYfKj1U=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=CKuNYm3y9wvIvuH9a2Imq7H1ChFsTnxGo0qERxM5TaMuW8P3gCXEzVSq9xQ4ndubS
 8C32t+Im5QVCGbYXmqfqFA8sxEhjBqq2kW8Uz3MoGN9E4scBIHVD3UOyWk8W3zgKvt
 hRA4NC0BVo13YViaNTfNC+Mh3OJEymZOdjsmf/uL5z6wPEew7QOfeKNs0nliwpSDds
 V39Y29Lvch3+1cjrLrzBEh1Tx+hAcwApHAhiIzvR5WyaaJSFzKZO9P1G/ovF7LSjJq
 KFp4+pc/l4GOTo8sPRE6+8XE/nBDQpUMfO/yp4AClPuVfspKm6jLg4wMfeS7yUugM7
 gys7U7AP6+3gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=CKuNYm3y
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Han,

[--SNIP--]

> > Furthermore, there is now a repo, containing the "Xuantie-bins", which has
> > a LICENSE file in it[1]! I switched to using that repository. As it is a
> > couple of 100MBs large, I changed the package makefile to only fetch the
> > needed binaries and the LICENSE file. Hence, I prepared a 7th iterartion
> > of the board.
> Regarding the license of xuantie-bin[1], the xuantie team thinks it
> should be released under the apache license, but I doubt if this
> applies to binary files?

I am not sure, but I assumed the Apache License could also cover binaries, 
i.e., such that they may be redistributed? Can someone shed a bit light on 
this?

> For another binary, please do not use the version from the
> xuantie-yocto repository. This is v0.9.5 SDK.
> The revyos repository has released v2.0.2 SDK, which needs to be used
> in conjunction with it.
> 
> The behavior of the aon has been modified in the SDK 1.4.0 version update.

Thanks for the information! Do you refer to the binaries in this repository, 
here:

https://github.com/revyos/th1520-boot-firmware/tree/master/addons/boot

I could switch to using those, but again, I would need some information about 
the license of these binaries inside the repository, e.g., via a LICENSE file. 
It is important, that people are allowed to use the binaries and redistribute 
images containing them. Would it be possible, that a license is added? E.g., 
Rockchip added this license to a repository, which contains binary blobs for 
their SoCs:

https://github.com/rockchip-linux/rkbin/blob/master/LICENSE

> > However, I have further questions, I wanted to ask before sending a v7:
> > There exist vulnerabilities reported for the board's SoC, e.g.,
> > "Ghostwrite"[2]. How would be a proper way to deal with such issues?
> > Specifically regarding Ghostwrite the authors say, that to mitigate one
> > would have to disable the SoCs vector extension. However, the only way I
> > am currently aware to do that is to disable the SoC's vendor extensions
> > all toghether (using the "theadisaee" bit in the "mxstatus" register). If
> > I do so, I do get a kernel oops upon booting, as the kernel is executing
> > some vendor specific instructions. Is there a proper way to disable the
> > use of the vendor specific instructions by the kernel, which does not
> > introduce other issues? Or alternatively would it be ok to only mention
> > the vulnerability in the board's readme, (ofc. including links and CVEs),
> > stating that the board support does not fix theses issues?
> > 
> > [1] https://github.com/XUANTIE-RV/xuantie-yocto
> > [2] https://ghostwriteattack.com/
> > [3]
> > https://elixir.bootlin.com/linux/v6.12.6/source/arch/riscv/errata/thead/
> > errata.c
> 
> The mainline kernel does not support xtheadvector yet, so it is not
> affected by Ghostwrite.
> I think the way to turn it off is to delete the xtheadvector
> description in the dts, but it doesn't exist now, so don't worry about
> it.

From my understanding of "Ghostwrite", it is not sufficient, that the kernel 
does not support any xtheadvector instructions: From my understanding, as long 
as the xtheadvector extension is activated, any userspace program could 
execute xtheadvector instructions, including the ones, which may be missused 
for a privilege escalation. Hence I think that as a mitigation the 
xtheadvector would actually have to be disabled, e.g., if possible by setting 
proper configuration bits. I attempted that, but so far I could only identify a 
configuration bit, which disables all vendor extension instructions all 
toghether: "theadisaee". If I disable all vendor extension instructions, I get 
a kernel oops, because the kernel is executing some vendor extension 
instructions[1] - not from xtheadvector, but e.g., from xtheadcmo. So I am not 
sure how to deal with that. Either, there is some configuration bit, which can 
precisely only disable the xtheadvector extension alone. Or maybe one can 
configure/patch the kernel to not use any vendor extension instruction, without 
introducing other issues. Or else I put a notice into the boards readme, that 
the board support may be susceptible to "Ghostwrite", if that is acceptable 
for a board support in buildroot? Any help, how I can and should deal with the 
issue appreciated!

Thanks and best regards,
Kilian

[1] https://elixir.bootlin.com/linux/v6.12.6/source/arch/riscv/errata/thead/
errata.c









_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
