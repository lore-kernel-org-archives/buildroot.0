Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6BEC47072
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 15:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBFC840360;
	Fri, 29 Dec 2023 15:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFC840360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qoEwz9CrbjtT; Fri, 29 Dec 2023 15:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5C9343533;
	Fri, 29 Dec 2023 15:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5C9343533
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB60F1BF383
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 15:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36774185C
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 15:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36774185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJ5pptVqOmQB for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 15:47:45 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C62741836
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 15:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C62741836
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 00C0719F57E;
 Fri, 29 Dec 2023 16:47:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40448])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 29 Dec 2023 16:47:38 +0100
MIME-Version: 1.0
Date: Fri, 29 Dec 2023 16:47:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <ZYhjQtmfpGir8zsQ@landeda>
References: <20231223212948.2512412-1-ju.o@free.fr> <ZYhjQtmfpGir8zsQ@landeda>
User-Agent: Webmail Free/1.6.5
Message-ID: <783a8cc0ec3eef55827fa3a0bffbb43d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703864862;
 bh=0tfHeY2HkMonW2Y7S9ioAbcrihFFivSUHYKhNyIVzSA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CTs1SQqZZ7LzoRe0KfIUIaO3AGbmcKkm7FUg5lvKGsfJBAF6YUDumvhBqD553rYQL
 j+rmL+ePZB2zVD7+EZN+LJMz8UjhIX3aiw1yla6iI4tHzKOWMaGSXv4hihopTenrTU
 LJVrtEp5IwSvOMglLyXt/DY140ZLw36VtEgDI4bKmy0hKcepkJ1U6Uo/LoxF6IrnH2
 M5kYCKLb/e84Pqp1NsIcf/QNxuwE0eVNuLTiFGO5xMPcusiZpca6KabfiTf/VJt7LM
 AceRl3YR2LdI1uNf+ZwnjvOVFrs3vAmdic8fRClh0seizTpuThPkQwFeTijfA8n4pB
 6ctlumL9AxAKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CTs1SQqZ
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/grub2: add RISC-V 64bit EFI
 support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 24/12/2023 17:58, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2023-12-23 22:29 +0100, Julien Olivain spake thusly:
>> Grub can be built as a RISC-V UEFI application since commit [1]. This
>> commit was first included in grub version 2.04.
>> 
>> This commit enables this support.
>> 
>> [1] 
>> https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=f1957dc8a3347278a095bc8f44197662559a8ba3
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Oh, I forgot to add: it would be awesome if you coulde extend the
> existing runtiem test to include a risc-v test:
>     support/testing/tests/boot/test_grub.py

In fact, I already had a test ready. I didn't send it because
the current Buildroot docker image does not include qemu with
RISC-V system emulation. See [1]. I sent a patch, accepted in
commit [2] to enable this support, but the image was not regenerated
since then.

Moreover, this RISCV 64bit EFI boot requires qemu >= 8.0.0.
Buildroot docker image is still on Debian 11 bullseye, which
includes qemu 5.2.0. Debian 12.4 bookworm only includes qemu 7.2.0,
see [3].

Do you think in that specific case I could include add
BR2_PACKAGE_HOST_QEMU=y in this specific runtime test config?

> Also, it would be nice to extend the readme for grub:
>     boot/grub2/readme.txt

I added that to my task list!

> Regards,
> Yann E. MORIN.
> 

Best regards,

Julien.

[1] 
https://gitlab.com/buildroot.org/buildroot/-/blob/master/.gitlab-ci.yml?ref_type=heads#L4
[2] 
https://gitlab.com/buildroot.org/buildroot/-/commit/93c7b55c778e3dd4d84945918e5d97d5f56256c5
[3] https://packages.debian.org/bookworm/qemu-system-misc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
