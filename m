Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6126CD8CAF
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 18:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C96540012;
	Tue, 10 Oct 2023 18:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C96540012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6uMqjVsk3Xj; Tue, 10 Oct 2023 18:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A862A40385;
	Tue, 10 Oct 2023 18:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A862A40385
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 867641BF2B0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F7F940385
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F7F940385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7-zHsrJOh6i for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 18:50:44 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3247740012
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 18:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3247740012
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40537481094so56011365e9.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 11:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696963842; x=1697568642;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E844VMtWiGICxcWZ9wgTBUq7sdlFReVoLfxlsbgdlwc=;
 b=BGzQsYLUqiMh81sGFHV/kOgJ52yKN7Yc48CSfBsuTeVDedXBIH8oqqrClx5K0NYGPn
 697TD4jcASOnhoYHVyqUFhiYeseNq1BL4obnqiCatLxDFquXkCEQNTxaZpdQkbQgcV3D
 IAJLhKNmiRTYs6M4QUyjY3sg76RESZhx11cIgPcQM+UDAfY+c9uY6f7aJcjGjQqGzQmo
 +CpJPJ4yBhbq9FtWCF8iSai/9ExXE3O8f0rRWnJRWZpn3+r2KzSL85DDpclquS+1xVjr
 9cCwSBZwrxuFiQ3cciJJo9sv4owJexyggMP/lCXZ962xYpebFBXKm1rN9mvH1lP2JFtM
 Eo/g==
X-Gm-Message-State: AOJu0YydsiSjVnWE7Qd1xB94WHkmabymNWUshzqCyNW4BnL7K6Ko23eI
 dFeUwUvLf0aHNHgVQHzXKJLda4zNfbvwdA==
X-Google-Smtp-Source: AGHT+IEZo5pFL5BYqP/nXq/sVC8/i+PjGbZZF8j7+NRKdqsytWUzy1Su9+gbnHnH/AJMUMxGTWFK2g==
X-Received: by 2002:a05:600c:22cf:b0:401:4542:5edd with SMTP id
 15-20020a05600c22cf00b0040145425eddmr16743261wmg.34.1696963841878; 
 Tue, 10 Oct 2023 11:50:41 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d19749b000922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9749:b000:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c024c00b0040531f5c51asm14989759wmj.5.2023.10.10.11.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 11:50:41 -0700 (PDT)
Message-ID: <c604e3e874577b85498bac2c2ad4d6a25c7c9cf3.camel@gmail.com>
From: Stefan Nickl <stefan.nickl@gmail.com>
To: Mike Davies <busybox_mail@rovoreed.com>, buildroot@buildroot.org
Date: Tue, 10 Oct 2023 20:50:40 +0200
In-Reply-To: <b8ccd688c2c755964b5aff6ecfd7ff53a6c6e8fa.camel@rovoreed.com>
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
 <b8ccd688c2c755964b5aff6ecfd7ff53a6c6e8fa.camel@rovoreed.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696963842; x=1697568642; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E844VMtWiGICxcWZ9wgTBUq7sdlFReVoLfxlsbgdlwc=;
 b=f1B/GAL1PB5g8HW901QXiQAwrAonL2Zfm9NpwQkoqvIqV1BLg2Mj0MHC208RZwh+p0
 Uw0jk7KIMr6ViP7tCpUG0+HNtU/1YEAcS+J/UmMTHtrVccr9KuyClUuUfhEVSI67BZ+B
 LzTI1nln7XIRqPvlW3dnHqvQRQ4DkfVL9JU9PSIeBYv01QNDai/iJ+KB7nbd5TLUtxzz
 v4VlAhWiDGzoUD3A81DsM8RyghRKFSFpMEUtUzQ8vyrVlvZJL9PCh5OX/tVuH3IcZq7X
 /Ht3LIbynxhtPAl/cXLFBRC/y7GmhbzGLWMygG/LvSPIxJTtcRAt1hnOEY4f7HS7qwDs
 lYeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f1B/GAL1
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2022-06-29 at 15:29 +0100, Mike Davies wrote:
> I have spent many hours (over 100 so far) trying to get ROS2 built as
> part of buildroot. I have been using the recommended ROS source build
> route of using rosdep/colcon etc., to build ROS2 Galactic and more
> recently Humble
> 
> Starting with buildroot-2022.02 I have had to add 41 new packages, and
> alter an existing 6 packages - either adding host builds or changing
> configuration options.
> 
> So far I have managed to build 157 of the 340 odd components. I can get
> code onto the target, but it doesn't do a lot because so many
> components are missing.
> 
> Alas, I have got to the stage where I think it is no longer possible to
> progress, or at least, it is going to take vastly more time than I am
> willing to take.

Hey Mike,
I just found this old thread and wondered if you could share the work
you've done so far.
I'm interested in using ROS2 in an embedded system with buildroot and
cross-compilation to aarch64. I don't need a full ros distribution,
just enable some basic C/C++ programs on the target to talk with other
ros nodes on the network via topics, services and actions.
Maybe having just a very stripped-down version of ROS2 in buildroot
would be useful for others as well.

Thanks,
Stefan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
