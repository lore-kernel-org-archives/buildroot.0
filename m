Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78467C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 02:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1EF560E77;
	Sun, 15 May 2022 02:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YavdmTRFQx1t; Sun, 15 May 2022 02:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D27560E73;
	Sun, 15 May 2022 02:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 579C41BF5EA
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 02:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D398408CA
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 02:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2f4jvIMa98Ve for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 02:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EEA740004
 for <buildroot@buildroot.org>; Sun, 15 May 2022 02:09:29 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id 204so11046261pfx.3
 for <buildroot@buildroot.org>; Sat, 14 May 2022 19:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OtFFsxeQSuM0i4EUmG9Yh2YXBIdwd2FgTdfgsJ3AFJc=;
 b=qAMj/y7UVH7iXmWjEgqktCTGxNv0+6MknWd3/f2BgpnMqdS47j4eSbM67fMzqWF6Kn
 96QHhcG1CbnO3tZNN/VDKraDR5gZJOxm5d8X67FsFvEHLgN5PK3dxsw2Av7ebC2eobxS
 9clq2g60w6o4zspG6CrAgwHtWQp4GJmEVWkIVzGBtoC9FhtYfsJz3lBqA/hYOi/8OAMZ
 PcmkhO55aEgl46Na1tRogEaO6qS9P797Mr0xxdVJ9fY73utS+d2rd8ZeospQRztp6AF1
 3gfh/MNFqcj360RtKUb6UH9xkFLV09LbRecB6VHlSVpmo6CyREdDd/b5STTtWgNFDn1n
 FmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OtFFsxeQSuM0i4EUmG9Yh2YXBIdwd2FgTdfgsJ3AFJc=;
 b=jqJtlgd327z9PCIk1bcxeQqLI8QMQt6cuF7OzUnBQdkYCl/yVtShx2AC7+cuR70hjI
 TCC6d64aNQuFquttYGZ/nWDQ63CdYfwDnSh9N5uY/WXY32cXYNTvt6N2fQdqESkNf0yj
 vXT8XOUEgZAWCH7Kg3j/k/o47Z06oiohDihLDQKzAhknkgWzrPG20Mc8EIeek1oepL39
 d0D9/191QJzTvr28KexzvZmpInyKe4Eh/RUqzp1NsU8z2QlvST8/CWuTmQw+VzqsyBo9
 KeSq0OB8c2JiMxKVCdSfPRR1PJ99VUddaHBuwzZ/J1qvpR2mdONVxVULj4joCPA6YLGp
 GBRw==
X-Gm-Message-State: AOAM533h0a8PEVgLha5c1/wwPMCBb03/R/bSRReNnlxt5JU04302CoOW
 RSKu9ZCM4nNwc4aWt1cIgsk=
X-Google-Smtp-Source: ABdhPJz8HkvmsGL3AiDiRQZ6dUjtoJ9kSEACQ5QqnZWdlRtCQGEhmeKoTTxUFzZctO1IA4GMAGdElg==
X-Received: by 2002:a63:2048:0:b0:3db:7de7:34b4 with SMTP id
 r8-20020a632048000000b003db7de734b4mr10106795pgm.105.1652580568665; 
 Sat, 14 May 2022 19:09:28 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a62d002000000b0050dc762814asm4264593pfg.36.2022.05.14.19.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 19:09:27 -0700 (PDT)
Date: Sun, 15 May 2022 11:09:25 +0900
From: Stafford Horne <shorne@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <YoBg1aDzr7cEYB/l@antec>
References: <20220511001947.2112747-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511001947.2112747-1-f.fainelli@gmail.com>
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
Cc: yann.morin.1998@free.fr, mmayer@broadcom.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 10, 2022 at 05:19:47PM -0700, Florian Fainelli wrote:
> As reported in the following autobuild report:
> 
> http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5/
> 
> cpulimit does not build due to a lack of definition for elf_gregset_t
> which is not currently provided in the or1k musl-libc port. While this
> is being worked on, disable the build for or1k and musl-libc.

Hello,

You mention this is being worked on.  I am curious who is working on this?

I try to look over OpenRISC stuff, do you need me to do anything on musl for
this?

-Stafford
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
