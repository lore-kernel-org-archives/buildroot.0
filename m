Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15BAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 13:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65EAA40C2E;
	Wed,  1 Jun 2022 13:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSgLeETnMg4l; Wed,  1 Jun 2022 13:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EEF74052A;
	Wed,  1 Jun 2022 13:14:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C24DE1BF3E1
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 13:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA58E83032
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 13:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvU7vZ0E3hZi for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 13:14:14 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F9CF8301D
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 13:14:14 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wO3xnhTyuLCiqwO3zn14Xu; Wed, 01 Jun 2022 15:07:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654088827; bh=l0xYKfhpwYaQod3kOnASIzr+jJrtzxzWR7wJKoygZ3s=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=mNNUae+E4rmnwL5Q2owSqk2NnxNbPf/W20uZcqEKaKAYgBOLPqUNyZdG//Q1FYkgy
 Lcr3vT7sDJRyqgJSC/0xJUAQxjarBF5424AAALojWM1c4oCfh8M4YTHpu0vBNO+9SV
 79zWadOzp4u2ouyBAdf8U9lymAGCu2Cc8PcsOSGsRt1hY/sVa/6AoTjaMVgzut4tPR
 Gk2k2Ug+kPoc95qv8VCDHrntk/tlwwV+Gic2FEbsSBizK5o/YhqHZAbB0h5Dh/c1vb
 Er+tv7LkvWA0hxQ2siQUUozOdZhqrKEHubGPsteQ/mktDK48+MqF/pEzTGkMaEa90z
 ALSYkONXUpQ/w==
Message-ID: <7c455f6a-a5d0-0e8c-402e-e8ab0e3121f5@benettiengineering.com>
Date: Wed, 1 Jun 2022 15:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220531210109.472212-1-fontaine.fabrice@gmail.com>
 <20220601144416.5567c828@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220601144416.5567c828@windsurf>
X-CMAE-Envelope: MS4xfA3VJWcYeBv8mcD9eNf1i5UuThYn9S4rgstR/n2a8rsCfoeKlx2DuksCgBNlAHyogeYzPj5RCsSE6t4DxnuBUyg8gliPxn2nm6t0KMZ7cMyl4lJzKAEJ
 rE8NokcmdZAwe2KjtCfoLRznRJC9ozzhh04QiSDcNeUaWlmkmz1/a+oH8ym85m4baOJix8bLhUHWI7JkA2UD5HMAuUL7gJ5NwT825CmMlv0a9h83R6MrghhL
 dZdw2zTy4OrciNDWq5k0KkuxMUtfqlHKRYNWhcpWc8Sjerbo1+6l5zhaLUZcehaZzY4OnTLK+DyjCF/jbYWTZdMmc0jGv7tRiO0y0WHplK1Ipi6FODIdrMQp
 OPvJYZhG7/N+3Pj7sHmx8JI68tKnqsj+EGBM78fT7kotTMUjMvQ=
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: sh4{eb, a,
 aeb} are affected by GCC bug 101737
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

Hi Thomas,

On 01/06/22 14:44, Thomas Petazzoni via buildroot wrote:
> On Tue, 31 May 2022 23:01:09 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> pixman fails to build with BR2_OPTIMIZE_S on sh4{eb,a,aeb}:
>>
>> In file included from pixman-fast-path.c:33:
>> pixman-fast-path.c: In function 'fast_composite_scaled_nearest_8888_565_normal_OVER':
>> pixman-inlines.h:586:1: internal compiler error: Segmentation fault
>>    586 | }
>>        | ^
>>
>> Fixes:
>>   - http://autobuild.buildroot.org/results/c9d35d5975311a191dfbe12291398503987e804e
>>   - http://autobuild.buildroot.org/results/d34b8672f6211d60af4122bdd94fa8c2f4f4bf6a
>>   - http://autobuild.buildroot.org/results/933c4a2e73c987573ecc97172f442b78199462d5
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>   toolchain/Config.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master after changing to use BR2_sh, as suggested by Giulio.

This patchset[1] is a bugfix similar to this and still produces 
errors[2]. Can you apply it since 2022.05 is going to be released?

Best regards

[1]: https://patchwork.ozlabs.org/project/buildroot/list/?series=281093
[2]: http://autobuild.buildroot.net/index.php?reason=sg3_utils-1.47

-- 
Giulio Benetti
CTO/CEO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
