Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923B3C63797
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30F604032B;
	Mon,  6 Feb 2023 10:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30F604032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ev39UN9UjqVz; Mon,  6 Feb 2023 10:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9017A402F3;
	Mon,  6 Feb 2023 10:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9017A402F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92FF51BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C70E4168A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C70E4168A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1UMDJnnV1CU for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:35:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D00C44160B
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D00C44160B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:35:38 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id x29so11641960ljq.0
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 02:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dNKbnst0ZsVfV94HGyXZc78S6yyTLWmJrJZ4vCfbvw=;
 b=ItbFuzZhcwHwikXGZ0IEcrso7lBxd7AZyyDktixLb1odKBMLn3dNRE/nv2pE80dIHS
 Cz1i7p37nFb0Fc7lQ9mrabO7n6W1LcoLf+lASPx+YdxtjhqvO7pKzfK89hQToSGpIlOg
 +1DM9435wiwqW8KPTtGvqJnLdx0teZCAoVTq3WrTFd+SqxqVcUSkASh87O7PL3E8WCFE
 wnpXc58B84DFIhLm4lfPV+R2APmGbFr/UEw9E4+PJO1QEemshDmoqfohqNV4tLGgJ9aY
 QmBWIZ4Wwm8HTmHn4qJeVDh+fLN2FvAiMILIOlyNLF0H9cY+jZEDpQ8b7Jtwzv8H2jL1
 SjJA==
X-Gm-Message-State: AO0yUKWsRXwk2286KZed0SkuMUoSR93GCFsTvEp75/iJmsE9UeKSgkLl
 +y5gj4Wb7r11xLx7/JcPASnv3m6po3wlQGmIFzs=
X-Google-Smtp-Source: AK7set8iwgx/Y9ltCTzd/TX6TesTVjNqlavjBtkFHFSA2N2lHgTTukPV+eX6HEDC3tRvy2qvmZXJSAEqpsBfELc9r/w=
X-Received: by 2002:a2e:86cd:0:b0:290:8080:25d1 with SMTP id
 n13-20020a2e86cd000000b00290808025d1mr2442076ljj.19.1675679736529; Mon, 06
 Feb 2023 02:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20230131142003.1354787-1-troglobit@gmail.com>
In-Reply-To: <20230131142003.1354787-1-troglobit@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Feb 2023 11:35:24 +0100
Message-ID: <CAEyMn7aYh1xU-MCJge3=hEdKCH0-AE-FA6RyWvO2rgoypT+s1w@mail.gmail.com>
To: Joachim Wiberg <troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5dNKbnst0ZsVfV94HGyXZc78S6yyTLWmJrJZ4vCfbvw=;
 b=ZkxGv4IV1PDT0nlORCUxwBExBg37VCaEJwzmzfvVYYC/4JbrcPhEVcOxNrxSA5PbZQ
 /mhh9/QGT5i6En8iBFBMhgqPljpnaN5gPHDznXXmc1kjL1oMux59vghh5yeYiREgq273
 41oCS4dEdf2/92UVGM8Rs8Hz9XZLHLPWVqeLVZxY7psP5AdCa8Pu5OiGmZN+j29ZiTZj
 AkewarAr7ytJOKt9i8arFxma270ItHGnXDswSxIBr27k5QuuI1o4O9NecBeEKAO9jrOu
 Biee1sBGQLBQnWUE+YZaIyFwYoAI7y7EY4aXxsvCP1sNTc7Sb+iG24joz7nfypIhEdZa
 HgEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZkxGv4IV
Subject: Re: [Buildroot] [PATCH 1/1] package/netopeer2: fix sysv init script,
 does not start
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

Hi Joachim,

Am Di., 31. Jan. 2023 um 15:20 Uhr schrieb Joachim Wiberg <troglobit@gmail.com>:
>
>  - The netopeer server forks to background by default, no need for '-b'
>  - The path to the daemon is /usr/sbin, not /usr/bin
>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Acked-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  package/netopeer2/S52netopeer2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2
> index cf53a8f109..cadd6b9feb 100644
> --- a/package/netopeer2/S52netopeer2
> +++ b/package/netopeer2/S52netopeer2
> @@ -8,7 +8,7 @@ NETOPEER2_SERVER_ARGS=""
>  start() {
>         printf 'Starting %s: ' "$DAEMON"
>
> -       start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
> +       start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
>                 -- $NETOPEER2_SERVER_ARGS
>         status=$?
>         if [ "$status" -eq 0 ]; then
> --
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
