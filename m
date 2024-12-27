Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293BCE7718F
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 18:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF988042F;
	Fri, 27 Dec 2024 18:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAYzIPkVFOe8; Fri, 27 Dec 2024 18:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C653D80E8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C653D80E8C;
	Fri, 27 Dec 2024 18:32:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5E2757
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 18:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4501740AB2
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 18:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAyYdoMPgOrx for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 18:32:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A39D40567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A39D40567
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A39D40567
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 18:32:15 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id E26A2240EFE;
 Fri, 27 Dec 2024 19:32:13 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id BA200240574;
 Fri, 27 Dec 2024 19:32:13 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 8F95F240DB7;
 Fri, 27 Dec 2024 19:32:12 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, mark@dibsco.co.uk, alistair@alistair23.me
Date: Fri, 27 Dec 2024 19:31:19 +0100
Message-ID: <2761179.mvXUDI8C0e@kilian-laptop>
In-Reply-To: <3f1890a6dce4859431fb9b8d0e4747e9@free.fr>
References: <4632342.LvFx2qVVIh@kilian-laptop>
 <3f1890a6dce4859431fb9b8d0e4747e9@free.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1832
X-purgate-ID: 154282::1735324333-4AF772C4-DCBEFBDC/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735324333;
 bh=AmDZVdVkyy9utqb2EIF0qKE0Nk+Q+9XsY3BTQGX8YUk=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=G+NmmWbhoc9TEA4hKPyGSYSWf7F2bt9jBIeCkUVadrpuDzqOg25k0DnOgUeNTVDdC
 YfcBIEEPdiqe13Y7hVW5jFWMQaxAMMNIuK8znEL+A7n19aI+IAWFscg8T92pxbGYge
 4lXVUBz/bwfuz4sVq0KUxRT0FZD8Kqva9+eGiXA9FeB8tcMypGojpHRUK/Emif3j4P
 eFlzLNYSgNCQpx0w0PL1kK03a5FA4BkA81JKQs8XGlE1klEYrMKrgQrSLNMQBke1G6
 /6IyuhISWZ+v24ehtip9qtA56yyKOgm3MlP9b8n9O0Q29a0WTB565pg9vzJzuWel4p
 2qBl7Hlr2QeQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=G+NmmWbh
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien, hello Mark, hello Alistair,

Mark and Alistair, I added you, because you are listed in the DEVELOPERS file 
for qemu_riscv64_virt_defconfig / OpenSBI - hope its ok ;)

[--SNIP--]
> This is correct. You can have a look how the previous versions
> were updated, for details. For example, see [3].
> This will update only the default "latest" OpenSBI version. Usually,
> defconfigs in Buildroot are using a specific, fixed custom version.

Thanks Julien! I locally adjusted the OpenSBI version number and the package's 
hash. Then I adjusted the used version of OpenSBI in the 
qemu_riscv64_virt_defconfig and started a build: The build was successfull, 
hence also the build of OpenSBI v1.6 worked. However, when I try to run 
output/images/start_qemu.sh I get the error, that ROM regions do overlap:

The following two regions overlap (in the memory address space):
  fw_jump.elf ELF program header segment 1 (addresses 0x0000000000000000 - 
0x00000000000271e0)
  mrom.reset (addresses 0x0000000000001000 - 0x0000000000001028)

I guess, that the OpenSBI image had a different starting address in the past, 
leaving some space for mrom.reset? I double checked, and when building 
qemu_riscv64_virt_defconfig without modifying its OpenSBI version, it still 
works, so the problem must come from my changes. I am not so familiar with 
OpenSBI and also not with Qemu and hence was not able to find a solution to the 
problem yet.

I also tried building qemu_riscv64_virt_efi_defconfig, but that board seems to 
need a github login to fetch some package. I didn't look into this in much 
detail yet (e.g., whether it was my fault for some reason), but I am planning 
to have another look at that and then maybe sent a separate email for this 
issue.

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
