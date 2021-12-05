Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0010DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 07:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B9D607CC;
	Sun,  5 Dec 2021 07:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wM6ilpJEn4LH; Sun,  5 Dec 2021 07:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECB160749;
	Sun,  5 Dec 2021 07:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA3C1BF294
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34A77401F1
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhVJ5fNBWUoM for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 07:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27DF9400A8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 07:51:40 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id p37so13644137uae.8
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 23:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:references:subject:mime-version
 :content-transfer-encoding;
 bh=YnqBj1uXg+iAob+XIeZcSyaHtoeMdPyaovOGpkhhV38=;
 b=Cy6EBhhOeKCgCy/wED628gpulqD0rOAEL4b7w9gxEtl/PnALCEJsa0dmCwSFcK+hLT
 ICn8D5kZ6C/jXzYui7DS7YY12AaFR+kgohhi+RKolfv5kTH6PibTNUNutovrld1F0RW+
 nPgb9TDZ5CCd+d9KSgn4zo7chn3oMDWaURVb9k5KmhNX3QPC4tKY8pL7b316Zy97QQl5
 HOp4Shv3wn1vtG/yiN/hE56zrb36c56fOzDDg5Xvodl0+k5E6AGdVUWC2hbZNwglXh0A
 GcPlwjto1gMLb9KEsH5t6AC2IjzziF56l0q8j36fbbPysY/BQj9wBcYzVJYpFiiy2TuL
 qUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:references:subject
 :mime-version:content-transfer-encoding;
 bh=YnqBj1uXg+iAob+XIeZcSyaHtoeMdPyaovOGpkhhV38=;
 b=cwyuHCwixr6/kzEs4MIuqqCwzstf1KFu4kuLQ5LJ40dwm7apMI8cKbw28bLkWTZuty
 Cc4K2FVDr95q/DAGLIFubD2HqnJ2QQ0dwhZqQepmRcTy4gV9vu335Gi2jSdhnv3bdGY9
 jAHwcKphAR49sh/iL0Vr91OGp5Hh+QsmY6PU2Y4dk7/NXsOja0CQM/W081uFpBM8YaF0
 pC3MBhzops6SHVaR7LCDL5tKmRdsOQS5SXv+S2Upk/EH9D6Fty/aOmXsPvw07vxiyYQf
 3kxUKApm+SqRPGB6vPXwHhHphJl0AixXWQQBmWDzQAOqSf/iX3kH3r07huxx3jYLA3yX
 yPlg==
X-Gm-Message-State: AOAM532PVQdRjewv9utvY2nKcn5oVOvXxCH0gB3KmmpSYibbYIHwttKY
 q8AR6AVqLk0RYRWzWkz738Y=
X-Google-Smtp-Source: ABdhPJw6eo98s2c/Vp3QelMUEyvYYpng2DNBDLqDuoTbVhrtoQtyL2Cv1mKJF6hptIzzeDw1wEjhfg==
X-Received: by 2002:a67:2dc5:: with SMTP id t188mr29213711vst.2.1638690698896; 
 Sat, 04 Dec 2021 23:51:38 -0800 (PST)
Received: from gmail.com ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id y22sm2132215vsy.33.2021.12.04.23.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 23:51:38 -0800 (PST)
Date: Sun, 05 Dec 2021 04:51:37 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: yann.morin.1998@free.fr
Message-ID: <61ac6f898d44a_261771a149721@xultri.mail>
References: <20211204112311.GG50662@scaer>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_61ac6f87ce102_261771a14965";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Buildroot] [PATCH] package/atop: ignore already fixed
 CVE-2011-3618
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_61ac6f87ce102_261771a14965
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Yann,

On Sat, Dec 04, 2021 at 08:23 AM, Yann E. MORIN wrote:

> Ricardo, All,
> 
> On 2021-11-14 20:25 -0300, Ricardo Martincoski spake thusly:
>> https://security-tracker.debian.org/tracker/CVE-2011-3618
>> 
>> The patch used by debian
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=622794
>> has equivalent code merged in upstream:
>> 
>> rawlog.c, changed in 2012, release v2.1
>> https://github.com/Atoptool/atop/commit/7c17a309ef97a59a8ee1f5a593f48eeac9d46bc8
>> 
>> acctproc.c, changed in 2016, release v2.3.0
>> https://github.com/Atoptool/atop/commit/2820b1144ce403c7917cd2e09b05e78d2c9dbc07
>> 
>> So ignore the wrong CVE report.
> 
> Instead, shouldn't the CVE be updated to state that it does not affect
> version >= 2.3.0 ?

Indeed. Thank you for pointing this out.

Searching in the mailing list I found this URL
https://www.elinux.org/Buildroot:Security_Vulnerability_Management

I just filled a form at https://cveform.mitre.org/

I guess this patch can be Rejected.

Regards,
Ricardo
----==_mimepart_61ac6f87ce102_261771a14965
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_61ac6f87ce102_261771a14965--
