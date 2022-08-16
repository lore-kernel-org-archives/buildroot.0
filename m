Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8C3C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 17:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A32760B95;
	Tue, 16 Aug 2022 17:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A32760B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zu3qNoveL3Pw; Tue, 16 Aug 2022 17:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8661260B35;
	Tue, 16 Aug 2022 17:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8661260B35
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 234081BF391
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 17:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F257D60B35
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 17:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F257D60B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQd-2ygss9wf for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 17:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92BD560AE3
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92BD560AE3
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 17:40:20 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id u10so8362604qvp.12
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 10:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kk5utAbTGKyKdLnqWrJnm0Jdfj1mElQCQ+W3nspeS+M=;
 b=Egt3hI9V9/Tyjsc6xGIniLINyCBnXObN0/q/fvPPIJLdiSf8BPidOPbP6RTyKZcmX1
 zhe3HW3E6zSgDvJ55URWB5YSsYsWalDDXb6LiZ8SK9X5M0j4rVrHAFC402K8ZmruVmSh
 Z0P/7WpFzeh/SvW9qRDL5oj8yhbRZ5Fy98iyxc+RUdLsKnTq8kkdJSZ6rZW3qoJ7tsud
 aP6rXcnyXX8YZ66o3JiTVSEKXrzqP3KP3GKa5VfX1zGzBxVieFfMrRmN7pa+dxEwTUqK
 gDWTS8a53OBaOJoj+W5pbv7ndtTLnxpYrchqEyKvRnSXyA3xWsl2Q6GxgKKnVHXMqfmG
 P73Q==
X-Gm-Message-State: ACgBeo0xYrtdVDGETtJRtE/NcjTPPQcSslJllioi5YetWsK7ukmUSa14
 W9lpn4UdIMj2MofU1J8GWs7RFL06FstsV3a9xr/5EPw+bjrXB/eI
X-Google-Smtp-Source: AA6agR5UbmoPcqRD9wyh2wQhVYF9PESFjWNkMBvT96TO3if20Id5yQ0bdFHhdcFjhNI433DO/+8G5kwoE51eJFmwYnA=
X-Received: by 2002:a05:6214:c6f:b0:479:5993:5e8d with SMTP id
 t15-20020a0562140c6f00b0047959935e8dmr18739747qvj.15.1660671618926; Tue, 16
 Aug 2022 10:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220809203505.3620840-1-mmayer@broadcom.com>
 <20220815195618.GM2854108@scaer>
In-Reply-To: <20220815195618.GM2854108@scaer>
Date: Tue, 16 Aug 2022 10:40:08 -0700
Message-ID: <CAGt4E5sMFKOmGX_syrwP85ZqFebb_r6x-E_rd=kB+8dk5RJjxA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kk5utAbTGKyKdLnqWrJnm0Jdfj1mElQCQ+W3nspeS+M=;
 b=TlRUyIH+H5KVquO5ZMDZHWg2znzOnUTTLO3r18SgxDwmyvR+rwVw89Um1YwDNNd8Xk
 Ta3TmIUi78Qd6W6Fz7QWUT6iUha8hr2XNmGetaf8iaPyjdSuw5pnrlnC/ISWPLFaeN7O
 lhjCLJEYHCqbsIzgtnEHQaRJTQGLE3eZrzuKs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=TlRUyIH+
Subject: Re: [Buildroot] [PATCH] package/linux-tools/linux-tool-perf.mk.in:
 Fix disabling of documentation
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Woo.. almost six years before my crap gets noticed! ;-)
>
> > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>
> Applied to master, thanks.

Thanks for applying this. We have to thank Ubuntu 22.04 for flushing
out this error.

In the past, /usr/bin/asciidoc used to be a regular Python script that
would import "regular" Python packages (i.e. nothing special). The
actual parser was contained in the script. With Ubuntu 22.04,
/usr/bin/asciidoc became a shell script like so:

$ cat /usr/bin/asciidoc
#!/bin/sh
python3 -m asciidoc "$@"

This means that the actual parser now lives as a Python module in
/usr/lib/python3/dist-packages/asciidoc. And therein lies the issue.
We are using BR2_FORCE_HOST_BUILD=y, so it builds its own Python
interpreter. And while .../output/arm64/host/bin/python3 is perfectly
capable of running /usr/bin/asciidoc when it is a standalone script,
it can't run asciidoc as a module, because
/usr/lib/python3/dist-packages is not in the custom Python
interpreter's search path.

And, thus, our build started failing when conducted on Ubuntu 22.04
(while being perfectly fine on Ubuntu 20.04 and older). Subsequently,
a slightly confusing search for the root cause commenced, since none
of these findings were expected.

I am mentioning here what happened, in case somebody else comes across
a similar issue.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
