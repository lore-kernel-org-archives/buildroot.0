Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054EBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 13:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93DAF81934;
	Sun, 28 Nov 2021 13:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWTBPFKdVvQy; Sun, 28 Nov 2021 13:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4AAA8102F;
	Sun, 28 Nov 2021 13:14:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A823F1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A147D8102F
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCA-_0SBWnXN for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 13:14:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABFFD8100F
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 13:14:51 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e11so28974320ljo.13
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qg/aHWury9TwTGgxzGfvu7nR5HnjCcHwjbRnfPKfh1k=;
 b=U6U65fMeI3TdTBE+h9CLr38QDCmnkGAcGrk6RRV+KyQA0kBRotnsoE+mRchaBsCp7V
 wCXbpm2WOVq2W33Hw4RzO9z/VdCwt/swx7bSxyhUAystn3BM7XFwzga0dKjmbMajXdkL
 FxaPZn24LW5GVaLr9A0kl92yWlhF3tVYxPnmht2VEyEOW5lyM/gMDAVH8kEG6jGMH6zG
 dhKmLSveKMpGre/wQLC7mTHqgCNjGeVJqKqfqp2b0ykQtg0BIMy7T8XcyrbRivtfJJWQ
 s1z2xL/L8ZKbhOOZzk84iDqOxKk0VTsScbm+27y1hbQn+VVbqhfNtUuR9gkyWNBUoXiX
 uH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qg/aHWury9TwTGgxzGfvu7nR5HnjCcHwjbRnfPKfh1k=;
 b=ZeU0tOryJRMTMJ9UFNNLn8gg7q3rVXAZ5Zvu5nXllohi2mmKq43NViW/Cn2RYKnxLn
 SDZsp8Vopj+ozoN2xqHpEYrpLZcu3aVWR5XaSej/WyCF7V8ovpyCVERR5hcszi5MFVGw
 SZKdFeqHdavUoD9mYttIqwhh4L/+ySM5vb4Hwwb81290Vb13K/g4ZZ2GCw69B+5Ph/mE
 Iu8x8OnKKjTrXdr3r9z0QLPfEx+/lSTiuROnWiCQ41w4+odkbwtW3c6yUGAQccZbfjum
 1U4+cULOAcy8JLfSthh03Td33tMgA5qvye86jLCKVJYiEtwPY139XEhwY3/tgM0GL4mu
 daVQ==
X-Gm-Message-State: AOAM532JuqbO9kdHsnZ4aEZmPRBI5k03T/v5vHfcGuvEqtUYPvPluu0j
 vzGjvW/LPrBV1kaAtgWPBnMGPWpKMLM=
X-Google-Smtp-Source: ABdhPJwPpExhEt7pnUQbvFTzJLUAz6qimGbf9y9bQmEMBBaHNM/lItLl4zm/qQVywLVK0sCwsxsWeA==
X-Received: by 2002:a2e:9450:: with SMTP id o16mr41821902ljh.444.1638105289626; 
 Sun, 28 Nov 2021 05:14:49 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.198])
 by smtp.googlemail.com with ESMTPSA id f23sm1193566ljg.90.2021.11.28.05.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 05:14:49 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <61a33668.1c69fb81.7f203.a37cSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <d8ea8ae9-8fb5-9eb0-8569-4334c52a25da@gmail.com>
Date: Sun, 28 Nov 2021 14:14:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <61a33668.1c69fb81.7f203.a37cSMTPIN_ADDED_MISSING@mx.google.com>
Content-Language: en-US
Subject: [Buildroot] Name clash in headers: LiTE and libite (Was: Re:
 [autobuild.buildroot.net] Your daily results for 2021-11-27)
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/28/21 8:57 AM, Thomas Petazzoni wrote:
> watchdogd-3.4 :: http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6

TL;DR == ignore autobuilder warnings for watchdogd for now ==

I've looked into this autobuilder issue with watchdogd.  The root cause
turned out to be a name clash between two packages in Buildroot: LiTE
and libite.  Both providing the include file(s) lite/lite.h (lite/*.h)

This is a potentially really bad situation, although the overlap in
users of LiTE and libite is likely very small, if any.

I discussed a way forward with Yann on IRC and we agreed that since I'm
the upstream maintainer (of both libite and watchdogd) libite should be
changed to use another name space prefix, e.g. libite/lite.h.

I've started the release circus for updating all this, but it'll take a
few days, up to a week I'm afraid, before there are changes available
for merging to the 2021.11 branch.  Please let me know if this turns
into a headache and I'll try to expedite it.

Best regards
 /Joachim




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
