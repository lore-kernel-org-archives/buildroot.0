Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CB4C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 15:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF042814B6;
	Fri,  6 May 2022 15:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxi_mDGqVlRI; Fri,  6 May 2022 15:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A93A81420;
	Fri,  6 May 2022 15:37:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 373761BF299
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3479D81420
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDOTIuwFykLi for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 15:37:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83C3181415
 for <buildroot@buildroot.org>; Fri,  6 May 2022 15:37:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v12so10509707wrv.10
 for <buildroot@buildroot.org>; Fri, 06 May 2022 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hQWWtJuzFdLfnhZusz9fa82dPK8GvYmpun3rGDQJw7k=;
 b=aciAJ1/ZGm+q+ippXVliu/ODJg6WWcS2ZIxC1+oIP2MfwjWz1hdSO0TMM7tj3FWbJX
 3Z7uHB+8fhr5opD9GOEI20gVyAMP3EX2GhMwJcrlZmBFnyZuA35vMwjpX6vVXSd2qrhm
 0QSHbWPnzOPlN9IDqPk1ZcepmOxR7JyQuWW9ixazCMHTl0yf5jX3iweOEZSl3krkmZQh
 tRwE2t4j1iX4v2A0Mge2e8qfEQcZx0rReq25szXeaDoaAq9PUNhUr9O/QWXhVd+wye8C
 p21CMFkC3zU+/31gsRnAOqS04inNbNrSRVMRnc9wm0BkLdoVuXXr69nM6nVSOa6ZD7ho
 IApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hQWWtJuzFdLfnhZusz9fa82dPK8GvYmpun3rGDQJw7k=;
 b=WsK1FjRQv5tDZdsEcc5ywwtJw249+E0yAGZZ0gAp/psMpIetMDXZCjtNWADtTYmJ9h
 mFEOVBlMYfwSyPA8Xc1xjNGXOgo1rLgxpDiopNKGUg2VZPKZmTNqkBN9XhS+2KK39Z7y
 Dp2GF6RbDCz95YBXDux+4GJ34Dh5LA1EhrcFQZEvACGCpTTJMvGuRdwp8t1JFAYUmgO8
 ymJlyNhQKdGOKtumImDhusX14oW6QOua88757OPUH2Ic00FQACU76sGzJY6YPUQatuuF
 A+VaaehbmO5Qr6Z9Sjzz0MFkxIKW8byZ9NHkhZryZRpRly3ANVIZq9uAzKpVhZyzs6K3
 f5Sg==
X-Gm-Message-State: AOAM531jsTOsExm6G1eUFZbbLEBzcClJGbF3nUb0Oi+PKvsoLlk6bXAn
 Jw6tESx2IWZ9kgKllIPZ+v9+VXatt6Bw8Q==
X-Google-Smtp-Source: ABdhPJxak++89lEYTDgISu4QQg8UjRnWIQlLpvCIUttQY/zQoVAyLDkHKW/4yoprRlfQdeBD/GINIQ==
X-Received: by 2002:adf:e104:0:b0:206:109a:c90f with SMTP id
 t4-20020adfe104000000b00206109ac90fmr3155618wrz.259.1651851468316; 
 Fri, 06 May 2022 08:37:48 -0700 (PDT)
Received: from [192.168.12.171] ([46.231.147.8])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b0039456fb80b3sm7046823wmj.43.2022.05.06.08.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 08:37:47 -0700 (PDT)
Message-ID: <615761ef-a121-d65e-6300-7f7291791619@gmail.com>
Date: Fri, 6 May 2022 17:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Content-Language: fr
To: buildroot@buildroot.org, Remi Jouannet <remi.jouannet@outscale.com>
References: <1651848863-30178-1-git-send-email-remi.jouannet@outscale.com>
 <20220506153144.GD19726@falbala.internal.home.lespocky.de>
From: =?UTF-8?Q?R=c3=a9mi_Jouannet?= <remijouannet@gmail.com>
In-Reply-To: <20220506153144.GD19726@falbala.internal.home.lespocky.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: add -O staticroutes
 options to udhcpc udhcpc default script can handle staticroutes but it
 missing from ifupdown options
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgp5ZWFoIHNvcnJ5IGFib3V0IHRoYXQsIGknbSBub3QgdXNlZCB0byBzZW5kIHBhdGNo
IGJ5IGVtYWlsCgpJIHdhbnRlZCB0byBkbyBhIHNpbXBsZSBzdWJqZWN0IGFuZCB3cml0ZSBhIGZl
dyBsaW5lcyB0byBleHBsYWluIHRoZSAKcGF0Y2ggaW4gdGhlIGJvZHkKCmRvIHlvdSB3YW50IG1l
IHRvIHNlbmQgYSBhbm90aGVyIHBhdGNoIHdpdGggYSBhIGJldHRlciBzdWJqZWN0L2JvZHkgPwoK
TGUgMDYvMDUvMjAyMiDDoCAxNzozMSwgQWxleGFuZGVyIERhaGwgYSDDqWNyaXTCoDoKPiBIZWkg
aGVpLAo+Cj4gdG9vayBtZSBhIHdoaWxlIHRvIGZpbmQgdGhlIHJlYXNvbmluZyBmb3IgdGhpcyBw
YXRjaC4gRGlkbid0IGV4cGVjdCBpdAo+IGluIHRoYXQgdmVyeSBsb25nIHN1YmplY3QgbGluZS4g
Oy0pCj4KPiBHcmVldHMKPiBBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
