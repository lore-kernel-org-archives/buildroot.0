Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B3CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 10:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96AAA416CC;
	Fri, 24 Dec 2021 10:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yP1J8miP_E5M; Fri, 24 Dec 2021 10:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF7ED416C8;
	Fri, 24 Dec 2021 10:50:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6318C1BF369
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 10:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5084C400F2
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 10:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzknoGjHONRS for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 10:50:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DE88400BF
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 10:50:24 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y13so31985353edd.13
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 02:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EI2cCVikX9vhdLZLcCbC/XLv3oFpkhU4/KTwgaPJRRc=;
 b=chUB9dtSlq3P7ScI3uaQpl4sg6/NMBmaMpkV2MOuJ7NHdvMaooeYrzcNC3TK8gKKcq
 IqRKV/kEXwBDr6LukpTeQIlhEA9UXoSDecATdL6wAYqMqAS0OXaiqZG/utXcWebb4U/8
 Ib4pmCpMCIe/DydEcry1KQwJpp3cG8DzZwTy2S8/t80NmTi4jSGJMCVuTQgu6vHV7mMy
 o0T16OGb3FP7+CIUbVfWReS9KfPRm/5A9m13CPCslV2zlS0KUeMqIncZPDs91tXleUan
 X/qFHzo0YUv1Lomn815nm+0f7qIeCOyWUhcry8zHQopG+ZmWu08sRQdvw8CJLumxw0UN
 ceXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EI2cCVikX9vhdLZLcCbC/XLv3oFpkhU4/KTwgaPJRRc=;
 b=3n3+ubx2CJW/dRS5/9lKuJR9vfa6iuc1tJvX18XUs3D2cqS+W18mWzfY/kFjk5/fi9
 8u4T9b0IPt0sQoqJS5d3wUePKGMDftVBu88N1VMgSu4u6zvQ+/kK2AGAPjGLINMah/18
 6m1hlMppkRJnmgHsi1mL332TrKxrlg3f6HRqeZVoRnJvCusvz81Mfpon3p1fbqFeWm59
 J4JsNFHnTrpuDNL5Vx71syWY4W5qZxQL1tPNjg8VhvYxSnKv+M9VUUc4SAFMU9TEZn78
 WlvG43evSwDll01c6Xfogat2Hah2m4wfB4ejMO510Et2UKY1WtI8AOlTqQbceofFVoqI
 xzHg==
X-Gm-Message-State: AOAM533RQ2DNLJhxdxkdDVowFdc5dsRrn9hAeJS5Zdb6l3Z/9dhTFOUS
 0Qi7bstRRzn7nzpD4SfEfweTTwdChjKldkrZZLc=
X-Google-Smtp-Source: ABdhPJznlRfPfQujF9S34EkHaf+KOU4XwtG3OCbg/5LSDAKdk2GhyilUHzNH996oAdIcaJCNLm6+fF17RmLwzsIfWSc=
X-Received: by 2002:a50:a41e:: with SMTP id u30mr5422930edb.388.1640343022771; 
 Fri, 24 Dec 2021 02:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20211224095257.2909635-1-yann.morin.1998@free.fr>
In-Reply-To: <20211224095257.2909635-1-yann.morin.1998@free.fr>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 24 Dec 2021 02:50:11 -0800
Message-ID: <CAMo8BfLwKGyJ7yNoG_Px8hnzR7k6jyDZtZfZKhHaM1Am7eeqdg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/gcc: fix xtensa overlay for gcc
 ccache hash
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Dec 24, 2021 at 1:53 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Commit b3b60706221d (arch/xtensa: allow specifying path to tarball file)
> m issed a place where the xtensa overlay was refrenced, thus breaking
> the calculation for the ccache hash.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
