Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01776C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B589A405CE;
	Mon,  4 Apr 2022 19:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZMoAxGM3DBa; Mon,  4 Apr 2022 19:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA5240248;
	Mon,  4 Apr 2022 19:38:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7DE41BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3140605A1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=laposte.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqT_G_ieSCbV for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-outgoing-1902.laposte.net (smtp-outgoing-1902.laposte.net
 [160.92.124.106])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2278660586
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:38:25 +0000 (UTC)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KXLfh5vRJz1spV8",
 "contextId":"474928ec-f6c6-4a5f-a66d-7ce5a9ce997e"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0111.laposte.net (SMTP Server) with ESMTP id 4KXLfh5vRJz1spV8;
 Mon,  4 Apr 2022 21:38:20 +0200 (CEST)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KXLfh4ZfRz1spV6",
 "contextId":"d065f702-d26d-4d27-ad6c-fe32cd34e3ea"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 46
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgudefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfntefrqffuvffgpdggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggugfgjsehtkedttddttddunecuhfhrohhmpeggihhntggvnhhtucfuthgvhhhlrocuoehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvtheqnecuggftrfgrthhtvghrnheptdduiedtgfdvtdeludefieduieegudelffeglefgkeelieeiveeukeffgffhjedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepkeekrdduieelrdduvdelrddvvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeekrdduieelrdduvdelrddvvdehpdhhvghloheprhhomhhurghlugdrsggvrhhgvghrihgvpdhmrghilhhfrhhomhepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnohhuthesmhhinhgurdgsvgdprhgtphhtthhopehgvghrohhmvgdrsghurhhlrghtshesshhmihhlv
 gdrfhhrpdhmohguvgepshhmthhpohhuth
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0111.laposte.net (SMTP Server) with ESMTPSA id 4KXLfh4ZfRz1spV6;
 Mon,  4 Apr 2022 21:38:20 +0200 (CEST)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id 3BF6248BABB9; Mon,  4 Apr 2022 21:38:20 +0200 (CEST)
Date: Mon, 4 Apr 2022 21:38:20 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YktJLL+SywDe7TYm@romuald.bergerie>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 buildroot@buildroot.org, Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20220329205136.32435-1-vincent.stehle@laposte.net>
 <40cedffc-e46e-e4d5-e2f3-c0dd398906cd@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40cedffc-e46e-e4d5-e2f3-c0dd398906cd@mind.be>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1649101103; bh=ODbBjodTAu8CCoiWdWHZlSRg9mRLS/31wWA+APUVseI=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:Content-Transfer-Encoding;
 b=oh8hT63ffYu23EuIBb3mtDroULHJJUEKQh67E8hA02lAhiQCFMxZC4oGt66/dHz5YhjiQQon5VtiCRqdd1x3DDgtCNIQY6cZFG9kAm8I2+bGUxwAzVgpvljVFXpVWiOtDXDgMwulWKGx0zxnJIg07IWy0MOx9mq2llec02pmksWY7nxYbOEXKwotLjiIjScrXJ9HLmPqVQJWUqaVCmI2VuVhzKkzr7CSnD2eklYDISIWHiMQwO4mkQRNXFKAyLN9Lcr6Gq43NJS9jE3flWL2EwtWZsuDNl8U824wE+BNwOaMAtN/mAYhcPtqUrBoKd3Tjf65M2sp4ZFMIE9qV0xlzA==;
Subject: Re: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
 minimal config
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Apr 03, 2022 at 05:07:48PM +0200, Arnout Vandecappelle wrote:
> =

> =

> On 29/03/2022 22:51, Vincent Stehl=E9 via buildroot wrote:
> > Update the qemu_xtensa_lx60_nommu_defconfig to use the
> > busybox-minimal.config, to make it more consistent with the other no-MMU
> > defconfigs.
> =

>  That's not a valid reason IMHO. We use the minimal busybox for boards th=
at
> are extremely tight on memory - which is often the case for noMMU boards.
> But if we can spare the size, full busybox is a lot more useable.

Hi Arnout,

Thanks for reviewing this patch.

>  I've marked this patch as Rejected in patchwork, but if there's a good
> reason to do this, we can always recover it.

There is another incentive to using the minimal config on no-MMU platforms:=
 it
fixes the udhcpc error and repairs the network initialization.

Just let me know if you want me to reword the commit message to insist more=
 on
this aspect and submit a v2. Or we can abandon it for good if you prefer.

Best regards,
Vincent.

> =

>  Regards,
>  Arnout
> =

> > =

> > After commit 3de486f8b052 ("package/busybox: fix udhcpc options in mini=
mal
> > config"), this has the benefit of fixing the following network
> > initialization failure:
> > =

> >    udhcpc: invalid option -- b
> > =

> > Signed-off-by: Vincent Stehl=E9 <vincent.stehle@laposte.net>
> > Cc: Romain Naour <romain.naour@gmail.com>
> > Cc: Gerome Burlats <gerome.burlats@smile.fr>
> > ---
> >   configs/qemu_xtensa_lx60_nommu_defconfig | 3 +++
> >   1 file changed, 3 insertions(+)
> > =

> > diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xt=
ensa_lx60_nommu_defconfig
> > index c4473fb32a..44fb81bd74 100644
> > --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> > +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> > @@ -7,6 +7,9 @@ BR2_XTENSA_OVERLAY_FILE=3D"https://github.com/jcmvbkbc/=
xtensa-toolchain-build/raw/
> >   BR2_PACKAGE_HOST_ELF2FLT=3Dy
> >   # BR2_USE_MMU is not set
> > +# Use minimal busybox with hush and networking tools
> > +BR2_PACKAGE_BUSYBOX_CONFIG=3D"package/busybox/busybox-minimal.config"
> > +
> >   # System
> >   BR2_SYSTEM_DHCP=3D"eth0"
> >   BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyS0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
