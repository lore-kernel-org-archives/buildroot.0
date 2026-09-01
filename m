Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BE5C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 12:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BC3606F6;
	Tue,  1 Sep 2026 12:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYl_2SdQjmF5; Tue,  1 Sep 2026 12:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788267214;
	bh=m0KfZTwKzOEgm7jzUDUd6ETL4nSfAHBZr/sw8gVCRQw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r+augX5KC8hf9q/ILUEtrohiEg8YrrTE3cTWLUimX3abQk120L3RWo8eHSgPgx+WY
	 LcWSt+3SyPzXT4CMsd2+n1JxQ29wAxQjt31jO1LvzVKWFUVQtDFIgjgeXPFUYo+jBp
	 lR+89SkszdSWDbpGD6HlSEjNryOv/6G26mUpNqSppFFqcpFdfSIEu2wpcn7RJNrh1A
	 RT8Hw0QVqo6a02PAtvLCbVd0CmQRtq0L5M1SUGKYFVqHsu8QVMnNrRD5JtnwwGTB/g
	 uFWTP5YT/x7MGak4uYqSHK7lCWMkL6oMkiMI003mf/wvtuhbUr5Y9CRfZANTuiV59O
	 wOaOsL/7fFuAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 382D4606D4;
	Tue,  1 Sep 2026 12:53:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF5712FD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 12:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACDEF60649
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 12:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aqOjT4zTZ09 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 12:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EA46605CE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 12:53:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1xKpaO0P3j-00Nw2o; Tue, 01
 Sep 2026 14:53:27 +0200
Message-ID: <3fbbaf51-47dc-4b3a-8a28-7768ae5d42a1@gmx.de>
Date: Tue, 1 Sep 2026 14:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20260831125103.841338-1-fiona.klute@gmx.de>
 <87mru2je25.fsf@dell.be.48ers.dk>
 <76f38e09-f5c4-4b0c-8397-01061d7fbced@gmx.de>
 <878q5lh3su.fsf@dell.be.48ers.dk>
 <ac74c754-7c42-421e-a16c-c019b902652e@gmx.de>
 <875x0p8als.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <875x0p8als.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:9sQFU6AEZSX+4LTJbP8rwi87hrx9aFXvfaHjLshppxtYbIAQzWU
 5D27uXcLZ2DUmdNUYHMcKcxSCSAx2/Gf/tccQvxZ/LDLtF99O+TgmfrgLY+lB+DJ9B6bvbk
 V2ht6fZdOBgvMc47oYsOGPMItNKeKIDaJOtry5atboyphYA7j/HwWa0KuomGON1wE+Thl/8
 Mbmm6K4Xr1a2V8bTh0+ow==
UI-OutboundReport: notjunk:1;M01:P0:FxIDmvTKLwY=;xahGzNlzVdgz/HP72VWDIS9VkJf
 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
Subject: Re: [Buildroot] [PATCH next 1/3] fs/common.mk: add optional hook to
 build a verity hash tree
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

Am 01.09.26 um 13:38 schrieb Peter Korsgaard:
>>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:
> 
> Hi,
> 
>   >> Possibly, but should that then be per-fs or global? I wonder if it
>   >> is
>   >> worth the complexity to add this logic versus how fairly simple it is to
>   >> just do it with whatever options you want in a post-image script.
> 
>   > I'd say per-fs. The logic could be shared like the general veritysetup
>   > call, just the option would need to be added for each fs (in
>   > Config.in). I don't think Kconfig has a kind of templating for that?
> 
>   > I agree running veritysetup in a post-image script isn't very
>   > complicated. Where I'm actually trying to do is to have the roothash
>   > of my rootfs before building an initramfs (using
>   > BR2_TARGET_ROOTFS_CPIO_DRACUT), so it can be included (and signed
>   > along with the initramfs, in my case in a FIT image). Of course these
>   > patches don't achieve that, they'd just provide the roothash as a
>   > start.
> 
>   > If you have a better idea how to do that I'm all ears.
> 
> The way I have solved it in the past is to use "late" binding between
> the kernel and rootfs, E.G. only when I build the FIT image by sticking
> the root hash into a u-boot boot script that I generate in my post-image
> script and embed in the FIT.

That's exactly what I'm doing for now, with a config for the script in 
the FIT image running "source $loadaddr#set-roothash" works, but it 
seems kind of convoluted. Especially given Dracut explicitly provides 
the option to embed command line options in the initramfs. :D

>   > script can't do it (rootfs image isn't ready), post-image doesn't have
>   > the fakeroot environment for running Dracut (and other setup [1]).
>   > Maybe we should move building initramfs to a separate stage, after
>   > rootfs (I'd definitely need to order cpio after other fs types), and
>   > add a pre-initramfs script? Is there another non-messy way to use the
>   > fakeroot environment and variables from Buildroot config that I've
>   > missed so far (other than rules in external.mk)?
> 
> Initramfs is indeed annoying because of the circular dependencies. It
> has been quite a while since I last used one. Out of interest, what do
> you need the initramfs for?
Right now for setting up that dm-verity device, in the future probably 
dm-crypt, too. If it was *only* dm-verity I could use dm-mod.create 
(assemble parameters like in the test in post-image) and let the kernel 
handle the rest. Systemd has a bunch of automation for it, which is why 
I've been working on fixing Dracut. ;-)

We don't really need the circular dependency, we just have to order the 
initramfs after the rootfs. Kinda crude, but works (in external.mk):

$(BINARIES_DIR)/rootfs.cpio: $(BINARIES_DIR)/rootfs.squashfs

My general idea so far is to add something similar (but generic) 
conditional on BR2_TARGET_ROOTFS_CPIO_DRACUT=y. We might still need a 
script hook, but maybe a custom Dracut module would be enough (e.g. 
build a veritytab/crypttab and install it in the initramfs). I'm still 
working this out. :-)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
