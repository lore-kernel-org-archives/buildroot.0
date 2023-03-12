Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A916C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B3981584;
	Sun, 12 Mar 2023 09:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B3981584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gl7tHBIt-hsK; Sun, 12 Mar 2023 09:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA8881518;
	Sun, 12 Mar 2023 09:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA8881518
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25DBD1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 000FD40256
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 000FD40256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAdp105t7QwK for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8948740136
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8948740136
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:43:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp5-g21.free.fr (Postfix) with ESMTP id 15E1C5FFAC;
 Sun, 12 Mar 2023 10:43:19 +0100 (CET)
Received: from [37.169.126.28]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 12 Mar 2023 10:43:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230312102342.2f2393b0@windsurf>
References: <20230311184148.183739-1-ju.o@free.fr>
 <20230312102342.2f2393b0@windsurf>
Message-ID: <7672ac6c9aff94c22e7738df5e1c6316@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678614199;
 bh=IYy4xSC55BU39K4blttk3w913dVq5p/7VKLzpd2hpa8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fICBSoC5i+fDPDILVUNr558YmU+PFE4KFxjavP4x/Hjgb5UT8s0I9z1DiVGMpf7Bw
 Eal2/ZXvIrAkDfLczsHkcJLDdp9vTxmvtK0xIJnhFkSAzk2NpIIOxJ0+NtpYFQ/NDs
 vgFmS6UToM/kDrzQBWaRM8FmVWlwdzr0Dbrjj6G6p3uzT+MRQILDL5L7okm3W3GqQA
 C/vnntfufASyuIpMS7gTAeR3UHNJHbJvjhyvliZ49pQk8dlvM2BHfIu3NXVagSpp/J
 B9sbpgqy5d4NkwIkQh7zBLV8SNc8Zy7AgpIQ8xrVwOu0FgseF98SnHZSH1lwtDJHwY
 eR+wy1wekh0QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fICBSoC5
Subject: Re: [Buildroot] [PATCH next 1/1] package/python-hwdata: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 12/03/2023 10:23, Thomas Petazzoni wrote:
> Hello Julien,
> 
> Thanks for this work!
> 
> On Sat, 11 Mar 2023 19:41:48 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> +PYTHON_HWDATA_VERSION = 2.3.7
>> +PYTHON_HWDATA_SOURCE = hwdata-$(PYTHON_HWDATA_VERSION).tar.gz
>> +PYTHON_HWDATA_SITE = 
>> https://files.pythonhosted.org/packages/15/26/f5bc1b42129fbcbd1c99c29714af1685fc89e2cf37680a9930d4fcac1808
>> +PYTHON_HWDATA_SETUP_TYPE = distutils
>> +PYTHON_HWDATA_LICENSE = GPL-2.0+
>> +PYTHON_HWDATA_LICENSE_FILES = LICENSE
> 
> This doesn't work because there is no LICENSE file in the PyPi tarball
> (and also the hash file does not have the hash of that file):

I also realized that, but I sent the wrong patch version.  Sorry about 
that.
My fixed version was just included a "no license file" comment. I'll 
send
a fixed v2.

>>>> python-hwdata 2.3.7 Collecting legal info
> ERROR: No hash found for LICENSE
> cp: cannot stat
> '/home/thomas/projets/buildroot/output/build/python-hwdata-2.3.7/LICENSE':
> No such file or directory
> make: *** [package/python-hwdata/python-hwdata.mk:16:
> python-hwdata-legal-info] Error 1
> 
> One thing you could do to address this is:
> 
> PYTHON_HWDATA_EXTRA_DOWNLOADS =
> https://raw.githubusercontent.com/xsuchy/python-hwdata/python-hwdata-2.3.7-1/LICENSE
> 
> and then add a post-extract hook that copies $(PYTHON_HWDATA_DLDIR) to
> $(@D), and then use LICENSE as the license file.
> 
> This will of course require an update in the hash file.
> 
> Do you think you could look into this? The rest of the patch looks
> good, of course.

Sure! I'll rework the patch to include your suggestion.  I never thought 
about
this workaround for this situation.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
