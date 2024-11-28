Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72FAD69105
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 13:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE5760F74;
	Thu, 28 Nov 2024 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eCfFuiP5X99; Thu, 28 Nov 2024 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D85660F76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D85660F76;
	Thu, 28 Nov 2024 13:01:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B60B1167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C1B261090
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCYpIm3iCXwo for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 13:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6F6360BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F6360BB7
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6F6360BB7
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 13:01:35 +0000 (UTC)
Received: from [192.168.0.66] ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4NHS-1tijdg2QVC-00wZvr; Thu, 28 Nov 2024 14:01:26 +0100
Message-ID: <b739b503-eb5e-4604-9868-5127ec944624@green-communications.fr>
Date: Thu, 28 Nov 2024 14:01:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
 <20240726162013.2183792-2-fiona.klute@gmx.de>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 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
In-Reply-To: <20240726162013.2183792-2-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:x/zNVvoiLwNg1x7VhwKM8/WRiPhcv8pFqv3bJHX5oSheXAvBjMj
 9f6+1zUbOiRsCyxq8qEL8Zmf1Bmn2OTMWVwWzBTEamNjNGA92VFImwiGgJC1Z0KFdVPD6Yf
 uF8SHOPTGk55NSsU/1nqcEub1wDN27Iba1UkXGViBvWT9550os1j+1KKWF9oeQ6fMmuIV7H
 WwsKpx+qwz8rl561AIgJw==
UI-OutboundReport: notjunk:1;M01:P0:J2VxwT2ieII=;8qzk1xiaKI/V24jTkdPQh4U6O5E
 J28kMzIjixZ/2W+sBBbUwjEsIsKXar7ADgP2y7M/9pDlUkVrdye6JWbl3IWg8YBC6mRq8wou7
 c61yywospAHeRDjLnVessZvKZ6S1KFMaNr+crSKr1b8D/e0gTLnetVINImiOuFnb3vtHsGUme
 LciXp4MF1tOlCOyVRIiqxKR4CNQX6HydbDkWlle5LqEyL72PaPsDkzOvyV27ctNiAV62g7Ugj
 eqRrYgyPywgqI5Cuu8WwSsKr7z9e7adSkOxrvCAlVdz02YLa5Rq+6+HKh4DwddSJICAkz2wrE
 Rh4CCpm4qeOs4ikX8RTsH6YXVm2BytOquyWDV3hb5dD0pbeinB+gII0MhQQyxv6Yaw8/HfU3m
 FyQQ5DxvTlt7jg91Hc1MrDUtWuuUfjmRISt6WOZJQgWhEdSkNuuTGrShIImtbfwm/+MlDWZTx
 F5/98ZAbEfiHJ52t6NE+IdEYDwI7pED9a4ruU7AqKizhDl/AQMa9QBRq08m0m1h9nX7vxBlQW
 KGzQtQsnF6HKR8H2nr0hKQiqXOA3s55jXzqGtDi5gn6Q13gyCWKVJiU/HCzcJsznGpteZBaHk
 EP+5LAQ1OOpX5k81Z9PfyWTsa2D2MMcj0ktQnaMyBtzw5j3lDcyZTGTUnoO1o3vn6OE5HQC2r
 +JZAnAfMyGkiWtmLOzbbIVtg/9FCMtzXMF3vC8A5cNb8u5iMUG7CGnKeDQBAsl4D9I/UzYOZx
 CNPnwWofjEJgE/UqiY/kIip3gTup62bmT/gpmLDXALJyLT5RLH3Yg6meal1r8OwP8pH1jGu3j
 u99OKaMXaU1ULJhy/x/SCqn+6Q+iBzL36gJAM5gx0bsZsoWEUowe9LF+wfNHhyeF6N4UWv8WG
 0pwnDspCl03X2GVSAlUA3NhjfQ9vgfSLE04V04gc9mQZFwjmxImiJucU72oeqr2bAWX2oXHVe
 hFA/xDYkGWdq19Zp4JOdp4bOZnEIB3uYjW98/VHfPvwM0SqamabmASUaSKRaoDcFC/H9tTxOX
 rwumotRqhxuX2sigLqAcQ9jNUXvLy0D9TQU7HnF
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH v4 1/6] package/nftables: add init script
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

On 26/07/2024 18:20, Fiona Klute via buildroot wrote:
> +start() {
> +	printf "Loading nftables rules: "
> +	# Run only if the ruleset file exists.
> +	if [ ! -f "${NFTABLES_CONFIG}" ]; then
> +		echo "${NFTABLES_CONFIG} does not exist, nothing to do."
> +		return 0
> +	fi
> +	/usr/sbin/nft --file "${NFTABLES_CONFIG}"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +stop() {
> +	printf "Clearing nftables rules: "
> +	/usr/sbin/nft flush ruleset

This will break existing users that manage nftables via another program (or 
multiple programs). It should probably be done only if /etc/nftables.conf exists.

> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
> +	start
> +}
> +
> +reload() {
> +	FLUSH='flush ruleset'
> +	if ! grep -q -x "$FLUSH" "${NFTABLES_CONFIG}"; then
> +		printf 'WARNING: no "%s" in %s, duplicated rules likely\n' \
> +			"$FLUSH" "${NFTABLES_CONFIG}"
> +	fi
> +	start

It is possible to flush and readd the ruleset atomically with e.g.

nft flush ruleset ';' include '"$NFTABLES_CONFIG"'

I don't think it is necessary, but it is probably better than trying to parse 
nftables.conf with grep.

(and unlike stop ; start, it will fail and do nothing if the configuration file 
is invalid)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
