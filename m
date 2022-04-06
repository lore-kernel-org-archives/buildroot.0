Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A16C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 02:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55536610A4;
	Wed,  6 Apr 2022 02:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cui6Z9LW1Q44; Wed,  6 Apr 2022 02:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7726C610A9;
	Wed,  6 Apr 2022 02:06:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4A8D1BF296
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 02:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C30E1610A9
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 02:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brv-vga_85cv for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 02:06:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF3BC60B08
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 02:06:14 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id l14so1664059ybe.4
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 19:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=AgYjx8vZtA5BGW8sI+MbjnSJfc/tqJN74hQiAracrZg=;
 b=MR3AXvxmRmlwg99GfPZJcScms1kRf4AbHm+LLx0gXgOITjfgYRNlD8J+0hxqtLDSRd
 qmzGlTHCflb6lWnBG68L4a/5BIFuItrnd9BpZzZnF6zcAc+n1cGn0BN+2QwKmycK2n9J
 bcPi8LuF7DaO8YxvRjnwCcNMdMAqqayEI64ayk6EcJ68PkQVwoLm0L6Bb5lJMABh7+z1
 jBV2xbH1LGnSmrnkSKQkzbR0FVr8L92HLK2Wg1cwB+MF/QdKlxgiybercGwH3te9ZoFP
 0xYAdZwFDZL2QY6Jqa1NfTkJR9luw0Kcp6Ev8cYxVO0aGi2mkU0W7GGStOQ4WHrHhq6p
 39qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AgYjx8vZtA5BGW8sI+MbjnSJfc/tqJN74hQiAracrZg=;
 b=VaKcTQnPKt/jc9+/dk1raIRiOHQLfTzFt8CuRMAgxORdMX71aOTACufGFl3ba0Iokd
 P+OQ2l5+B09yewTKf6llH4rAx69BaL2oRNNCD5si38z7t7zE0xGW7qX83VEyws/is7lU
 cZ14baVpouqqTmIPkucIksJTVJmyEkTOKJ9AeWSoLYPjAh2Dppi18eKQlArBBt0OmHTS
 PMF/MYXoQYWbzxxHyv0H517zrBmCQZJpxZla3ins2Lvp3rX9jJI1+xlh4WHIaw454Q5G
 JzzXob4y/tMQ7ADIhy7mRVCxVo36tGgq0j8cluk3/1vcxscDnuFZv6g6Rnd6pvCcSGYw
 p/Jw==
X-Gm-Message-State: AOAM531yzFRgQB4vgoJ6wf1Jf3OW8Z+ZTRRsZPhg8kSTRLDM3Kv2/5SE
 w8QT9dU9YdqKL2K/4iuoO0aLvgJCUQYzxfWUy+BzFeLcUrg=
X-Google-Smtp-Source: ABdhPJzUfrnzI/TXLIS0/FpUSlA7IArzqDyrMwmom/9s507WkEybnHbz7YVfRdUSYQo+WtELD7i7EQYpK2c+wvpHaqE=
X-Received: by 2002:a25:adc8:0:b0:633:b79d:92ee with SMTP id
 d8-20020a25adc8000000b00633b79d92eemr4675669ybe.457.1649210772810; Tue, 05
 Apr 2022 19:06:12 -0700 (PDT)
MIME-Version: 1.0
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Tue, 5 Apr 2022 23:06:02 -0300
Message-ID: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] [Feature Request] Host cmake built with the
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
Content-Type: multipart/mixed; boundary="===============4888418509816400897=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4888418509816400897==
Content-Type: multipart/alternative; boundary="00000000000045f12505dbf2ce7f"

--00000000000045f12505dbf2ce7f
Content-Type: text/plain; charset="UTF-8"

When using cmake while running a post-build script, the ExternalProject_add
command fails when the URL option is used to download a source tarball via
https. This is because the host cmake is not built using the --system-curl
option (https://github.com/Kitware/CMake/blob/master/bootstrap#L660).

Without the system-curl option, the cmake build will use its own bundled
libcurl without OpenSSL support, and thus downloading tarballs via https
fails.

Adding the --system-curl option would entail that libcurl also be built as
a host library. I don't think it currently is.

I use CMake's ExternalProject_add in our project to download and build the
static library dependencies that our embedded application needs. I know
that buildroot provides various packages for cross-compiled libraries, but
I have no control over the versions (and compile-time options) of these
packages.

Cheers,
Emile Cormier

--00000000000045f12505dbf2ce7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div>When using cmake while running a post-buil=
d script, the ExternalProject_add command fails when the URL option is used=
 to download a source tarball via https. This is because the host cmake is =
not built using the --system-curl option (<a href=3D"https://github.com/Kit=
ware/CMake/blob/master/bootstrap#L660">https://github.com/Kitware/CMake/blo=
b/master/bootstrap#L660</a>).</div><div><br></div><div>Without the system-c=
url option, the cmake build will use its own bundled libcurl without OpenSS=
L support, and thus downloading tarballs via https fails.</div><div><br></d=
iv><div>Adding the --system-curl option would entail that libcurl also be b=
uilt as a host library. I don&#39;t think it currently is.<br></div><div><b=
r></div><div>I use CMake&#39;s ExternalProject_add in our project to downlo=
ad and build the static library dependencies that our embedded application =
needs. I know that buildroot provides various packages for cross-compiled l=
ibraries, but I have no control over the versions (and compile-time options=
) of these packages.</div><div><br></div><div>Cheers,</div><div>Emile Cormi=
er<br></div></div>

--00000000000045f12505dbf2ce7f--

--===============4888418509816400897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4888418509816400897==--
