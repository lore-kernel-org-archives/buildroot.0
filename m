Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370C7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 23:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB3161185;
	Wed,  6 Apr 2022 23:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1oLgwb2TF0t; Wed,  6 Apr 2022 23:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82F760F35;
	Wed,  6 Apr 2022 23:11:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3EE71BF352
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 23:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE69E81A34
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 23:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aeyx1dcQxCvh for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 23:11:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D910881A30
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 23:11:43 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id k10so4042635oia.0
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2c4gtfgJ+YnmVDVVJRL/odpbznJy3EzBY0kGNv6wTic=;
 b=lmOFGGF+jGgKja2j4OhxL4UJ76rS+FTIHD2Bx3QjCDhsJZ+qPIbK/3K7+9oLCsxwYz
 K946mg15OpGqshul5JOipXbyFmwm/hfULXXv7SGx4hqseLp6J38r1iMklrE5DeDP87qG
 r1fGrxMb9QILSAxvK/fB6wP7/h0u5wWpWH9xFiNzOoLTj7XaX3o1YQd51Avz+vGWyfnI
 KBrP2D9vJql5p967Kt//3nVdMP2OlqkwEq33EHje8b3VvXnKh9LJqwrG18xe3YOx5GLz
 sF+Njzq04/poO/oo267rvGYGQOjyQ+C5MsiTLEuW7+E07/kSR9BDecmn/IiZ6/HZBJ8H
 0n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2c4gtfgJ+YnmVDVVJRL/odpbznJy3EzBY0kGNv6wTic=;
 b=RWMuJjll7M9afmrip12kG6IYtjzBlHMi7/NRtnK9OEr71zIdGvGgEPDG4UdgcEX6Wz
 iR/NxGNInlfcTYOszYXN4VAoPrqEXTiTuzpM92g4FYfcPSeoz6HJIrcy8STMJ5pRau2K
 OuoK+dXpDPUtDxNURC/S84TVAfEpPveaApkh0HUVLahgLetzPFGHLqKb1LUVD7Mk24bN
 xnV4awaRZYcbQDgVVGGLZZmSC8dXI5iFKjgaf6iAdJ15Z/iPnk8mvzbg6Fh0e8v03KZ2
 eSg6ymJzadAkq/sudNPHtigmS/kHc4mz7q9nh1zofbq4H8kYCjnH2Vjknxi6ZbY7Vi5q
 w3AA==
X-Gm-Message-State: AOAM533y7roQTzIQLfU6pJiQ/iDiQESN5Wax4lJcGltjBtnyK5IM91PR
 PhLjT4iNLsaF72vFq4buOURUncl1/8b09qe8sGA=
X-Google-Smtp-Source: ABdhPJwp/9fQPgUg25rqPcBRPIgkESgBuULMQeKtss6pRPwjbAyieJRsYKAzU1sCzKuaRzPbj1NTJitYSd6+tku44jI=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr4341572oic.200.1649286702753; Wed, 06
 Apr 2022 16:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
 <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
 <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
 <CAM70yxDPCUobSnoq7XhH=k7Q8B5x9j2=DSWS9a-VN3iX6zg5pA@mail.gmail.com>
 <CADvTj4p_qDCOB5PysR+rNKpp9Fo4PCCn9n4AzpJ4mRkZnqtk_g@mail.gmail.com>
 <CAM70yxDMKEOTKfesTPp02oakyCCB4zM+BmigQ0fqMoaSfeHjnA@mail.gmail.com>
In-Reply-To: <CAM70yxDMKEOTKfesTPp02oakyCCB4zM+BmigQ0fqMoaSfeHjnA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Apr 2022 17:11:31 -0600
Message-ID: <CADvTj4rvFLx28rNUEy=c5kgONHTiQRbBbyM51ehC6GUp8bmDhg@mail.gmail.com>
To: Emile Cormier <emile.cormier.jr@gmail.com>
Subject: Re: [Buildroot] [Feature Request] Host cmake built with the
 --system-curl option
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 6, 2022 at 5:02 PM Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>
> On Wed, Apr 6, 2022 at 7:27 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>> Why are you executing cmake in a post-build script?
>>
>> You should probably create a proper cmake package in your BR2_EXTERNAL:
>> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages
>> https://buildroot.org/downloads/manual/manual.html#outside-br-custom
>
>
> I should have clarified that the same CMake-based superbuild project is used to compile desktop versions of the same app for development purposes. All the (permissive-licenced) dependencies are statically linked to avoid headaches where the desktop's dynamic libraries are used instead of the ones intended for the app. As I'm sure you know, the edit/run/debug cycle is much faster when it doesn't have to be uploaded and remotely debugged on an embedded device.
>
> Nonetheless, I'll consider your advice and will check if the CMake superbuild of our app can be hooked into a BR2_EXTERNAL cmake package instead of a post-build script. Thank you.
>
>> So create a separate buildroot package for those dependencies that your main
>> package selects.
>>
>> Use the cmake package infrastructure instead of trying to use cmake to download
>> the dependency.
>
>
> Again, the same CMake superbuild is used for desktop builds and I don't want to duplicate all that effort into equivalent buildroot cmake packages. Sorry for not making clearer the dual purpose of our CMake superbuild.

You might still be able to share it for desktop builds for development
by creating
packages and then overriding them using the OVERRIDE_SRCDIR feature:
https://buildroot.org/downloads/manual/manual.html#_using_buildroot_during_development
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
