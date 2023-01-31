Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B49C38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 17:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C155760C15;
	Tue, 31 Jan 2023 17:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C155760C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drYIt2SHi76e; Tue, 31 Jan 2023 17:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEAF560C0B;
	Tue, 31 Jan 2023 17:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEAF560C0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2A31BF314
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 17:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D3DA81358
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 17:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D3DA81358
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nvt99C0q3guL for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 17:26:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8D6781329
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8D6781329
 for <buildroot@uclibc.org>; Tue, 31 Jan 2023 17:26:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.226]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0G1d-1oTANE3Rtn-00xHzp; Tue, 31
 Jan 2023 18:26:15 +0100
Date: Tue, 31 Jan 2023 18:26:14 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230131182614.163620c1@gmx.net>
In-Reply-To: <pan$f3553$692b21af$5c871432$524c2ffc@ID-313208.user.individual.net>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-4-bernd.kuhls@t-online.de>
 <20230130221514.2d58df14__31334.1615417571$1675113344$gmane$org@windsurf>
 <pan$f3553$692b21af$5c871432$524c2ffc@ID-313208.user.individual.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:w7xtMtMjhngLjfCJ+ypiRbEBRee9TebLC9ZR2fm02TM6AIpxDUm
 BoCy59oAoAPYIZrdci0nyTBQOUBZqWUuRJGWBI3CybbL1lsiSYfCkSpSmiIIvjdVdMZn5TD
 ytG8+WQJ2LbfjMxSK1E9KBr92FdMt/GFSg2Dez7l3g0qTcMZB+spR1pSxN0hkNYmtRlEW+N
 n+j44OJpbgEQIpZyzZHaw==
UI-OutboundReport: notjunk:1;M01:P0:le5lc+OVOOs=;ilx8VmdnAWLXZajD2ybW5r9mKgA
 IETx1m3jYm+dCv7MgE+lAALTFvDkQonZd2zqhgRdfvIuS7aid7HLgWSaZ41mH+hVDTcOhZYmy
 XqxTqjHJTDfyB5ZReMjtoprAfn92h9UoppB+efSq7HwPbG15dOMD2iwN3GWGLmSI94RdNjw15
 91hUbqLEn85bOhxCalg6t5fmo1z18STLyzL0SIfe+PhmIFJJk2LNtI1QvIgsYcF746Z3932u3
 MK6O1vYmT43FYLGxrTWBGdyJG2BUmwtgk8H0h796Kbfd0r1UmWMFeA6KyS6K2K87pWtMy2pJr
 VUFwtkXW9DdyRBQnb9+rGVqhpeSg5QwJyVi3ME5sBzBO4ZifX2VxrC05NAEupl3/B2HBuL7z1
 Y8JrjmogDTolNu+HjFSdP18cwaHjoAGLzzr8Db4U2Uj+tKuZEcIx/msfoqqOgpSIh4Oc4z9hG
 CEGR1BPNEqCjMswbnxZuFBzA8NYRW7uVpW9JogivOhd3cSZeoE249Zc5rIyQoMurP1eOPtGwc
 0I5+TAJ5RSJRLPZIw058nTwTGZ65CNDMoQ5T7+XX0y0jGdIIQqRW91S1i0CpW6MJ4Ied2a9mr
 lt0dIsSy2qVfyLrhTGH/6n+ECRD1YU53jGs+UOinPhEXy6EiWIaVSZ9awwbrNTTzNZadRLtoB
 /0NQ20nU2xavHkwPLys9HaqkW/ljQr2Z3Z9tGpxTvZQj9JMc2Cp5OEiMP3V68+6hJXgwQxI7O
 BLq8ghYbS1kFZkKZSPorQjFQtsgEIiwozcBO1cxsnGGEum0iqT9kWHt/PXepVN095KB9oqYGa
 mTsgoX2EHqBzgaonECKFSYBQj7xNMeINKhIpMXxAk47ZlzHcqJIFXrLro+vMo7b5ouJc1Uy9f
 dLcmytiQ4kndJXWpaIvnuImR5dDGfXKfm2mmDGKV21yLRmIv0USlgGerLkCtLBqKu88/MEcz2
 MoPYuMbPj0VD9RAQjlmSEgvP7js=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1675185976; bh=+BEobPWi006LNgmQSUmaKf9psPUzXOS/GhHKiyaHiHY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dEC8vpKbdxIZ4FaGd/4St9kqfCcOZgotzYtWU561b+Gdq2Y16xIvfhrUA14evXTMb
 bpl3eSEJJAwIm5YRjMFdfvpBvUERWJZUhkqBKEiartfwAXvSBp62ixw6/96hEZFy+Y
 tvNbgcZiwmAtS7iJ5PnVjJbz1+le+vk+EsiEHH+rc8zEwW4mRsqiC/MGx/N2PUKUzj
 /zrhjKmq/if6mOPBbS/v9lk8DCoci6nursv44wDzIQ1mLKkPmnPEVbPGNZdlBOcyBB
 Rzx+H6yHWegqOU8ElgdJ0Incd33ryIQVUKi4i0nXWchQQc8l6/bayvDkn+AyLvHf3f
 YRtxToFXsVxKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dEC8vpKb
Subject: Re: [Buildroot] [PATCH 4/5] package/intel-mediadriver: bump version
 to 23.1.0
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Mon, 30 Jan 2023 23:00:15 +0100, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Am Mon, 30 Jan 2023 22:15:14 +0100 schrieb Thomas Petazzoni via buildroot:
>
> > Here as well, I'm getting a different hash. Did github change something?
>
> Hi Thomas,
>
> see https://github.com/keybase/client/issues/10800#issuecomment-375831096
> and the following discussion :(

And https://github.blog/changelog/2023-01-30-git-archive-checksums-may-change/

Regards,
Peter


>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
