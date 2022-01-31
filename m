Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70735C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 16:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6B1D83F74;
	Mon, 31 Jan 2022 16:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYidx-VqMO9X; Mon, 31 Jan 2022 16:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291F18303C;
	Mon, 31 Jan 2022 16:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4076F1BF375
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 16:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AD7283E7D
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 16:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcixWJqunEHE for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 16:16:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E1F182890
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 16:16:22 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so13074810pjq.0
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 08:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SgjWRZO251AvYlBtNHKEpz1zMvadG/tZ3Pyl0yv90UE=;
 b=LKamh8E0sTgp6wRBnSkkt6T30eP/CUXa82YBZlSanfjOHbGZyG1vTaAljzOReGTAB+
 mtNp8ZN8xj7JI61I7VM6yDEcRcKlaRjb/gu8ZRw6IxmHBWfCXnO+9dJ9S97yJ5L1iBHw
 +2hbWR+1mhziRJV7970CBYSLs4LN7imtJZNjgdMSEi99wC70HqPmYhvFGrkSoYSrBncO
 8KSEl0m+jadiMmG9iJvnu26ujSyL/Pky/KG1FaT/MVSHo5RAe2toTBOavpNbsfxr1Mpi
 VM5gAaG4emrWJzg8seZzSdltaEqDEVfZxJ9Xb8/VvMB0B0vvkSNFRRfzo9myTGmMUpEr
 swOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SgjWRZO251AvYlBtNHKEpz1zMvadG/tZ3Pyl0yv90UE=;
 b=qOuuJ581XMpVZJv50vLYsbHNFERr2w5/Yu/1yN4HvUCIwIpKU3/5PR3T8YDJvkLN/0
 sM7eEwwfyF9S34FqR1akcADfTKAijia93Xqd9IbJTwxSkkhzRpgOd566WMsbQr9vMjUZ
 tWIeC5ASo45E7C3tic+BBG/v7li5+ml7berbERidQVpgX9XG3FJay4nDVDEyU27DDHGg
 rGt9Pa0Ukbja80ZfI9l1qvpwtF3Xdx6mmLzYJSufarg68XVGPx4sMkQsqpGKkVtLUwAA
 iXHUIu73W+YInHtTnZ6W+HQ7DpQNn28RThL8pL47Q6KGCEj2J9YD1ve8ilcHhu3MkoOi
 i/pQ==
X-Gm-Message-State: AOAM533w2fINiyfmpbi7zSb3NaXmLqv/EaXsm9ZSgaH6DzXxUvb7zP+H
 SsZtv790McS4FK1x6I9qhSwVtOB9hdza3GR1duh+/CooUL8h59Th
X-Google-Smtp-Source: ABdhPJy7N35ScFjBKvSHww+d7D4Sq0U0U+fkN6uHMRRSiKXLe6iTV49ur4DR3BrwOMvaaTcJsYv8HK3pvFEoeF6RuCA=
X-Received: by 2002:a17:902:c206:: with SMTP id
 6mr21959560pll.46.1643645781731; 
 Mon, 31 Jan 2022 08:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
 <20220130155235.2f51e08a@windsurf>
In-Reply-To: <20220130155235.2f51e08a@windsurf>
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Date: Mon, 31 Jan 2022 17:16:10 +0100
Message-ID: <CACXRmJjh3BGWJ5frhAgE9pRKPVpLj1aZ4bQbj1prSrMVT2mguA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libglib2: bump version to 2.70.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4468491807388672982=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4468491807388672982==
Content-Type: multipart/alternative; boundary="000000000000f4ecbb05d6e31af7"

--000000000000f4ecbb05d6e31af7
Content-Type: text/plain; charset="UTF-8"

Hi Thomas, All,

>
It's a bit difficult to follow http://autobuild.buildroot.net/, but
I saw one thing when doing a quick scan:

bluez5_utils:
http://autobuild.buildroot.net/results/5c7/5c75ad724df3ff726559acee0da31f777ef6bc68/build-end.log

--> g_memdup, deprecated since 2.68:
https://docs.gtk.org/glib/func.memdup.html

Kr,
Thomas

--000000000000f4ecbb05d6e31af7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas, All,<div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
</blockquote></div><div><br></div><div>It&#39;s a bit difficult to follow <=
a href=3D"http://autobuild.buildroot.net/">http://autobuild.buildroot.net/<=
/a>, but</div><div>I saw one thing when doing a quick scan:</div><div><br><=
/div><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">bluez5_util=
s: </span><a href=3D"http://autobuild.buildroot.net/results/5c7/5c75ad724df=
3ff726559acee0da31f777ef6bc68/build-end.log">http://autobuild.buildroot.net=
/results/5c7/5c75ad724df3ff726559acee0da31f777ef6bc68/build-end.log</a>=C2=
=A0</div><div>--&gt;=C2=A0g_memdup, deprecated since 2.68:=C2=A0<a href=3D"=
https://docs.gtk.org/glib/func.memdup.html">https://docs.gtk.org/glib/func.=
memdup.html</a></div><div><br></div><div>Kr,</div><div>Thomas</div><div><br=
></div></div>

--000000000000f4ecbb05d6e31af7--

--===============4468491807388672982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4468491807388672982==--
