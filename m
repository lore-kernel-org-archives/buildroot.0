Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD22CC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 21:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CCB141A5A;
	Thu, 18 Aug 2022 21:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CCB141A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7kBHZ7NvsxO; Thu, 18 Aug 2022 21:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6A2419C5;
	Thu, 18 Aug 2022 21:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C6A2419C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C78FC1BF9B4
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1A5183E7B
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A5183E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PChpbB21xh5u for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 21:50:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08EC783E63
Received: from smtpcmd15186.aruba.it (smtpcmd15186.aruba.it [62.149.156.186])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08EC783E63
 for <buildroot@busybox.net>; Thu, 18 Aug 2022 21:50:53 +0000 (UTC)
Received: from [192.168.8.175] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OnPeoXShazxgcOnPfoyfxr; Thu, 18 Aug 2022 23:50:51 +0200
Message-ID: <1da82f84-42e7-37af-d87d-3dfb27382060@benettiengineering.com>
Date: Thu, 18 Aug 2022 23:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220816175503.1280276-1-francois.perrad@gadz.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220816175503.1280276-1-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfN1znaesdN7Hg131rTBELxwgbnKSDixLSIL11FoYfNHp+KeE2866EWH6Zm8F3R2VL6dU91U2ZI63enjA0J2EgiBkEfVpnaRT/sts6IIoIyIO9F7pSHVY
 RyXmM/93ttbksjeSVSbFrOI7bJkHozIaYgFaoZwhQJqYod4V4ro9GyACNIVvO5droCl9Bl8Fj0lMakF1zDi6VND/0owgaOzBCqqNF9euWg2Zx+X70vrMaXII
 3GIdu62IPIad3gCqH5dh9g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660859451; bh=8RJfAOwQcNEVYUHUk5fz3YephWZBw8CHvMpBsvHCPAE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=XnZvbdCKT+Sl615mAS32lhnmLhskP+XzMrg79wdV1Q4OeC+zH9OluL+Yn4FmIb+T1
 sO8HyB28tRRPsZBvFkdtmBPlbvv460sWdka/8j2gtA9if8KfGs+b1q2yOwaOtAzxQ/
 iAR9O/wKRucCW8qWsHBhLyAwanQZESatedS96WfbkHDdYRuETwqMYc+d75P7pUloET
 lqUWkPG21Pu9iPMG29iqWmSsnx18dmIcqP1hz4Zve6FHFunc/8HP6A5DqcUBqap/rm
 2P08aRbBR5JBINerKGumVRelGS7XyaRmjIjZBdgmJwWDGsYSHCojBDtz+lYHKzwRXm
 SQ3cMZN62gdSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XnZvbdCK
Subject: Re: [Buildroot] [PATCH v4 0/2] new board LS1028ARDB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

remember to set as "Superseded" the v3 patchset in Patchwork:
https://patchwork.ozlabs.org/project/buildroot/list/

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 16/08/22 19:55, Francois Perrad wrote:
> This serie introduces a new board.
> 
> The first commit tweak an existing module,
> and the second commit introduces the new board.
> 
> v3 --> v4
> - remove qoriq-cadence-dp-firmware part
> - use imx_v8_defconfig from LSDK instead of arm64 default
> 
> v2 --> v3
> - restore my SoB
> - add Reviewed-by Giulio Benetti
> 
> v1 --> v2
> - add missing udev rules
> - improved commit messages
> - tweak readme.txt
>    - of=/dev/sdX
> - minor cleanup in defconfig
>    - BR2_TOOLCHAIN_BUILDROOT_GLIBC becomes BR2_TOOLCHAIN_BUILDROOT_WCHAR
>    - BR2_PACKAGE_BUSYBOX_SHOW_OTHERS removed
> 
> Francois Perrad (2):
>    boot/arm-trusted-firmware: allow to generate BL2 from RCW
>    board/freescale/ls1028ardb: new board
> 
>   DEVELOPERS                                    |  2 +
>   board/freescale/ls1028ardb/genimage.cfg       | 23 +++++++
>   board/freescale/ls1028ardb/readme.txt         | 60 +++++++++++++++++++
>   .../boot/extlinux/extlinux.conf               |  4 ++
>   .../rules.d/73-fsl-enetc-networking.rules     | 16 +++++
>   boot/arm-trusted-firmware/Config.in           |  6 ++
>   .../arm-trusted-firmware.mk                   |  6 ++
>   configs/ls1028ardb_defconfig                  | 57 ++++++++++++++++++
>   8 files changed, 174 insertions(+)
>   create mode 100644 board/freescale/ls1028ardb/genimage.cfg
>   create mode 100644 board/freescale/ls1028ardb/readme.txt
>   create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
>   create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules
>   create mode 100644 configs/ls1028ardb_defconfig
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
