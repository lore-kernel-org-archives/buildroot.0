Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A645BC04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D6C41DFD;
	Thu, 10 Aug 2023 20:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D6C41DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBMPkxur06Qo; Thu, 10 Aug 2023 20:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48D2541E05;
	Thu, 10 Aug 2023 20:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48D2541E05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 246F01BF5DF
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 098F440A70
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 098F440A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsauDMrYKA4W for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:17:40 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B005D408D4
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B005D408D4
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.222.147]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1pXykP0IdQ-00wYX5; Thu, 10
 Aug 2023 22:17:37 +0200
Message-ID: <182e39d0-d141-4edd-b7ca-f4eddf291dcb@gmx.at>
Date: Thu, 10 Aug 2023 22:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20230809220514.2089980-1-thomas.petazzoni@bootlin.com>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230809220514.2089980-1-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:O6KdF3lkXWhV69R7ibcAfFlewEAEc02wOs244CpOUDv+TJv8QAP
 IhOewBU9hn+nSaXrn6MbbJTp6IoY+xcoicBHAa+qMIeKnSVSI/0HqXvEC1L+XblIDqoiU1c
 KhgAPqCL3frouzWh1D6O0aUHegkw9gx9StZFmTW8fry38wim4w2ZUPGn2T31eh4AXhqarBE
 aYop6l/WnzEYzqAwizUJg==
UI-OutboundReport: notjunk:1;M01:P0:EsRVdVMySQo=;KGy509B9kpVoRBNm/W752/By4Cv
 CrraWx8RUrWwwi88oymHoPmAOpMtl92VdUR5zWQU3sz3jNQbytOyknYf2NPdLflwlmKTghoJ+
 Lz5E9WoGYd2lBEyiyTKshdEYo4QAEKG41hKoHHlBYUQ7OZsbqkqw5AcgkEwrgR/akUDUwSKuW
 b597GY3sAQxbx8TL5iSBbUyTwIoJObr2S3LevNwoycBGTDJn37CiEuFkEA6+AI1ZiMfJriVbW
 BNMeg73B+7E7PCbNzIn6Pr6H5DuRTFZu3JDo9VyQIaxddKv9oWxJaWjNuDmcqA0+U/ulrtfPz
 OfTMko0NVTkKK1IPzfiinqDTGn1xt0v9JI4D70PjSwtmXF2S/w5X8sQcvECIED9iX4ms9Wp8/
 SLvd7w1xmliT44pq9Fi6IckYN1f89zPiicBpgqqTUuIfzTpM9znTugapfXnuPwf6tSaqZo17m
 no1PhrjKuml35lgNGWQSe37FrPFydYE2bb3rBp1wbe+rx/zU1uDk5LY1hb3oewVdW4cvIhv1w
 ro9/rH87hP6V+D8LMfGr9BtaBpy7Jeb6vrJEfprJL6Z6o1kz6RRbmi8y61l0wUw0xgACle+20
 VNu4GUVPNlPLLEBhqmSaa77lELaa6WIHDhGYTdWLarQF0SnoA3zLzWrEV552UkYs98Upf2cCd
 udhbvdkt8atWmGhs7EpOf/GFk6pU+2JXd7MVFtsBkFozFUp/r0iYnhD5Vb1+mNPen2X/5UJdp
 rO0SsUtS7S7sZjDih9tYt8MY2HeWRfku3jdw9VXvta9JFDH/VxQcC+gdqv5YjUbtbuZqePd8H
 646IFDoNN65n4otOd+JBCW1gOSWVWu+XF8NjmXyRaR0hNynmSzsY2TLM2Nl0Vb5/qoNgONy+2
 PtsmqZTUUbNvM6qWfKQr33mOXuaqBkGbXMcbNWMCD100fyCQ5mLbBHFqLk8prjfVBiPkvuF3U
 tJKZ5y6a15Z5K6ZqZuDIP2TQgGU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691698657; x=1692303457; i=dalang@gmx.at;
 bh=NNII+ql2OfEhPl/CfbtGd+/QMuCmstnzYyNffK5N9fo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=thKutpMwYd3pZY+audSEudlnDfpFhl+kGSZdb9ac0UuMsv+41CFmFZbV4Vy2ZPyslZKcYk+
 igYuS/8+TDNFkOnLw+UQR1ZpnIbELqMWACXFYdp/BDpNc5turCAMdalQ5++rH+PBQdxOAg+Zs
 H0KwG3MXj4NtF8T0aPfQuNU51z+WLnuL6n0+hnggOYU1kLhyis103Ag0sm9og9hEASUy6N9ah
 TLprdHt4lvFF4wfuYhVUGYIUvNA5GcmbXzikbxp9L/p4xIQXLB7UTFqkfgoNzhsLHsepBOszp
 a9M6DbF9KLdC5goRLPB3t4lmWfFe9J/hn/zPuEp5yVcNKZR4LpBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=thKutpMw
Subject: Re: [Buildroot] [PATCH] package/swupdate: install headers at the
 standard location
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
Cc: Andrey Grafin <conquistador@yandex-team.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10.08.23 00:05, Thomas Petazzoni via buildroot wrote:
> In commit eb2f2886b2364e5b6a0867f55106bf83acb064e7 ("package/swupdate:
> add staging install"), the swupdate package was changed to also be
> installed in the staging directory, as it provides an API to external
> programs, through libraries and headers.
>
> Back then the commit log said:
>
>     This patch installs headers and libs to STAGING_DIR, to prevent a
>     header name collision a subdirectory /usr/include/swupdate creates.
>
> And indeed a custom INCLUDEDIR was specified. However, installing
> swupdate headers in /usr/include/swupdate/ doesn't work well, as
> progress_ipc.h (installed by swupdate) does a #include
> <swupdate_status.h>, which doesn't work as swupdate_status.h is also
> in /usr/include/swupdate/ instead of /usr/include/.
>
> To address this Daniel Lang submitted a patch [0], which was proposed
> to upstream swupdate to fix this header inclusion. The patch was
> rejected by upstream saying that the swupdate header files should be
> installed in /usr/include.
>
> Currently, swupdate installs only 3 headers files:
>
>   /usr/include/network_ipc.h
>   /usr/include/swupdate_status.h
>   /usr/include/progress_ipc.h
>
> To the best of our knowledge, this doesn't conflict with any other
> header files installed by other packages. A good proof of that is that
> even Debian (which has many more packages than Buildroot) also
> installs swupdate headers directly in /usr/include.
>
> In addition, the original submitter of
> eb2f2886b2364e5b6a0867f55106bf83acb064e7 said "I'm not remember what
> was a problem. Probably network_ipc.h but Im not sure now. I think
> it's safe to install this headers to /usr/include w/o subdir if this
> collision was met only in my environment. PS: currently I don't see
> any collisions with this files."
>
> So, we switch to installing swupdate into their standard location.
>
> [0] https://patchwork.ozlabs.org/project/buildroot/patch/VI1P190MB0493D233ECC579510F8C0FC69FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks for picking this up and investigating it.
And sorry for not responding earlier.

Tested-by: Daniel Lang <dalang@gmx.at>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
