Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3710C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0B560EDE;
	Mon,  5 Feb 2024 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E0B560EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkhN59mSgAKz; Mon,  5 Feb 2024 13:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05C560E43;
	Mon,  5 Feb 2024 13:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05C560E43
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6529C1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48F70408D1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F70408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sO1CLjg4yxms for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:18:42 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 838DA40111
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 838DA40111
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 474BC2C80BF9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:18:40 +0100 (CET)
Message-ID: <32c71490-c8f7-43e5-b7c8-091935636340@bubu1.eu>
Date: Mon, 5 Feb 2024 14:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240111053157.2928259-1-james.hilliard1@gmail.com>
 <87plxbta1d.fsf@48ers.dk>
In-Reply-To: <87plxbta1d.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707139120; bh=ZHbkIvPR69edU9tLU/tVxZPvHRIgWBjxoOm3ImalFMk=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=AUcDsqrPtaRIVL3X++N+pov78B+67ftk6ub7YuaKb2S7BnRO55vtZFKoM7ZLVoKZt
 jJOHBLTYM5WiRSjiaZz4zbDHA6fLj4VOSEslDRu+DNHDtbSs1glvRA0fmoEteg43oN
 9tlZyPccXrmoVlYzcujHbYu+bFLu+UYNnLz1JMBL9017SnYPsPSORCpvqzmPbGs/Tp
 dQYkTR75sxEkKVRCnsQ8X5YMLLQMOsEoUwzP581kJMMs8TKeDYsc8L60TSHp4pbQBK
 bFxOsV4dCI3+bfX05oR9nKeyDYaj/TcipNbRMLELenjtQeYVf+sDxTSYeSzQymO2IG
 x6rodIsSbpZcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=AUcDsqrP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to
 version 0.18.5
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, James

On 05.02.24 12:39, Peter Korsgaard wrote:
>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
> 
>   > License hash changed due to year update:
>   > https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/
> 
>   > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>   > ---
>   >  package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
>   >  package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
>   >  2 files changed, 5 insertions(+), 5 deletions(-)
> 
>   > diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
>   > index 29852a51ed..7b5dc1e29a 100644
>   > --- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
>   > +++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
>   > @@ -1,5 +1,5 @@
>   >  # md5, sha256 from https://pypi.org/pypi/rfc3987/json

I think this comment is pointing to the wrong package, maybe some 
automation went wrong because of that?

>   > -md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
>   > -sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
>   > +md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
>   > +sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  ruamel.yaml-0.18.5.tar.gz
> 
> 
> Hmm, I get a different hash:
> 
> ruamel.yaml-0.18.5.tar.gz: OK (md5: 24fac3544a3c7bd7eeaf6e4f704a056e)
> ERROR: while checking hashes from package/python-ruamel-yaml//python-ruamel-yaml.hash
> ERROR: ruamel.yaml-0.18.5.tar.gz has wrong sha256 hash:
> ERROR: expected: ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0
> ERROR: got     : 61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e

This is the correct one according to https://pypi.org/project/ruamel.yaml/

> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Any ideas?
> 

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
