Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D424C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 14:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539B0418AA;
	Tue, 20 Sep 2022 14:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 539B0418AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-nSbQ_g6mQi; Tue, 20 Sep 2022 14:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24F02408AA;
	Tue, 20 Sep 2022 14:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24F02408AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 857331BF3A9
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 14:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6159160F69
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 14:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6159160F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xepq9vvtTKZV for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 14:44:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F7D60F68
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19F7D60F68
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 14:44:00 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c198so2914246pfc.13
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 07:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=dPt+ZxtmycJKUsVsKT4XigSCQn9SSkeCMmJaHYKZ76Y=;
 b=mYK7Hg6uDPPbn3FrU6hLjKnKhkgvAMCayG37RODXsi0EwCjGq/a0SQJdUmJ2zHKe/U
 TotmYw7iUOmEoy+pWpHFKa6AKeKKC6sfqezAFDu8QJH+eFDf5Kt6y3WrRmtFPhQtb+1f
 kzuOSJBio35uSFIRuW7MvQsTSkec9m6PCFIyYXNvBBn9ESc5K0r0a07MsIwBaWID4IjU
 HZubrhBTFKpCbyH450ewBjRzMuF0IV5zcaaJfoBecwbsZTZV4WFvPHZOTN1/46Bl3S6S
 hOdI0sG6llYNeKo0ArGSra89Q+UKbj91h81nXt1pR1sTYmnAu2TZTaHOKXWsV6/Q3AEj
 7jPg==
X-Gm-Message-State: ACrzQf2X3PD0/zz3eIsFCPmemhNKU79L8d60OwVv9fDiKgd+8IyZczSo
 ptkEhDDg0CQnBTkoWxPef28yo1Syq2xfIdtw+jXXe+/E
X-Google-Smtp-Source: AMsMyM6EKzmbV2xs9A0K5y3GqsU77xG93AvzAVA0lKa6WtRZzYQ7EUeJu1RFNX0xcYH2gL6Jwg89VJgrgo09vtgvq1w=
X-Received: by 2002:a63:7704:0:b0:439:ae51:3bc1 with SMTP id
 s4-20020a637704000000b00439ae513bc1mr20504672pgc.558.1663685038899; Tue, 20
 Sep 2022 07:43:58 -0700 (PDT)
MIME-Version: 1.0
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Tue, 20 Sep 2022 16:43:47 +0200
Message-ID: <CAMdwsN8FyQD4ofHfVgorNvX4kBDArfK6t9dBqgG=3xHrkFOuag@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=dPt+ZxtmycJKUsVsKT4XigSCQn9SSkeCMmJaHYKZ76Y=;
 b=qtaIY0B+GTzNtouU4nSQQlZp43fJOv+OqWahBK2GoTogd6TutD5OSlqIjup5FhENoi
 JqX1E3o3kfoAgtJYRZHU0b5g7zQ5vYvq46geeGnkLuTg4HCUznL5LH4IfGXYOu4PDZfJ
 72Fv9qivd2KI6UqwUSf6w1AkI4Ee03JHNAzfstheBoqFxpm1nTsRkqaMVm3v9AloN7Dq
 cIpYzCRyE/uS7TYYPMRzPxBNEGY17ui5MblHhyJtxyPque93doFpnr4LdQBfphX4w2JN
 KMmbxqJw4j3I74trYM4pa0mN6eGTLSb13NQL5wL6OFEeCM4AAf7jo/YV27peVbYsZjzU
 Omig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qtaIY0B+
Subject: [Buildroot] Forcing fresh clone/checkout of custom linux/uboot SVN
 urls
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

Hello,

I wanted to gauge for interest (or if I could be given the opportunity
to) for adding an option to buildroot that would instead of making a
tarball of a custom version, force a new checkout to be done rather
than an extraction of an existing tarball. (along with the option of
making it a checkout rather than an export as it does initially)
My use case for this is the following:
We have our own linux/uboot (svn) repositories, however we currently
have to modify the linux/uboot makefiles because trunk development for
us is not possible if we point to the trunk url of our linux/uboot
repository and then use "HEAD" as the custom repo_version. It will do
an export once, put it in the download folder and extract that later
on.
We would have to remove the tarball in the download folder for every
change in our trunk repos and because it's an export we also can't
develop on it.
My idea was to add 2 new config options that are enabled if
KERNEL_CUSTOM_SVN or UBOOT_COSTOM_SVN is selected, one that would
override the extract command so it won't look at the download folder,
and another one that would make it perform a checkout instead of an
extract.
Is this something I could add to the main buildroot or do I best just
keep this inside our own buildroot repo?

Regards,
Jesse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
