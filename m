Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03E8CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 23:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91C358290B;
	Fri,  3 Oct 2025 23:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8ftklQYHk7h; Fri,  3 Oct 2025 23:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB9F583613
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9F583613;
	Fri,  3 Oct 2025 23:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5625F226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 23:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 485AD61311
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 23:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXeRfgf4Y_ta for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 23:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A21961442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A21961442
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A21961442
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 23:08:07 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 4osfv3arw3rWi4osfv6rV7; Sat, 04 Oct 2025 01:08:05 +0200
Message-ID: <d29d7591-598a-4941-8833-bd185fbec82f@benettiengineering.com>
Date: Sat, 4 Oct 2025 01:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251003201501.2430547-1-bernd@kuhls.net>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251003201501.2430547-1-bernd@kuhls.net>
X-CMAE-Envelope: MS4xfPJZ2rGsPFuYRD2vYVobVsuiPmZm6bgoeGRzSMWt3hXYP2szgfafw4JG8VFA8tQC3LXxaZ7qPjDZfesIq7j/Mxud1RY2+zP5tJ/7RTFB+jvftFHEHb02
 YfBylnnnVLvsNMa46qNyeFaS6wc9Ey8QcPw+ch9nU6k5RtArhoEZcqBNLUvCBhSBqqZY0it/qgtpEh998d1h6Q597Jr/IXq8YcM281kgWGR9kZQj/qTHJoG6
 arOCBxVq+22CVCfb5YSK3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759532885; bh=Uvu/uuPhBiIneAUulRyKn59KhmkLOMuFfJLI/9eXLq8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=isa8AmhzCZoYq8b0h/YEpxRDIVe9uCMeZ/MQrEoDjojAkXz7ETQjntsCAy3aDPzti
 wgkX46rmC6KwlSmQHpShtzZfO7Q4xK9hhBkf4L9nFzi3LamKybCzIRyn73TdjGVkoW
 5Kd0TCSKqm0dDSqwpNXAN0Ku0QrfMQ+XmvCLjmHgQrD+B0o568J9qd2prRgfEn0Bga
 zU3uV31MBq8xeRAgV5xJTmFC+Brf1/LwCesCcxtUPIhNlHKsz69EGOsTuebT2EyqHX
 5+YTaukoaUJTKZij7RR+PJwZNb5gmWnJrWk4UF0a5/5CaS8WpcKsZ/xbV26t0NAROK
 JXIrAY4zF8oXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=isa8Amhz
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump to version 12.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

I was working on the same patch but test-building all of its packages
:-) That's why I've send a patch for EFL that was failing. This should
be done because API changes with major version. I've done it every time
major version changed, you can see in the commit logs, anyway...

On 10/3/25 22:15, Bernd Kuhls wrote:
> Release notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/12.1.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

...I've successfully built all packages except qt5webengine and it seems
reasonable to me to keep this patch since the failure is not due to API
change so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
https://www.linkedin.com/company/benetti-engineering/
https://www.linkedin.com/in/giulio-benetti-79975951/

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index a6c34d92a3..3b7be8c07b 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  972a60a8d274d49e70361da6920c3a73dfb0fb4387f6c6811906a47ba634d8a1  harfbuzz-11.5.1.tar.xz
> +sha256  e5c81b7f6e0b102dfb000cfa424538b8e896ab78a2f4b8a5ec8cae62ab43369e  harfbuzz-12.1.0.tar.xz
>   sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 5c3666bf75..a21a7f4387 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 11.5.1
> +HARFBUZZ_VERSION = 12.1.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
