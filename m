Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F0AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C19D40B0B;
	Fri, 22 Apr 2022 22:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ow_6HCsjE9Z7; Fri, 22 Apr 2022 22:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00E2740B03;
	Fri, 22 Apr 2022 22:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BDAB1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 292528416E
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iC2p-21d8qOY for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:33:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48DED83459
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:33:30 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g20so12051509edw.6
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UMzFQIK1mA9pM55DTkGZpOrRZgY3nnGythbkav2E5H4=;
 b=Ahg4Pj161wiNrO9ukaU/XuKw39p9nOCTyed84Jl91/oWqgkIurnmdJWH9VyDgroyrN
 wp6TujJE4+b6z86grhontArRr9PMayrjaDo1hRDHRjC5j3ATQvJRQbdl1nan80CfWHyZ
 KV5OblRzXBcm2AvAjb6vKnMRuY0wtdPFDLr+VbJkv20s+aTmPUyhgbghIq/Mj0kcHbDv
 6/AzZYzn4yWDA8zSYoccbQA6sNUZoNWVFo6bVnumDhtDecHeKI/9LqF3ARRvX87YHK+e
 I1MELi2GvtFfIGCHRbyK0azUzYnshPAxV9oagg+n36xDbVkJaYINI+8uapfRMCgDEqGR
 z/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UMzFQIK1mA9pM55DTkGZpOrRZgY3nnGythbkav2E5H4=;
 b=N4aZzmE2O5QDQeu7atifCmX6CMK2MQs1vNFOVYAZgCb24LzYLtMsLvLKB1ERKK5gsZ
 8eKKdrfGYfjFAhtwZ6gHI9aSZBmvnnNE8/BVjq5aEARrE67RlIfVh4M1S7MLv80ubCie
 vHe9RiPH6eE1Y0iaAZUeTloHIVWPs88igVCwK2Qn5Fv8LGkGlmBu3XLKT4CNjTf6NMlB
 UYaNawen2tXjoBOgas/FitZL55uqeV9VNg5ekUqS8nzFZ9OgtOBt0kmfr8iPnPtpX8Gf
 AFvvjujcA+1ORomapDTDza8Oq3RPjFyc9pV3zglNRDUTUAu0sh8b+o7Ggn8qyfRF8aJM
 +VJA==
X-Gm-Message-State: AOAM533cWBnuhDcKyBeN0ap0Zd5jHlp63DrMsrJaXjG69+fyRl+aa512
 eh6BAOaKKr0401OOPioJ6HwA/D+1eFqK/Azn8dm8LClB
X-Google-Smtp-Source: ABdhPJy8KSFU3MAjPN83CW5IgQqw5bQ7guxnYjxRs7wYOWo0YZexqvluzvgF68f1854aohIi+kDSzAAw5iITipZo6z8=
X-Received: by 2002:a05:6402:50cb:b0:423:d7a8:719e with SMTP id
 h11-20020a05640250cb00b00423d7a8719emr7174597edb.37.1650666808451; Fri, 22
 Apr 2022 15:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220422181418.2411463-1-joseph.kogut@gmail.com>
 <20220422181418.2411463-2-joseph.kogut@gmail.com>
 <5eced090-c6ac-21fb-3206-f3c0ff0f2e74@mind.be>
 <CAMWSM7hkKNzn4SysPsa-9R51GZq-T67HAAh0fkBEY1zGRZt5yA@mail.gmail.com>
 <8f21f80b-07ae-24ce-a84c-94666edb0381@mind.be>
In-Reply-To: <8f21f80b-07ae-24ce-a84c-94666edb0381@mind.be>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 22 Apr 2022 15:32:51 -0700
Message-ID: <CAMWSM7jjPKncZPktujp6KOBRry52cWGbH1uey+=8hQOFm7r+PQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] package/libcurl: add host-nghttp2 to
 host deps
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
Cc: Matt Weber <matthew.weber@collins.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Apr 22, 2022 at 3:19 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 23/04/2022 00:09, Joseph Kogut wrote:
> > On Fri, Apr 22, 2022 at 2:56 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 22/04/2022 20:14, Joseph Kogut wrote:
> >>> This fixes building host-libcurl, which otherwise would fail with
> >>> undefined references to nghttp2 symbols.
> >>>
> >>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_pack_settings_payload'
> >>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_http2_strerror'
> >>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_request'
> >>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_rst_stream'
> >>
> >>    I guess this happens because it somehow finds libnghttp2 installed on the host
> >> but then fails to link with it? In any case, we don't actually need host-libcurl
> >> to be built with nghttp2 I think. So just pass --without-nghttp2.
> >>
> >
> > It seems so. I think either providing the library or disabling it will
> > work fine, I just didn't want to assume what other users need here.
> > I'll respin with that config, thanks for the review.
>
>   Actually, host-libcurl was only added for host-cargo. When host-cargo was
> removed, we should have removed host-libcurl as well.
>
>   So the even better solution would be to simply revert commit
> 736e0fc5d6103300fb5d6b0cde5e22ce978b8a80.
>
>   How did you even run in to this error? There should be no reason to build
> host-libcurl...
>

I have an external package that makes an HTTP query to populate a
config file. I'm not sure if there's a better way to do this, if you
have any thoughts, I'm all ears.

>   Regards,
>   Arnout
>
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>> <snip>
> >>> collect2: error: ld returned 1 exit status
> >>>
> >>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> >>> ---
> >>>    package/libcurl/libcurl.mk | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> >>> index 97857954db..d5805a1d32 100644
> >>> --- a/package/libcurl/libcurl.mk
> >>> +++ b/package/libcurl/libcurl.mk
> >>> @@ -173,7 +173,7 @@ endef
> >>>    LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
> >>>    endif
> >>>
> >>> -HOST_LIBCURL_DEPENDENCIES = host-openssl
> >>> +HOST_LIBCURL_DEPENDENCIES = host-openssl host-nghttp2
> >>>    HOST_LIBCURL_CONF_OPTS = \
> >>>        --disable-manual \
> >>>        --disable-ntlm-wb \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
