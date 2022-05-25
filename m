Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF09DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72A3740FEA;
	Wed, 25 May 2022 13:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHh7E5FKNdT1; Wed, 25 May 2022 13:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F2EE40A88;
	Wed, 25 May 2022 13:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 005BB1BF2F5
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F10B540A88
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwjzrZWy_MFv for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:59:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1191A4014B
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:59:28 +0000 (UTC)
Received: from [77.244.183.192] (port=63510 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1ntrXp-000Chc-L3; Wed, 25 May 2022 15:59:25 +0200
Message-ID: <b0d64e2e-f316-d98b-8374-b98e0eb8ff66@lucaceresoli.net>
Date: Wed, 25 May 2022 15:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Neal Frager <neal.frager@amd.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
 <20220525085717.GC301044@scaer>
 <1325638a-c5a9-3795-d282-c0a6accee081@lucaceresoli.net>
 <SJ0PR02MB7758166614E50F1528FADE3BD7D69@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB7758166614E50F1528FADE3BD7D69@SJ0PR02MB7758.namprd02.prod.outlook.com>
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
Subject: Re: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 25/05/22 15:33, Neal Frager wrote:
> Hi Luca,
> 
>>     FILE="${BOARD_DIR}/extlinux.conf"
>>     if test -f "$FILE"; then
>>         install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
> 
>> Right, but use "${FILE}" after -D.
> 
> I just want to make sure I am not missing something.  I have changed the script to the following:
> 
> if test -f "${FILE}"; then
>          install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
> 
> Is there another -D I need to add somewhere?

I didn't explain clearly, sorry. What I mean is quite trivial: you can
simplify this:

  install -m 0644 -D "${BOARD_DIR}/extlinux.conf" ...

with this:

  install -m 0644 -D "${FILE}" ...

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
