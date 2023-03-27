Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A040EC7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 09:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 167BC40E46;
	Mon, 27 Mar 2023 09:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 167BC40E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0v7y9qJRHMb; Mon, 27 Mar 2023 09:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D45409FC;
	Mon, 27 Mar 2023 09:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28D45409FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9E9F1BF40A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 09:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF52B409FC
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 09:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF52B409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SURg6Mu4w8Bw for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 09:42:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6692A409DD
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6692A409DD
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 09:42:57 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2SXX-1qSLM81Dyx-013uZv for <buildroot@buildroot.org>; Mon, 27 Mar 2023
 11:42:55 +0200
Message-ID: <4c0755eb-8986-3edd-6435-33f92b5e4d25@green-communications.fr>
Date: Mon, 27 Mar 2023 11:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230327081824.7259-1-nicolas.cavallari@green-communications.fr>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <20230327081824.7259-1-nicolas.cavallari@green-communications.fr>
X-Provags-ID: V03:K1:L3Rn2kS9YP2sFUlMRHz2KYBSXPQa5vz9fQnTFYJiihU5iOy7vws
 KCQGoKna2337DtOrkStr8uvJvi+Mm2QsmQjdgFj2aIHqrfvi1c2ZQqJscOhpn4vcEEDvKd/
 5u5Cp3QkWtK0jgTXby+56G4dFoFpn+1GpN9WwFTMS0/AAqQ8kkhc+IqQOf6TJwGdlBYfhzp
 x/8CJ4F6TAq3Cgp+DCnaw==
UI-OutboundReport: notjunk:1;M01:P0:YCRux6YMZR4=;2CiVFasL4OR7gpKXgOcSviw9tfU
 lIyQZvYC39O3rUM4J+W162onXNIKlkNDBHVHt8+X7994B3rq1kTfbl9Nqk1BZDhtRRDvIE1Z4
 cpBMD0c1VIplYUzcrDRuFClsBRBpPmDFSGPuTNf0523VhTzpAvO5biP4cTw8XO2/azusdYrTd
 opg/n906Q+dH47RTe3s88tQF/mhMtQrrv0eQc8P0rr0waWLGUhrY1uax0mS5d5fXwoloQTP85
 6i1dqrdrWIYUyf/001V7Ne/pv4d9ea1Ds+zdx/g4prZ1s36LL+BgB4oxpYQ2dcEZh/iu5Jpa2
 31eGyloCt5ywNo8g/GCsi2dYnIFMxAfdLjcflF2KCta8SN8toiSQRuK7BvfBFGp74dcvJG8LA
 iKtouaGZCEhpGKxI7TfY5HJySQnh8W2d4OuMV1WxTRsrgeu9m3VkZ+HqK8onuHPGQ4XLNl6zo
 frd+RaPlsegr4PJkH9zDJtxZJasY5/VCywFpjwB9F7/L+dkg1+kK/vdv5dh+xXaOZozGqE8hA
 McW9IXPvRLidYO0tbWGomAf+MY5hW7bzNEC0EcpI5ZTODsx7urrn7WBQMo23vcFV37tvBmVBy
 TiM58X1TlaFuGYq+U00xhtdMti/vSXvUrLGvpYJ7cYuVlhvJe3x7kKTwtzAecYA+7s1EtHc+l
 NUnb8brNuE2cqbIecW5HDsaP0Vwf2qWuIaBsJQOwPQ==
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.6.3
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

On 27/03/2023 10:18, Nicolas Cavallari wrote:
> * Remove patch applied upstream.
> * Upstream fixed building inside the source tree, but still does not
>    recommend it, so keep LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

This patch is broken, will send v2.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
