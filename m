Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA830C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 18:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC4683E3F;
	Sat, 14 May 2022 18:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4B_t1El7Muk; Sat, 14 May 2022 18:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F0C8346C;
	Sat, 14 May 2022 18:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0458F1BF584
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 18:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F3C410D1
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 18:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5a4HqO-cCuqy for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 18:35:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E14BD40908
 for <buildroot@buildroot.org>; Sat, 14 May 2022 18:35:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so8676623wmj.1
 for <buildroot@buildroot.org>; Sat, 14 May 2022 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hzf/JjfPX98PhKiaO1d9aViSijgZL9H9Cs+lTkf8V8k=;
 b=KmsGxsFIajvXulkWvMZNlEMcGp+Z722V7a6zrYk08aePCzr9njETbeMA7dqq8frfOd
 y1MKBrbDsWgz4Xfjm2WmuVF8B2wrh5UZR59Nx0u+DUiF/quJPT9FhsPAjB8GoHB8lazh
 h1bCxQaUIvWzJUbi054Bcnxa5mqOnRajz4NReqkfg9ojDfmNsw1k8jwbFbprGNsiCbEX
 y428XG8CropQuV/CRtpPErjEGeSGQxbGrWGjxVTTFDiv36tvGVT8Fg2Qe7lF6Cphf79z
 aiRgOHQWtgVU1Bdq+1S90+8BgYZO5a+el3RUhzvksGB1L5/WB8q7OhU9J4t7sKM4q5k6
 6i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=Hzf/JjfPX98PhKiaO1d9aViSijgZL9H9Cs+lTkf8V8k=;
 b=mXzM0In8smisr+FQZUwe+WM+dqYm7p1rLczLS1KF8hMzwt1S8jQMvo7M0j0CPexzrr
 te3oKNDd/ypnccaNFa3R7Ud9Hy50NyqAy0vDcI/D2sl9CKsYIMLzziWspkcLkeW+Dp9+
 4x1qpaIPRK3nr88RH3npy8VylLSMsftVllTlShJbf5YoBb2a8Ak8NX+xSwC5vt+CO4bh
 uh5ys2i4ZCNkdryIgxMGroHHjDEihcZlASg5d/2VVrCKJClwGZn3sv35MUFCj9osjhBL
 ZU4+JR/XbxnpLduBuq5Ay758MPHZXZEbkFQlomI93yYby1gNx+7fdSDkriRJ31qSvVNV
 V4aw==
X-Gm-Message-State: AOAM532+6fzccWVGFBrQfW/9Pcog9Iq2MW1AsDmSngBB4c7gjn++NqMR
 8onncHiWPRHhPwt/9XjWGNg=
X-Google-Smtp-Source: ABdhPJx2OXlykCzVVb3+K2F6hfd8lRLFHRG2MDeTytZwcFuOqNaoCabHJI6LZheGtzmQHopSz5JpYg==
X-Received: by 2002:a7b:ce82:0:b0:394:2514:6f07 with SMTP id
 q2-20020a7bce82000000b0039425146f07mr9883240wmj.56.1652553336915; 
 Sat, 14 May 2022 11:35:36 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a1ccc12000000b003943558a976sm5599168wmb.29.2022.05.14.11.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 11:35:36 -0700 (PDT)
Date: Sat, 14 May 2022 20:35:33 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Yn/2dekYOuHiq1yw@pevik>
References: <20220510163249.21272-1-petr.vorel@gmail.com>
 <20220510163249.21272-3-petr.vorel@gmail.com>
 <91d3a296-4c11-4f31-d44c-4860ead80498@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91d3a296-4c11-4f31-d44c-4860ead80498@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] musl: backport netlink macro fix
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> > diff --git a/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch b/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch

>  This should be in package/musl, not dl/musl. Also, subject should be
> package/musl: ...
Uh.

>  Applied both to master with that fixed.

I'm sorry for silly mistakes, thanks for fixing them.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
