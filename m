Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F91C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB18741924;
	Thu, 10 Mar 2022 20:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEs2talulw95; Thu, 10 Mar 2022 20:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864C3418EB;
	Thu, 10 Mar 2022 20:59:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AFDC1BF2F3
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9702960BBC
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-pEnoxUk4-u for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:59:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00CD160768
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646945956;
 bh=uNm28E4K30tGAyJB8+aiSFbeAcIWmW8KRad7cCf+Sp4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=WAvv7e/FVFtYxn3PLOsoWMOT5/Nbwuz6DeemyjNRl2MOYEeGJJ0OOEyc0A+vxONAf
 J2/4uSK6SWlzVyTq+e6hcpS8sjhOCJ4XF0bDajH1siU6G1D9l68P8RxUIhaggIwHjx
 fMLAQRVQDUmq17uoX39VdjnhmZew+6uXzrw2LxZY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.204]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1nXNQb3zsc-0064n8; Thu, 10
 Mar 2022 21:59:16 +0100
Date: Thu, 10 Mar 2022 21:59:14 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220310215914.3d26c317@gmx.net>
In-Reply-To: <e47e01eb-0992-20ba-130e-f53df351c1c9@mind.be>
References: <20220309142913.2102898-1-foss+buildroot@0leil.net>
 <e47e01eb-0992-20ba-130e-f53df351c1c9@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:A1BTk7T1AFgZWV5yPMIjy0SO7stR46BCH3cfLUHMHJ0G2dmEm6M
 m3AGSnFcSOGEsA7aqh7N3dZTbMQlbzrjQ6mDX+UGCcyRxVS3/RUnmblbEY/ajwfD6n7kJMv
 8Nl8dr/kFvpH+IfnasM6xllDH0H0/F3eXKN39KKShaROnFl+lI7PDxTqFuHjkc42xYVh6Hb
 niFCA5ZeONtSuy/ufd6lQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wZQBEBbCc2k=:S1x9b4H+xQBYT/rt8lVu3m
 2KR9JhzOdB2hsfx9Qk36ocUZf6VvqeUFVaEyrkAm/JQZ7bQdZ56DmbhacQ1n/eexGHNkAnBYs
 WGqrt8jOfOIMnqfoDZf+9E1Jmx98Th1X6vL6iZsJ1nfP+b9W0UqIjKvikg+cq8iC5xKGGS6OT
 LRJFtKa+E+WViFcAdI5rx/ZJankxtQKQ7hGM5IBRo1S5wS9Pyb0aCwucE4HkT1Q4Q1RhJeGSI
 76I13bnlGYaz5JbZrbS1b9YIzSVnyiywEXnNmKDglW4hUbHels6zNGAbZAz3gsAP48MYypZE2
 bed0a7DtsJeXtarvilSqm3FhTRgn1hp9ro2Hr+hotXDw4ro/AzvGp1Jiwn9zZmL4uCsD0wVNB
 7A+Z45wjKOIlBbNXzXjKqnPZtfK8EZSrpy/QuAd6WcTCw8rT8Fnz4xh2faC2LR27Ndhznk9UT
 lHXPP/4Qrl2FWNchcm+R/32DvdQdNzfMifzBE6s/HBAfVUXYtHaSfGXyUtqcdzUP+NXaPEtM8
 EFgcR6jDqa+aex2I1rNOOH5H1x+DeEIC86nrl0Z4VeRyMZlQtIPLovd4hHuND2YKcX2bfBp/E
 WoUApERRKUfwJCjZmRZes/Lg9KkE1G4MPCxE02lo4kDuKKHoCeKp/GYJbPG8bFh5GsxiPZDiO
 25VR6TcbGMQyWXAl6hUYSiBTtRyJjVDNbN6fEunMXhgsB/Pnxe/uH3CTiSgQd8PxaW2GRLEBS
 3kKFk9XRb3vISbCXwMgSKGKqJ2l461zo5YFu98GeCzKTACM0qUMeTebX7u2KFN9ssJTNVX8VH
 /oWfn86Rl6HMrnuK+IpdDsqAHXyAWuKSvmYodI5XIZZ33CkXiijzLTrY2EYt+4N3tbA3vIQvR
 VLZdquzjQ+O328Sc6tK1buXDKY7x4qXw8+y71jEDb2NA4AS9pdvC4szvBAkjt1f2QwBb80+Tl
 d4hSxMj7RX3acCu5meCsy66/Enowl4ZhDupDlvE1lEN4K12ASUGlZ9rxrcpzXIqIeQCQuRcfq
 g2Kcxef84WTznllvYsrcCck+URI7Y/+mOHs8lfABHqAVBoA3q8zGC9gzkAUgJS8u8lEbOMQPk
 1MJHx/SyqMFuKM=
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5base: fix CVE-2022-25255
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Thu, 10 Mar 2022 21:10:36 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

>   Hi Quentin,
>
> On 09/03/2022 15:29, Quentin Schulz wrote:
> > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >
> > This fixes CVE-2022-25255[1] by using a patch provided by Qt for 5.15.
> >
> > The patch fails to apply because of a conflict in copyright year so it
> > needed some additional handling after downloading.
> >
> > The patch file was added by running the following command:
> > wget https://download.qt.io/archive/qt/5.15/CVE-2022-25255-qprocess5-15.diff -q -O - | sed -e 's/Copyright (C) 2021 The Qt Company Ltd./Copyright (C) 2016 The Qt Company Ltd./' > 0008-CVE-2022-25255-qprocess5-15.diff.patch
> >
> > [1] https://nvd.nist.gov/vuln/detail/CVE-2022-25255
> >
> > Cc: Quentin Schulz <foss+buildroot@0leil.net>
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > ---
> >   ...008-CVE-2022-25255-qprocess5-15.diff.patch | 56 +++++++++++++++++++
> >   package/qt5/qt5base/qt5base.mk                |  2 +
> >   2 files changed, 58 insertions(+)
> >   create mode 100644 package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
> >
> > diff --git a/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
> > new file mode 100644
> > index 0000000000..dfab92a9ef
> > --- /dev/null
> > +++ b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
>
>   Please make the patch something that approaches git-formatted. At the very
> least, the patch itself must have a description of what it does (i.e. a commit
> message) and a Signed-off-by from you. Ideally, though, you look for the
> appropriate commit in the upstream repository [1] and use that instead of a
> random diff. In that case, add something like this at the end of the description
> part:
>
> [Quentin: backport from upstream commit ab6915f0efb12cfe48d1f126f4a828212f853ce5
> in 6.2 branch]
> Signed-off-by: ...
>

..or wait until [2] is merged and bump the qt5base version/kde-git-revision
(but then only applicable for 2022.02.x/master and not for the older buildroot
branches)...

Regards
Peter

[2] https://invent.kde.org/qt/qt/qtbase/-/merge_requests/115

>
>   Regards,
>   Arnout
>
> [1]
> https://invent.kde.org/qt/qt/qtbase/-/commit/ab6915f0efb12cfe48d1f126f4a828212f853ce5.patch
>
>
> > @@ -0,0 +1,56 @@
> > +--- a/src/corelib/io/qprocess_unix.cpp
> > ++++ b/src/corelib/io/qprocess_unix.cpp
> > +@@ -1,7 +1,7 @@
> > + /****************************************************************************
> > + **
> > + ** Copyright (C) 2016 The Qt Company Ltd.
> > +-** Copyright (C) 2016 Intel Corporation.
> > ++** Copyright (C) 2022 Intel Corporation.
> > + ** Contact: https://www.qt.io/licensing/
> > + **
> > + ** This file is part of the QtCore module of the Qt Toolkit.
> > +@@ -422,14 +422,15 @@ void QProcessPrivate::startProcess()
> > +     // Add the program name to the argument list.
> > +     argv[0] = nullptr;
> > +     if (!program.contains(QLatin1Char('/'))) {
> > ++        // findExecutable() returns its argument if it's an absolute path,
> > ++        // otherwise it searches $PATH; returns empty if not found (we handle
> > ++        // that case much later)
> > +         const QString &exeFilePath = QStandardPaths::findExecutable(program);
> > +-        if (!exeFilePath.isEmpty()) {
> > +-            const QByteArray &tmp = QFile::encodeName(exeFilePath);
> > +-            argv[0] = ::strdup(tmp.constData());
> > +-        }
> > +-    }
> > +-    if (!argv[0])
> > ++        const QByteArray &tmp = QFile::encodeName(exeFilePath);
> > ++        argv[0] = ::strdup(tmp.constData());
> > ++    } else {
> > +         argv[0] = ::strdup(encodedProgramName.constData());
> > ++    }
> > +
> > +     // Add every argument to the list
> > +     for (int i = 0; i < arguments.count(); ++i)
> > +@@ -983,15 +984,16 @@ bool QProcessPrivate::startDetached(qint64 *pid)
> > +                 envp = _q_dupEnvironment(environment.d.constData()->vars, &envc);
> > +             }
> > +
> > +-            QByteArray tmp;
> > +             if (!program.contains(QLatin1Char('/'))) {
> > ++                // findExecutable() returns its argument if it's an absolute path,
> > ++                // otherwise it searches $PATH; returns empty if not found (we handle
> > ++                // that case much later)
> > +                 const QString &exeFilePath = QStandardPaths::findExecutable(program);
> > +-                if (!exeFilePath.isEmpty())
> > +-                    tmp = QFile::encodeName(exeFilePath);
> > ++                const QByteArray &tmp = QFile::encodeName(exeFilePath);
> > ++                argv[0] = ::strdup(tmp.constData());
> > ++            } else {
> > ++                argv[0] = ::strdup(QFile::encodeName(program));
> > +             }
> > +-            if (tmp.isEmpty())
> > +-                tmp = QFile::encodeName(program);
> > +-            argv[0] = tmp.data();
> > +
> > +             if (envp)
> > +                 qt_safe_execve(argv[0], argv, envp);
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index ef38d03253..ac0781c430 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -15,6 +15,8 @@ QT5BASE_SYNC_QT_HEADERS = YES
> >   # 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
> >   # 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
> >   QT5BASE_IGNORE_CVES += CVE-2021-38593
> > +# 0008-CVE-2022-25255-qprocess5-15.diff.patch
> > +QT5BASE_IGNORE_CVES += CVE-2022-25255
> >
> >   # A few comments:
> >   #  * -no-pch to workaround the issue described at
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
