Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275B1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADF68473E;
	Thu, 10 Mar 2022 20:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kyDq5sD_L_1; Thu, 10 Mar 2022 20:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A8438436B;
	Thu, 10 Mar 2022 20:10:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD9D1BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86BBE8436B
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EGiL0WRVSXk for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:10:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E70428428D
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:10:39 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bg10so14590071ejb.4
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7bGUHs9DwEqovNvQ3F8kTWxpIG4tgM6TbXS+HTKVrVA=;
 b=D41ciRqI+1ajbqGUgqddtvaV/0LmlVkfqFobs5r6+MhSCemuBy04HM8ziO2FxWDfdw
 HfAXF14xwGI2ES89bn9i/U/tUPnZqUSHAh2Z6U2GGv5QKCtx53MdiE1QyofRhJYNQXtS
 iB/GjFEUOXvX1LcukiFKQEpFKRKn5vjZJEgwQA71HEPeEBE9dTu2x0lSbbzvmljiSqfD
 isJCE4HmYGDqE9J4ucJHl2VCo+PO18rY3DMQ1i6mux22N9Wjm9cmwhgiM+WGAoAmOeQW
 0TnqCccQsPTqHDH7a78mvLgyMKFbdt0zSXYcR0t6x/C6BUe4+NHCRJW3crqQYhHkNsav
 z75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7bGUHs9DwEqovNvQ3F8kTWxpIG4tgM6TbXS+HTKVrVA=;
 b=Wx3L5Gc+kdjNBzoboegWzgcySpLg4pssI94609qk6JYtNAzYpcNKUNQVraWjAYzko0
 kvF9UhemUyCeOIAzX6XflOmTrw1XQ0yv2dGa5eH9qoEMXnQqAFRu+5J+mQk7NeBlDJLx
 hNseAYMWCP9GoGldEgWoN9twp828uHcG23+oa6VuejsutT7boweGrbfXpqM1pSmrTUIL
 utPqTUHsyRatlL2/N2PD6sQyt8s+4+m6K4ls+NuDZvkz8nuV6qJVClECAsmw1PbT34DN
 152jZvfwjas+mGkKy8yv8wXUYdK5NMhlKsViJphh4XqGFC7xe8Jc4YcjjY63pM8YPq8A
 WN5w==
X-Gm-Message-State: AOAM532XAM7xlXz2lngxMQQ5Wt/GwSei4TmU4q7CN08eBn8TDX+XiPs+
 VIbP8wX79Yd1yAZGV5oOAE3xE73zDIqyCw==
X-Google-Smtp-Source: ABdhPJwpontHUGxG175tTqJRJKC1V8vXSh1fDC1ir3ibjrRYvNAqrmwN7bNj5UFV/T2IeaQ2lrYixw==
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id
 r11-20020a170906280b00b006cef3c7688fmr5852077ejc.468.1646943037939; 
 Thu, 10 Mar 2022 12:10:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a1709067fce00b006db0edb8a80sm2145263ejs.225.2022.03.10.12.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:10:37 -0800 (PST)
Message-ID: <e47e01eb-0992-20ba-130e-f53df351c1c9@mind.be>
Date: Thu, 10 Mar 2022 21:10:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220309142913.2102898-1-foss+buildroot@0leil.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309142913.2102898-1-foss+buildroot@0leil.net>
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
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Quentin,

On 09/03/2022 15:29, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This fixes CVE-2022-25255[1] by using a patch provided by Qt for 5.15.
> 
> The patch fails to apply because of a conflict in copyright year so it
> needed some additional handling after downloading.
> 
> The patch file was added by running the following command:
> wget https://download.qt.io/archive/qt/5.15/CVE-2022-25255-qprocess5-15.diff -q -O - | sed -e 's/Copyright (C) 2021 The Qt Company Ltd./Copyright (C) 2016 The Qt Company Ltd./' > 0008-CVE-2022-25255-qprocess5-15.diff.patch
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2022-25255
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   ...008-CVE-2022-25255-qprocess5-15.diff.patch | 56 +++++++++++++++++++
>   package/qt5/qt5base/qt5base.mk                |  2 +
>   2 files changed, 58 insertions(+)
>   create mode 100644 package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
> 
> diff --git a/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
> new file mode 100644
> index 0000000000..dfab92a9ef
> --- /dev/null
> +++ b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch

  Please make the patch something that approaches git-formatted. At the very 
least, the patch itself must have a description of what it does (i.e. a commit 
message) and a Signed-off-by from you. Ideally, though, you look for the 
appropriate commit in the upstream repository [1] and use that instead of a 
random diff. In that case, add something like this at the end of the description 
part:

[Quentin: backport from upstream commit ab6915f0efb12cfe48d1f126f4a828212f853ce5 
in 6.2 branch]
Signed-off-by: ...


  Regards,
  Arnout

[1] 
https://invent.kde.org/qt/qt/qtbase/-/commit/ab6915f0efb12cfe48d1f126f4a828212f853ce5.patch


> @@ -0,0 +1,56 @@
> +--- a/src/corelib/io/qprocess_unix.cpp
> ++++ b/src/corelib/io/qprocess_unix.cpp
> +@@ -1,7 +1,7 @@
> + /****************************************************************************
> + **
> + ** Copyright (C) 2016 The Qt Company Ltd.
> +-** Copyright (C) 2016 Intel Corporation.
> ++** Copyright (C) 2022 Intel Corporation.
> + ** Contact: https://www.qt.io/licensing/
> + **
> + ** This file is part of the QtCore module of the Qt Toolkit.
> +@@ -422,14 +422,15 @@ void QProcessPrivate::startProcess()
> +     // Add the program name to the argument list.
> +     argv[0] = nullptr;
> +     if (!program.contains(QLatin1Char('/'))) {
> ++        // findExecutable() returns its argument if it's an absolute path,
> ++        // otherwise it searches $PATH; returns empty if not found (we handle
> ++        // that case much later)
> +         const QString &exeFilePath = QStandardPaths::findExecutable(program);
> +-        if (!exeFilePath.isEmpty()) {
> +-            const QByteArray &tmp = QFile::encodeName(exeFilePath);
> +-            argv[0] = ::strdup(tmp.constData());
> +-        }
> +-    }
> +-    if (!argv[0])
> ++        const QByteArray &tmp = QFile::encodeName(exeFilePath);
> ++        argv[0] = ::strdup(tmp.constData());
> ++    } else {
> +         argv[0] = ::strdup(encodedProgramName.constData());
> ++    }
> +
> +     // Add every argument to the list
> +     for (int i = 0; i < arguments.count(); ++i)
> +@@ -983,15 +984,16 @@ bool QProcessPrivate::startDetached(qint64 *pid)
> +                 envp = _q_dupEnvironment(environment.d.constData()->vars, &envc);
> +             }
> +
> +-            QByteArray tmp;
> +             if (!program.contains(QLatin1Char('/'))) {
> ++                // findExecutable() returns its argument if it's an absolute path,
> ++                // otherwise it searches $PATH; returns empty if not found (we handle
> ++                // that case much later)
> +                 const QString &exeFilePath = QStandardPaths::findExecutable(program);
> +-                if (!exeFilePath.isEmpty())
> +-                    tmp = QFile::encodeName(exeFilePath);
> ++                const QByteArray &tmp = QFile::encodeName(exeFilePath);
> ++                argv[0] = ::strdup(tmp.constData());
> ++            } else {
> ++                argv[0] = ::strdup(QFile::encodeName(program));
> +             }
> +-            if (tmp.isEmpty())
> +-                tmp = QFile::encodeName(program);
> +-            argv[0] = tmp.data();
> +
> +             if (envp)
> +                 qt_safe_execve(argv[0], argv, envp);
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index ef38d03253..ac0781c430 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -15,6 +15,8 @@ QT5BASE_SYNC_QT_HEADERS = YES
>   # 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
>   # 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
>   QT5BASE_IGNORE_CVES += CVE-2021-38593
> +# 0008-CVE-2022-25255-qprocess5-15.diff.patch
> +QT5BASE_IGNORE_CVES += CVE-2022-25255
>   
>   # A few comments:
>   #  * -no-pch to workaround the issue described at
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
