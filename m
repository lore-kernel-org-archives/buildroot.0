Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF99C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4844A40946;
	Sun, 13 Nov 2022 16:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4844A40946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LScReTNjjYDP; Sun, 13 Nov 2022 16:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BAD4408ED;
	Sun, 13 Nov 2022 16:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BAD4408ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 346241BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06ECF60BC9
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06ECF60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weg8F7J3nUCE for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB58960AE2
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB58960AE2
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:32:44 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id i3so8958563pfc.11
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 08:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6lGNGbeXNmQg/QeTHTkYN8iZKWsVz+zR67VoFXU/Qkw=;
 b=TB1S5NETSskUDWlbq79oBMXLVkjpnQ9nQpyAcEYY+3AAhVrD58gwfjCy2t34ubsl9u
 c3WnVfci9GdIPtpkc7cfOTRcF0uEFe6sJl+qmQAW2pHpwA6Khn3qlaAGFkmU3CMxC62i
 3DQx1DmHI9VbQ5dzLybLRYIlDcz55gfjFoPmjpm6HoLxDPEdzLJIkzeRUWWafWma4jOz
 wcvwKqC86E90RHQL9XvfGYNTAliWM7H7oL2khoC9EmH7XHz93lSgTQ+OtDWwNAxzbGp9
 qSKje16hk97svXtPxvbKqsyPzKtM5v8c5oRY9F3EZKYbqVqpl0HWzAenR0HoPH6k1E3R
 7t7g==
X-Gm-Message-State: ANoB5pn4UnaYxnG9isyHqLuW+OWSPJTzWys+ji4Sij3bgbOIdYrD41E0
 JTBEW5nXWcxtvwicJRo/AsTAeGn21hcJdh1diD45wdBGo3A=
X-Google-Smtp-Source: AA0mqf72Ytdfa9jIl/XGl1xdxTZD4WGJxNWbi1KfSno30hUYRFFzKPEImABLNYzoU0gYaUz9G8quZvwqU5qN/+isAXU=
X-Received: by 2002:a63:db13:0:b0:45f:a78b:f905 with SMTP id
 e19-20020a63db13000000b0045fa78bf905mr9150542pgg.296.1668357164181; Sun, 13
 Nov 2022 08:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20221030215458.3773991-1-james.hilliard1@gmail.com>
 <877czyq1h8.fsf@dell.be.48ers.dk>
In-Reply-To: <877czyq1h8.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Nov 2022 12:32:32 -0400
Message-ID: <CADvTj4pXB+McZU6Eb0Ex6xe9cBStEBHKCrm00aRrweT7nh=-bA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6lGNGbeXNmQg/QeTHTkYN8iZKWsVz+zR67VoFXU/Qkw=;
 b=dzaqGBp124YpGRzOwSW50bPRXJKkFiy3lN80+GR5YpJL7lGNNVKfZklsPXeSTqsrAA
 DZE4o6Y2k7qFJRWMdcarFA1m/0aQ7z+bQIC91Ja7sB5AcsKEbMxzPawu71Atc5I8nWjq
 2o1q2PnnweCov2xxd5LjccK39STarvLKFGXw27FzPAa0PoeUv5Ybyj8hkqMywhhuJeAs
 l3tnqmuksxvqkSHZhwCNyXPSN78/HEtKwOh/E4bZp6+u5Xuj+Eab7UYq0YyVxI6BncUa
 n1GPq9CzntB48JfbBSXzRFgIe1MD+aCOIPpo6WHpK2MAgu7SzABH6Jj1BPfPP8SoiTeK
 Zl+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dzaqGBp1
Subject: Re: [Buildroot] [PATCH 1/1] package/gawk: fix double free during
 kernel build
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

On Sun, Nov 13, 2022 at 12:10 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > Backport an upstream patch to fix a crash during kernel build.
>  > Details: https://bugs.gentoo.org/868567
>
>  > Fixes:
>  >   GEN     /home/buildroot/buildroot/output/build/linux-6.0.6/tools/objtool/arch/x86/lib/inat-tables.c
>  > free(): double free detected in tcache 2
>  > Aborted
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> This presumably only triggers after our recent update to gawk 5.2.0?

Yeah, seems to be the case.

>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
