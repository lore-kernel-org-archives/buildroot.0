Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DC5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B71A611C8
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B71A611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0BE1841A3;
	Thu, 30 Sep 2021 23:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajJ7c-2I3jxY; Thu, 30 Sep 2021 23:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA63841A2;
	Thu, 30 Sep 2021 23:15:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E57871BF352
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E260960680
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgV4MUeBHpwl for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 23:15:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id E329A605F2
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 23:15:51 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id W5HKm4ydsrIRlW5HKmKral; Fri, 01 Oct 2021 01:15:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633043750; bh=lCKtSEBGtmIINMUxsfEoy0S0TKz0GIcd9rlwC74L7lI=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=YkeX1QLPWX39PYvRuAO5AWqw0HMuxOENtVN8jm9lZYSHD5j8DTScIF55Z5Jy0n3pi
 58YaOtm81nq0u2Ru0QL4JxjlobjYIAKvQ52C6ymVe5/f/bvtRLtM/6KtU4XgxiRQIt
 dnOCBzCUdN/b4PQnM5YHQqc9MDYJvLkqY602UorELUlWmJpLUz0Inwtyc5yckpd9E9
 6pmbcakkZDg0yUa97JjyCdLGQCDl56VsaxGfAq0GIyvIhTEzkn5wiJ9wHnbJU80BW2
 bsisuigx6LML8CTK9Ow8F3ujNukwZKkm1g1iMyqhd92DJBjPkXzcRxbeEyHPwqNsiI
 0/+TC0Ofc5Rbg==
To: buildroot@buildroot.org
References: <20210927185019.1938346-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <4eafbe2b-ea48-3da5-750b-86d2e8ced3ed@benettiengineering.com>
Date: Fri, 1 Oct 2021 01:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927185019.1938346-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfMbE3W1QuenIWbbhwi5II7MLphmbpFCf4r3YJ86Zl3kOUTC9ZC7C6/gSyEILKVCxmuNA1JUQAkwBx+tHeChZAUuAB8/7IeE8EcMDZlfy5QSA6Y2cy2Wg
 ijxAe0GdICAXItxCslmeWMxUdIM5XbczCwHlh1p0tE3XLdq5P/AWUOP/2Cw2W/wFl6z63r72iAkQH+JnhsOr/05XfSCZkq8dK7w=
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

Same here:
Please drop this one that patchwork missed and pick this:
https://patchwork.ozlabs.org/project/buildroot/patch/20210930231424.249681-1-giulio.benetti@benettiengineering.com/

Thank you
-- 
Giulio Benetti
Benetti Engineering sas


On 9/27/21 8:50 PM, Giulio Benetti wrote:
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
