Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA15C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45BD340B57;
	Tue,  3 May 2022 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOMYbwIA64sK; Tue,  3 May 2022 21:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CD7640B4D;
	Tue,  3 May 2022 21:00:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE1141BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAC5D61017
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 21:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28Hhj8YPWdjp for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 21:00:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B06F60FF6
 for <buildroot@buildroot.org>; Tue,  3 May 2022 21:00:13 +0000 (UTC)
Received: from [77.244.183.192] (port=62394 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nlzcx-000AeT-Ad; Tue, 03 May 2022 23:00:11 +0200
Message-ID: <dab01e63-1617-e93c-3e39-1834df2ef008@lucaceresoli.net>
Date: Tue, 3 May 2022 23:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: it-IT
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220502084506.4054715-1-neal.frager@amd.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220502084506.4054715-1-neal.frager@amd.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2022.1
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
Cc: giulio.benetti@benettiengineering.com, ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 02/05/22 10:45, Neal Frager wrote:
> This patch bumps configs/zynq_zc706_defconfig to Xilinx software release 2022.1
> which includes the following updates:
>   - U-Boot bumped to 2022.01
>   - Linux bumped to 5.15.19
>   - rootfs changed from CPIO to EXT4
>   - extlinux.conf for distro boot support
>   - U-Boot migrated from git clone to tarball for faster builds
> 
> This patch has been build and run tested on a ZC706 evaluation board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynq/extlinux.conf        |  4 ++++
>  board/zynq/genimage.cfg         | 11 ++++++++---
>  board/zynq/post-build.sh        |  8 ++++++++
>  board/zynq/post-image.sh        |  6 ++++--
>  board/zynq/zc706/uboot.fragment |  1 +
>  configs/zynq_zc706_defconfig    | 20 ++++++++++----------

Most of these changes affect all the zynq boards, but the defconfigs for
three of them are in separate patches. If we want commits to be atomic
(read: bisectable) these should be suqashed into a single commit.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
