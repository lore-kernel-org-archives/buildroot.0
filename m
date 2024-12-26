Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AD7E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 22:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1397605F4;
	Thu, 26 Dec 2024 22:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zbau6WoR7Gdc; Thu, 26 Dec 2024 22:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FA6C607A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA6C607A9;
	Thu, 26 Dec 2024 22:16:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF2AE0
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BA1A80C75
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbEll74tAUPM for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 22:16:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCB8580A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB8580A73
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCB8580A73
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:16:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5644719F576;
 Thu, 26 Dec 2024 23:16:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58580])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Dec 2024 23:16:03 +0100
MIME-Version: 1.0
Date: Thu, 26 Dec 2024 23:16:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org
In-Reply-To: <4632342.LvFx2qVVIh@kilian-laptop>
References: <4632342.LvFx2qVVIh@kilian-laptop>
User-Agent: Webmail Free/1.6.9
Message-ID: <3f1890a6dce4859431fb9b8d0e4747e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735251364;
 bh=E/r0CPYbv8QbF8cXvn4hRaVPiSReMgD7DMEpdppnAec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SMTTIpBNFvM1sGocYO5gyCfaBgnpyMdXvF/ZmrSqcEoF53X30TsXf5qCv9zAeUCVQ
 RnErZSQSPj6pqclD4rDNLDZp5Uf88hZNsjVW4ZdB0XcGRfwSlxhlAgaamdr2wePk6N
 bMa3+cKwQx5ck28ayi/K3jdZusdiHnWFHc3TpBVnBynu4rsUCMlK/3Qxrp/wwp/xIj
 N8M3U3r3Xb/Z6XOmx96RHQjqRORYQH6rNGKnIXCZgf5fXKFJ5GswJQbArrkfSmbzPc
 caTZofCsQe6COmADKI9MKRFmJXDd8B8l4wdGwxrG55/cg0JMNZVCqtijTW4qGvIXKq
 863Y/Uo775zNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SMTTIpBN
Subject: Re: [Buildroot] [Help] How to bump a package, e.g., OpenSBI?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 26/12/2024 22:19, Kilian Zinnecker via buildroot wrote:
> Hello all,
> 
> I saw that RISC-V's OpenSBI recently got an update to v1.6.[1] In 
> buildroot
> the package's latest version is v1.5.[2] I would like to bump it. Ofc. 
> I'd
> have to adjust the version in the Config.in, and also the hashes in the 
> hash
> file.

This is correct. You can have a look how the previous versions
were updated, for details. For example, see [3].
This will update only the default "latest" OpenSBI version. Usually,
defconfigs in Buildroot are using a specific, fixed custom version.

> I am wondering what is required with regards to testing? Currently I
> cannot test whether RISC-V boards would work with OpenSBI v1.6. 
> However, I
> could do a build-test, i.e., pick a RISC-V defconfig, adjust its 
> OpenSBI
> version to 1.6 (just locally, not sending any patch with that regard to 
> any
> board's defconfig) and see, whether OpenSBI v1.6 gets build 
> successfully. Is
> this sufficient as testing before sending a patch bumping OpenSBI? Or 
> is
> additional testing expected before sending a bump-patch?

There is no strict rules for testing. The general guideline would be
"the more, the better" ;)  Doing a compilation test only for such a
component is a bit limited. Doing a runtime test would be better.
So, if you have a specific board in mind, you can ask in the patch
cover letter (on in the patch note) for somebody with access to the
board to test and reply with the "Tested-by:" tag.

Fortunately, in Buildroot, there is several defconfigs for
RISC-V emulators [4] [5] [6] [7]. If you don't have a specific board
in mind, you could use those to runtime test this new v1.6. Those
emulators are usually good references.

For example, after locally modifying those defconfigs to use this new
OpenSBI version, you can use commands such as:

     make qemu_riscv64_virt_defconfig
     make
     output/images/start-qemu.sh

Or:

     make spike_riscv64_defconfig
     make
     board/spike/riscv64/start.sh

and check you can reach the user-space and the system login. You can
describe your test methodology in the cover letter (or patch note) to 
make
reviews faster for the maintainers. See for example [8].

> Best regards,
> Kilian
> 
> [1] https://github.com/riscv-software-src/opensbi/commit/
> bd613dd92113f683052acfb23d9dc8ba60029e0a
> [2] 
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/boot/opensbi/
> Config.in?ref_type=heads#L21-22

Best regards,

Julien.

[3] 
https://gitlab.com/buildroot.org/buildroot/-/commit/c583befc8e92d0ae70d4fcb967bf8257ea94d577
[4] 
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/qemu_riscv32_virt_defconfig
[5] 
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/qemu_riscv64_virt_defconfig
[6] 
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/spike_riscv32_defconfig
[7] 
https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/spike_riscv64_defconfig
[8] 
https://patchwork.ozlabs.org/project/buildroot/patch/20240622114621.447904-1-ju.o@free.fr/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
