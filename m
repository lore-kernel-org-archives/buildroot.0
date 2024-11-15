Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A561D68BC8
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 16:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1912941B90;
	Fri, 15 Nov 2024 16:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IINCKdh2rq-x; Fri, 15 Nov 2024 16:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0E0241B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E0241B4B;
	Fri, 15 Nov 2024 16:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE911EB8
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 16:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 398E28488C
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 16:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4DAhx0tiSZB for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 16:02:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3CAE8488B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3CAE8488B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3CAE8488B
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 16:02:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.114.118]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDIo-1tcTpJ1F5s-00eByO; Fri, 15
 Nov 2024 17:02:41 +0100
Message-ID: <cce5be8a-6fe8-4d70-97d3-9fd63ab6733f@gmx.de>
Date: Fri, 15 Nov 2024 17:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>,
 Buildroot ML <buildroot@buildroot.org>
References: <1af29766-5cfd-47a5-adb5-d90ff42dd095@gmx.de>
 <e3e6612f-a9dd-45a6-89eb-9165788c5b8b@green-communications.fr>
 <b25d0a28-cc5c-451a-a719-e932f1fa1aaa@gmx.de>
 <4f4607c1-7aa7-4b1c-9d0d-d8fdef58c973@green-communications.fr>
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
In-Reply-To: <4f4607c1-7aa7-4b1c-9d0d-d8fdef58c973@green-communications.fr>
X-Provags-ID: V03:K1:GN7ut8cyJTmvQ1+U23lqUTgAzn0v/L+FJQvgwUC6eyhJ9CHcE9K
 q4Z1XYASKE4joycWdKeydYW/wJsYUhiRA0hE6pAEGkLaQSsAPXdVIpkYz9cUPbUk4o76muI
 FZB06jGLpoo2ZRWpVcqDv4NbeYO123AN5/r9Gw/j4nNJewQH8614pQnkwgdBh6ktbOvtLuU
 yL2HU3YEAA5wn3egjT/vA==
UI-OutboundReport: notjunk:1;M01:P0:0bsTLDrTqA4=;VicxRl033VbPKVxTU56SnLG2lTG
 I5HxRYmQhBK4jvxp6pNHbOAua5nYuXjfk4YSjWxEauI+2SnyV44uLTJlSajl1ZNLBkjv3X5QT
 as/37W2eyUay+7/XzSImpt4Scy5iZLUcfP6zALdNZel93SkLRrXSh+dO48yl3Ow2vni112OWI
 lYtoGtlYcrQ7tel3P5Fc+zpLaj8xnTK7yG5Hx5J7I1PzpHPYt1vxaOUVehv2XB35HLLMKGkqE
 5ZY6mlbsLEcxzp//takYN75J99A4dcgSHPEDnhEjvakB4S293dZwfhQDKmOp4D+KQHFNsm1xn
 kPjhhmNtvMAubkkuKJ4zGfsf6Eu4kkO97ZJ8wDUVySc8qa+Hb/PBPcV9JsMJniJAd4AWj93sS
 Fr1GI3YEAoi/OtlrGfZLJEkHocBWhDbW0pGWujTjdMlqQ+8ujAPBHdoN0To+RbicomqQlu72P
 ixblfegYMnsRNoIztH3fktw8VS8HFev9R9qxzSK6ysKMmMuKKc5XNuausnBEsnKnZfV0Qkl7a
 +yyI4NPP2KYI00LrdyM0iHrcjo3SHReCjYKsFyvl/vW7MgjCTPAX37KDWQGtzYeOkZsrOMT5T
 TqFg7P7or/nH7jpbn7oOisNJAhIK4MEODjCDirVaTcRhRs6iltnVqr4Xq0i/19wyToZ5hKxCK
 /VotChlINTKKNoojFQYEh8FeISJJC+PREYQC4WgFDGk+yxaxa9MOyq7bhq8ZXoJFv+rKjj5yO
 depRAzB5vzJRhOfImiVcHdmDNKJoXHu8PwreIZutnvwB+bUiS5D57EFC8YAtVwYy4hWgjneKs
 gwJtOxOVfkjjLUhDp40+/XOlbP59rngy0xQwR6tNFw6oAA0omcgRMqSP5mmh9JgviklA8QHM1
 E495WHdUJwliWrmqjZNc4KjwOsfve1xURqiHOUf8u+VKamQ8G6+lWxbX6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1731686561; x=1732291361; i=fiona.klute@gmx.de;
 bh=hZEv3YMT90TJ2bV4XOiRNPmYwVa39wmC5uVD7TGjC8c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BB3rY0XT2Q4xFAXoBZkO8JHmUSoLI7M0+b1MPop5gXDpv675PZ68EqMELoInyg0o
 Rrq4XJHCwPmIrnVh2E2pHaFm36qhrYDjEBqF+9IX5JoamP5wv2ogKErc6wGiLVNEe
 aULzdjIxcArJ36ouGS5+SRibo0gxFplt/jRUTX4d52jc1Qm/tJ1kH6NGKzJH/XyNz
 lM6HuDqIdXNy4FLK0qQFaTBXoAaRhRv1a7ZISKyCnwlXKJMAc7nadvcCsB1AE9deP
 w4MmM343IxXEhV4DoGuh5j2Evcny5NtjxY++LeurwtLemezmaG8iLHJ8rJCvxcYYn
 +aKqbWILLJqAKoC74g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=BB3rY0XT
Subject: Re: [Buildroot] Consistency check for UID/GID tables
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

Am 14.11.24 um 16:25 schrieb Nicolas Cavallari:
> On 14/11/2024 12:50, Fiona Klute wrote:
>> Am 14.11.24 um 09:35 schrieb Nicolas Cavallari:
>>> On 13/11/2024 11:54, Fiona Klute via buildroot wrote:
>>>> Hi everyone,
>>>>
>>>> as pointed out in the documentation [1] autogenerated UIDs/GIDs might
>>>> cause issues if they change during updates, so one should set stable
>>>> UIDs/GIDs for users/groups owning files.
>>>>
>>>> I'd like to create a consistency check, to make sure that any files in
>>>> the generated image will be owned by users/groups with fixed UIDs/GIDs.
>>>
>>> Isn't fixing the UID/GID of users enough ? Since Buildroot typically
>>> uses usernames to define permissions, making sure users never change
>>> their ids is enough, as long as user names don't change. If the username
>>> changes, we can probably assume that it is intentional.
>>
>> By "consistency check" I mean to verify that exactly the expected
>> users/groups exist, with the expected UIDs/GIDs as applicable, and that
>> there are no files owned by an undefined user. I want to do this
>> automatically (as part of the build) to ensure that nothing is missed,
>> including on updates or changes to the config.
>
> So you want to check that the output matches your expectation and fail
> if it does not match, while I want to force the output to be the
> expectation and make Buildroot refuse to use anything else. Both are
> equally valid ways to achieve the same thing.
Sort of. I want to detect the case where the configured expectation
doesn't cover some aspects of the build result (e.g. a package update or
new/added package adds a user/group). That's not a bug in Buildroot as
such, but I'd need to adjust the expectation *and* handle the change
when updating existing systems (which is also outside Buildroot).

The part I think would make sense to add to Buildroot is (optionally)
checking if a configured users table covers all users/groups created
automatically, or (slightly less strict) all users/groups owning files
in the rootfs.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
