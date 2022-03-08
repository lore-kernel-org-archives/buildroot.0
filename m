Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE6AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 20:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B30F40AC0;
	Tue,  8 Mar 2022 20:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1UHEpLOkC9M; Tue,  8 Mar 2022 20:26:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1408540374;
	Tue,  8 Mar 2022 20:26:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF0521BF86C
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9C28411B
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLyCctHtDZwQ for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 20:26:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CEE884115
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646771203;
 bh=zlHhGrphLe0xAcbzjiK90wjujffXM9z1cCKxTON7hfI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KQsGVwtKTNJJVEzaIJqNeM+hftH5xJqeQOFxF30aJRTPh4WzZ3mNTpECwcNkBpuE0
 ztmLDcN1RpquhbNPWoeMygBjDYHPTJ81FonURUowgyHBxirHHizB3wgJzR+1euxGve
 zR/LXjmt8N9E/zn4xrUtP/Q3nd0oUKF4ZrNqYyWE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.213]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUUw-1nxNcM4BmG-00pv7g; Tue, 08
 Mar 2022 21:26:43 +0100
Date: Tue, 8 Mar 2022 21:26:41 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Sassen, Rutger" <rsassen@comecer.com>
Message-ID: <20220308212641.15b03b75@gmx.net>
In-Reply-To: <YQXPR01MB61219F7B0E78D6C785ABB816AE099@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
References: <YQXPR01MB61219F7B0E78D6C785ABB816AE099@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:z0RaAZrGOa0qd3Bct7acPCYWWtUKGc/6C7MyL0Vy+zaHaOwHOPv
 h4OvEnZB9E+jDtYChGzA4vKo1SsGCKxWQNLLV1+CJeo0NuBqrYEW9PGe5j3MtryAz55pTVg
 ZthWV0S2RTv1Owt4Vc1s1j1XILkbrCIXctqbdNqa1yoF5cR9In9xFjuURS8gZDGV52icygo
 mDf0zHt5pyQy+uv6RthqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zPaLW12PLlM=:dFvNlue22ee0Ge3/wD4g3x
 lxYTZhd5fmLaU8+tcCpb9C93ZgxXtIaapJCta/kjGL1mqnveLF8nxCGTdcjMRr4YEE5N6Muj8
 5wJTOqjZNFHi6Inw0BtY1PKyihXHGWyznW+iay2NBO2jgBGSulJzaG5qeyM43NboFt4jkN6/E
 sXYQDTGA3RZN99GNGoLNDIf7+V33ov47x+fW8yvnLjM9MawIQLHgXukyG46ieA65kzJw9tMW1
 Tj8E49t8nlPEeR+GAQ9B/hvSmBn7GI+jxAkr24ToZwdRJfKcbZFXU5Wcz88cPrE4+EodgUQFY
 EYf3rb1Mva568Wlrcvyr9Li3GkMVSYeN7r2VM2Hicu3IpKYKbuf70VKu28DcsqNzi9rQWX+U7
 WgZtObIYeqKfXxYtFgqxnySf0igIT0Cu3HqNXivzToV+bC81YRnTxck/C3OVmXhw7nBlPZ6xE
 Ueyyiumb5saxj09xp/sN3EaLgV1LB6Fp7bGpWLiHA822KpsaXod9B1LAA85FB4cJuBfj+QS3s
 eKnL4X3srfOR3ZYwb2gOuHCghrnmjq5s82qHUDj+TX1pQkD197Z+5NUHqeHVu9yqdmELj5+MU
 yUXDU9keVGC92tzBEnEMib1b40E5xt/Wu+jhjoR787hHBFhF1kXTgeluo+2VUzl8zW3geSJIS
 vtK/jePEqOYmH203wp0i0il/nLJ6qEExP9jP1uNdJPBFfjPLG1iv6iPaCeEbKzBCvk7C1ixZp
 T9bVPWwzvOrd40/RWAMXt5IEsFZW31ujGphm9txaxYT1VI2xam8LYsPqIJ8qtas+Jnn+rlWCH
 TzbWS9mKGv0/0G5cXvhVg/2w/aBFjFw2ntX7H0tUm91+cPlYUx0pdunESiyiJyBZwimEhPYRb
 b4tO6GT7yLppSa9rnnzfJ9cfvPvviyBnZK9C+fgCuF9RfdqbfzMlNw8grBVfaZjoqjk0wEIkO
 YPhmVBpwBd0Pj5RIEsD0hysMt8bIx7lpmGNZhYnsqwn/O2Sy9cvkpXToIhttSAfSGZS/ip84W
 9xzci0QoqWlNwEdm2LdTlVEOQve43PtFKK7ehnMBFFP+yBPRcFVv2gzAQeqf7X5ksmWFSExJ1
 y6kJostNWFTwDE=
Subject: Re: [Buildroot] [PATCH 0/1] package/rpi-firmware: fix missing files
 in overlays
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rutger,

On Tue, 8 Mar 2022 12:39:51 +0000, "Sassen, Rutger" <rsassen@comecer.com> wrote:

> First of all, this is my first patch I submit for buildroot, or for
> any git project for that matter, so please forgive me if it is not in
> the expected format.

No problem, every patch (or hint about bugs/missing features) welcome...

>
> This patch fixes some files not being copied from the rpi-firmware
> boot/overlays directory. I suspect it could also be backported to older
> still supported branches, but from the documentation I'm not quite sure
> how to specify this in the patch submission, since the package has been
> bumped to newer versions in the mean time.

Should be no problem as the mentioned overlay_map.dtb file should be
already available in the older rpi-firmware releases (since April 2020)...

>
> Also, git stripped the leading TAB character from the changed line in
> the diff. I'm hesitant to manually edit this, since I'm not sure if this
> is intended behavior.

This should not happen, are you sure the tab is committed?

>
> Rutger Sassen (1):
>   package/rpi-firmware: fix missing files in overlays
>
>  package/rpi-firmware/rpi-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.20.1
>
> This email communication is CONFIDENTIAL. If you are not the intended recipient, you may not use, copy or disclose to anyone
> the message or any information contained in the message and I ask that you please notify me by return email and delete this
> communication immediately. Thank you.

According to the email footer I could not look further at your provided patch ;-)

Please try to re-send without it....

More comments in replay to your patch...

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
