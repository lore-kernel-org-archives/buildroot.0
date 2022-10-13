Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94298C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 07:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27E37419D0;
	Thu, 13 Oct 2022 07:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27E37419D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id id8sT8wJdDAY; Thu, 13 Oct 2022 07:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F02F5419CC;
	Thu, 13 Oct 2022 07:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F02F5419CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E73F1BF869
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 07:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 696566111C
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 07:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 696566111C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxHGrj6EMvII for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 07:58:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9953161118
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9953161118
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 07:58:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="212015371"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 15:58:00 +0800
IronPort-SDR: FwR5vp1kOgx04NUaAM9FzWfHWRBW+1ODCAEc2V4WuJY3/F+yfE/BDAo3J7Nkz3dItnGDczX7Cb
 amF+re+aS12FpIGcyKenKjP4sad/rbgSkD1gDwDLy8BYbcxGEx0UUJ+AknzqrzW1BxPuc5BELp
 UjJinizFxZuGD/NN+ySLpqRXyNNXOGsKNbobjMYfAGoB48L6fVTTez8IKFhFrxgObVX+x+PS/O
 rut9VojcyKpYiVOrM66bC/3bn8PtsNjmFPnkC8v2qWRljhfppOy95BgxeGxm9en2G50PgIXTao
 QRbSPFJj26sFdvG99Gwjfeb4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 00:12:01 -0700
IronPort-SDR: A+s/QGWhNEABgBuus8cejagoh1XZKydfITQDhaARc+ZLctTrdJRL8hJ1ZiLhYsJtlYfjc/miwO
 pVovAsAgXIMTscMvPDsvKWAddQSbws3N1w5/4cvK3zdENRIv6678hLKCC/GxsQHltvrCdEAOT1
 xs26sucu2MyAkSLYDZqN3nIrqjRBlHWzzOQ99Dzeuhb1phMAu8kzD9QcMgVVhN13IClv7pp5N8
 4vSI7dt5bmsOaPGL/YPIJKQ6hBoVrP/l2C8TpHIDJwcmhkYK2W9j1mCSI+8jGuDv7wGo3zB30q
 sI0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 00:58:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mp2201NPfz1RwqL
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 00:58:00 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Wx4n2D_fr5be for <buildroot@buildroot.org>;
 Thu, 13 Oct 2022 00:57:59 -0700 (PDT)
Received: from [10.89.85.169] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.85.169])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mp21z19x6z1RvLy;
 Thu, 13 Oct 2022 00:57:59 -0700 (PDT)
Message-ID: <aa0c37c9-4a9c-ec68-404e-30c64d4d57c4@opensource.wdc.com>
Date: Thu, 13 Oct 2022 16:57:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221013041616.491620-1-damien.lemoal@opensource.wdc.com>
 <20221013083952.145dbb8f@windsurf>
Organization: Western Digital Research
In-Reply-To: <20221013083952.145dbb8f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665647881; x=1697183881;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UAe/K5/VjhRa+uz3itcNNxmhvArUTGZWGN2VE9XJ7IM=;
 b=JPwscu5UV72zWitVHt7KPirPxtd/UoSH4/rwphTqSXKA5SaOcw9XnezI
 Q5WMAH++SkmIDLQ6oobj8aQMUgG7hhcRViyak0CDZN4NJhntGlSg96OKa
 pgL4+7ctmhC14ZoyaM9+gApt6OegE1bH8DLy5oMe2zLK/7jpxl4NPTn4l
 FVHgEK4f+z2mYsnu/Gq3J2quXDit8mo0PutxJ4ounKnpljaZoP2jzuc1k
 N2laQ3kpk5DcYQIw7vkFis5RN4+eOrSf8VO4fFfIAJF9jmv1salZCG9XX
 svd1hCWU/ArA1BXDXNnr6Q2d6U5Coe5OCdGCGdmKthN5R/HP7EEfDE22D
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665647879; x=1668239880; bh=UAe/K5/VjhRa+uz3itcNNxmhvArUTGZWGN2
 VE9XJ7IM=; b=OxJabzrKcZhRR52BvA4Cq4kgo103YKahfXwDp8srbyVNvR1vyUF
 lSRO1/NcKlHBcx6wfCXtZ5M4WmfJ0yry+w4ICqQLL/Z09JOUp3kdhl1pUekpZEIi
 zmMFfN7ru2TI4bRbf4T0XCV4EYNXU3b+80jggbwXaNG9Iy+bS21X6roGzVWT84YP
 Istsb6kOZlZ8N0lwpJ1arOaGDcANoSoxRi6HUqtLkm5IUSlAhu81VZSgbGTMNQ4m
 X0x9qLeJuJNinlCPfIrztGvCHw9X9XIehVj6Eejd7yiVwwRJxSSWRxABKJsS/B/p
 gBVA/uV7Pzuf2+mLYcuSHgiF7gt2sQTSDkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=JPwscu5U; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=OxJabzrK
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: Re: [Buildroot] [PATCH] configs/sipeed_*_sdcard: Add dependency on
 host-openssl
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022/10/13 15:39, Thomas Petazzoni wrote:
> On Thu, 13 Oct 2022 13:16:16 +0900
> Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
> 
>> Gitlab CI reported build failures for the sipeed RISC-V nommu boards
>> with the u-boot/sdcard enabled default configuration. The compilation
>> errors are related to the openssl/evp.h header file missing, e.g.:
>>
>> In file included from tools/imagetool.h:24,
>>                  from tools/fit_common.c:20:
>> include/image.h:1166:12: fatal error: openssl/evp.h: No such file or
>> directory
>>  1166 | #  include <openssl/evp.h>
>>       |            ^~~~~~~~~~~~~~~
>>
>> Fix this issue by adding BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the config
>> files so that host-openssl gets built as a dependency of U-Boot.
>>
>> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> 
> Thanks for the patch. Could you provide the links to the Gitlab CI
> failures that are being fixed by this, so that we can add them to the
> commit log when applying?

Done. I am not sure about the proper format though. I copied similar references
I saw in git log. Please let me know if this needs a special format.

Thanks !

> 
> Thanks a lot!
> 
> Thomas

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
