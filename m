Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104AAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 11:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86276408F3;
	Tue,  8 Feb 2022 11:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eXLpbKP0lpO; Tue,  8 Feb 2022 11:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41B8408BF;
	Tue,  8 Feb 2022 11:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5071BF5F6
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD4A81450
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xEfVIp58qj32 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 11:16:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD0181430
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 11:16:48 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HOUJn6u35roAhHOUJnXlEu; Tue, 08 Feb 2022 12:16:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644319007; bh=mHxvDG9n98GJpRxcl+9j0ROzgx8ZujXWr8O5/GjuLfY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=luRhWAd5wSidZ1U1Akq/Zwod/jHGWIlMSsoJfeV/qIunotbYidyC19R44c0eOo6gI
 aF/cwjLTbCSgtvq52Pad8s1H4XeLLMwPWFhUuH8PybI9gaVRcQhNpf4+qRldKYA0Bt
 Fgaig2BPYdhAQIyt/qt5wKRx3lstnU9VJxSOiPbjRv8DKlzk2/8UN91cgvKejgDUW2
 9pgQU5sgUeWdnfVu98ws18EtkC4lrxPqxgefWYtiE374rCdzWvEWQxmyyl8CYno752
 V2V35WKmvuM19vv02+p/aHEOYLYnWnNRXBqanJYkG5n77GbfOCa3YIFVnWnY89BgMN
 pqQUkkYqTIlGw==
Message-ID: <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
Date: Tue, 8 Feb 2022 12:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfD/xhOXV/FF9U3LvznhCntzOtK72fhAKf5VAcTbiNr2sakd8V73Z+tOPrQ6V4kWVH1UiJg7E5tB7IRqyMNXBssIXB9Ta7AMSf613uBgQ+cBHd2P0mwA/
 KJ3foSe+l0rkyoLUfos60Vypv61DsuAbq7E8VEVoM0/SmPYQQPrREbOWPXUxTwc4oXEgtZEBewx8nDYKlbbx6BZhoU0O3Eo/OcbkJjZMPWb2rJIJ36JhyTC/
 h/GnKAynp6AVlHHodgLZYjIyrrbr8tCHcF7+QHtXYgmHuAZsOVs2RPeDMsAt93c+
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 Michal Simek <michals@xilinx.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 08/02/22 11:24, Neal Frager wrote:
> Hi Giulio,
> 
>> Ok, I was about building your patches :-)
> 
>> Please send as v2, so when creating patches add -v2:
>> # git format-patch -s -M -o outgoing -2 -v2 then add 3 dashes before the actual 3 dashes in the produced patches and described what is changed between V1 version to V2 like:
>> ---
>> V1->V2:
>> * moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local patch as suggested by Giulio
>> * other eventual modifies
>> ---
> 
>> And if you send then a v3, then keep previous V1->V2 and add:
>> ---
>> V1->V2:
>> * moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local patch as suggested by Giulio
>> V2->V3:
>> * modified ....
>> ---
> 
> Thank you for your quick response.  How do you think we should handle this?  It appears that the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG configuration does not yet support pre-downloading the file from a URL.

It's not its purpose.

>  Is this something that can easily be updated?  If not, perhaps it makes sense to move forward with my patch set as is for now, and then I can include a new update once the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG configuration accepts URL inputs.
> 
> What are your thoughts on this?

I think you should go with local patch honestly.
As the patch is now.

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
