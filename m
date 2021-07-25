Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CAFC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:18:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5972360F37
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5972360F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27071403A2;
	Sun, 25 Jul 2021 16:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMOfPSuQ5syq; Sun, 25 Jul 2021 16:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B024039B;
	Sun, 25 Jul 2021 16:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 218FF1BF2B4
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10A534039B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ar2w9WREcqiF for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 16:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0DBA4039A
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 16:18:25 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hs23so12149620ejc.13
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H6Pbnx17qg1Ql4mxzWhOFElbzcrqW6NHsVGp9+jR3v4=;
 b=Mj77/1ZIRDfn9UywYbziJz/5gW24T1jSwUtYKv/Kb/R3wmqrsiGYVL6vxqa3C3sdU9
 p7l9sdfmO1EqeC+JHGB/R346QevTrVeUutPskj1gzfN976Dpg+0DoS1YcfCDKMuai76f
 unC4IZteHNGoNkklbOnOxkIW3PhfZgxCU8l2WQ+AnuJtb9Rgvb4mpj3tiucfHe9E7Hmm
 ZJOZviMrMtWKJexTXL1QEHnVbY/bhtGOwHJ1u4lcVLA0nuyIWtnEQBKyn+bzR0yKv3Yc
 kgsJbVVnLwxvUwCvdgkJDLrRE+4armEvEp25nCLKcrbLqUam1PZQyFqupLSJylPRbx2e
 J+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H6Pbnx17qg1Ql4mxzWhOFElbzcrqW6NHsVGp9+jR3v4=;
 b=SNqYQ33swWUPrKbo2RMghgQYqJQMcejfuNmUxA8rh1ParwyWYub84NP8hP/qyjH1i8
 7CvMbbG8DnAYAUdjwLzaquGRDjpCZpmGJMIycCyuvpY+/SzVKQe1D6J8dx1gGN8025NH
 AA5n29MunTnApsctvcYXodExBJXjpVpj7YkojmTgNSY2+rBjGGcc3TJtqA+boEcUZYYb
 36zhhYYs8fCQh/cctpd88RdkSnxDSbGO8LIfF8Vdx57PC+BONDcGZ03UGkUV4Bx3vNXE
 gS9ZSKQpjMQnMp0XhxrlgY6KBsh6wF0k1U9pLCB9obdYxKkm7Xfp89Nb+CbHu/mf9axY
 trcg==
X-Gm-Message-State: AOAM531u5dp6zn0k68ebkujNEVN3zuiX6IErY9tZ8AT1EU4vDR1B7Gdz
 LS7X1yanBsnyACjAz9GyM5V/og==
X-Google-Smtp-Source: ABdhPJzkwWZ54XR3OcGoz5lEcORYlMN/DG3rIWVomsnUehWeugco6fN6j7n0IaZPw+NIyzWJ/sL3Nw==
X-Received: by 2002:a17:906:8252:: with SMTP id
 f18mr13303336ejx.261.1627229903808; 
 Sun, 25 Jul 2021 09:18:23 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id mh10sm681261ejb.32.2021.07.25.09.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 09:18:23 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210718083412.1904311-1-fontaine.fabrice@gmail.com>
 <20210718140058.47ac4d31@windsurf> <20210718125136.GG12203@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <976f19cb-90ff-49f3-49a0-4f0611c68e4e@mind.be>
Date: Sun, 25 Jul 2021 18:18:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210718125136.GG12203@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: update lib{mtd, ubi}.h path
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 18/07/2021 14:51, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2021-07-18 14:00 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 18 Jul 2021 10:34:12 +0200
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>>> Update lib{mtd,ubi}.h path to fix the following build failure raised
>>> since bump of swupdate to version 2021.04 in commit
>>> 2c6b0359c3b819fadb4437b2d780e95c32fdab21:
>>>
>>> In file included from corelib/mtd-interface.c:21:
>>> include/flash.h:13:10: fatal error: libmtd.h: No such file or directory
>>>    13 | #include <libmtd.h>
>>>       |          ^~~~~~~~~~
>>>
>>> This build failure is raised because of
>>> https://github.com/sbabic/swupdate/commit/0c672866d4a9fe8f0808b5d8a0afb95c13c4c138
>>>
>>> Fixes:
>>>  - http://autobuild.buildroot.org/results/d475bdb341d2afecf12e404dfa093e58221b9882
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>>  package/mtd/mtd.mk | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Isn't there a chance for this to break other packages? Is it just
>> swupdate that is using the MTD headers?
> 
> Currently, in Buildroot, we havea few packages that depend on the 'mtd'
> package;
> 
>   - fs/kffs2/
>   - fs/ubifs/
>       both want the mtd tools
> 
>   - busybox
>       installs mtd applets
> 
>   - swupdate
>       needs the headers
> 
> There are a few other refrences to '\<mtd\>', but none are about a build
> dependency.
> 
> So, for Buildroot, only swupsdate seems to be impacted, indeed.
> 
> Still, using headers internal to another package is not nice from
> swupdate...

 Well, you could argue that it is not nice of mtd-utils to have a very useful
library but not export it :-)

 Since there isn't really any other way of fixing this other than mesing with
symlinks, I've applied the patch to master, thanks.

 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
