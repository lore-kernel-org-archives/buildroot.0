Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725A1CD98E1
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 18:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C5CD842CF;
	Mon, 15 Jun 2026 18:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22_TvBCdntw7; Mon, 15 Jun 2026 18:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44726842CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781546842;
	bh=RxRC4Y1dgOryhBnsooQLiGWy7/PY/c7c2k/FUs4S7U4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lFUGOPnYv8hcQyB64TSrK0kj43GDPzqX3uObsc1t5/XFdMogTIKO9nmpAgXAb5G3X
	 etObfFwilJj/P2Y4qjzbEgQCVHA45Cqe7kQxlJ98PrY4zvuZpzYUZcetHcIM7smp/Y
	 q19WkZn9vLeVQ4ATOniEXrWVBv6Ag27RapJZfPNlOxBqiSscv3Bh0Ad61AW4aLqwTz
	 cML/xNHFSHXWlmBaO9HNC1c+1pZ6+GEbzuE7dTz1XFqiGgA9s/dXJyQDgIWGUIYOma
	 z1tB5gWRXMmzhY0TT259PIZKztgkSXltwtf4/ZPHVIYS/KMFgeOOgbmXDEyOp7sUEZ
	 hUNiRhsFVGPjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44726842CE;
	Mon, 15 Jun 2026 18:07:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E254169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE5241350
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e9YTe4UyKwG for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 18:07:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD98F404E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD98F404E5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD98F404E5
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:07:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1wXEhz1MFd-00GTAQ; Mon, 15
 Jun 2026 20:07:10 +0200
Message-ID: <abca804a-1a63-4319-9b7e-ff9cdfed053d@gmx.de>
Date: Mon, 15 Jun 2026 20:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260615123930.447-1-kory.maincent@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260615123930.447-1-kory.maincent@bootlin.com>
X-Provags-ID: V03:K1:1Vo2/GZMVV4h0KVaorWNSzvn3jphwx3pgp4/4SGNHtxzaHJjds0
 T5eXrxzRPOXYrI54IHmc0owaZBQjHn8nfqfrYhFh0Kna6V+F2GVFp6PoebzA9Ov3aQZLfp4
 btvD5ym5oneEds6cNU7SdtFUgU4BNAvF3iFUdInNOzdteqdm8ehO3/A8BG07vbwRcIkVo5Y
 79H35ZzBLb0AEHtU+37WQ==
UI-OutboundReport: notjunk:1;M01:P0:mf1/lHaNvus=;atjSDqOEMo9TwIo9i2qkKUcvQWc
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781546830; x=1782151630; i=fiona.klute@gmx.de;
 bh=YBNFMswxv+RzJtzuxJ/ISu6p32q9mXtWS5J6afF55Mk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pYzlSJ3yChCOldytXui1godKniW1HCwRIyFl5cy5ePZ/sqR2nmHBvd/+NE1W/gRw
 48UHSUjciulEOwML4XFBP7nAelDdsWTJrkvL7r3ew9Y++ZraRkupJlxXJNXMeMZtB
 Oua0KQw/+7aMeV1ItrHFMO5Wzd2otuwrP5npFGOmf3OiCWSu+ikocS+zMp1tlt0Q6
 bCcZzNcAVOdecV4bCXlZ2lmG7Q9RRKTlOrsk7RFS84E5Q1oM2bBLCXRBr2GWTF2LQ
 3ETyPfP+XFHtuNxpj05sZwOiuoOCDrib+8C+AMHNtDcg8jTRS827LT+WJMeD+jNcs
 RSin9kpKiBciJqHw6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pYzlSJ3y
Subject: Re: [Buildroot] [PATCH] utils/docker-run: Support BR2_EXTERNAL with
 relative paths
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

Am 15.06.26 um 14:39 schrieb Kory Maincent via buildroot:
> The docker-run script did not handle the BR2_EXTERNAL environment variable,
> preventing use of external trees in Docker builds.
> 
> Add support by converting relative paths to absolute, mounting the directory
> into the container, and passing the variable to the Docker environment.

I've sent a patch a while ago that does pretty much the same thing, and 
handles the possibilities of multiple external trees (space separated 
list, or legacy colon separated) and empty BR2_EXTERNAL (to disable any 
configured external trees):
https://patchwork.ozlabs.org/project/buildroot/patch/20260405185608.1357633-1-fiona.klute@gmx.de/

Could you test that one?

Best regards,
Fiona

> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   utils/docker-run | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 27c169db72..6e9693edd6 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -97,6 +97,12 @@ if [ "${BR2_DL_DIR}" ]; then
>       docker_opts+=( --env BR2_DL_DIR )
>   fi
>   
> +if [ "${BR2_EXTERNAL}" ]; then
> +    BR2_EXTERNAL_DIR="$(cd "${MAIN_DIR}"; readlink -e "${BR2_EXTERNAL}")"
> +    mountpoints+=( "${BR2_EXTERNAL_DIR}" )
> +    docker_opts+=( --env BR2_EXTERNAL )
> +fi
> +
>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
