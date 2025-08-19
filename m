Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBF3CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 16:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1EFE40B4D;
	Tue, 19 Aug 2025 16:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSRXJvwXxUwr; Tue, 19 Aug 2025 16:00:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C9140C3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C9140C3E;
	Tue, 19 Aug 2025 16:00:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96545E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 16:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CDF64077D
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 16:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fyh4ONbK12xV for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 16:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.20;
 helo=mail-24420.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85C2940779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C2940779
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch
 [109.224.244.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85C2940779
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 16:00:52 +0000 (UTC)
Date: Tue, 19 Aug 2025 16:00:43 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>
Message-ID: <cad96fd9e7449c747de6e6f0613f24fc37f285cf.camel@philipmolloy.com>
In-Reply-To: <20250819143950.0fe69ce0@windsurf>
References: <76af3a7b1aade5a457440fa4605712aba391bd90.camel@philipmolloy.com>
 <20250819143950.0fe69ce0@windsurf>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 7dfca9f72851f34a7eaa1bd65001d1e533814c70
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1755619249; x=1755878449;
 bh=msZ8zzl0Qy5kEvR5W3ErIo+VC8bQ6huUBdWXMxsiXb4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=LEgl53zsHX97IVMa38opops9n2xgvGEYzj8vaQ1TAGQfF/yR4fZVfSn53zCykHN0C
 GyQi3g2IuxlmqkFuPyc189ojE4k/VfG22PfzdCPMvUIs8LZ5p/CDuMRVvkks/iM5k9
 IDPq06pcgfMQDk+yez7j9aKPpWvNkvsnlNqkDejYxtUxDEW/SNa6wlT9lPt0Pz+/sk
 gQRsCKRoe62RDauVW9J6wLXgo+iYllM3Mm16dN38Jurlq4o/cFHDml2P9x3sdTAdYr
 O5JaJMMgxddzV0zbm3BzaSKaBsgtQGrcCAnoQy/pmkTy7VGwr8jeS+VnZKBTcOu9Ls
 MoFf57MY8sVDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=LEgl53zs
Subject: Re: [Buildroot] [PATCH 1/4] package/adsp-ldr: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2025-08-19 at 14:39 +0200, Thomas Petazzoni wrote:
> Hello Philip,
> 
> On Tue, 19 Aug 2025 11:53:00 +0000
> Philip Molloy <philip@philipmolloy.com> wrote:
> 
> > Absolutely, renamed it to Config.in.host and updated accordingly.
> > Pushed it, along
> > with all other changes to the branch linked to in the cover letter.
> 
> You don't need a Config.in.host file. This tool is merely a build
> dependency for U-Boot to do its job, so it's sufficient to have U-
> Boot
> add host-adsp-ldr to UBOOT_DEPENDENCIES. No need for a
> Config.in.host.

ldr basically just generates a header describing data to be loaded and
executed by the boot ROM. That data could be U-Boot SPL, U-Boot Proper,
ATF, Linux, FreeRTOS or a baremetal application, for the ARM Cortex or
ADI SHARC DSP cores.

I don't mind dropping it, but it is much more than just a U-Boot
dependency. Perhaps more context in the Config.in.host description
would help?

> > > Are you sure that this license file is correct? Indeed, all
> > > source
> > > files seem to have a BSD-3-Clause license, for example:
> > > https://github.com/analogdevicesinc/adsp-ldr/blob/main/src/ldr/lfd.c
> > > .
> > 
> > Thanks for noticing this! I'll try to address it in a new release.
> 
> But in the mean time? You'll set ADSP_LDR_LICENSE to BSD-3-Clause and
> use one of the source files as a license file?

src/ldr/COPYING originally contained GPL v2. It was then moved to
LICENSE in the project root. Then around 9/2022 LICENSE was updated to
GPL v3.

I'm checking internally, but I assume at this point we'll change
everything to GPL v2 in a new release. If so, then I'll just bump the
version and update the package mk file accordingly in v2 of this
series.

> > > Why do you install it with a $(TARGET_CROSS) prefix?
> > 
> > It is currently required by mainline U-Boot.[1] More context below.
> > 
> > [1]:
> > https://elixir.bootlin.com/u-boot/v2025.07/source/Makefile#L405
> 
> OK, understood. Then probably a comment in the .mk file makes sense.

Sounds good, I added a comment.

> > > Also, you seem to be the author of this repo. Why is the ldr code
> > > burried in src/ldr, with not much outside of this folder? It
> > > would make
> > > a lot more sense to have the code directly at the project root,
> > > and
> > > avoid having to pass ADSP_LDR_SUBDIR = src/ldr.
> > 
> > This code is very very old. I was not even able to track down the
> > full history internally at ADI.
> > 
> > The DSP line of processors were (and largely still are) used to run
> > baremetal or FreeRTOS applications, which are developed using a IDE
> > called CCES, which includes a custom toolchain (hence the prefix
> > above). Some DSP processors do not even have ARM cores.
> > 
> > As they began to support Linux with larger ARM cores, the code
> > necessary to generate boot streams was extracted from a CCES
> > related
> > mono repo and copied into the Github repository. That happened a
> > few
> > years ago and was never updated.
> > 
> > So far I've renamed the repo, switched from master to main, merged
> > a
> > "release" branch into main, and created a Github release. But there
> > is still a lot that can be improved.
> > 
> > I have spent some time cleaning things up[2], but I need to
> > refactor
> > it a bit and rebase onto main since merging the release branch. As
> > I'm sure you can imagine, this isn't a high priority. :-P
> 
> I can understand all of that, but I don't quite understand why all
> this
> history implies that the code should be buried in a sub-subdir of a
> brand new Git repo that otherwise doesn't contain anything else?
> 
> Basically, just recreate your Git repo with the contents of src/ldr/,
> but directly at the root of your repo, and work from there.
> > 
The git repo is at least 3 years old. The repo has been in use by the
ADI Yocto layer since at least May, 2022.[1] All of the commits
currently on main (which I recently merged without making any changes)
have been in use since October, 2022.[2]

[1]:
https://github.com/analogdevicesinc/lnxdsp-adi-meta/commit/5dc8760c306fcc25c4d60da64ee478a117878a7f
[2]: https://github.com/analogdevicesinc/lnxdsp-adi-
meta/commit/083171f142d230f5e726f89a86486373b0494b54
> > 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
