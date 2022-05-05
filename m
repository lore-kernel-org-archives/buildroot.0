Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5364FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0304060BAC;
	Thu,  5 May 2022 20:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIE4ybNuxqAN; Thu,  5 May 2022 20:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0596F60AA0;
	Thu,  5 May 2022 20:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5571BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1DAA60AA0
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uonXZtd5aajR for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2B7F60A70
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:40:20 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z19so6518336edx.9
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YgPhhw3fHr6I0hxTQL6deBMP+spl6Gddu4zfj3wup7o=;
 b=INN4zIy9gS37Iq53IBq0OB8oL4t7Kc6n5y+FRYfQ+eUkGXrz0Qv6mFAgirOQGWIczn
 DrcLbIUAiguV/zR163uY/+lTfE7qRQZu5zKFK60Gqr49hG3rT7t5i0jpAWZk8cCFHLAY
 /YYSdbtgoyUbNnFIBSJMCjL7JKHluyD7EMICasxo+rVpEgYE4L329EvAM4bFciE44qPQ
 kDxldCnGZX8NXiPt1O1JQyPMCgJBkzHTqfgNEiZtw5k7mmxThs8UaUf/aEI2x+d0eDc3
 58v1BrOEtGORjY8S2S5uFKJT4R4znkShp2LZHexK0bwu974fgHQfOWokolYC7yoCM/MX
 +UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YgPhhw3fHr6I0hxTQL6deBMP+spl6Gddu4zfj3wup7o=;
 b=AmQB9L5VcG2OjZc98PciDM9h8anHT2xfk4H10yk+URDuQAY7tOpgx4v7ABxrqUsszZ
 A3XfFK2wxETV+oxrFXBB/UnChIgKjZyA9tnMhV0C2SQm5mPTlmm/PCo+ygCnAsBBbxnY
 h7f8wFZquvSKUtNaV8n8wIUY1nH4IP7OGDQ3CIXcv9vFmBaelAhUmdg9oiQM5YrnPqXK
 VQVdTb6/qNJ5UnuGQzb/cqMMOKVM0r4VoQPw/cOsk8cukxrxGyUdV4E2o58tMzsUSDkv
 GgqO2Ljkp5PzGhVagc+9daSJcwLVPrf3YTjHxw/EQhZsr6h518yjLoekm+fkdvpFb049
 cH/A==
X-Gm-Message-State: AOAM533CgCOM1hukIzbR9xIyZ0U71n03Knm6w4QJLCHAjOeD2DFjEbOq
 GAmIIS/yCKQVJKJr0yRmDUZ2jbeTqkzP6g==
X-Google-Smtp-Source: ABdhPJxGWt8owfFH+Aoq5paeXBwtOyc6exmXd0reQGruLNbaiqhNTxFXtsU9q3YJEgqgSH6bP+9jTQ==
X-Received: by 2002:a05:6402:1e8b:b0:41c:59f6:2c26 with SMTP id
 f11-20020a0564021e8b00b0041c59f62c26mr45087edf.156.1651783219100; 
 Thu, 05 May 2022 13:40:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a1709063c4c00b006f3ef214dbcsm1135778ejg.34.2022.05.05.13.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:40:18 -0700 (PDT)
Message-ID: <2fdf319e-59c5-e146-4294-f85d03cdc3a2@mind.be>
Date: Thu, 5 May 2022 22:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220505202436.1058027-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505202436.1058027-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/zchunk: fix symbol conflict
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 22:24, James Hilliard wrote:
> Backport a patch to fix a symbol conflict issue.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...002-zck-declare-write_data-as-static.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/zchunk/0002-zck-declare-write_data-as-static.patch
> 
> diff --git a/package/zchunk/0002-zck-declare-write_data-as-static.patch b/package/zchunk/0002-zck-declare-write_data-as-static.patch
> new file mode 100644
> index 0000000000..3c48ab3d50
> --- /dev/null
> +++ b/package/zchunk/0002-zck-declare-write_data-as-static.patch
> @@ -0,0 +1,34 @@
> +From 477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Wed, 4 May 2022 16:32:48 -0600
> +Subject: [PATCH] zck: declare write_data as static
> +
> +This needs to be declared static to avoid a symbol conflict:
> +io.c:(.text+0xe8): multiple definition of `write_data'; src/zck.p/zck.c.o:zck.c:(.text+0x1f4): first defined here
> +
> +Fixes:
> + - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc]
> +---
> + src/zck.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/zck.c b/src/zck.c
> +index 7727479..83b2630 100644
> +--- a/src/zck.c
> ++++ b/src/zck.c
> +@@ -159,7 +159,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state) {
> +
> + static struct argp argp = {options, parse_opt, args_doc, doc};
> +
> +-void write_data(zckCtx *zck, char *data, ssize_t in_size) {
> ++static void write_data(zckCtx *zck, char *data, ssize_t in_size) {
> +     if(zck_write(zck, data, in_size) < 0) {
> +         LOG_ERROR("%s", zck_get_error(zck));
> +         exit(1);
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
