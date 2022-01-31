Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C40C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 21:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A822A81C40;
	Mon, 31 Jan 2022 21:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XxJ_l0msV13; Mon, 31 Jan 2022 21:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D865381BC2;
	Mon, 31 Jan 2022 21:31:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1141BF362
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 649AF60AA0
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id em65u9O7QUQB for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 21:31:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 339E4607EC
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:31:45 +0000 (UTC)
Received: from [77.244.183.192] (port=63298 helo=[192.168.178.42])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nEeH1-000GSy-61; Mon, 31 Jan 2022 22:31:43 +0100
Message-ID: <a96ef331-fa93-2014-09e6-cf311d5f090b@lucaceresoli.net>
Date: Mon, 31 Jan 2022 22:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <SJ0PR02MB775858FF54330E5040E95E32D7259@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB775858FF54330E5040E95E32D7259@SJ0PR02MB7758.namprd02.prod.outlook.com>
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
Subject: Re: [Buildroot] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to
 Xilinx 2021.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 31/01/22 18:30, Neal Frager wrote:
> Changes included with this patch:
> 1. Removing ATF and U-Boot patches which are no longer necessary since they are in mainline.
> 2. Using Xilinx github for ATF, U-Boot and Linux as there are updates which may not yet be in mainline.
> 3. Adding a zynqmp_zcu102_defconfig.
> 
> Signed-off-by: Neal Frager <nealf@xilinx.com>

Thank you for your contribution. I appreciate it very much!

Please don't point to my luca/next branch for the pmufw download URL,
but use the tag I pushed to master a few hours ago. This is the URL:

https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin

More comments will be made easier after you send the patch inline as
Giulio already asked.

> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.

This sort of message is generally considered incompatible with
submission to open source projects, and in some mailing lists is causes
messages to be deleted and ignored. Maybe the Buildroot community is not
so picky, but it would be nice if you could remove it.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
