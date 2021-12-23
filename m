Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 01:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 189FC81A18;
	Thu, 23 Dec 2021 01:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0CUwaSBz38O; Thu, 23 Dec 2021 01:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BA8C81A0D;
	Thu, 23 Dec 2021 01:29:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C08BF1BF473
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 01:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8F7781A0D
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 01:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0GzyHf1JBfn for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 01:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92F7E819BE
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 01:29:05 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so4187558pjw.2
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:to:cc:subject:references:from;
 bh=Z5lyc351rmLLOl028vjy1iTFgHPbqALyPyM/JTuKfyc=;
 b=4jTThO6IOvMgxYREfkEq7OXNynNpyPDTNIgXLAebPGG4S2Z3ASL8FeN3l1dmCrY0XT
 liIgNo8YTkhh6yd+YTLJ7M2IpIxYFadHkp9MxGQJz9VuRU0K4EP4fXIuApAryWUbQ049
 grmfE0d02OiFc4ZlbEls6g0aURfx5kJVmnf5smlN6o2/8AtbQ1aMmxoiOm17Xoz59zo7
 OAHqe9Xt1ktoAdXEKJLzjwFTPkV4ZxhYTN+sZZLgsYZ2Cco4e73r12KkfE8vjSpbnsoo
 1Lpj9BUDxP86oaASB+0BZqI8Jc7UCLdb6QNAToydLPnmnpWFiaayEtXp/5XvG1E/xtvJ
 Suag==
X-Gm-Message-State: AOAM5313AAoK0JJdx8bRsjB37cl4tf5MkLHnMY7iMyGnitHpuCehe+CZ
 8KFCJPXvqgviix/BOFl1wPo=
X-Google-Smtp-Source: ABdhPJz6PS6ZJ8fRQKkBhzX5IZO4mLn99DzAFlSKwM08VmElDUfOpv+j3H07kX/a/bGICwCmKtrzDg==
X-Received: by 2002:a17:90b:180a:: with SMTP id
 lw10mr518541pjb.57.1640222944964; 
 Wed, 22 Dec 2021 17:29:04 -0800 (PST)
Received: from forge (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id y27sm3965253pfa.12.2021.12.22.17.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 17:29:04 -0800 (PST)
Date: Wed, 22 Dec 2021 17:28:58 -0800
Message-Id: <87v8zg2jol.fsf@paral.in>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211216184943.580682-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libqmi: fix build with help2man
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: buildroot@buildroot.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi all,

Original e-mail:
> Fix the following build failure raised with help2man since bump to
> version 1.30.0 in commit 50c5495f81d3418a0f63fc642dc6beb41cd316e0:

Please cherry-pick to 2021.11.x. Thanks.

Best regards,
Christian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
