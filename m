Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD31C021AB
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD75F60A35;
	Mon, 17 Feb 2025 12:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPamShPfdiCl; Mon, 17 Feb 2025 12:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E2A60AAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E2A60AAC;
	Mon, 17 Feb 2025 12:13:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD07372
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCA0A412A2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3o_7fGg6izv for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:13:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54F0041295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F0041295
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54F0041295
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:13:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.144]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My32F-1tQhP532nH-013pRr; Mon, 17
 Feb 2025 13:13:20 +0100
Message-ID: <e429c293-485e-45fa-9df9-e768df93c32b@gmx.de>
Date: Mon, 17 Feb 2025 13:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>
References: <20250216170350.397879-1-yann.morin.1998@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250216170350.397879-1-yann.morin.1998@free.fr>
X-Provags-ID: V03:K1:L8aA/29tozRWRh0FRnlnLJ7lbIRm4NfxfLUpAOGQ5kl2qNP/MZA
 zi4w47hr3PS8i1oRJot4SJrGT5E+NejgUDpN16lwpGY4D345ce47LP+3LLBPGbUQtZSuJ9y
 Zuxape1Ofb9Ddx+fR9ndrP3zKK7l/xVV4uzCz3t6vjXVhzlSgAgwxrZoTwcl1KRJ+YWHPK7
 rLHzD3nCgrjZ52nro+q3g==
UI-OutboundReport: notjunk:1;M01:P0:MrOP0nvtHCA=;xMSCS5TRCEF+y9ue6CP7nzVCg3M
 aw/U3Wtu6fZr/QzvRci7OF4Sb8g9L2UYI0xogdLfKH4H2pjLIwT5jrVV7nrC+1iJJ4933rDMb
 z1VE1azwDfy56lrMpVHV2YIi288MoemhHPyR4Fy62x0Sh0ghf33wHpTT5at95M17Gy4+LhMyl
 L+Dglx6eV0XMagVjEpUUwF/Ga6fAtqgtq9zoADl9qw6WA5jPYBnOuU8IYGE4ArdtTeDeZe1/5
 9bYx4rrbCIPQ3RFG80eyA4nVLfn2cr0Ou/pt0wQdZCj33gSVwmsCo70XHFK5JewrMF/LgAqJ/
 /nnRfZ00nEcAoNMu7JxR6PFOebzUK+csGQXg+1x/tcKy+G2rTzfm3TLQYJlzbhz6ow38th8p/
 b3Skqx+LcxJP7lbLgCg4Fgz8c8KbLbr4pDEl9pBMef8nrp0kQRecraHvblVCiL/9R1N6RZaqP
 nbtltNxrBAF1bmvvOyaf/PyxWEl8/bz5RY0eZ2pEHI0ofY5C7n5Wez3eS8wmq1Ifn10h6WDjY
 fXmtfloxnat5x9GE92zpOq0YAOybTJSDrTrtw8SNkD5QacLxoPJf68ZLQe4xmi4p+fBO8otzP
 nk4coP404bHNSRntTAk1ncG4SADt+UyEGb/XQhMfTG85g33rDIbz2xb7WP1JtFlY2EQrlyVpQ
 ZlzkKafWeEe1prqNnJAcBqSpUvS976pAjjkwOJ4ciEwdJvmm8CW4+pp1Y6I8mcqyICP0nPCK9
 72V0ZbIjHYRmlf/KMOpr47+tbfzF8CxsmVMX/syk6HqnuQh9SX/D3yhVqRv55wf0H0Wl21GDF
 JPU1g6oOmnvGHF7HMW888OZrBWRQEv5cc8QwVJA54r9AWvz1Sr0SzkDbR5YL7ePGSnEhDJGuC
 4cqJGYOhq2ubRz4k9rEUBKLge5j9/mb0SD0ddeM4p516vPQVCuK6H1qwI3htaZst4ieNben8u
 lZXPWxfrEJtnxXyoS9ji3rQFobc7OVquSk8ELlVURRr4r/CzR4TjSw3dolXant0i3RS960QQM
 iiNIqSxadaREQiJNninyoL2dAvYFZ+Jdtq4juh/+LOuUUPV/C6BHnOIkLAT1vuqFZxhLFymbe
 2x5O8cg5dFJjjXa9PQTQuLD1ZGYzzpNqCDfrJCyJYKAykLzcNLnQ6OLeIR0beozYG/zPrt72U
 gnKBcKOnwawHeV5K4epU/1lZA4Di6jQO1hB2fOcucZCHsOeAkpRWi12gsgykAEWMgnOjGRT8I
 x4mtB+g1ylhJx4Bo34HJ3Voj7PlVXh81UQZMP6Zg2S97wfkbLg2VBcnbvO+2eZwjzv9LxoXCJ
 dNGUJs2ysSllCP4P5bC+CyIiGoeLt5QwqWZF7ciIR9mkN1MuqFdpaAP0yUMyCvlmUhtk7cTpl
 +Y/eU8fwb6xu3bMiqH3uD8p/jnZiKRfrifqsU9mtN0uErJUd5bPbpqhVfsynGI/JdVgDTHrJf
 de2tgDg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739794400; x=1740399200; i=fiona.klute@gmx.de;
 bh=qxKNDLMi/hOCNqnmPHx7Tw2df/SBkOS7wGOJNqEpbZ4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lkwi1LaZzw+7py9EBgMWYT1D8PpX2YHZAKy3s3+yAGV8P33QAS2CEF+QIzSf7Wzu
 fvlgK4r2qLTx+lQP8la0DJPlDZNl6ToFRdPv/xP47+JADetZlKf4rICpeX+XiRGvB
 mLVAhUp90c2adp3E3t0h0KgfbApK0my2k0n2lkgq47PVvGNZYS8GRco3rPviH5zPV
 WoEf4i6o+C1EwKjFKwtJe9YaccjFT5QKeGt5mEHhBXl0rXJ6NgP77zEtpt+AHo+Qi
 T3fkn7yj81mCHYwOpzalhyofuZSgsgyGnbZVsgNgNa1eGxAI7pYW+WMId/xCqfmWs
 vB4Y/thIJXjcs8IsHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lkwi1LaZ
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow explicitly setting
 of docker/podman/...
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

Am 16.02.25 um 18:03 schrieb Yann E. MORIN:
> Currently, our docker-run helper will decide on its own whether it
> should use docker (preferred) or podman (fallback). s introduced in
> 9a629f5129d6 (utils/docker-run: allow running with Podman). In case
> both are installed, it is not possible to exercise the podman case.
>
> Allow the user to force the one to use, by setting the BR2_DOCKER
> environment variable. If that is set and does not exist, exit with
> an explicit error message (rather than rely on the failure when
> eventually exec-ing the specified command).
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> Cc: Julien Olivain <ju.o@free.fr>
> Cc: Fiona Klute <fiona.klute@gmx.de>

Makes sense to me.

Reviewed-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Best regards,
Fiona

> ---
>   utils/docker-run | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 849df66d54..27c169db72 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -35,7 +35,14 @@ declare -a mountpoints=(
>   # compatibility command.
>   export PODMAN_USERNS="keep-id"
>
> -if command -v docker >/dev/null; then
> +if [ "${BR2_DOCKER}" ]; then
> +    if command -v "${BR2_DOCKER}" >/dev/null; then
> +        DOCKER="${BR2_DOCKER}"
> +    else
> +        printf 'ERROR: Command "%s" (from env BR2_DOCKER) not found.\n' "${BR2_DOCKER}" >&2
> +        exit 1
> +    fi
> +elif command -v docker >/dev/null; then
>       DOCKER="docker"
>   elif command -v podman >/dev/null; then
>       DOCKER="podman"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
