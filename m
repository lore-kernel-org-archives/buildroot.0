Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405A1C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 20:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8039D80987;
	Tue,  1 Sep 2026 20:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4KnE0CL1UOK; Tue,  1 Sep 2026 20:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788293487;
	bh=D8Z+9GZVfiChYRNOCBx/e61LvHmwSqVY8y0HDXPIDB0=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nNO2AIaeLnkivJQ8/ZTJvjQMCSgY8SC/DO4BwG6p8+mOzohubKhzkp5kIa8Tz2cdO
	 YOOFk4GoPFdBR/I5V98/FCYGkakZEgz9061QmsE2hv/JoCPpQRKcefJ69sdswDXQRH
	 3o9hRjMnlB8ZK1TdCrJdOEfTCqoamJ/pkYegRTO9k/mG8yDwFLBto+M2SPYPqALDnS
	 2QdJPglt32ND6kWj60RwSDLbSbwXTHfywfjXVqH8PaBfM3Rud2OShEFjmRlVIfJn8i
	 DHbwbPDRAgzTZN5WW7o7OHSg1ScY/ucqbE3ZW44JepCwnVO4k8k9N5L2uwFgJvhmR3
	 QaQNzZYXHq1ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225A0808AE;
	Tue,  1 Sep 2026 20:11:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 225351D9
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D494027A
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf28hTsfKmEz for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 20:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F28940275
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:11:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1wlDUh2wOa-00w96h; Tue, 01
 Sep 2026 22:11:19 +0200
Message-ID: <9d071a34-5e26-4a04-9419-14754ccadc51@gmx.de>
Date: Tue, 1 Sep 2026 22:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260831205703.3909457-1-romain.naour@smile.fr>
 <20260831205703.3909457-2-romain.naour@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Cc: Joachim Wiberg <troglobit@gmail.com>
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260831205703.3909457-2-romain.naour@smile.fr>
X-Provags-ID: V03:K1:gmSHGmd2adkpOdFMCydAzLvJEykFRGa4rwKKmo1wAEuh6IC34kf
 BhCeSdo67Mu6Xyennke70fpzTvYCUCeJJGdZ7J03Y+e6w6oZ0LlaPTBxZzl+V1WD6CB5K5c
 /Ua8mc7U4HgoCFwaqtRCKWAhHSmjvWK0I5Apvtzms6rC7htzoO1dOn1hlS3vA3RgYv7o+Oj
 Kf4FAvYvhXdY7k1PfgA4w==
UI-OutboundReport: notjunk:1;M01:P0:4DrY+sVk4yw=;X6RoMFEaBt7mU7fsCPxBG7CfHU2
 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
 DfbFYK12Ehy90hoT18tmtvW
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: TestMdnsd: improve
 test reliability
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 31.08.26 um 22:57 schrieb Romain Naour via buildroot:
> The mdnsd runtime test can randomly fail on slow runners.
> 
> It's hard to reproduce locally (only one failure after a few attempts)
> but we can reproduce it easily by removing the while loop entirely.
> 
> It turns out that mdnsd is started by S50mdnsd before the
> emulator.login() change the system date:
> 
>    [BRTEST# date -s @1788032864
>    Sat Aug 29 19:47:44 UTC 2026
> 
> Since the minimal rootfs.cpio generated	for TestMdnsd doesn't have any
> ntp client installed, it start with "January 1, 1970".
> 
> The date change may cause some issue to the mdnsd daemon which blocks
> any response from mquery command.
> 
> When the problem occurs, "mquery -T _http._tcp" reply is empty:
> 
>    # mquery -T _http._tcp
>    Querying _http._tcp.local. for PTR (12) ... press Ctrl-C to stop
> 
> To workaround the issue, restart mdnsd manually.

Thanks for the workaround! If mdnsd gets stuck if there's a time jump, 
that sounds like an issue that should also be reported upstream (and 
hopefully fixed there). Even with an NTP client installed there'd be no 
guarantee the time would have been set before mdnsd starts.

Best regards,
Fiona

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948555
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   support/testing/tests/package/test_mdnsd.py | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
> index 214eea7dd9..ebb8971e38 100644
> --- a/support/testing/tests/package/test_mdnsd.py
> +++ b/support/testing/tests/package/test_mdnsd.py
> @@ -23,6 +23,10 @@ class TestMdnsd(infra.basetest.BRTest):
>                                       "-net", "user"])
>           self.emulator.login()
>   
> +        # Restart mdnsd after setting the date in emulator.login() setup.
> +        cmd = "/etc/init.d/S50mdnsd restart"
> +        self.assertRunOk(cmd, timeout=30)
> +
>           # We check the program can execute.
>           self.assertRunOk("mdnsd -v")
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
