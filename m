Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA70CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 10:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500B084151;
	Tue,  8 Mar 2022 10:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4n8G_65KzsGC; Tue,  8 Mar 2022 10:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D5688414C;
	Tue,  8 Mar 2022 10:28:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5711BF2A1
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 10:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E96E360F3D
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 10:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9RCbCfR9_on for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 10:28:06 +0000 (UTC)
X-Greylist: delayed 20:04:49 by SQLgrey-1.8.0
Received: from 20.mo582.mail-out.ovh.net (20.mo582.mail-out.ovh.net
 [178.32.124.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E2E760F3C
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 10:28:06 +0000 (UTC)
Received: from player697.ha.ovh.net (unknown [10.108.20.202])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 060C323885
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 10:19:48 +0000 (UTC)
Received: from dopsi.ch (unknown [147.87.105.170])
 (Authenticated sender: dopsi@dopsi.ch)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 002942825E307;
 Tue,  8 Mar 2022 10:19:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0061f9bfe07-070d-4e63-821a-01a47100c890,
 CA46441891C01D98DF216A0D4C22AD7CB3D247F3) smtp.auth=dopsi@dopsi.ch
X-OVh-ClientIp: 147.87.105.170
Message-ID: <f4e356e6f59e8746890bbdc07ed684115043e762.camel@dopsi.ch>
From: Simon Doppler <dopsi@dopsi.ch>
To: Danilo <mail@dbrgn.ch>, buildroot@buildroot.org
Date: Tue, 08 Mar 2022 11:19:21 +0100
In-Reply-To: <0e6293a1-fa3e-4399-b963-14634d3578ad@www.fastmail.com>
References: <0e6293a1-fa3e-4399-b963-14634d3578ad@www.fastmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3297760829366581365
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefuihhmohhnucffohhpphhlvghruceoughophhsihesughophhsihdrtghhqeenucggtffrrghtthgvrhhnpeevfefgtdelgeeivdelvdefgeevgfeiveekgeffgfeivdeutdfhueefffegheekgfenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkpheptddrtddrtddrtddpudegjedrkeejrddutdehrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrheileejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepughophhsihesughophhsihdrtghhpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: Re: [Buildroot] Patching buildroot package makefiles with
 BR2_EXTERNAL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Tue, 2022-03-08 at 09:57 +0100, Danilo wrote:
> [ snip ]
> 
> What I need to inject into the makefile, is the following:
> 
>     NGINX_DEPENDENCIES += nginx-rtmp-module
>     NGINX_CONF_OPTS += --add-module=$(NGINX_RTMP_MODULE_DIR)
> 
> Is there a mechanism to do this from outside the Buildroot source? It
> seems
> that BR2_GLOBAL_PATCH_DIR only works for packet sources, but not for
> Buildroot
> makefiles, correct?
> 
> I tried adding the assignments above into the package makefile
> (nginx-rtmp-module.mk), but that doesn't seem to work.

I hit a similar issue last month (see [1]): I needed to add a
dependency (host-stm32wrapper4dbg) to the arm-trusted-firmware from an
external tree but I failed (a temporary workaround for me is to
manually trigger the build of the host-stm32wrapper4dbg dependency then
build the whole system).

I did expect that adding the dependency as you did would work but it
failed: they show up when running `make arm-
trusted-firmware-show-depends` but not in `make arm-trusted-
firmware-show-build-order`. Does the same happen for you?
I confirmed that adding a post-build hook from an external makefile
works fully, only the dependency has issues.

I did start to investigate the issue, but it is currently low on my
priority list since I have an easy workaround for it. I suspect it is
somewhere in the package/pkg-generic.mk file, but I'm not entirely sure
where the issue is.

As far as I know, there is no way to patch the buildroot source, only
downloaded sources can be patched in the build process.

[1]: 
https://lists.buildroot.org/pipermail/buildroot/2022-February/637237.html

Best regards,

Simon Doppler

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
