Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09EBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 17:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F91E83FB4;
	Mon, 18 Apr 2022 17:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dT9BJNtuJX_X; Mon, 18 Apr 2022 17:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 902E983F4C;
	Mon, 18 Apr 2022 17:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 088791BF2FD
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 17:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4D3F40BC9
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 17:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VFjlPHGyBoZ for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 17:04:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CAD940BB3
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 17:04:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u3so19256852wrg.3
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=RB/38VwJJjTZxsXl9a8hCRhhfhiew23zIHUMCw+zoAU=;
 b=ASnVaQy3zPsUe3gp9fB/vwQDNdmsNgP2tokvuopkvTXYwZhYgWXVNOsEUqZCLBiItD
 2f/yqkd9g7psx0v8G7RSIkJ894HnxKRZYUCmMz8In44Dp8WH4tS1fBaV1VvSru7lCUq5
 T7sdv63Gw8rEU56LrV94hL0s0WHr+xcEOYFxuwJftnxB0UvUDd4fSk5A8zmiz4EHOYVw
 OE3CC36/DQyEdgeJPrIeIhb1cehmX1bLqaNh01CB3tr4/tLmRh9fpWldcGHGeqC2G5ya
 yVmbkXmfm0z5OWcefWEZPxcF7eVpR/w1nRO60X8imSsGvOZM4GNbV0ZMkVXKA5NdYJxW
 cziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=RB/38VwJJjTZxsXl9a8hCRhhfhiew23zIHUMCw+zoAU=;
 b=wvBlyAyQUdhdOMQHp7sxV8M7MtvN3dQTk78htiyE8d8uT/e5PvWcl+x040fpPngJ5Y
 zvbaSkqJ6MoT4QR2b+FWrYaZiEoDucoqCrq4X/4L6+gT/6z6BHT0QLdDkKHHnqsfjbOZ
 1fwmJZE9fmOsWoOVF4H7bloOBtYT0pdNZkoUqaihxN7ToIJbAQ7bbnvDMRAhOlq+TTt4
 DTlB4bTbn+lRds/gVfYg8NO1z8f0BvRJqURZD5raU+Azx/VEUWo6KMK3iJSp2DvARU5G
 oGCP8nKpHltmbYcbQAicCXOe5F6SQusMK7rTAvkT6DeiGEe/Z2JfpKx28dkDRZL3ngNf
 dh+A==
X-Gm-Message-State: AOAM532JTR3+M2nwwiqT9KtMlVEy5HTdWWHlZsb0B2r9b8XKj/e0iVFM
 qfcYnqYbglPgbgcJ7QPj0rI=
X-Google-Smtp-Source: ABdhPJwqMVgwfuX+n7AmiwTyjAw7NIV5Wm83MiGo05fMGiBADzkVOfBqDGCVk4Q8RsIhr4KYx6Y1Yg==
X-Received: by 2002:adf:eb07:0:b0:207:8534:2ef6 with SMTP id
 s7-20020adfeb07000000b0020785342ef6mr8930493wrn.62.1650301438061; 
 Mon, 18 Apr 2022 10:03:58 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adf9e41000000b00205c3d212easm10928083wre.51.2022.04.18.10.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 10:03:57 -0700 (PDT)
Date: Mon, 18 Apr 2022 19:03:55 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Yl2Z+85yQW085BXp@pevik>
References: <20220418114103.276282-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418114103.276282-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: doesn't build with
 libressl
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: =?iso-8859-2?Q?Andr=E9?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

> libkrb5 does not build with libressl since commit
> b7a5b9d06d484700fc4fcbd354f2c15e0422688c and upstream is not interested
> in fixing this issue as a PR is opened for more than 4 years
> (https://github.com/krb5/krb5/pull/607):

Good catch!

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
