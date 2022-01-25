Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021E8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9912E60B3B;
	Tue, 25 Jan 2022 07:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DffN0ZC1FvQ7; Tue, 25 Jan 2022 07:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D409D60B22;
	Tue, 25 Jan 2022 07:09:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C11791BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF9BF410B5
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WJ4L7oUzsxo for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:09:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34F3B410B1
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:09:09 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CFwxn7obvDzPJCFwxn2ZyK; Tue, 25 Jan 2022 08:09:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643094547; bh=XrO9ZvQZFxdvHOqKUrMPnSGaFfnA95ypmWvxM4Ui96c=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EARRUIi2Xy6ODDdNJSRat9ItLYjH/hL7maUkawhxpMLXPsl/las5jBsYm8dOPdoXT
 lNwj9ZU2+z2+blZQ5u7UodjftQVW6G7YaS1/juvMJEMGQ3sOndtWDhetRcODKpmEjv
 6CpYxnEsLHqnUgx3jh2lnoitugWh3RFNQ62QiY/pxbm/k+5nq/+60Xb0RIu+pWsvWM
 5FWwqoDkalv5dUvbLJtp8f5agwb9ckSGeevGnldnY7WZaaSbC0xtOBr7wKNTdEvA+D
 UqhF7Lr0e9dz/hqEo2G+gk6daC2dh46sHjAS/Is5VykoOPl7DmMY2NI7NYKjwus3Y1
 cZ+jChgq473fg==
Message-ID: <78204a26-75d9-ef6a-bf7f-dee8b47fa508@benettiengineering.com>
Date: Tue, 25 Jan 2022 08:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220125070545.09FA6401E1@smtp2.osuosl.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220125070545.09FA6401E1@smtp2.osuosl.org>
X-CMAE-Envelope: MS4wfCnn4weVd5i9gNmrmYEuqFucKJFmKw2gJlA2199pp+rKuhVHxnleKBfE9BwyunKmyvbjTGFpyCHPjKsrmLLMARa5uUXmMCik0fUeP7pK5QqjIbl20Py+
 dnOgQpRtnv65uYdUmHmOs6aCTk/UwjhoEHD+XCCZMRGvI3udOAnmY+T5KWBdVBNDHYjdXOODbJpYfFPtvINzv3Pzl4YAFy+3p/3Ta27OBHE6thDE6cMQakmE
 GCL692l4kFhesfzR1Tk63EtPpVC6MjL9xZ4AQuUL8iyam9lXyX2mWkK7ZAV4CK3x
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-01-24
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

Hi Peter,

On 25/01/22 08:05, Thomas Petazzoni wrote:
[SNIP]

> Detail of failures for 2021.11.x
> --------------------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> microblazeel |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/e02c7a0e22d8eee226e5c906537f7dfc559e067e |

This ^^^ is fixed by:
https://git.buildroot.net/buildroot/commit/?id=540029eb4550760c2190a18ecbf0cb4391bb1dea

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
