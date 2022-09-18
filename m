Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015E7C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 13:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED4B60E3C;
	Sun, 18 Sep 2022 13:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ED4B60E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Y6lMsZxQPBr; Sun, 18 Sep 2022 13:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE7E360D4B;
	Sun, 18 Sep 2022 13:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7E360D4B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D853C1BF426
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFE7A4047C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFE7A4047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcSHn3sB9Z7f for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 13:10:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3449840111
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3449840111
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 13:10:02 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id w2so15353244pfb.0
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 06:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5jvjlg5QmSHN13jXhZk37jLEuzFPVfWiLIdR0oT/DTg=;
 b=HUfdBuphm7xJYL7u2+LlohrVpdr43n2YqB78wRrmNwvQQVRsykcJV2N2esNDEORx5+
 eaiuYfJ9h7/L13YIwar2NYhzY+tbHtjfO65oHFtmpF56RagJudu5hmI/xSCzkw2yUYUD
 ibge1W9wAc2oCCkIUumDolwBvE0r2nEVO7mi5Z7wynRmzreyB2NOfogI+YnEK0Sifd7+
 onXQEhuoBtHc3TUm8n8BWmOQ/Phir5HNNyq27xL3loTcc3jSHg7EpHvOC8M20wOvD4VU
 bqeVmLGtXNY+iF3L0URylbi7xjPAHNYNAZYs2dUG5kkcS3+Qd4/cSSKRr7BwBBA44TXm
 Zd9Q==
X-Gm-Message-State: ACrzQf2Au2iz5EyTqnsdgM7FkILCtKzy46f21n12dabJVsaQhnRYmGof
 g8GgEc/LfpvSwh/Ag8d5xcQu8D4yAgxF75/pw7s=
X-Google-Smtp-Source: AMsMyM5QCZmkcUFcFX7fbEsqeViLGjZERIUIkTB/vX4Ps76zCCoOxxQzvK34h9DF15aAtA7yXzFJoTF7vGL2KU7Tq18=
X-Received: by 2002:a63:e305:0:b0:439:6e0c:f81e with SMTP id
 f5-20020a63e305000000b004396e0cf81emr12439459pgh.50.1663506601423; Sun, 18
 Sep 2022 06:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
 <20220720222430.7eb519f6@windsurf>
 <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
 <20220722231518.1536cd2f@windsurf>
 <65b22e0d-1a50-54e9-3ad2-92e3d804ebbb@mind.be>
 <CA+h8R2oX11-6vwu8SsqKQqKKZ8OsMDRzOcNThC9PPnYb+sXE=A@mail.gmail.com>
 <989b969f-6450-bfad-c2ad-340a799c3dea@mind.be>
 <f7cf7f1e-797d-e83e-1c2a-6e66357bfcb6@mind.be>
In-Reply-To: <f7cf7f1e-797d-e83e-1c2a-6e66357bfcb6@mind.be>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 18 Sep 2022 10:09:50 -0300
Message-ID: <CAOMZO5B+F2unie8WJ-RmwVKsb22Zex3v1Nyi6K1xUDgfEVWQew@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5jvjlg5QmSHN13jXhZk37jLEuzFPVfWiLIdR0oT/DTg=;
 b=hLF+QZxbhDghM/DHkZSkbRe12rEmi0MlSc8pRkcEQiCKQk0ARri7e4DxYYfVxfnNMJ
 n0SPbHQr5dWFrGrg8RFv6PXyBvoQcma2WBalUuS2IK4v//WMqeLbHSiXbWNnkKcfKIob
 Kqtj4wv8CzSo8hxTNoF5wYzdiRYtoPzY2ncDMlSslFX8+FK+m6X+Zluv8rWd+1yWSTUn
 +LnFO1Nv0BX+9xvV9lzIfu9NqekNkn+FIS0tacc2EW0RqtOsQ6dHCpvvPd3nzuKlJk3g
 IxAei5LFM+6riIcM6KzXwB1BXsWTy4NH+1Bh0Dl0cZKwHVCz1HFb0dugVLCwuosFcZxe
 K79A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hLF+QZxb
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: "Barisani, Andrea" <andrea.barisani@withsecure.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Sun, Sep 18, 2022 at 9:50 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>   It turns out that other packages also do need it, e.g. containerd and delve.
>
>   So I moved this to the pkg-golang infra [1], and marked this patch as Superseded.

Thanks for taking care of this.

Regards,

Fabio Estevam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
