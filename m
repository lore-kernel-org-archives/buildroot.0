Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF60CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EB0241047;
	Wed, 18 May 2022 19:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmTpKquEe9B4; Wed, 18 May 2022 19:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D59340FD0;
	Wed, 18 May 2022 19:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80F0B1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F7AA61264
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=esdemc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOZEVLNibr6S for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A99D8605B1
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:27:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p22so5323810lfo.10
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=esdemc.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jaDY6fgwMfkOWaXVUPXas0O+5JeZXPXS/JFMiZ5oJC8=;
 b=EGHo5A9BjQT0GyTM4XQQFORcBmRXSdMlM5y6/uJJR/iGuzPCzs+ZsNJxjs6b2jqTU5
 XpFx/yj+De0gi0vqlOLwxanaSIb5SvFC8yNLPROCIirUr/jvhb47bgoFraTGnzwWzlDs
 KfWNfj4ZrQw201Xpt16HlR2Q1QLlWzig3niaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jaDY6fgwMfkOWaXVUPXas0O+5JeZXPXS/JFMiZ5oJC8=;
 b=678AdZOLbMughbw7hxg1U69yUqTEYHF/ClFpFzNNhrJMV09A9fdIKLN4seEU7IiSqk
 4HEdwdxenrza0nQhB+gKeAjUXznlauNjx4qdniTM1P3r55sijEDMPvGmYKzIJtQ8mUaB
 1WQol7F9BR7HqOkef7nuCdPkzZGW9onZMXUxyxp0bpZL7XEixh+PkFFc4iQk4o8f75/q
 RteAF6S9YEPq3qy1guNkIwSjiDlbiwZq7919IBzanOps/aX8f0Y1/GnKinRVdM9K1cG4
 VJL/f4aS/FB3x+WctJDyG9qBCJowbp6DYjtVE3BXCToyw+vdEJ8jVqf4UYg8lE3Dd/7J
 UDsg==
X-Gm-Message-State: AOAM532BaZPaKY16IW2QqIiHiskNIJ/Zvwjg3yIj4duEIHuUOjp/tMqN
 IgJBc31xXYizulRH1BLvtS37qsmlWUAfNEV8MQvSaA==
X-Google-Smtp-Source: ABdhPJx5Q5z1rmcMcPhM3V2eDqvEjiVka4m8ZfNJUcO1au0aLHtlD2wEtU7s6/PpZmDmXtmbqlJSh8GzOpppoWOxtA8=
X-Received: by 2002:a05:6512:33d6:b0:473:b562:b8bd with SMTP id
 d22-20020a05651233d600b00473b562b8bdmr658874lfg.551.1652902049626; Wed, 18
 May 2022 12:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220512201820.13611-1-adamg@esdemc.com>
 <CAGm1_kt4zJ8F-7D0b3r3wQpzKz=DiQsDH2xMuFRQ4XEwbkTOKQ@mail.gmail.com>
In-Reply-To: <CAGm1_kt4zJ8F-7D0b3r3wQpzKz=DiQsDH2xMuFRQ4XEwbkTOKQ@mail.gmail.com>
Date: Wed, 18 May 2022 14:27:19 -0500
Message-ID: <CABu+GhzDidBrru0R0RL-+s_f3fF5hAjQA+tPyF9vwDCDVnY_NA@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH 1/1] add package/python-pyqtchart
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
From: Adam Gausmann via buildroot <buildroot@buildroot.org>
Reply-To: Adam Gausmann <AdamG@esdemc.com>
Cc: =?UTF-8?Q?Manuel_V=C3=B6gele?= <develop@manuel-voegele.de>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Fri, May 13, 2022 at 3:11 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> > +ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +PYTHON_PYQTCHART_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
> > +PYTHON_PYQTCHART_RM_PORT_BASE = port_v3
> > +else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > +PYTHON_PYQTCHART_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
> > +PYTHON_PYQTCHART_RM_PORT_BASE = port_v2
> > +endif
>
> There is only the Python3 package in BR so no need to handle the Python2 case.

Thank you for the feedback; I had based this package on an earlier
version of the python-pyqt package on my dev branch (2021.11). Will
amend and resubmit soon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
