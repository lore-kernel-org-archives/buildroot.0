Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30862C48295
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84146067A;
	Fri, 16 Feb 2024 20:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYl6-vzxjlCK; Fri, 16 Feb 2024 20:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B95606AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B95606AE;
	Fri, 16 Feb 2024 20:27:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B20891BF2E4
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F45A606AE
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vB1sYMIbZ9Al for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 20:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 949216067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 949216067A
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 949216067A
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 20:27:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41GK6ZXK082628;
 Fri, 16 Feb 2024 14:06:35 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41GK6ZZG026717
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Feb 2024 14:06:35 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 14:06:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 14:06:35 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41GK6ZVt041968;
 Fri, 16 Feb 2024 14:06:35 -0600
Date: Fri, 16 Feb 2024 14:06:35 -0600
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <20240216200635.crek5j23p3hybg2p@dasso>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708113995;
 bh=J4XYRR0VE8jQic1a7q99jbIKyNwEqkLC5lkPQfvUmTA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GddFH1Q0x3GVNaF16vqld/LkQVaAOi7nRDiicJvfNYgjxGFkCWClbZIGjBc2Zhf6D
 /ZaFjNbssB6s8TtbJYE5P4/iedyGcJkueWESoQi4bTSYGONsuZq4HNZV2XXZra45Qf
 3CgO15Iqs73a54HBP6l51m7YiIOR9GHckPV6xp38=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=GddFH1Q0
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Anand Gadiyar <gadiyar@ti.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 15, 2024 at 11:20:50AM +0100, Alexander Sverdlin wrote:
> Hi Romain,
> =

> On Tue, 2024-02-13 at 18:28 +0100, Romain Naour wrote:
> > -choice
> > -	prompt "Security type"
> > -	help
> > -	=A0 The target SoC security type option for image gen.=A0 Valid
> > -	=A0 options are "gp" for General Purpose devices, "hs-fs" for
> > -	=A0 High Security - Field Securable devices, or "hs" for High
> > -	=A0 Security - Security Enforcing devices.=A0 Note for all High
> > -	=A0 Security device variants the TI_SECURE_DEV_PKG environmental
> > -	=A0 variable must be defined at build time pointing to a valid
> > -	=A0 core-secdev-k3 folder location, otherwise the build will
> > -	=A0 fail, see
> > -	=A0 https://git.ti.com/cgit/security-development-tools/core-secdev-k3
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
> > -	bool "gp"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
> > -	bool "hs-fs"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
> > -	bool "hs"
> > -
> > -endchoice
> =

> another observation I made just now: previously BR2_TARGET_TI_K3_IMAGE_GE=
N_SECTYPE_GP=3Dy
> was the default, which didn't boot on my HS-FS SoC.
> =

> You patchset started out-of-the-box, which, I conclude, means, HS-FS is n=
ow the
> default for AM62x. I'm not sure if this is a problem, though.

HS-FS should be the default for all TI AM6x devices. This is our
"production silicon" and what's used for (almost) all projects,
especially new projects. This being said having support for GP device
variants still is desirable for existing boards/projects, such as the
current BeaglePlay boards (amongst earlier version of TI starter kit
EVMs for AM6x).

--
Andreas Dannenberg
Texas Instruments Inc


> =

> -- =

> Alexander Sverdlin.
> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
