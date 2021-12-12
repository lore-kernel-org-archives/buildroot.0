Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2551C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 07:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B2DB85928;
	Sun, 12 Dec 2021 07:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmkZT1rUeFGp; Sun, 12 Dec 2021 07:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB71385924;
	Sun, 12 Dec 2021 07:25:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57B131BF3BE
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 07:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4608F60E21
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 07:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oledcvHPHOom for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 07:25:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B153060E08
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:25:24 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id m19so8501700vko.12
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L97M2QjHUnF1upPWQNZHTip0syzptv7U5e8lIsNj7gQ=;
 b=Uln7ThWfJTplFSDIwa2qchNjmCqfFowmndC8OiSg5Ot/+xjrbilfqLOR35b2dJzfz3
 b2xGxt3ifz4pgkqazfYEAQFCPwOpb8hJjd6S2fmpqrvManDLrvRambul9LMaTAnbyfGF
 OgxTLVA5HML5YjVi1dALOZXDUna7m9rNRsrESi4+tiXyr/Dg/4B0bmp+dxfVGlBmywaL
 RXvvljp2lQD0Z5gdQx9DaeoAqw622jXRdD4YBkFZXFZoy3zhjjQyElCkK6/jALP0LYtf
 +bBoi7tpu8Bw0E1HSHHWsf0bikLln07GeLS0eiA+WPNn5VIlVxAPgD37THBXvlAsI76P
 +K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L97M2QjHUnF1upPWQNZHTip0syzptv7U5e8lIsNj7gQ=;
 b=0KOTbtFSNJr9Nd7R9ZohrZ1bb5k+TQ1syR1fCu9GXK0Xb0EE2xKUduThTVzsrGP6ln
 4UiDs+ZJ3m5jaN38pj7fHIbW3gZ8sUnIoasghEykq6ZvpTVzGoYO0gsYjQHd1bxY3UYd
 qAXoH7tSuz5HrATVLsBkM+DF9RGbyCNOshbM8Rj+argmHL/1xkMx5uLWh3JtW1njedcX
 PQPRaxN0pYoWc+3KUkMqOqkHoLSI0dH+PnPMBZvjB4L8CTVPHzHkrUlFXHDV5VdVdIuw
 dHcn+JeYVkNQDi5W5WXJaYtXHLA0hz8x+xawsCoDqLm6utTeq6+jgj8A3u1KFoI+EBEx
 G2gQ==
X-Gm-Message-State: AOAM5305YHvNkrBZEAJJLvX2TOqANHabvfo5OHZOf9/3WVBsrJrp3NPn
 j9ms7dfrY6AaeDAka2F1tX1dCeZ19MeCVA==
X-Google-Smtp-Source: ABdhPJylFLlkftbopcQCUhLHZb8HnR4eOQOSOLscZCnverXz8rfr+tdbzJkP02pUpyw46mxwEpLlZg==
X-Received: by 2002:a1f:1fc9:: with SMTP id f192mr25892427vkf.33.1639293923128; 
 Sat, 11 Dec 2021 23:25:23 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id g21sm3703365vkd.26.2021.12.11.23.25.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 23:25:22 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id p2so23918360uad.11
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:25:22 -0800 (PST)
X-Received: by 2002:a67:6283:: with SMTP id w125mr23472427vsb.85.1639293922508; 
 Sat, 11 Dec 2021 23:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20211210211558.4015391-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20211210211558.4015391-1-fontaine.fabrice@gmail.com>
Date: Sat, 11 Dec 2021 23:25:11 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qBzZ6ui73xR8fVKN2j0kWBJJEEBE89UYL=im75Cumy9Q@mail.gmail.com>
Message-ID: <CA+h8R2qBzZ6ui73xR8fVKN2j0kWBJJEEBE89UYL=im75Cumy9Q@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.5.8
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Fri, Dec 10, 2021 at 1:16 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  09be0cedea77568029aa0c7be9a323b89fa6886b402b5d223780a05b8c7cd45a  containerd-1.5.7.tar.gz
> +sha256  a41ab8d39393c9456941b477c33bb1b221a29b635f1c9a99523aab2f5e74f790  containerd-1.5.8.tar.gz

Reviewed-by: Christian Stewart <christian@paral.in>

Regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
