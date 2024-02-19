Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F30C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 19:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F0AD40B6C;
	Mon, 19 Feb 2024 19:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAhKZPdGM--T; Mon, 19 Feb 2024 19:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC3F40199
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABC3F40199;
	Mon, 19 Feb 2024 19:42:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92AC31BF342
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F2EA60762
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ry1Ozn4ikUqd for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 19:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2331860753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2331860753
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2331860753
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 19:42:08 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41JJg72v118917;
 Mon, 19 Feb 2024 13:42:07 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41JJg7RU000735
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Feb 2024 13:42:07 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 13:42:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 13:42:07 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41JJg7QY081603;
 Mon, 19 Feb 2024 13:42:07 -0600
Date: Mon, 19 Feb 2024 13:42:07 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240219194207.pfonekdap7jagk3d@dasso>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
 <20240216200635.crek5j23p3hybg2p@dasso>
 <b3065644-f654-49fc-9560-31caa0beffbe@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3065644-f654-49fc-9560-31caa0beffbe@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708371727;
 bh=CfQ38SlvtA7QOQcmZ5+SROQe9h8a7aIcVxrApyQFZqE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=O8RQpfHS+47rDGELWQuLGzdt1B1qKdGZGHRbM8f2864mOU6nPKHJY4sAvzARe6WGw
 zCVKE3RfCxnTH2InSOZ/zxDhcRTkECw6FdX11jjl/AYmZmDJmcWYHkux21pUrpI9jB
 /ktVwqJPwHyN+L1CWGx+zTfiXSaUQLGdBQOCt8VA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=O8RQpfHS
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

On Fri, Feb 16, 2024 at 10:38:42PM +0100, Romain Naour wrote:
> Hello Andreas,
> =

> Le 16/02/2024 =E0 21:06, Andreas Dannenberg a =E9crit=A0:
> > On Thu, Feb 15, 2024 at 11:20:50AM +0100, Alexander Sverdlin wrote:
> >> Hi Romain,
> >>
> >> On Tue, 2024-02-13 at 18:28 +0100, Romain Naour wrote:
> >>> -choice
> >>> -	prompt "Security type"
> >>> -	help
> >>> -	=A0 The target SoC security type option for image gen.=A0 Valid
> >>> -	=A0 options are "gp" for General Purpose devices, "hs-fs" for
> >>> -	=A0 High Security - Field Securable devices, or "hs" for High
> >>> -	=A0 Security - Security Enforcing devices.=A0 Note for all High
> >>> -	=A0 Security device variants the TI_SECURE_DEV_PKG environmental
> >>> -	=A0 variable must be defined at build time pointing to a valid
> >>> -	=A0 core-secdev-k3 folder location, otherwise the build will
> >>> -	=A0 fail, see
> >>> -	=A0 https://git.ti.com/cgit/security-development-tools/core-secdev-=
k3
> >>> -
> >>> -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
> >>> -	bool "gp"
> >>> -
> >>> -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
> >>> -	bool "hs-fs"
> >>> -
> >>> -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
> >>> -	bool "hs"
> >>> -
> >>> -endchoice
> >>
> >> another observation I made just now: previously BR2_TARGET_TI_K3_IMAGE=
_GEN_SECTYPE_GP=3Dy
> >> was the default, which didn't boot on my HS-FS SoC.
> >>
> >> You patchset started out-of-the-box, which, I conclude, means, HS-FS i=
s now the
> >> default for AM62x. I'm not sure if this is a problem, though.
> > =

> > HS-FS should be the default for all TI AM6x devices. This is our
> > "production silicon" and what's used for (almost) all projects,
> > especially new projects. This being said having support for GP device
> > variants still is desirable for existing boards/projects, such as the
> > current BeaglePlay boards (amongst earlier version of TI starter kit
> > EVMs for AM6x).
> =

> Thank you, I was not aware of this.
> =

> I found your post in the TI forum about the recent switch from GP to HS-FS
> device in Yocto [1].
> =

> Currently existing am64/am62 defconfigs are still targeting GP devices bu=
t we
> should add additional commits to do the switch to HS-FS.
> =

> What about other SoC of the K3 architecture?
> Is the DRA829/J721e device will also switch to HS-FS by default?

I needed to double-check with the team, since I'm only intimately
involved with AM62/AM64/AM65 type devices. All the others are managed by
a different group in TI.

So based on what I found out here's the full context accross TI's K3
platform of devices and their associated TI EVMs / Starter Kits:

* All "Sitara"-brand SoCs (AM62x, AM64, AM65x) are HS-FS first
* All "Jacinto"-brand industrial SoCs (AM68, AM69 and AM67) are also HS-FS =
first
* All new "Jacinto"-brand automotive/other SoCs (J7AEN onwards) are HS-FS f=
irst
* All existing "Jacinto"-brand SoCs (TDA4, J721E, J7200, J721S2 and J784S4)=
 are GP by default

So while there are still boards out there with GP silicon (last bullet)
those are probably not the typical target platforms for Buildroot, being
very complex and high-end multi-core SoCs, mostly used in automotive
applications. The one exception here that has more weight in my oppinion
is the current BeaglePlay board (AM62x-based), those also have GP devices
on those boards.

All this being being said, I stand by my previous comment that HS-FS
should be the default. As for the BeaglePlay board (which is a very nice
community board) and potentially selected Jacinto-based boards this
could potentially be handled with a dedicated defconfig or some other
Kconfig magic to enable a seamless and easy out of box experience.


--
Andreas Dannenberg
Texas Instruments Inc







> =

> From the u-boot k3 documentation, it's not clear witch device type is use=
d by
> default across all k3 SoC. By default I was expecting the GP type for all=
 the k3
> family (I was wrong).
> =

> [1]
> https://e2e.ti.com/support/processors-group/processors/f/processors-forum=
/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-=
mmc-sd-card-images-using-sdk-v8-6-and-yocto
> =

> [2]
> https://source.denx.de/u-boot/u-boot/-/blob/master/doc/board/ti/k3.rst?re=
f_type=3Dheads&plain=3D1#L108
> =

> Best regards,
> Romain
> =

> > =

> > --
> > Andreas Dannenberg
> > Texas Instruments Inc
> > =

> > =

> >>
> >> -- =

> >> Alexander Sverdlin.
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
