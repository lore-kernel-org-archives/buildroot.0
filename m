Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904C1C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 22:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57A3640B80;
	Tue, 19 Mar 2024 22:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DXDRZsQfs_v; Tue, 19 Mar 2024 22:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 418704144E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 418704144E;
	Tue, 19 Mar 2024 22:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70ABA1BF28F
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AE4681F60
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyCamngEVCYo for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 22:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 221FE81F59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221FE81F59
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 221FE81F59
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 22:09:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AB2B713F8A2;
 Tue, 19 Mar 2024 23:09:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 23:09:32 +0100
Date: Tue, 19 Mar 2024 23:09:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZfoNHD-DlqkkYCRh@landeda>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710886186;
 bh=bUsq26E85d95wTENmIc7eECWskDk/4pZhLczfXKIgFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JQ+RtgyBSOe0mGGoPfiYeTNl6DOuPkXqjaiWr0+e+NGV/kKfx2EHO+MdDNu3yN2FY
 aBENFnKz7IApU/u+vBwttVCME2o44pigqwc6k/A4Pff/sId1RE5JpclJCEqk/FeVRq
 ZiklUb8m87hu6KV9fsugMUqNEMdmjEqTClYyYfxyJMP9BW3pMIq5f8jjwm2751Nb0O
 RNkce4c7B1rD4WHD3JMgL+nPEq3gVh7XxOxEQ9aZdLMs0LG5GZbyeB1FXPe4ilI1+G
 iJrGrWraJrIwarTOigKS1U4rJEzsTJum5cGSI/LQk5TS2oXJNWsEbqSr9M0kfgBmRt
 718yG2oIyKL7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JQ+RtgyB
Subject: Re: [Buildroot] [PATCH v9 05/22] boot/ti-k3-r5-loader: bump to
 version 2024.01
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-03-04 16:32 +0100, Dario Binacchi spake thusly:
> All in-tree configs with the ti-k3-r5 bootloader use a custom version,
> so this patch is mostly for the menuconfig default version
> 
> Suggested-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[--SNIP--]
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> index c5d1cb8e09f0..fbe5d215409d 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2

Removing this hash means that defconfigs that still reference the
2022.10 version, no longer have a hash to validate the download against,
which make it susceptible to CVE-2023-43608 [0] [1].

That was already the case for the two ti-am6?x defconfig in the the two
previous patches, as they already used a custom kernel, a custm ATF, a
custom u-boot: the hashes can't be checked for those versions, so the
two ti am?x defconfigs already hit CVE-2023-43608.

We already fixed another defconfig for a similar issue, see commit
9ebbfeff387 (configs/rock5b: add hash for custom kernel).

Could you look into doing the same for those to TI am6?x defconfig,
please?

In the meantime, I kept the hash for 2022.10 for ti-k3-r5-loader
(really, for uboot), to abvoid the issue at least for ti-k3-r5-loader.

Speaking of that, by the way, ti-k3-r5-loader really is uboot, so I
think that it should share:

 1. the same DL_DIR:   TI_K3_R5_LOADER_DL_SUBDIR = uboot

 2. the same hash file:  have ti-k3-r5-loader.hash be a symlink to
    uboot.hash  (and have a xomment at the top of that hash file that it
    is shared and that old hashes should/can be kept)

Do you think that makes sense? If so, would you like to look into it?

[0] https://cve.mitre.org/cgi-bin/cvename.cgi?name=2023-43608
[1] https://talosintelligence.com/vulnerability_reports/TALOS-2023-1844

Regards,
Yann E. MORIN.

> +sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
