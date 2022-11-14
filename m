Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20765C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 23:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B262608D8;
	Mon, 14 Nov 2022 23:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B262608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-H4QZD10a3h; Mon, 14 Nov 2022 23:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EACA60758;
	Mon, 14 Nov 2022 23:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EACA60758
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA6071BF284
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 23:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A413B402B1
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 23:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A413B402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sN2WiUVhJxV0 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 23:32:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F9440120
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F9440120
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 23:32:09 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id gw22so11758643pjb.3
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h8f0LF1knJxhBvs5Sjd612HZ2apgN9GRjQTqlThtyT8=;
 b=q5ThVM8FXQ2v7a2PyAE71kUsRkkKl0laIZG1emGTZIorheNS3GFkcxhylPQc+PLgjU
 +alr6plLTcwAixhw/Vj1oN1tmC4EEH3C6cCLptuoiwrXD8QVdJvvBFa2EgNBVllEuVqJ
 O51xhD66eEcAtmrTyQ70Ru8hyMEsqfRZVC80l3OeWDUvcG4WO5bNQsEEEe93Rb/sWo7z
 ymQS9WNZA2Xx10oUUfcAk7PRc/voi8821Hp+158ydGI25uScktZiA2lRDiD/14Mxa5Uw
 jXFTce7gckMmgSWAjETilEjYrlkgwHp3Jlx/v1eL1SJCJDXobPFjm/gbU62QNrfhCazr
 oKyA==
X-Gm-Message-State: ANoB5plH8O8vBahqqHm8RuCrjFbI+IquQZW5B+rCCcImkeZ8/Usr5wOH
 UT/BpuLl5ULIOZ4HKNgwb6eOgHs4xG/Ywh2Q+IMSDg31DMaL0Q==
X-Google-Smtp-Source: AA0mqf44Q6w6XEaRSk9SwzVPCbO5t16JaKpoA9lLBnrOtA8K0BkZFiTS1k4XK5+GC+NmK0Dn780RGQzage3lOOaPfLA=
X-Received: by 2002:a17:903:40ca:b0:187:1acd:4be2 with SMTP id
 t10-20020a17090340ca00b001871acd4be2mr1506866pld.16.1668468729083; Mon, 14
 Nov 2022 15:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20221107022458.3448020-1-james.hilliard1@gmail.com>
 <20221107022458.3448020-2-james.hilliard1@gmail.com>
 <20221114234532.3aa355df@windsurf>
In-Reply-To: <20221114234532.3aa355df@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Nov 2022 19:31:56 -0400
Message-ID: <CADvTj4rSeSPp3C0QFF3Ey2q8CvF_s0Y04_jOckj0d_huUp-ehA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h8f0LF1knJxhBvs5Sjd612HZ2apgN9GRjQTqlThtyT8=;
 b=HJrdidH/CNcJH4o7lRB9AYliwbphnwT2MW7Rmg6GLkRw6pEldT0vSEy9ApP7OnIswc
 z8urW0DVOwEFmGeWbzPZ3/Mp8vJjd17D9WmQzDXxpZdjftNZplajM/sFhVaBP4vQfga7
 aKfM+TagPtY8t160U9T5DbfoXzISqhe5KmPvO8+Ese9OArtqW4Bew9WQGpQbpzKj5pT/
 umf8UWujJ8RJ1Efnd0/62BhbRDgE+3BHGz8HFxrRZH9lucWLImMFx6EyO1vleLqAAHJJ
 CVjP9us+LtND2aeP/HMFXOjbS/NzDuIZ190s5Ojx+H/1U4txV0a7GXuBKXQwUmPVifns
 aOuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HJrdidH/
Subject: Re: [Buildroot] [PATCH 2/3] package/zxing-cpp: bump to version 1.4.0
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

On Mon, Nov 14, 2022 at 6:45 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Sun,  6 Nov 2022 19:24:57 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > -ifeq ($(BR2_PACKAGE_LIBICONV),y)
> > -ZXING_CPP_DEPENDENCIES += libiconv
> > +ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),y)
> > +ifeq ($(BR2_PACKAGE_OPENCV3),y)
> > +ZXING_CPP_DEPENDENCIES += opencv3
> > +endif
> > +ifeq ($(BR2_PACKAGE_OPENCV4),y)
> > +ZXING_CPP_DEPENDENCIES += opencv4
> > +endif
> > +ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=TRUE
> > +else
> > +ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
> > -ZXING_CPP_DEPENDENCIES += opencv3
> > -ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
> > +ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),y)
>
> Are you sure this is correct? I believe it should be:
>
> ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)

Fixed in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20221114232254.3970611-1-james.hilliard1@gmail.com/

>
> or:
>
> ifeq ($(BR2_PACKAGE_PYTHON3),y)
>
> since anyway pybind is guaranteed to be available when python3 is
> enabled, since you select it.
>
> > +ZXING_CPP_DEPENDENCIES += python3 python-pybind
> > +ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=ON
> > +else
> > +ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_QT5BASE),y)
> > +ZXING_CPP_DEPENDENCIES += qt5base
> > +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yy)
> > +ZXING_CPP_DEPENDENCIES += qt5declarative qt5multimedia
> > +endif
> > +ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yyy)
> > +ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=TRUE

This makes all the qt5 components here required:
https://github.com/zxing-cpp/zxing-cpp/blob/v1.4.0/example/CMakeLists.txt#L29

One qt5 feature requires BR2_PACKAGE_QT5BASE_GUI:
https://github.com/zxing-cpp/zxing-cpp/blob/v1.4.0/example/CMakeLists.txt#L33

The other requires BR2_PACKAGE_QT5DECLARATIVE_QUICK and
BR2_PACKAGE_QT5MULTIMEDIA but not BR2_PACKAGE_QT5BASE_GUI:
https://github.com/zxing-cpp/zxing-cpp/blob/v1.4.0/example/CMakeLists.txt#L38

>
> it's a bit confusing what's happening here. Why are the dependencies
> different than the condition used to enable Qt support?

Also added a comment in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20221114232254.3970611-1-james.hilliard1@gmail.com/

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
