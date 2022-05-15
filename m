Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0B7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 03:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A470360E74;
	Sun, 15 May 2022 03:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzyDRhKbO5P6; Sun, 15 May 2022 03:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2605C60D5A;
	Sun, 15 May 2022 03:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 655881BF962
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 03:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 538A240987
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 03:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JH9qS23YkEr for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 03:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EB8640986
 for <buildroot@buildroot.org>; Sun, 15 May 2022 03:42:59 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id i1so11472055plg.7
 for <buildroot@buildroot.org>; Sat, 14 May 2022 20:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6n/6ES0MSddXdU9cTFwkrfQizlhK48P8olmRQzfaV6I=;
 b=pJEu/oTamp0iRaiavxPV5UistJpzwj24MIbUFf8GoqEdWe/DMyqaCvUlLjJm/Iobh2
 Iyz5qK98Q3XGOJFE+Y/bzgkWlrJHcx+NiRmefWQPZL5bfP5HmruHs1e2mPwaI7UY8mUW
 V2+ppYLfvO6CwqdRykM/BsHs6tHA5NwZVXcWjgmpDaKj7BhkUz62FrwMzvwhtHlNKsbK
 8OkJSBFKNduDN+Vjwa1I4kPRG32c5VeYc2lqkjaqjBxFPPdlcYMWZormGxNrx7jbi5dX
 /UNh7lWvR/YfAKRoHYmwPsmq8n98m3P9nZaLhWgROCuZcg2HvLcuYv8STjn6JCL25oOe
 9PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6n/6ES0MSddXdU9cTFwkrfQizlhK48P8olmRQzfaV6I=;
 b=Fv8v1ihcSnPEHodKHLbq3+xeOPvmzd7VP4XV9sW5p2BHE17Rx4lTMpOSeLkmmpjLOE
 bGP0pU28nr2rtPVGipdxNe0UTwJovxs8msVLc9phAWkyQGZxlKCJtOw9VVFX8IjX29Sc
 Cs8IkIZk6gZznehhEgqa8PAr3BK5z+NxXBA9JWPbUIFX7SRr2H3mg5VWoiJumFhsUguc
 yIVEWFqU1SwGKt+a7pG7w1QKfgvC89IR0IRYHCgAeOTwhQxiox9eQahfunPBxPft/b+s
 mdgBetdBOWWe94GWo34349SXwyQyB9avhdIH4fJEEtg+uW2N67DoL7QzSxCOczGHJHDw
 Y0Yg==
X-Gm-Message-State: AOAM530GPgkpmaNuVrEAkDAqbobWJgDElClsxllrYucOs18OJ54L24en
 CmgL4jA8NBhaOqKYNwFPgzI=
X-Google-Smtp-Source: ABdhPJxyXUAQFqZJmzvL5V/wBKpYe5ABBHGWzBzH0n1I1sEWi9vTUZx7y5uirB3OB4GySugrasKOQQ==
X-Received: by 2002:a17:90b:174a:b0:1df:3dc5:a386 with SMTP id
 jf10-20020a17090b174a00b001df3dc5a386mr1169771pjb.192.1652586178468; 
 Sat, 14 May 2022 20:42:58 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:4a48:a874:f2e2:e388:1893?
 ([2600:8802:b00:4a48:a874:f2e2:e388:1893])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a17090302d100b0015e8d4eb243sm4390385plk.141.2022.05.14.20.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 20:42:58 -0700 (PDT)
Message-ID: <faa43149-a101-746e-89be-2859a057e1d2@gmail.com>
Date: Sat, 14 May 2022 20:42:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20220511001947.2112747-1-f.fainelli@gmail.com>
 <YoBg1aDzr7cEYB/l@antec> <14506c30-bf1c-71b3-bda5-b9105adf85b4@gmail.com>
 <YoByu/uEWlDx+AT9@antec>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YoByu/uEWlDx+AT9@antec>
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Disable build on OpenRISC
 with musl-libc
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
Cc: yann.morin.1998@free.fr, musl@lists.openwall.com, mmayer@broadcom.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 5/14/2022 8:25 PM, Stafford Horne wrote:
> On Sat, May 14, 2022 at 07:14:21PM -0700, Florian Fainelli wrote:
>>
>>
>> On 5/14/2022 7:09 PM, Stafford Horne wrote:
>>> On Tue, May 10, 2022 at 05:19:47PM -0700, Florian Fainelli wrote:
>>>> As reported in the following autobuild report:
>>>>
>>>> http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5/
>>>>
>>>> cpulimit does not build due to a lack of definition for elf_gregset_t
>>>> which is not currently provided in the or1k musl-libc port. While this
>>>> is being worked on, disable the build for or1k and musl-libc.
>>>
>>> Hello,
>>>
>>> You mention this is being worked on.  I am curious who is working on this?
>>>
>>> I try to look over OpenRISC stuff, do you need me to do anything on musl for
>>> this?
>>
>> I posted this:
>>
>> https://www.openwall.com/lists/musl/2022/05/10/1
>>
>> if you don't mind reviewing, thanks!
> 
> No problem, I don't have the mail in my inbox, I've subscribed to musl now.
> 
> Put some comments below based on what I had configured in glibc.
> 
>      diff --git a/arch/or1k/bits/user.h b/arch/or1k/bits/user.h
>      index e69de29bb2d1..3405bf771c0f 100644
>      --- a/arch/or1k/bits/user.h
>      +++ b/arch/or1k/bits/user.h
>      @@ -0,0 +1,11 @@
>      +struct user_regs {
>      +	unsigned long gpr[32];
>      +	unsigned long pc;
>      +	unsigned long sr;
>      +};
> 
> OK, matches glibc.
> 
>      +#define ELF_NGREG 34
> 
> In glibc we define this as 32.  Howerver, we define elf_gregset_t as
> elf_gregset_t[34].  I don't see where ELF_NGREG is really used so I am
> not sure of the impact to this.  I also can't remember why I set these
> different in glibc.

If it this is meant to be number of general purpose registers as the 
name suggests, then it looks like 32 would be more adequate.

> 
>      +typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
>      +
>      +/* or32 does not have floating point support, placeholder */
>      +typedef unsigned long elf_fpregset_t;
> 
> OpenRISC uses the same registers and floating point and integer. This is defined
> in glibc as:
> 
> /* Register set for the floating-point registers.  */
> typedef elf_greg_t elf_fpregset_t[32];

OK, I will send a v2 with those fixes, thanks for taking a look!
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
