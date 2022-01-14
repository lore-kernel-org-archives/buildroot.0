Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A0FC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 10:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E352D4158B;
	Fri, 14 Jan 2022 10:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_TvyfhX-_Pb; Fri, 14 Jan 2022 10:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D98D41592;
	Fri, 14 Jan 2022 10:55:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1FE1BF37A
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74C3D41592
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9RWvUJSm95lo for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 10:55:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBA6E4158B
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 10:55:41 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b13so33748954edn.0
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 02:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0aBlHHNOjtbca6fmOKboklhKe7l8FNr5exjGqWjv7KY=;
 b=g1cpiHofsXFTCyyN2xXG+Lk7ThHgUT6U9148RQh7oq+lPW8uoS7D2+g5fezhVbvmty
 2hAjjCumAraxFLHaH5NrfwmEIPsBqTdF9wDeyQQhJo8wqS4Ycu/9QoA2QbLI5Ih/yKh9
 tpUw555kMMNn+xcTIoc7yvnWJFP1sUG6HE+A7IdAapN0jOg32uM6DArHRWmTnZwrv1c+
 x6AcnhgAadi6gjeifrbkuNNeItBK3X7Ij5ufP2XgUp1UaMHuqAUWQi7YWCWDk8CP78/f
 ZcjVPwn1pyM73u+KLCQuzcBHfo8bJF3iwEukgx6aUlrZZt3vQuCdAdzYo3Cy8OzBgrye
 4aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0aBlHHNOjtbca6fmOKboklhKe7l8FNr5exjGqWjv7KY=;
 b=HcLPlRdqatw8IMmFXLq+I+0KnRw+06VT+T/vCrMHvPWs0Orh7VeAG/vYJQJVVomC1/
 iGjXwlgJ+2GK7UufEHZxFqytdgMp18ZmiG5LLU5Ctq/7WXdKY1Cf19fvX3pnLHmlU9WM
 XPlIKGGjybB2JZhpa0iZ8cV9G7cKlZmtcNyfrCHaNeMth5di8xLqvUba2xhQPVbUO4+a
 Nt/8pHYnC5OuSr/5CXBIrgDDIG72M6FEQqs6oky6s21zVgz9XN9qfRPp8tAFVHdfPMKh
 wZnq37cJYe5Dy5rnKbptZWh+pjlwzdRuC+pLe0g76qsPGxGUFLXJe/FVaeS4lJU1zqXW
 PXZA==
X-Gm-Message-State: AOAM531nReTUWvYhwp7oFLUEvdYkFzFcrwil4O9xur3yrrxBTKA1CyX6
 CoIVEYskpgLHlbjESsFFNAtrCwRgzE7l8GRP/EQ=
X-Google-Smtp-Source: ABdhPJx3vq8znjV3e0+HEIWHHQZN0OTa1LxQItUEkygCJjlXwxJbN93eiQEgnpPF1g7b+JKZ1ePFJfHEV0Jw/1tU3rg=
X-Received: by 2002:a17:907:60d2:: with SMTP id
 hv18mr6759999ejc.214.1642157739973; 
 Fri, 14 Jan 2022 02:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20220112184821.916646-1-heiko.thiery@gmail.com>
 <20220113220057.1db30808@windsurf>
 <CAOMZO5C+cjNoVVEe44MsnuZgVj2TKdTJo8xF7Y0o5ksjk_TLpw@mail.gmail.com>
 <CAEyMn7Z-+WVwtYje4EutgZVBMBZqdvS+3kt7DhGvOzJD0no1Yg@mail.gmail.com>
In-Reply-To: <CAEyMn7Z-+WVwtYje4EutgZVBMBZqdvS+3kt7DhGvOzJD0no1Yg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Jan 2022 07:55:28 -0300
Message-ID: <CAOMZO5AdZVXkWUqUNnMs-wEZix6zkPvLMjZiHuiwwLuDqzDZow@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

On Fri, Jan 14, 2022 at 6:39 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Can you tell me how often this happens? I updated my defconfig with
> the comments from Thomas. Now I bootet the board with that several
> times and can not see the behavior you describe.

With a 5.16 kernel it hangs approximately 80% of the times.

By using earlycon, I can see the start of kernel messages. It seems to
always hang near the imx-sdma driver.

[    0.563618] NFS: Registering the id_resolver key type
[    0.568147] Key type id_resolver registered
[    0.572317] Key type id_legacy registered
[    0.576407] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.583079] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    0.590661] 9p: Installing v9fs 9p2000 file system support
[    0.631634] Key type asymmetric registered
[    0.632882] Asymmetric key parser 'x509' registered
[    0.637887] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 245)
[    0.645224] io scheduler mq-deadline registered
[    0.649771] io scheduler kyber registered
[    0.666398] EINJ: ACPI disabled.
[    0.681930] imx-sdma 302c0000.dma-controller: Direct firmware load
for imx/sdma/sdma-imx7d.bin failed with error -2
[    0.689628] imx-sdma 302c0000.dma-controller: external firmware not
found, using ROM firmware
[    0.689635] imx-sdma 302b0000.dma-controller: external firmware not
found, using ROM firmware

I will investigate this when I have a chance.

Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
