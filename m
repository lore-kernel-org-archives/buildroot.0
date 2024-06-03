Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CC6C41513
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E2B605E1;
	Mon,  3 Jun 2024 07:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4qdKeShw3fp; Mon,  3 Jun 2024 07:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B0760663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B0760663;
	Mon,  3 Jun 2024 07:37:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41A421BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D6C640508
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSnlm8ryCNGA for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.209.10.33;
 helo=libero.it; envelope-from=dariobin@libero.it; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 673D640362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 673D640362
Received: from libero.it (smtp-33.italiaonline.it [213.209.10.33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 673D640362
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:37:44 +0000 (UTC)
Received: from oxapps-12-070.iol.local ([10.101.8.80])
 by smtp-33.iol.local with ESMTPA
 id E28GsRiTto6ZQE28Gsz209; Mon, 03 Jun 2024 09:29:28 +0200
x-libjamoibt: 1601
X-CNFS-Analysis: v=2.4 cv=Qr2V3kyd c=1 sm=1 tr=0 ts=665d70d8 cx=a_exe
 a=INVnJeSsuNg8HEc+evQ4ig==:117 a=7FGnZS6rfqEA:10 a=IkcTkHD0fZMA:10
 a=pADFtF_7AAAA:8 a=3HDBlxybAAAA:8 a=iP-xVBlJAAAA:8 a=nncghkLd90JUyihs9NAA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=SIJ3zCUs7LZk56CadGmo:22 a=-mK4jGaHXJwEiCVHQkBg:22 a=laEoCiVfU_Unz3mSdgXN:22
 a=lHLH-nfn2y1bM_0xSXwp:22
Date: Mon, 3 Jun 2024 09:29:28 +0200 (CEST)
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Message-ID: <1695303387.8057.1717399768570@mail1.libero.it>
In-Reply-To: <20240603071726.532652-7-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
 <20240603071726.532652-7-peter@korsgaard.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev61
X-Originating-IP: 2.196.43.202
X-Originating-Client: open-xchange-appsuite
x-libjamsun: YxxfOZ9Bhj0ran0XYrGUy6TLZjcDcYyz
x-libjamv: RUXqiNbuIxs=
X-CMAE-Envelope: MS4xfBjtW+vj6fnDiRFVU8oI4wZMDhbrvuUDL2psK1eNY8a6DFRl6ivCnJpLZBrwqhfAh3UVTyw93/MDhjnlhrZY++JvoohzMbxUaJrapNH6LJpe48gg5qU3
 ZKKAqMP3rqajBblLYDkypoq8Mo4N7OXi7ZsE3xHsWJRb9b7JnyEYOuapWO5uY/lV56Naxw2UsbtDbvIxoHOfgX2mdmLRmVI7Mw5SevNTHU1OQsGl+/PaBuwY
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=libero.it; s=s2021; 
 t=1717399768; bh=vD8tjBpr8+A2qVxXDMdMIPDgXSl01k63dJ8MTt7tsxI=;
 h=From;
 b=r0/90EohEA2zPMySG4WxDNWLnDxtzFdf6X5DySOmNf61Ll4qwimqTO1os4XMmuI2M
 82+VYiuAqtYUPMLEcSkIHZmhEnXeiVYuAGSA69XyfCWXoHwRdNrUB1oZvtPDUYSMPc
 Ajt+Sj4e/01nh0HATdHSM+k7xU//OoGjoQ4WkgfiIyiEbHg5WfLVaTN9kLBd8q1Ric
 xBL1SusFaVR5GpPt8ekmBWB9x84y/sXT0RQMREvi5Xp+E1+WyM9wcDElilpqIMTCCE
 nknZioIz28t2et24dVakhA1Ve10TLiWMe3WJQpDht3bdxKvlvJiVlukJPysbUZhBH2
 zEPbvTFUR+fgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=libero.it
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=libero.it header.i=@libero.it header.a=rsa-sha256
 header.s=s2021 header.b=r0/90Eoh
Subject: Re: [Buildroot] [PATCH 07/23] package/libmnl: use upstream sha256sum
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: dariobin@libero.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Il 03/06/2024 09:17 CEST Peter Korsgaard <peter@korsgaard.com> ha scritto:
> 
>  
> ftp.netfilter.org no longer provides ftp, so use the https:// url from
> _SITE.
> 
> This provides a .sha256sum but NOT md5/sha1, so update the .hash file to
> match.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libmnl/libmnl.hash | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
> index 4b592333cb..e2db46f03b 100644
> --- a/package/libmnl/libmnl.hash
> +++ b/package/libmnl/libmnl.hash
> @@ -1,7 +1,5 @@
> -# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.{md5sum,sha1sum}
> -md5  0bbb70573119ec5d49435114583e7a49  libmnl-1.0.5.tar.bz2
> -sha1  63c6456b77f7978a7b37e62c1b38346b2ef2d91c  libmnl-1.0.5.tar.bz2
> +# From https://netfilter.org/projects/libmnl/files/libmnl-1.0.5.tar.bz2.sha256sum
> +sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
>  
>  # Locally calculated
> -sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> -- 
> 2.39.2

Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thanks and regards,
Dario
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
