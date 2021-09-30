Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C431C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:15:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D0E611C8
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9D0E611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 854B140468;
	Thu, 30 Sep 2021 23:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vE35EfgvBH3j; Thu, 30 Sep 2021 23:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E156740466;
	Thu, 30 Sep 2021 23:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F36E01BF352
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E207840367
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5riUVMBU-KrE for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 23:15:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id A68114026E
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 23:15:37 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id W5H6m4yNHrIRlW5H6mKrXk; Fri, 01 Oct 2021 01:15:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633043736; bh=RPXCWAvzwO4uzcLCYrgfkYF9WHwDMNLBI9w5kq2QVS4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ViAwoPum4rd6jQJ4R9RkAieDiuzO6HizpXZl2Qx8sEzB2ZvoZBIpS9gneSvCSZWtY
 uVAYjLIvMclF2mzalb/J2mklXKTvj2f8Mwh/dPQR4X1dx/IwexKff/i5i9ZrebOOIw
 3Mvn0lXuT1X9Zh54ZWRH9L8494X9ZTMdpFUuxWyG+OWERzPKJwWXKNFf1kSzcvbJ4x
 D0QmGQN1mSKRhrFEb+AxTN6XwyRTPWv1DZ52qDHOYWXHkitqa9AhQmkQEosZCQE0JQ
 s1IqUoCS7s3mpk9hyMytyjR4UQF/VaLDmTPi/FUUFpEUWe+Y2lICtT2v3EKbwTtLeo
 NjKHfQPHeyF0w==
To: buildroot@buildroot.org
References: <20210926232633.360345-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <c5c60428-99f3-e21f-88a4-4d21a24793a2@benettiengineering.com>
Date: Fri, 1 Oct 2021 01:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926232633.360345-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJFw+JZc2U6T6+46jC/mIH7eJ1HT6Tw5qt0zdeJlQNHkxlxqw/alYyc6QR1SIM0H4//x7JnVp3SqHqjdTP0DM6hiF3hRz80u5Tt5QseR6wdh99pU9TJ/
 wsqiNkdzGjC+JHqEbRjFvCwXPOXzOznN07bfPlbUgWNBkKOrjWB8N6utlR8JyX5D4qEIwQXVEyj2zyb4uHHK215nO/NnD0QfkFg=
Subject: Re: [Buildroot] [buildroot-test] scripts/autobuild-run: extend
 timeout from 120 to 180 minutes
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

Please drop this one that patchwork missed and pick this:
https://patchwork.ozlabs.org/project/buildroot/patch/20210930231424.249681-1-giulio.benetti@benettiengineering.com/

Thank you
-- 
Giulio Benetti
Benetti Engineering sas

On 9/27/21 1:26 AM, Giulio Benetti wrote:
> During the last months some package started to timeout, but this is not due
> to toolchain infinite loop. I think it's due to the increase of the source
> code files' length and to complexity of toolchains or even slow compiling
> time. For example python-uvloop and python-lxml only take long time to
> build with -Os optimization and this makes it seem a TIMEOUT but it's not.
> So let's extend timeout setting from 120 to 180 minutes to avoid false
> TIMEOUTs.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   scripts/autobuild-run | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 346928f..0636368 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -176,7 +176,7 @@ else:
>   
>   # A number of packages can take > 60mins of build time (e.g
>   # gst-ffmpeg, qt5webkit, mimic)
> -HUNG_BUILD_TIMEOUT = 120 # mins
> +HUNG_BUILD_TIMEOUT = 180 # mins
>   VERSION = 1
>   
>   def rm_ro(f, p, _):
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
