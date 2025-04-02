Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7C7C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 21:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9192240849;
	Wed,  2 Apr 2025 21:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXiE4noVa0f7; Wed,  2 Apr 2025 21:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F8A4085B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F8A4085B;
	Wed,  2 Apr 2025 21:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A53123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAC2181EF3
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRIrxLqce5in for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 21:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6A3381EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A3381EA0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6A3381EA0
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 21:38:40 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:1423:8ecf:8625:fde9])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CE5C6B00571;
 Wed,  2 Apr 2025 23:38:29 +0200 (CEST)
Date: Wed, 2 Apr 2025 23:38:29 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <7yldvqm4njymhjjmxne6xwehkarou7s2qfqtcbcqnm273sscoi@52n4ebzuhkfr>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
 <7rnjce73dhujdnipfea5e2qg7z7g7moczlzbkzsrxzggse2rkb@lpmauc2r4qc6>
 <20250331103956.tdwjd3xl7jaihse7@skbuf>
 <lsefn7ciqjh4vcjresnslswex7o4y67hyewwv324gqkmhaw5tx@s43mnee24je2>
 <20250401081424.hwdxevrzucohq6fw@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250401081424.hwdxevrzucohq6fw@skbuf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743629917;
 bh=R+/WRxE4qJbtuIRRJLfb3sRm7zkFZCy+gn0osOWCqNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NICh4dyxodgX2CyF2yoDqvVJtqQppV2CLGQfhGCWZeM8pUDa/x7Ejx68FuQpg39aM
 tvfgbNIuTSKRuv2zMED6kGTJUDbJjeWZLpr8clDY1pa3CehoiPlDz4sIAsOXc7l2E7
 ycgRkY04CqB5JrKf9Stj4R7fQDhhdxn9n/BDcNRHl7xAzqgN2hVZ8S/bv0H8hWyxm/
 RzaMZRRVFkXL7LFPvieebXSc58Ath1D0Q/4dhrMU3oI9ravGyK3DdQ93rXxafPEsBH
 8XnHAV0JLX0HWT7KWFknEu2ujAfdKtAM5Wmo02QebbxrOFI7HcxqYkP+IgiziRMJZB
 i8ZQ5GIH+CDRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NICh4dyx
Subject: Re: [Buildroot] [PATCH v2 18/18] board/lx2160ardb: new platform
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On Tue, Apr 01, 2025 at 11:14:24AM +0100, Vladimir Oltean wrote:
> On Mon, Mar 31, 2025 at 11:11:41PM +0200, Vincent Jardin wrote:
> > Just because I'd do support an upstream first instead of a NXP first.
> > The purpose of an upstream first is to make sure that any other boards,
> > including RDB, Silicom, etc... are all based on a same build
> > infrastructure instead of a respective "fork".
> 
> But even with downstream components, they still are based on the same
> build infrastructure.
> 
> With the "forks" you get access to more feature-complete DPDK
> networking, thanks to some non-upstreamable components such as
> dpaa2-mac-standalone. The upstream network community favors fast path
> technologies such as XDP more, and does not make it a priority to
> support DPDK. This is just an example which you might care about.

OK, I'll analyze deeper the differences.

> > Of course, I do understand NXP willingness to control theirs, but here
> > it is about Buildroot, not NXP's Flexbuild. I'd like to read the views
> > of Buildroot's maintainers since I am a novice with Buildroot.
> 
> I don't know if I am reading this as intended or not, but you seem to be
> making the undestandable confusion that it is me with an NXP engineer
> hat who insists on using components from LF.
> 
> There has been a disclaimer in the cover letter of this patch set and of
> its previous versions that explains I am not submitting these changes as
> a work duty, but simply to serve my best personal interests on how to
> make the most use of the platform as a simple user.

Yes, I did review and comments based on your cover letter, "personal
contribution".

> The other Layerscape design boards in Buildroot also use LF kernels,
> U-Boot, ATF, and to my knowledge, that didn't happen due to NXP's
> willingness to control the software on their platform either. Non-NXP
> Layerscape boards (arcturus_ucls1012a_defconfig, kontron_smarc_sal28_defconfig)
> use their own versions of these components and don't seem to be hindered
> by the integration choices made for the RDBs.

OK, I have been checking many other boards of buildroot, and yes, I just
noticed that many are using some custom versions.

so, beside 2 minor comments:
  - the cadence DP
  - (maybe, but your arguments make sense) the consutions of console=ttyAMA0,38400n8
    on a 115200 case.

It is ok for me.

Best regards,
  Vincent

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
