Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A32FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 19:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF7F6404CD;
	Mon,  7 Feb 2022 19:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNGIaW6KYRwg; Mon,  7 Feb 2022 19:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3FA04049B;
	Mon,  7 Feb 2022 19:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4112D1BF28B
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F1F260783
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 19:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYjaU68TqfsV for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 19:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E714F60669
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 19:44:46 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id g14so43196003ybs.8
 for <buildroot@buildroot.org>; Mon, 07 Feb 2022 11:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zh4r0LSy4iM9Un9YAj2XWmClacXtP3FX49QNgp3vuoM=;
 b=Q5DBXCCbGoDjhwbCEu+RQw6Q3X8ZAu8X6FhOeeIVGvWt6Qd1OYQPtXI/GIIWHu7aqy
 73+UVt3kYT66Ci56QPjsU+HwJvOCbkdrbC8lxmKBLe5H2fdYM4y38ZXd8yyLiwYyDt2x
 K9kPmBNYzjcd7kZ4HXRda1PCLSUO0TM9c7pDiMOLEtdheVfzvVu6Lz7FOfH0dA/Tg3mM
 KNXcfMGgjPj5ZOHQ1EyxvoMS0Tt4oRN+a95iPNfNFYFUv8sXStRYz8KC4iW8C1xZrKnC
 Jc8fEJQrunYwkd/ywnzZBDfzAse262VoF8/CQWMfam0ZeulZCcq/3NNOhruvIEsMKRWh
 qYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zh4r0LSy4iM9Un9YAj2XWmClacXtP3FX49QNgp3vuoM=;
 b=5KFpwDtQ6N7tCfQ7U8Ni8mGVMw6ui18A2o2pABTblquDbKMsckhoD5XgJXN7nI6htq
 MvhhOM8WNMRu6EjQPe5ownPoim1s+Y+2MgDxh12Vbm/fD02MzzgVY2qeFVKAmJck2XoR
 0CjAspWlW8wbmhLsK3bAgKTNY4kNk6WvpMWkt2p8Q8JPuEC63nZJTiZlhgw+3BiY/k+P
 /a2DSSbHNb7USqVE69OSVg66L/uHkJyPRcyjFecLjsPippKXMrVYk/uLsBE5PBSd+JlU
 TWit+zsF5ExEWVl/EeBmwXIF4Iu/CGqQoobRX3V4N9bz/Qhps45IWRx7a4m7v2610C39
 9GCA==
X-Gm-Message-State: AOAM530qdnI+QdOYG76kumbPRnXW/LPtQ6VArpCOnkJsdmZxr5UruErQ
 ooYEeHqa6vV7QXlfd3UQDRLW9DzGgKbp1r+g+NTb07U5Pr0=
X-Google-Smtp-Source: ABdhPJyXnD4hdBDKX6WxlNZO9VgEgXIJp29+qxfrLA+qbhIOtqTVsiJRMb5HtIrVr7fp0rAXemj12tYNDG7LarvxFoM=
X-Received: by 2002:a05:6902:10c3:: with SMTP id
 w3mr1399362ybu.280.1644263085546; 
 Mon, 07 Feb 2022 11:44:45 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkCq0M11qPm=nyJdLgFPRSf7Y+rWfhgGfPLuXsWk4ziCaw@mail.gmail.com>
 <87ee4esejl.fsf@dell.be.48ers.dk>
In-Reply-To: <87ee4esejl.fsf@dell.be.48ers.dk>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 7 Feb 2022 20:44:34 +0100
Message-ID: <CAOiXNkBHd74CVZ2-rEKCskkSYbz44bPvXSVv3d3=KDpdSS2bwA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] Build error with 2021.11.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> >>>> icu 69-1 Configuring
>
> [snip]
>
> > INTLTOOL_PERL=/usr/bin/perl CFLAGS="-D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0
> > -D_FORTIFY_SOURCE=1
> > -I/home/and/p2/build/prodx/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/drm"
> > LDFLAGS=" -ldrm" ac_cv_lbl_unaligned_fail=yes
>
> Hmm, is this a pristine upstream Buildroot 2021.11 without any external
> packages? You seem to be passing some extra CFLAGS / LDFLAGS to the
> configure script.
>
> Variables like TARGET_CONFIGURE_OPTS are global, so you cannot change it
> in a custom package without causing problems, like this:

Indeed, I am using an external tree and one custom package did modify
TARGET_CONFIGURE_OPTS. Somehow I did not realize that these variables are
global.

Thank you very much! Really appreciate the help.

Best regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
