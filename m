Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D5606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m5SbmDmO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F807409A2;
	Fri, 27 Nov 2026 13:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TS8JckfnKuv; Fri, 27 Nov 2026 13:36:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E8840408A2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795786566;
	b=oc4xuXB1jsvau7VgRhJek4ybmU7QE0BdLGrc8i0ljH3fGEHCsZqgzJsnLNzWESCNfGHm
	 eC1FL5ER6qXZYYXADqQbkY5++36l5aTTKfeHjeG+G+RqWTXURKKX0OQ6D17oD489bDhYE
	 rINrKXpimcdFScZTnR6aw5VeAmVQy2usN/V2XIuHtcGmVbP7FPrx5gincEYHS9aRwcr4C
	 /bJ1pz6kHAimItMHsCq2wXQxsl+MaKTtdcr6LdC1gsNQXY+hq77mm8Myvp5qZ5zeJAof7
	 eQXH/uqd9HGTCUGoAbFgR10i1GVzcoSz6eSzT0a2V0P9w2dkUeVhGs5pbWQmzbexIDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795786566;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=zIILUaevg+gf1srNeyFe7kjL8vDqyCaIaFpRW39YZqg=;
	b=tavg1naSDT00Uz10DxiTddx3AzDpe/JjrCFNuEobCqDiK8UbZD/CanxwWScNJmXazS4M
	 CPmDmgEYeH7W3K4cAgV0Ie4byODPvQ/HhOP9WtfXfcHo15c51vNnDjYx72Phl84IcTY1n
	 iqfrRcogcT8vBRLeiDLFghkodmYE3O1g8sAvbNI9nxi3h0bzbpBbwbn4qwPBoaMi2iHg9
	 b8C/7yoGnSkpWLW6vZe3oRnpRZH2wI7zfaMYK9RgVY/bdsD/Yu0C51IypH3pDGOh+HFjb
	 bPwSx9nEX9ZmUC27SOmaT485Q/k8SjO0WUXZGt3PNAxLRuIojlOxgK79cmvVqo8gHxw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795786566;
	bh=zIILUaevg+gf1srNeyFe7kjL8vDqyCaIaFpRW39YZqg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m5SbmDmOTk2xsrzAAleyRffT25yeBx9rnXJTPk2touMpJZaKwwww6YAr1JnHtA7dK
	 EhbLmKhujoAmwzkdGdLPodPwICzdHUsMpMQd6uSWqs4JQN6tfMBbFV6TqbzpxJLGSl
	 6XIIH8FoTsnaFjG+HHWOqNi28SJtJ+ZV6wYKDocUGRB3wYwHMxHZ/5e1QSbxUxcMGS
	 0SV6djmnzQgFzBLiMKTwJqvrkww0pzFqlyJwjx3MPGKBalb+iUgzvtP3sK0l5V835x
	 3A8EnNOxy/8XrEVUqHE+hvAl6tCuvFldyzctbw0KwRqJdTdr4IbzRVZ6YQ12JROcev
	 7sNoRH3BPgs2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8840408A2;
	Fri, 27 Nov 2026 13:36:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A788F2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D50A8119C
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egVw3r1rYopm for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 13:36:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D06F481121
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D06F481121
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:36:02 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795786560; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:rvfPEmqnTH/tW8jVOSC8YjuaVR0A
 9NFWW5fDXHACvFHaa/2x2bwIj3zpvfoiKQJ1WdZsF4VJbzKC4KAxPDMk0YW6lRz5KByt3CFeAge
 41j3pOKLxFO0oW69Vg5UMLCIDN9NZ/c05jNdUdYsuAhXMWyVVJFZ1uRPJo80GS4zze+V+Qgy3Gt
 fI95YXCguRqod7ohFPZkcrDYV9r89nS3mWyTp9UEBzieJto6TU0U+Z1JeUkilATbOXqs2o9hM2s
 vv5iTUmr+3HsQu2Axbd+SwfsPVVIk6yb5J+AMe8VP0ELpRRiVKGSJZVOKPNiGsfUQyWHBrIDtBu
 VmrazXKqFmerFQ==;
Message-Instance: m=1; h=sha256: 2w56yVBW25uny5MBM9b8DuinLKs91jwksTGr3jZmewM=:
 P/vC2KpUlm92wLlcKVI0reD/5zcX0oR4QUXlFXhLJq0=, sha512:
 NARQKblWdI5Tvpl+zPRyyXe4JlCbS8wdnr7yKc1BNU1bw1HHH3PL8ZWzqsTMhEgxJGRMSvsCqEndTKE1WEDDCw==:
 fycxkmlS2Z5lRovqRtG019tHHUMIXZFzBOlfAu1fL528ie9G2y8ur8Dl2Fht2UY5ToItP0GkRCsz1kVsTp5QoQ==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2E1G-1yVx0Q02By-00uPXE; Fri, 27
 Nov 2026 14:36:00 +0100
Message-ID: <1131b742-e952-4fd6-bd4b-33e84b0162d7@gmx.de>
Date: Fri, 27 Nov 2026 14:35:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
 <20261126192435.1826415-10-fiona.klute@gmx.de>
 <a2643476-4921-4bcd-97c6-92bff9a71347@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <a2643476-4921-4bcd-97c6-92bff9a71347@bubu1.eu>
X-Provags-ID: V03:K1:5vwZ2nc7hjsZHpAoiBRNpOVJisJnjwTP3GZbuoxQCz51axEY1sG
 q5i8Zomv7OWOezmYeVXVNHznvD7O2kf9t01OWxj1Y23oeCh88mu9o4VrbUR3sj7Ieqtfn1z
 y/1XUzLhkDmUPCBFRWACtttUxPPCIgpVLKFljBBXquRXo/fOhOGD/IiKIs0jeFlLZRrW5i2
 a7zOum2Q7j6E2tWo+iabg==
UI-OutboundReport: notjunk:1;M01:P0:70siNftXx4I=;vz4yOmpOLA61nZEdlYShtPclocR
 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
 AXsa8+KrfpgBLh8vKY9Bh/zAEV2QNMdX0
Subject: Re: [Buildroot] [PATCH 09/10] package/dracut: install components
 for systemd exitrd
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marcus,

thanks for the review!

Am 27.11.26 um 03:49 schrieb Marcus Hoffmann:
> Hi Fiona,
> 
> this review got a bit longer, because I both learned something new here 
> and had trouble understanding how the dracut implementation of this is 
> supposed to work. I think on the buildroot side we mostly want docs + 
> maybe a test covering this functionality. But there's a bunch of 
> conceptual discussion below (I dug all of this up now, so I might as 
> well share it :)).

True, the initrd option isn't even mentioned in the manual right now, 
you can only find it poking around the rootfs options. Might be good to 
change that. :D

> On 11/26/26 20:24, Fiona Klute via buildroot wrote:
>> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
>>
>> With systemd, dracut can optionally restore the initramfs during
>> shutdown, e.g. so the rootfs can be cleanly unmounted and
>> device-mapper devices closed. Systemd calls this an
>> "exitrd". 
> 
> TIL, interesting!
> 
>> dracut-shutdown.service will prepare the exitrd if
>> /run/initramfs/.need_shutdown exists during shutdown.
>>
>> Install the required tools and systemd units if BR2_INIT_SYSTEMD=y.
> 
> I dislike the dracut implementation for providing the exitrd, unless I 
> missed something fundamental in how it's supposed to work.
> 
> As far as I understood it requires the initramfs file to be discoverable 
> (see [1] and [2]) at shutdown time for this feature to work. That is 
> normally not how you want to boot a modern/secure system, where you'd 
> normally want the initramfs loaded from a UKI or FIT image. So you 
> either need to redesign your boot workflow around hashing/measuring 
> (into the TPM?) a plain initrd file or you install an additional copy 
> (that you don't actually boot from) into your /boot?

Yep, at least as of v113 that's correct. Another patch of mine that was 
merged after the release lets you override the location:
https://github.com/dracut-ng/dracut/commit/c6b9ccfa91887de2912e9b820c927fbefd2053d3

I didn't include it in this series because it already has a lot of 
patches and that one isn't needed to make the cross-build that Buildroot 
relies on work, and e.g. a simple extlinux.conf boot could work without 
it (if the initrd path is one that's searched). I'd be happy to add it 
though. :-)

One catch for the extlinux.conf approach: It needs a separate boot 
partition, because at the moment Buildroot treats initrd as one more 
rootfs image, so it can't be included in the main rootfs itself (because 
there's no dependency to ensure it's built first). Maybe we should 
change that eventually. ;-)

> Do you have a concrete setup/usecase where this works? Do you think it 
> makes sense documenting the requirements here and/or including a test 
> that exercises this functionality end-to-end?

Yes, using the mentioned patch, actually with UKI *in* a FIT image. 
Those get verified at boot, but we shouldn't assume the data won't be 
manipulated before shutdown. The setup uses the approach I hinted at in 
the commit message for that patch:

At build time (post-image script):
* Create verity data for the initrd. Watch out for verity data block 
size, zero pad the initrd if needed. The data block size must also be a 
multiple of the loopback sector size to be used later (default & 
minimum: 512 bytes).
* Determine the position (offset, length) of the initrd data within the 
FIT image.
* Record the position and verity root hash in a *signed* file.
* Include that signed data and verity data in the partition that has the 
FIT image.

At runtime:
* Verify the signature and set up a loopback device for the initrd (FIT 
image with offset).
* Set up a dm-verity device on top (using the verified roothash), to 
ensure the data hasn't been manipulated after boot.
* Use the dm-verity block device as INITRD_IMG for dracut-shutdown.service.

Not sure if it'd make sense to do all that in a Buildroot test, for that 
I could just build a disk image with a partition containing the initrd 
that gets mounted to /boot. I can talk to the client about publishing 
the code if there's interest. How to determine the offset will depend on 
the exact setup though, the rest could be fairly generic (though I could 
imagine some variations).

> I then was curious at what archlinux actually does with mkinitcpio. 
> There's actually two different variants (systemd vs bysubox initramfs) 
> and I think both are conceptually better than what dracut does:
> * The systemd case especially is also far, far simpler: Before shutdown 
> a new minmal initramfs is assembled just containing libmount and the 
> systemd-shutdown binary from the running systemd into /run/ramfs and 
> that's used for final shutdown. systemd-shutdown handles all the actual 
> fs teardown. This means you always have everything you need for clean 
> shutdown in the rootfs, at the correct version and only mount a tiny 
> tmpfs, not the full initramfs for shutdown.

So in principle it does the same thing as dracut, just at runtime, and 
with more limited functionality. With the dracut approach you can have 
modules add (pre-)shutdown hooks (and use the emergency shell), and 
dracut can make sure their dependencies are available. I'm not going to 
say one is fundamentally better, that depends on what you need.

> * The non-systemd case is a bunch of shell logic for unmounting stuff 
> (meh) but it does still avoid the need for the initramfs at shutdown by 
> copying the contents of it during boot into a location it will be used 
> from during shutdown.

Hm, that sounds like the data would have to remain in RAM though? If you 
have enough of it that's certainly simpler. Though I guess the initrd 
can be pretty small if it's essentially just Busybox and a script or three.

Best regards,
Fiona

> [1] https://github.com/dracut-ng/dracut/blob/113/dracut-initramfs- 
> restore.sh#L16-L51
> [2] https://github.com/dracut-ng/dracut/blob/113/dracut-initramfs- 
> restore.sh#L64-L72
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
