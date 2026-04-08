Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E101073C8D
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 10:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A168217A;
	Wed,  8 Apr 2026 10:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_MU12BBlc3z; Wed,  8 Apr 2026 10:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7A3F821B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775644095;
	bh=9EPp1q0RNaVkeWm2ijjhSKRIVYWSLW5dqZoxSW64VcA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZA0FCpAKe3Zj+Zo8HZqo5VwZrMcVD7XD47AQJ9XNy6UOumvNfhtJLe7rXhJAxg9KG
	 +zDbAfQIWYix2RZKzr4dUo10eIIkuCW//kxL9p7Jxd+F0c0EZ++7Gr6XjfYPnvhSYi
	 N5D8gcftsRG58VLLi01xqQt9uNpxKt7a8o1NNWUQ3vDgIwxiusAh6HaqCKpFfg5PYu
	 q9pNa21az9SMD65quV8n2Mc2rsKaaEcYISIWyxa2NscMTndvTHnlRVsgOESNp6HBCJ
	 N81Dyhjp9lko63U6AohjAOHSN4mG7fM/YXjVKyucstudKopsZyE5rPkXNpu/ixAvXM
	 ngIlRMWn0wYtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7A3F821B6;
	Wed,  8 Apr 2026 10:28:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC49B237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD55400C2
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxFlNGNk8rCI for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 10:28:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D24E40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D24E40057
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D24E40057
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:28:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1vwj1s1PXO-00RpoO; Wed, 08
 Apr 2026 12:28:10 +0200
Message-ID: <b49e9bd7-762b-4206-baee-25e92b1d48d9@gmx.de>
Date: Wed, 8 Apr 2026 12:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
X-Provags-ID: V03:K1:wPp4xlbe9IzaKcSOwK+7AMW2//RJ7qoSzsv9Xwl8rKwvqfzYju0
 zr6xxbvClEJNbV/jzJeUMyoiv7hgM+yUeDp/4AboiSGDmgWVrVb6piafmX0Ps7g3L9icEXu
 UVJT4zIkePIpfmmk+ebH8X406wesOKhchoOyOpZeeTt4VO9eud6bcYtU7NuJacESi5lpXqn
 uczuqWiO5YXLng6O+fO1g==
UI-OutboundReport: notjunk:1;M01:P0:GfL+oWMDMo0=;smTPay04UXdqRGH7t7hmmEHPdko
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1775644090; x=1776248890; i=fiona.klute@gmx.de;
 bh=ZftjgHozYK8zSAJheTdrl65fmSZr7NSTRUpPsuNj5tQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ezPDhG57TXPykGir/onPPPgMBRzvSjs9LjVYc4UTAqFvYSJX9+Zk+Z86ns5kA36m
 yImGY+RdZGK/3UsputzrSs1ZTE3OHApZNRi9QZ/hZ/zsDCMEN0JMBq5doG7C2I7Ua
 x/y5dy4pxQkouUwkgH567SgOA9RwjA7xqBdoSQLXKvFHuPHe3OXv5KPQEh4d20E9Q
 8Hd9MVt3DU3qjUaNJMIqCUzg7n4HeaXO+C7M3YCwrRiqH+wB6D3cC9OM/Yp8mKk1o
 l7T6rcC/X23vlaI/KEUdlYO1vyIDs7vRkXjZmWUAU3n/SuArhDx1Cj80zqfX3ZMPb
 xV7wB1P50pkYauhmUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ezPDhG57
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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

Hi Quentin!

Am 07.04.26 um 19:37 schrieb Quentin Schulz via buildroot:
> It may be beneficial to be able to run the script from Buildroot host
> packages to avoid external dependencies. I for example build Buildroot
> within some ancient container where I don't have a recent-enough Python
> to run generate-cyclonedx with. I already build host Python as part of
> my build, so it seems like a good opportunity to reuse it for running
> generate-cyclonedx with it instead of going for a separate container
> just for running that script.
> 
> This however required a few changes. First, I needed to enable
> BR2_PACKAGE_HOST_PYTHON3_BZIP2 otherwise importing the bz2 module would
> fail.
> However after looking at the code deeper, there isn't a way right now
> for this script to actually receive a compressed patch to parse,
> therefore instead of requiring that option to be selected, the
> compression "support" is removed from the script entirely.
> 
> Then, I got hit by Python telling me it does not know what HTTPS is. The
> issue was that the ssl (well, technically _ssl) module wasn't built
> unless BR2_PACKAGE_HOST_PYTHON3_SSL is enabled and without that, no
> HTTPS support.

How about creating host packages for generate-cyclonedx and the 
CycloneDX schema (in a way that the script still works standalone, if 
all dependencies are available)? That'd completely sidestep the HTTPS 
issue and work offline after "make source".

I'm very much in favor of clear errors and removing broken, unused code 
in any case. :-)

Best regards,
Fiona

> Going further, Python would then complain that it cannot verify the
> certificates. The answer was to build a host variant of ca-certificates
> for host Python to use. Another option is to go for host-python-certifi
> instead, with the following diff:
> 
>    diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
>    index fad0671166..461743692e 100755
>    --- a/utils/generate-cyclonedx
>    +++ b/utils/generate-cyclonedx
>    @@ -51,7 +51,13 @@ if not SPDX_SCHEMA_PATH.exists():
>         # Download the CycloneDX SPDX schema JSON, and cache it locally
>         cyclonedxpath.mkdir(parents=True, exist_ok=True)
>         try:
>    -        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
>    +        import ssl
>    +        import certifi
>    +
>    +        context = ssl.create_default_context(cafile=certifi.where())
>    +        with urllib.request.urlopen(SPDX_SCHEMA_URL, context=context) as response, \
>    +                open(SPDX_SCHEMA_PATH, "wb") as f:
>    +            f.write(response.read())
>         except urllib.error.URLError as e:
>             if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
>                 raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
> 
> The downside is that users running this script externally from Buildroot
> will need to install certifi Python module to run the script. I guess
> we could run urlretrieve first and if it fails, then fallback to
> certifi. What do you think?
> 
> So, this adds a couple of messages hinting at the user what may be
> missing for generate-cyclonedx to run. Note that
> BR2_PACKAGE_HOST_PYTHON3_SSL and BR2_PACKAGE_HOST_CA_CERTIFICATES are
> optional, they only are needed if the SPDX schema isn't available yet.
> One can also decide to download it externally with wget/curl in the
> appropriate location and avoid having to build host ca-certificates
> and/or host Python with ssl support (it does bring host-libopenssl
> after all!).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (4):
>        utils/generate-cyclonedx: remove "support" for bz2 and gzip compressed patches
>        utils/generate-cyclonedx: better error message when host Python is built without ssl
>        package/ca-certificates: enable host package variant
>        utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error
> 
>   package/Config.in.host                     |  1 +
>   package/ca-certificates/Config.in.host     | 12 ++++++++++++
>   package/ca-certificates/ca-certificates.mk | 30 ++++++++++++++++++++++++++++++
>   utils/generate-cyclonedx                   | 29 +++++++++++++++--------------
>   4 files changed, 58 insertions(+), 14 deletions(-)
> ---
> base-commit: ac4c32f6f839d1b813125e64f0e23a98922ac602
> change-id: 20260407-generate-cyclonedx-br-2b2d2561072c
> 
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
