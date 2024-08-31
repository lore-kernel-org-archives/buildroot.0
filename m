Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ACFCD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD76C81D02;
	Sat, 31 Aug 2024 16:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WELuyQx_gujN; Sat, 31 Aug 2024 16:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7165381DF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7165381DF7;
	Sat, 31 Aug 2024 16:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68DCB1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 558F5409F6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M6AcElvWEvF for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D4D1409F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D4D1409F2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D4D1409F2
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:57:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.123.38]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK4Z-1rtRBR43zF-00szgW; Sat, 31
 Aug 2024 18:57:13 +0200
Message-ID: <ae8a1d19-00a8-4be4-a16f-a951cba5e9f9@gmx.de>
Date: Sat, 31 Aug 2024 18:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240713192207.873065-1-fiona.klute@gmx.de>
 <ZtI7NyPyq9rU94RT@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJkNTaZBQkNK+tyAAoJEO6nJs4hI1pY3qwQ
 AKdoJJHZpRu+C0hd10k6bcn5dr8ibqgsMHBJtFJuGylEsgF9ipWz1rMDWDbGVrL1jXywfwpR
 WSeFzCleJq4D0hZ5n+u+zb3Gy8fj/o3K/bXriam9kR4GfMVUATG5m9lBudrrWAdI1qlWxnmP
 WUvRSlAlA++de7mw15guDiYlIl0QvWWFgY+vf0lR2bQirmra645CDlnkrEVJ3K/UZGB0Yx67
 DfIGQswEQhnKlyv0t2VAXj96MeYmz5a7WxHqw+/8+ppuT6hfNnO6p8dUCJGx7sGGN0hcO0jN
 kDmX7NvGTEpGAbSQuN2YxtjYppKQYF/macmcwm6q17QzXyoQahhevntklUsXH9VWX3Q7mIli
 jMivx6gEa5s9PsXSYkh9e6LhRIAUpnlqGtedpozaAdfzUWPz2qkMSdaRwvsQ27z5oFZ0dCOV
 Od39G1/bWlY+104Dt7zECn3NBewzJvhHAqmAoIRKbYqRGkwTTAVNzAgx+u72PoO5/SaOrTqd
 PIsW5+d/qlrQ49LwwxG8YYdynNZfqlgc90jls+n+l3tf35OQiehVYvXFqbY7RffUk39JtjwC
 MfKqZgBTjNAHYgb+dSa7oWI8q6l26hdjtqZG+OmOZEQIZp+qLNnb0j781S59NhEVBYwZAujL
 hLJgYGgcQ/06orkrVJl7DICPoCU/bLUO8dbfzsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmQ1Nr0C
 GwwFCQPCZwAACgkQ7qcmziEjWlgY/w//Y4TYQCWQ5eWuIbGCekeXFy8dSuP+lhhvDRpOCqKt
 Wd9ywr4j6rhxdS7FIcaSLZa6IKrpypcURLXRG++bfqm9K+0HDnDHEVpaVOn7SfLaPUZLD288
 y8rOce3+iW3x50qtC7KCS+7mFaWN+2hrAFkLSkHWIywiNfkys0QQ+4pZxKovIORun+HtsZFr
 pBfZzHtXx1K9KsPq9qVjRbKdCQliRvAukIeTXxajOKHloi8yJosVMBWoIloXALjwCJPR1pBK
 E9lDhI5F5y0YEd1E8Hamjsj35yS44zCd/NMnYUMUm+3IGvX1GT23si0H9wI/e4p3iNU7n0MM
 r9aISP5j5U+qUz+HRrLLJR7pGut/kprDe2r3b00/nttlWyuRSm+8+4+pErj8l7moAMNtKbIX
 RQTOT31dfRQRDQM2E35nXMh0Muw2uUJrldrBBPwjK2YQKklpTPTomxPAnYRY8LVVCwwPy8Xx
 MCTaUC2HWAAsiG90beT7JkkKKgMLS9DxmX9BN5Cm18Azckexy+vMg79LCcfw/gocQ4+lQn4/
 3BjqSuHfj+dXG+qcQ9pgB5+4/812hHog78dKT2r8l3ax3mHZCDTAC9Ks3LQU9/pMBm6K6nnL
 a4ASpGZSg2zLGIT0gnzi5h8EcIu9J1BFq6zRPZIjxBlhswF6J0BXjlDVe/3JzmeTTts=
In-Reply-To: <ZtI7NyPyq9rU94RT@landeda>
X-Provags-ID: V03:K1:lo5w6Fqs5uffqWCXTqEeaA40bEthmkJyOi8FSt/SoccQadMYsFa
 HrtfIL2opixDiQSs1WQckz8rksLw9cI/Jro/6LFzEPFGhL4SLtGAccDU+46T7rIOOXkvpZE
 WeSHjmq213vGC+v/u++1HnWFXV3/4TWkIDgbsO2uI97gT3ldtuxO5mJgjv01KGlrQlM0Vtl
 b4PMRmWIQIl7LpTgPBOgA==
UI-OutboundReport: notjunk:1;M01:P0:I1knHayzSuc=;S7SSFCk2gonHDA1WDEdC8YR7gFh
 +0MAbp1Her5KTugjkEYiNFf5n64gTxhKk+AS4GUUrsoCA85bPm9ekDRRrXCMNmteN7scG1yNJ
 9r16zAZKVhDPCJK+kSAlJW5PxpQWiNWKJcvKQUKeFhJfADl3Nl9zL5BRgA1WVm6i3Js4eBxzW
 TGWC+QRLt8+rFeHW8ntKkOWmGjMzsqWkvhOkcT4LiEavFvSfVSSv7+kNxe6APAf2IOBCrhwLp
 G9A/gnJhVAE0mT5qmYKHU3/V18dzDY0CKDBkv5QuYeAt3sqhoFJ/1k2x3ZuLnWB8EvNaCMtaS
 sga7vWvKEckmIe2HF3xMWVyzRMZ0y0pwu/Im/z8vdjTfsTnIwSFVdGIvI9UL6osqBHVFALnJQ
 +n8T87j7SRyS3jxSyuHL7yerXrdjgoGHjipc1OkfiIoQxV6XOyVvDZYTwzngwqLafalyjePFY
 QfDfR+PCbRMRelm29iIwtipw1uxylit8kCXH1fiSKPtvZ47e9yN/XlhGHqVUnvXT0FLxOOQTJ
 2juee+BhQCsYhzTapj7k8b901ZkKHGBA0R6pn9LEejRuvGoPZDPRNdRaQjXqfrvfvewI0DbvC
 E9nLpUaUtGn84p2ooB3CHuQCfrtA2vtQosy46zEibOJtgScWLNrqOYEHskh89X3pPzGW+/y8U
 7NtYh9E1FfsSETsZFHh1V+arx53pEMQCWcBZAIbcxZfPYyq/l2TrfH5t19m3pCj782hZKJ6Xt
 NjyKUx53LtVLGOv6zxgjJumFZyEJOQoTTfBo8g7X/sPW9F/vefujyYLjBuZXsfrzHVU0xvSH4
 NEUaQNynktEU1W5Jqi5uljdw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725123433; x=1725728233; i=fiona.klute@gmx.de;
 bh=LlpFFJ6I70CPKfZHGNJX3PB6PcSs71SLOVm3NnUU+T4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MOQvjSQxiDnFOC3x8oJD22SWEWm5feS9OcXT9RIwWHSF6hSulCZZZ8xMX66EtLWF
 AZRYre8pHYai7bErfAhhLamwQEi0KMc6KRzferC1+WD/MrXQetCo+XrM9ElVpguaP
 LCNTHilwdYS7bnUhsMq50wxWb1hq4sG3MwBuJhA6xLRMDBoGrrnULsK8lSnkJkgv+
 wN00lFcn8wuKo0JhMqhNNBol7f573b3e3dd2QrMVKGJrgMwbo4f1JDrwvJy2CQnzI
 64sJAF6tuydTQ8CrBGDjtV4fwlM+y4AopgfHCbuJu43v75KNTUQ4o/GeI/4VfjNDL
 nx+7eYXk5X9/hlanbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MOQvjSQx
Subject: Re: [Buildroot] [PATCH v3 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, all!

Am 30.08.24 um 23:35 schrieb Yann E. MORIN:
> Fiona, All,
>
> On 2024-07-13 21:22 +0200, Fiona Klute via buildroot spake thusly:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>> The BR2_EXTERNAL environment variable is passed into the container,
>> and each path listed in it mounted. This allows using external trees
>> when running a build using utils/docker-run. Testing the existence of
>> the variable instead of a non-empty value allows passing an empty
>> BR2_EXTERNAL variable to disable currently set external trees.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>> Changes v2 -> v3:
>> * Use read to make the loop that creates mount options more robust,
>>    removing pre-exisiting shellcheck override. Suggested by Brandon
>>    Maier.
>>
>> Changes v1 -> v2:
>> * Correctly handle spaces in external tree paths
>>
>>   utils/docker-run | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/utils/docker-run b/utils/docker-run
>> index 1adb02d74e..dbb9c45fdd 100755
>> --- a/utils/docker-run
>> +++ b/utils/docker-run
>> @@ -90,10 +90,17 @@ if [ "${BR2_DL_DIR}" ]; then
>>       docker_opts+=( --env BR2_DL_DIR )
>>   fi
>>
>> -# shellcheck disable=SC2013 # can't use while-read because of the assignment
>> -for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>> +if [ -v BR2_EXTERNAL ]; then
>> +    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
>> +    for br2_ext in "${br2_ext_arr[@]}"; do
>> +        mountpoints+=( "${br2_ext}" )
>> +    done
>> +    docker_opts+=( --env BR2_EXTERNAL )
>> +fi
>> +
>> +while IFS=$'\n' read -r dir; do
>>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>> -done
>> +done < <(printf '%s\n' "${mountpoints[@]}" | LC_ALL=C sort -u)
>
> This commit mixes multiple changes:
>    - using process substitution with a while-loop, instead of the
>      command substitution and a for-loop
>    - passing br2-external and mounting trees in the container
>    - handling br2-external trees with spaces in them
>
> I see you have a second patch with support for br2-external trees with
> spaces in their paths. If at all, it should come before this one.
>
> However, I don't think we should support paths with spaces. We currently
> do not, and the rest of the code base (as your second patch states) may
> or may not work (hint: it does not, it's broken in a lot of places, and
> the buildsystems of many packages do not support spaces in path either).
>
> Also, BR2_EXTERNAL must be a space-separated list, as it needs to be
> split on space from Makefile context, so no br2-external tree with
> spaces in paths can even work... (unless I missed something...)

According to the manual multiple paths in BR2_EXTERNAL must be separated
by colons, not spaces, example copied verbatim from
docs/manual/customize-outside-br.adoc:

buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig

support/scripts/br2-external splits BR2_EXTERNAL by colon, or rather
replaces colons with spaces in the variable value and then uses the
result unquoted to create a list of parameters. That means
utils/docker-run must split by colon, too, no matter if we want to make
the handling of the individual paths after splitting space-safe or not.

> So, I'm OK with passing br2-external to the container, but not with the
> rest of the changes in this file. I.e. the change whould be just that:
>
>      docker_opts+=( --env BR2_EXTERNAL )
>      for dir in ${BR2_EXTERNAL}; do
>          mountpoints+=( "${br2_ext}" )
>      done
I can drop the change to handle spaces in paths in the loop that
constructs docker_opts elements from mountpoints, but the read to split
$BR2_EXTERNAL by ":" needs to stay or handling multiple external trees
won't work.

That said, I don't really see a reason *not* to make utils/docker-run
handle paths with spaces correctly when it doesn't make the script
significantly more complex. That's at least one less place where they
could cause unpleasant surprises. The alternative would be to raise an
error directly, but I think the right place for that would be
support/scripts/br2-external (e.g. by extending the second patch in this
series to check the values after splitting instead of quoting possible
spaces).

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
