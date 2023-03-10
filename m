Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14820C6FD1C
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 17:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63E0741695;
	Fri, 10 Mar 2023 17:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63E0741695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7VtRVPBtMse; Fri, 10 Mar 2023 17:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8743F41696;
	Fri, 10 Mar 2023 17:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8743F41696
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22BE41BF3B8
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 17:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F09FB61ACE
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 17:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09FB61ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3hvAyigspqZ for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 17:53:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B23461ABA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B23461ABA
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 17:53:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 8927F2003FF;
 Fri, 10 Mar 2023 18:53:13 +0100 (CET)
Received: from [37.167.136.57]
	by webmail.free.fr
MIME-Version: 1.0
Date: Fri, 10 Mar 2023 18:53:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <997d670a-8843-0686-995b-63b671cca1c5@mind.be>
References: <20230305232504.232860-1-ju.o@free.fr>
 <997d670a-8843-0686-995b-63b671cca1c5@mind.be>
Message-ID: <6e9d8313f1d606ff3da0495c77c023f8@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678470793;
 bh=BV5mzEQiuM4AqAGc0IPtupGW6tkDXYWZsWVte/ySFSw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bmlkOr5MObGaInEiuPodwnHGmCl78St1gLbrWgfr+qln8FwY8ILSSRarN/6mAFEQA
 e6lla7z33Qm/KR78vOpo6xdxLJKuYEU8LQ9e+RqpWyPdcZMTayT4CS23DKh1jfJtqd
 H0F2QtwChHKkq++hxIzXMqx3lTGHj5/v2wdir7k5q8ZVYGlU1/8qgp4U2OiEuyZVQL
 NC5s43sHoRGQbjAzjws67VLczTjhwMTlSXV/sL++LQ0Pi1quZ/LFDsTWsnc5a80xlL
 Ih5OEoHtRU7yx/LRpxmyehCnOL/rmtxkDPh/XS6i1P1G6eyrJKwpyRncwMKegUQmPL
 s4hMymhqUEVXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bmlkOr5M
Subject: Re: [Buildroot] [PATCH next 1/1] package/bridge-utils: update
 project URL in Config.in help text
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On 09/03/2023 21:04, Arnout Vandecappelle wrote:
> On 06/03/2023 00:25, Julien Olivain wrote:
>> The old URL no longer works and shows "No repositories found".
>> Replace it with:
>> https://wiki.linuxfoundation.org/networking/bridge
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
>  Applied to master, thanks.
> 
>  Why did you mark this for next? It's clearly a fix, right?

You are right, it is clearly a fix. I overlooked it as it was mixed with 
several
other improvements and bumps for next.

>  Regards,
>  Arnout
> 
>> ---
>>   package/bridge-utils/Config.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/package/bridge-utils/Config.in 
>> b/package/bridge-utils/Config.in
>> index de5883f063..2d886e2cb0 100644
>> --- a/package/bridge-utils/Config.in
>> +++ b/package/bridge-utils/Config.in
>> @@ -8,4 +8,4 @@ config BR2_PACKAGE_BRIDGE_UTILS
>>   	  added. Instead use the bridge command from the iproute2
>>   	  package which supports more features.
>>   -	  
>> https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/
>> +	  https://wiki.linuxfoundation.org/networking/bridge

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
