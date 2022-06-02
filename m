Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F2C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 05:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7615C82EB4;
	Thu,  2 Jun 2022 05:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTnoMAYgKQTB; Thu,  2 Jun 2022 05:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9703E82EAD;
	Thu,  2 Jun 2022 05:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3985E1BF292
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 05:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27B3840922
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 05:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M92sWxCR8ek5 for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 05:01:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A653D40743
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 05:01:34 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se29.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nwcxY-000H4l-7N; Thu, 02 Jun 2022 00:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WIwqSXcoZS7YnacoC5ZUh2y2eoI3f9+xUq7TH6/VmFU=; b=OUe1xr8CtGbUBz2/XRA1hjhuuM
 UvjoM2RidGDrGhp26b8XEed+VnYpkif2jBqjMERnwlNPv70lubL5Tq1AA33Bs3o239tQT/mioQdZb
 h6AI1i4pVcALX99m07Zs5blammZyH+B4UVWCa1jjNDnazdhxMZE+0I+2r4r+UFHoWDoHUYpPm/Kj1
 +qobe1xrcxRtO/M8MWJmw0RsDhw0zEeIJZJWrdtqZr/y4O//jAlrrElgW8MN05Ife9XUwvJc6c/50
 hMwY6bAUGiGLSmtRfbcnYKo+L/HDJnnlir7ivc9jX67uM77c5hlKW9QtkVbVytaloTVESiu26zXL/
 QZpx2gBw==;
Received: from [127.0.0.1] (port=59330 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nwcxW-000J7h-EJ; Thu, 02 Jun 2022 05:01:22 +0000
MIME-Version: 1.0
Date: Thu, 02 Jun 2022 08:01:22 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220601233607.336a4072@windsurf>
References: <20220530203001.574908-1-dimi@tpm.dev>
 <20220601194746.29106-1-dimi@tpm.dev> <20220601225031.79aca2b0@windsurf>
 <4499743c804d1a5a091055a8bb58be72@tpm.dev>
 <20220601233607.336a4072@windsurf>
Message-ID: <855061e514da0fc44a740cb6687e42ce@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.14)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8F7MbUHmjhpPUxTNidYKnnPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJaaj
 T7GK+pV+DB0C1T8MJSONp1orT0zdSv/EvZ56A6zUQaXPwIlI4yu/PH1NWDdGRbMuquvcLZO/fWzt
 9+bGf7pTtObPqIqeRAv2CqzEPfjvBK5fzIEWxOKtcShtfOYYenQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgdas/VTNCC9cNG0ZUHetAVuAXlm/yIarJ6MLtuWSGk5WZn7S9PqmI7CxqPRD6
 uYFuWlL+AzdNu5X5f7NNcHGqANvvQ7y3dU9ER0LU50yMqo3HL0jq0UTY1VJNLTVaix4USb4d2v72
 6lpj8/w5Va6KvnTD1aveotlgoppd3/OkI+ve6RqPPT75ZQBVMc+Li61b6cTrAfIBtLJVe62uoyOA
 UtfsPev7LNp/T0V6wcNiJWH6ZboosCGGDrdx/yGEn66RE9n6xcs9dAjFcdYUmx6p0CV+3YBwFTmQ
 DwcsbTdCl4f6Bfy1T3PwsUos1yNYdTOG17NirEYyqwqMBGrw8ELiqDAff04cDRXGaP/Cy6sgzmsE
 /Xy9bqh2t87xwDNJ1ZQn9Z1kUo7APEynsyHYUP3usgPt8rNcco5Lt6ku63DkksyWUQhsiRV7ToHt
 3HSONnNjcxw3qqhc+N6cuEg4XWh5FmdlgpEWziJwQtUee+sRGgavbZh+X78RUpSCE6gsBmis0ddy
 Jhw20OyQnKtoOk9IJhv/vrSLvCUHMT/dLj+6VWWeH+mIf4ZAwT1XjbqQQ/uU0mCTpRgcoQPyBmzG
 6HJjvZ5ECu3zMC6/UIvU+dfuPW4Fq60D0IrCERjnDPsHGlH62P/Q5P2avsXwIHCKRpn8mrgUqWtM
 kwf3MnkWOmaXxaB2Jb1rY1tO0r8h2f0Xr8lvTjrNCxinmu8YyXWCafR/2x66OQ0NojUFkvjGWF6o
 Utbn/4Ny/m4PJtdsKlQhcDiq647lNwN4qOsSZg+fYhVZG+aNsL2JRrOpejgF0fuKp2SDLX1tyhUO
 sR3FEBVf9eq5Q/RubER29Gsl7u8pEy3UTWWLX2ZbQb3UJKihEmoDuwjgD4vT+QwiY2D1YBmu6gZc
 v+1j2oorz4YWED/OKQ7wdK30zNNQQeLujWA6r47gmJ4=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wolftpm: new package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thank you Thomas. This is awesome.

Only FYI - I had no issues with wolfssl building from latest buildroot 
master. My only issue was with the config.rpath autoconf file while 
building wolftpm.

Best Regards,
Dimi

On 2022-06-02 12:36 AM, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Thu, 02 Jun 2022 00:03:39 +0300
> Dimi Tomov <dimi@tpm.dev> wrote:
> 
>> Hello Thomas,
>> 
>> I have this working on a STM32MP157F-DK2 board with a ST33 TPM.
>> 
>> https://gist.github.com/tomoveu/8f0519cb8d75a5374a999f29640cf45c
>> 
>> Could it be that because I am using $make wolftpm-rebuild is saving me
>> from seeing the same errors?
> 
> I am not sure why you don't have the error about wolfssl being
> unavailable. It was clearly failing to build here. I would need access
> to your complete build log + output/build/wolftpm-<version>/config.log
> to be able to (perhaps) say what's going on.
> 
>> ps: Do I need to submit v4?
> 
> No, I said the patch was applied. It's in our next branch, see:
> 
> 
> https://git.buildroot.org/buildroot/commit/?h=next&id=4bb884a3c61c6b71e33f69453a90eb2a367f64b7
> 
> Thanks!
> 
> Thomas

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
