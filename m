Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7866BC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C93260EFC;
	Sun,  6 Aug 2023 21:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C93260EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjhg5cgwJxPb; Sun,  6 Aug 2023 21:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6228860ADF;
	Sun,  6 Aug 2023 21:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6228860ADF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56E891BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 971A9409AA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971A9409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1drkBP35USzw for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:54:56 +0000 (UTC)
Received: from smtpcmd15188.aruba.it (smtpcmd15188.aruba.it [62.149.156.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 059CB40022
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 059CB40022
Received: from [10.10.6.40] ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Sli7qisSZQDLBSli8qQVaD; Sun, 06 Aug 2023 23:54:53 +0200
Message-ID: <dd298b06-7a3c-4817-30f3-bdbcc2a5121f@benettiengineering.com>
Date: Sun, 6 Aug 2023 23:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230806183738.257006-1-giulio.benetti@benettiengineering.com>
 <20230806233208.67c2657a@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230806233208.67c2657a@windsurf>
X-CMAE-Envelope: MS4xfEENliFEdy6ENQ7wxR0ig3tmJCl4WVqjF7l5zRXf/dTkPZtYBl9gsl4aqBfrDvblGb4xpZ2MGAqOhL4GQSzBmDQyYv5fkUcBsAkoYMq4GntnBmVXIfWu
 nh419njbFClpE7BM+Ei08sQK654c/KnX1Z86FzsY8rTGgPIgj33EYKeGuQq/asKN7NJStk0RdkK4AnBnQ8EKO//3q3X4n7rTDhYZbSTaIyhZL/mn4XqNbRtA
 2a9+At/exlGSn0pPGTXDCP6uLzFd6vSehKBfRE36uKzQyXfblg05WwJZT3XKHJsoCWt795eYAopok7mWdFBl1rYIJpk+wtEU93jFLFoU+Jm/hMLi83+93HJw
 zNFP8zrK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691358893; bh=lfpN+D/51KbFTu0bRZg3SCuNclVdiTwEK7nObTu/Ix8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EQfugej+N9wVjKJQNr1W5x5EJQImcXFhXecoSwE+A50z/nihRh+wbuQTKEWit6Bjn
 cyNeTsq4wSJSLI0aRwx1UXhk37b550Px6glzOR9Vr6GvX8kNwkIIwYlLxXvKZbn5In
 12vXN05Tc2u95PElXNI9i66t4ZlJbTMvYwwcgtvoVF6CUxkYRw6yC7ivZ+m0sqgSFW
 qdBuKxaIi7sw4Kz4HZeD++hWTL0GL48TThIg75SVYevw2KpM44O0Fa6+kZ3C7E7YmK
 rbWqMbz/ZxvThqdd4Vsi0DnnxNWUxuLo/IDPf6+va1aCzKIxzoKqT+e1Og68Sa2I6z
 0p7+siXG6Q6Yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EQfugej+
Subject: Re: [Buildroot] [PATCH] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_80786
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 06/08/23 23:32, Thomas Petazzoni via buildroot wrote:
> On Sun,  6 Aug 2023 20:37:38 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> openssh package fails to build for the M68K architecture with optimization
>> enabled with gcc = 12.3.0 and it's still present in gcc = 13.2.0:
>> http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/
>>
>> It's been reported upstream:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80786
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> But this commit is only introducing a hidden boolean option, how can it
> solve any problem on its own? Can you submit this in a patch series
> where it gets used at least in some place?

This is to ease this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/ZM/aaG0d/pzoYgp1@waldemar-brodkorb.de/

so once this patch is applied he can use BR2_TOOLCHAIN_HAS_GCC_BUG_80786

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
