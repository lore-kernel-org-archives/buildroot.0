Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC64C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 00:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C2640888;
	Mon, 27 Dec 2021 00:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fg6sQsHeKJSt; Mon, 27 Dec 2021 00:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F897408A5;
	Mon, 27 Dec 2021 00:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FECC1BF97C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 00:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3984840963
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 00:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2TqABsLbUo0 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 00:08:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893DB4049D
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 00:08:59 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1dZRnY4y5THgO1dZRn24lH; Mon, 27 Dec 2021 01:08:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640563737; bh=yF5iZREp6h2Cxg94scs1992B0S+/dhgB6yTh8CntK1U=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=QaJMm+lt9kl033i2oxV2/ar4C2Ca7z96t1EbDjKzijo0ZJkCQEgUzPsjXAKc4zK6q
 9LcsCQoMmSuveRQ6r8iJr6N5gDFAYjxBM9Hlamg6qyFm/ttvHcyqX4Q/ODn3A2W1z0
 mPuDtX1tHOCwS0NtCJYsJ9Pcc46wDp6dyNMNIndV2FDFgpc2jJFubrJXRPRm0gEBSP
 /snITKzd8+c1ZVd7cSpksA2mounQigHoDrP9P/eKDJClbR2VtAQIHXoLW4Ym4gXkEX
 NWOvGj1xrW8ep2Ah17KtW6NhlpHOnKRh6GvpRp+0vmLsvv6tMUzw2Od0hDyEnJA9Hs
 o5nFakOHg8zvg==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211219070332.2642029-1-giulio.benetti@benettiengineering.com>
 <20211219080817.GA2603@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <8e972605-f761-0839-7f42-57efe580694b@benettiengineering.com>
Date: Mon, 27 Dec 2021 01:08:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219080817.GA2603@scaer>
Content-Language: en-US
X-CMAE-Envelope: MS4wfG1dmHfC5KPJ2BC4EbdekW3+K0b5ptKOCtzP+FkSBA5HdQXlheLLtAjsyCpGkFcfFPIiv+evtDyd59h75QjWV+W7mQGurhOsNtm4Ty6EZN56CpHdcIQH
 w5tXquB5Sn6KZBJ7PsllBivSNL4a+avMREZsDxUl51XHbsv9RykNvyY+bBM4cwXLq2dp5cPERWKAdCTvCJtKr+byg+0TKHqUMhzFaubgbost2JRuKQ9r6TUa
 U5PWuHs61LMhkfvCZTRzERh+fEf3P85oHv89zWXqY7YxKXbgnAvdShWz+rXG/QCkNlvqmkYQbhnL8Sjvij//HqkNYRK3c9VEYBN3+flpq6jBxfJ8RufMZLZG
 lvDfa1RL
Subject: Re: [Buildroot] [PATCH] package/erlang-rebar: fix linking failure
 on shared library
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Will Newton <will.newton@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 19/12/21 09:08, Yann E. MORIN wrote:

I've missed this e-mail :-/ ...

> Giulio, All,
> 
> On 2021-12-19 08:03 +0100, Giulio Benetti spake thusly:
>> Add patch to fix linking failure while creating shared library. As
>> explained in the patch itself, there is no specific variable for when we
>> link a shared library and rebar itself rely on the default LDFLAGS. Since
>> by default every CFLAGS is filled with -fPIC we need to make sure that
>> every LDFLAGS is the same, so not having any other *_LDFLAGS variable to
>> fille with -fPIC let's add it to the main LDFLAGS.
> 
> OK, I think I got the hang of it. But see below...
> 
>> Fixes:
>> http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...ompiler-add-fPIC-to-LDFLAGS-by-defau.patch | 35 +++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
>>
>> diff --git a/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch b/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
>> new file mode 100644
>> index 0000000000..a9c1670a1f
>> --- /dev/null
>> +++ b/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
>> @@ -0,0 +1,35 @@
>> +From 7f54d48ee5db037778ead310e0b8278f3fe70b41 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Sun, 19 Dec 2021 07:52:55 +0100
>> +Subject: [PATCH] src/rebar_port_compiler: add -fPIC to LDFLAGS by default
>> +
>> +Since both DRV_CFLAGS and EXE_CFLAGS list -fPIC we need also the LDFLAGS
>> +to follow them. Unfortunately adding -fPIC only to DRV_LDFLAGS and
>> +EXE_LDFLAGS is not sufficient, since when linking as a library(.so) it
>> +doesn't take into account those variables. Since -fPIC is needed by default
>> +by any kind of linking, let's add it to the general -fPIC. Rebar seems to
>> +link libraries without taking into account any variable listed in:
>> +src/rebar_port_compiler.erl
>> +this after testing and tracing for every variable.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> + src/rebar_port_compiler.erl | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/src/rebar_port_compiler.erl b/src/rebar_port_compiler.erl
>> +index 9679c80..bd08b21 100644
>> +--- a/src/rebar_port_compiler.erl
>> ++++ b/src/rebar_port_compiler.erl
>> +@@ -645,6 +645,8 @@ default_env() ->
>> +      {"OBJCOPY", get_tool(Arch, "objcopy", "objcopy")},
>> +      {"OBJDUMP", get_tool(Arch, "objdump", "objdump")},
>> +
>> ++     {"LDFLAGS", "-fPIC $LDFLAGS"},
> 
> Don't we want to match EXE_CFLAGS and DRV_CFLAGS, and use DRV_LDFLAGS
> and EXE_LDFLAGS instwead of the generic LDFLAGS? This way, LDFLAGS is
> left alone, like are CFLAGS and CXXFLAGS, and the internal variables
> are used.
> 
> EXE_LDFLAGS and DRV_LDFLAGS are already defined, lines 665 and 667.

...here the problem I've noticed is that nor EXE_LDFLAGS and neither 
DRV_LDFLAGS are used when linking a shared library. They are only used 
for the executables. I've tried in all the ways, and the solution seemed 
trivial like you point, but in the end the only way I've found for 
shared libraries to be linked with -fPIC is adding it to LDFLAGS.

So basically there had to be a specific LIB_LDFLAGS(for example) 
dedicated to it, but rebar is archived in favor of rebar3 and I see this 
as the easiest solution.

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> +      {"DRV_CXX_TEMPLATE",
>> +       "$CXX -c $CXXFLAGS $DRV_CFLAGS $PORT_IN_FILES -o $PORT_OUT_FILE"},
>> +      {"DRV_CC_TEMPLATE",
>> +--
>> +2.25.1
>> +
>> -- 
>> 2.25.1
>>
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
