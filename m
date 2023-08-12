Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF29C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 13:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E54608D8;
	Sat, 12 Aug 2023 13:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20E54608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ocr5tLOTVyWq; Sat, 12 Aug 2023 13:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E661607DE;
	Sat, 12 Aug 2023 13:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E661607DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EACC1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 13:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 747D1414C2
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 13:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747D1414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEh98bXFsdm8 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 13:33:38 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E23C3410C7
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 13:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E23C3410C7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a00a:6044:1314:a80a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AAC3E19F5B4;
 Sat, 12 Aug 2023 15:33:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 15:33:31 +0200
Date: Sat, 12 Aug 2023 15:33:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230812133331.GK421096@scaer>
References: <20230211163422.25944-1-ps.report@gmx.net>
 <20230811000738.0c613b1e@windsurf>
 <20230811212220.52d4ffb9@gmx.net>
 <20230812002345.660aea04@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812002345.660aea04@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691847214;
 bh=m2pCM759ZxaPfJR0shSt2OEccPHTh5EuNOsHbvjRf7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBM/fWh/1Ch6bErhBIZesUVYRsp4dGYBNAsM6gQD98UAyMtPgjVY6HIpmc0fkXrdh
 uZHZ3pH79G5t39U1woMoiRmWpO0jInFrhU/QXWBB1kJ0Mvj20MaHfqto2sfEAkv0aY
 RdOrsRa5f2T6buosa6oAViz8ssTGq+Y7yRFw5MoCNJhdA6rPUKM/PFC6kRd/xArxoR
 V2ZG4irnbNMTtx9NuGF2ImRgTTFeDAkFpFZF2i1ZD8EPq1p2upUuoKnr1CJ63kAtKw
 Acmh4f4OCc42Up+kfHreCbPdDUCe3x6ct7X0Sn7WGP4hkRF34AR0/wkqb7XSD1sD1A
 GJXhg1OClZy0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LBM/fWh/
Subject: Re: [Buildroot] [PATCH v1] package/fft_eval: new package
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Peter, All,

On 2023-08-12 00:23 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Fri, 11 Aug 2023 21:22:20 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
> > > I've use "make install" instead of doing the manual installation here.  
> > Looks nicer..., but now the variable FFT_EVAL_TARGETS is unused?
> Dammit, indeed. One of us needs to send a follow-up patch :-)

I've pushed a fixup commit, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
