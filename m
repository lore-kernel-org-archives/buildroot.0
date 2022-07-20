Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1EEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 12:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7789A82422;
	Wed, 20 Jul 2022 12:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7789A82422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlTgY9qsTLI3; Wed, 20 Jul 2022 12:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CEC82907;
	Wed, 20 Jul 2022 12:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CEC82907
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C52851BF5A8
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 12:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ED8340C36
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 12:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ED8340C36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rh0OJp7bWxPc for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 12:14:15 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0465340C22
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0465340C22
 for <buildroot@uclibc.org>; Wed, 20 Jul 2022 12:14:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.55.53])
 by Aruba Outgoing Smtp  with ESMTPSA
 id E8TsoE6eJJtD2E8TsoojlD; Wed, 20 Jul 2022 14:07:09 +0200
Message-ID: <9201a744-1be5-c564-ef92-c5149259676c@benettiengineering.com>
Date: Wed, 20 Jul 2022 14:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org
References: <20220710225552.324219-1-giulio.benetti__768.939305429228$1657493781$gmane$org@benettiengineering.com>
 <pan$6cbfd$cce9e95c$3c4a2822$90799940@ID-313208.user.individual.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <pan$6cbfd$cce9e95c$3c4a2822$90799940@ID-313208.user.individual.net>
X-CMAE-Envelope: MS4xfMK/UUF4WEbBSlJWsmsWN/eNuROA4cQdbNxmdEDCusP+4RKvn4vBF6lkjr8uHsFPBnIYche/1qEWccGvACs0w38Ef5jQuu1dH8WXLo1HHeAPwZM/tftV
 S7HW7XeRYTDG/3YnoMrBTCVH3Jv6SXncBZe0s0uTZZoMjh0+Dp23KK9n3hTQ4ykLMzKSWMcGTKVU763ycTShIu460KoRJeywmKxCljz/fIvz+Kb/ZqOjPSyc
 D9qsQjlNFsf+au5E6gVmcE6K+tUxxWB8CQieblC8gjdNHZ9yqYKcKFC59HtLrnPX
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1658318829; bh=Mk4LcEVbn1SvxCrlNKCV86OBtoKsSvZBglPuF1kfX0k=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=CHDUvQ20nxeSWso0Fq/Dv63fqnW5hJ2kUdpn/TIfngzqovilwf1iUQYxfFoYg3JsY
 OngHfcz5niN9pnv6UVNOIQvk0heDFx4/Uwh/64fd5NlIagq2nHQ0Gbi/YVm7AgJTav
 II9ZwCtfEJ99IV0q4FpCbfxbDQBtfvp2z9BFhBOCAlJl0IQXwAccj9wT/v5fWaqryc
 6+yxqgULKqBNfLEyFMJL/shYEMHtgmEmRZ6IWfeOrWxawD7mY9pXWmXMNMj7lF1KKY
 pRSrh4DXnN1qtHWKoj4yysMtK4mefwxegPmaHD+RGqkgLbXYtwVW1KPi5Mzro9k9vb
 2mniw3Dr0yq9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CHDUvQ20
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 4.4.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 17/07/22 13:10, Bernd Kuhls wrote:
> Am Mon, 11 Jul 2022 00:55:52 +0200 schrieb Giulio Benetti:
> 
>> Signed-off-by: Giulio Benetti
>> <giulio.benetti@benettiengineering.com>
> 
> Hi,
> 
> this bump will again break the build with gcc-4.9, please backport this
> commit to fix the problem:
> https://github.com/harfbuzz/harfbuzz/commit/
> 3238cb744bb570a75326ab4438968c59069e9af2

thank for pointing,

Fabrice provided that patch and then Thomas applied mine, so everything 
works ok now.

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
