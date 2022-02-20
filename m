Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E71AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010EA605AF;
	Sun, 20 Feb 2022 10:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1ooMrRvG-uT; Sun, 20 Feb 2022 10:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68976605B0;
	Sun, 20 Feb 2022 10:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08F101BF59D
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9F998145A
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baKXq-mXPYql for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:57:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1778581457
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:57:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n8so7892193wms.3
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 02:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=fWrz/FO41O+o3EDzVdEie4V6tZEYDYrxRKm8tvZq39E=;
 b=KogGOMbuQgIfJSOPoHfV7kkfCQzHpV039l7pm/i0lwAwCRCQCHNJ7EovqPZk7bWbqG
 tQhfuN3n/GvTPnUhfwiKrNarDsLCm60FTRCLK53igrFOVmV/hIx/Wvc8KwxTD+aI8eVP
 x8GqzPTbdP7dkWD/NzEdJlmMguN5Dm2wrF/dpuWf49toflaZXxGVDUDObcL3LvHp0IO0
 2v3PLbMRjArFU6XLyf+e3mjOxD8y6rRYb+HV3p9K7sP7oWpVOJbxIqAGbV/x7+NH69Ej
 YQ2RI6XVML4UrwoIL2J8zRGHNengDdF92tGudRY7UK8z4a+jZwnuHgn25vV++xcxhUgt
 DSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fWrz/FO41O+o3EDzVdEie4V6tZEYDYrxRKm8tvZq39E=;
 b=xtUS0bvdZU4ntwVl1Ko+Pyt7nu9cmD1rB3ArOb95WrYJUXWykDvAedchjs4LdTsbEy
 IPPQmKm9Y2zlriZ76dzBxkxoGx62GiXzsQvJxNaqKb1X9AGiNB0nSf4dicZlK8ru6DCy
 gOUZFeB2UbkngjP7XJaZ1Yyyq8xuIktWnj9ZtK02HBOIHawY/jc+XH85l1tELJD/g1ne
 s9H68wO0T2hkS/a7/r5tq6NLnxt53GE11GpF0lVpE6MXzf4YAqfVK89W3WlFKvjKtWnO
 NGou4QH+iCAGW5l0ixggoCjOujkRQN/YU4553aTo8Qk85ocqfc5KtFhYh+U/GIh91ojf
 FHYg==
X-Gm-Message-State: AOAM532JRCLMX1rYDaWXXQSP3sETddtoac6FMNb6K1mcEKGCBVWNGAzE
 DBnmxVDfAUBoQQueXQ5sbJo5bALMNLUUwZcQoBHMqvY12I/Sfw==
X-Google-Smtp-Source: ABdhPJzUDfW5rCtErzr92a1hPXTWP1/jjrb7PKkhmq4oTXqbXnbiK8ikMwIgGSe4RM2LcoLnPO+ZaFgoi+HLNwgegKs=
X-Received: by 2002:a1c:7704:0:b0:354:4d2b:9d5 with SMTP id
 t4-20020a1c7704000000b003544d2b09d5mr17364373wmi.155.1645354651727; Sun, 20
 Feb 2022 02:57:31 -0800 (PST)
MIME-Version: 1.0
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Sun, 20 Feb 2022 18:57:20 +0800
Message-ID: <CAHnHX5jBPNhPMUZz+TPiUk2_+FpWYV0EoHwCdHoKHNsLsqbM4g@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Issue with login
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
Content-Type: multipart/mixed; boundary="===============2945053798492287791=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2945053798492287791==
Content-Type: multipart/alternative; boundary="0000000000008bba0305d870fbda"

--0000000000008bba0305d870fbda
Content-Type: text/plain; charset="UTF-8"

Hi guys,

I managed to compile with success the Uboot(U-Boot 2019.04), Linux
kernel(4.4.155)and root file system(systemd 249) using the
Buildroot-2021.11.1. It was able to boot successfully until the login
prompt. However, it seems like there is an error with the login prompt it
does not want to enter, just looping around the login prompt after I have
entered the login name (not showing the password prompt). Did anyone know
about this?

Thanks.

--0000000000008bba0305d870fbda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi guys,<br><br>I managed to compile with success the Uboo=
t(U-Boot 2019.04), Linux kernel(4.4.155)and root file system(systemd 249) u=
sing the Buildroot-2021.11.1. It was able to boot successfully until the lo=
gin prompt. However, it seems like there is an error with the login prompt =
it does not want to enter, just looping around the login prompt after I hav=
e entered the login name (not showing the password prompt). Did anyone know=
 about this?<br><br>Thanks.<br></div>

--0000000000008bba0305d870fbda--

--===============2945053798492287791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2945053798492287791==--
