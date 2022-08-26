Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004DCECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C8141A42;
	Fri, 26 Aug 2022 14:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C8141A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xucmpty1TgxH; Fri, 26 Aug 2022 14:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7333C419AE;
	Fri, 26 Aug 2022 14:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7333C419AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 280D41BF284
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 14:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9AE261113
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 14:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9AE261113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGO8KlekUS-y for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 14:11:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37CA610F5
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B37CA610F5
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 14:11:58 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id w13so1508528pgq.7
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 07:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EYmJ/jj2I5jzI4PzuBsnD4etjZ0BaUVtpew4gn/PUTw=;
 b=uJYGt6P83r0WHoPfwMFWsfd1F3+Ylf4ANo+bWzE3bayOwT6+lcuRuxP4x+FwVZJnPB
 BFgD+68KnAMs5ozjAGay0BBT7+D4rtPgHGhQ89RTVutfsV5AODNTqHuas9/ucaQzq+hn
 ssBFT0ZUMgkJn01HYRjl2xamiK9BfaalsqzvheuKwGlU06xkyzmnx0p6IL5ARgPxkI1w
 C1Ae22xbpnH3L9lL9mxz4Zvx7KPh4jQJz4TTJM4driJPdIrY6DP4mqROuFA8ZkAlFzkM
 tLNtD7qsGjIf6CRVKs2BzWmdDr/xKlxKoeBX3cf7K28kY4Qf2jHqdl4geFXuK2fy5bff
 FvdQ==
X-Gm-Message-State: ACgBeo3JFEkQok667agRqMGVmQXCFMt4G7fEFLjE3MGdZ/X2GWh6r6Vy
 4xFiYP59/o+TvvZiFGYm76tHAAjHPeU838hvpvU=
X-Google-Smtp-Source: AA6agR4szqnhEOoydkNRmOwUh4QnfqBAd/xqw3eMaKYCzGCc6r2FCP/9x2u6TQ1nUlN38/A/BqE70IwyKLhLupGOZn8=
X-Received: by 2002:a63:1e64:0:b0:429:7f02:79b4 with SMTP id
 p36-20020a631e64000000b004297f0279b4mr3472143pgm.435.1661523117996; Fri, 26
 Aug 2022 07:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220322160725.636205-1-johan.oudinet@gmail.com>
 <20220822141205.GC2167049@scaer>
In-Reply-To: <20220822141205.GC2167049@scaer>
From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri, 26 Aug 2022 16:11:46 +0200
Message-ID: <CAJtjsKZtjXnqki4+yPdkdLNcVa+4kOfmybk-_5yxA8497r31-Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EYmJ/jj2I5jzI4PzuBsnD4etjZ0BaUVtpew4gn/PUTw=;
 b=KhowPTvlHCOINVKqSu4C5N3Qjpaxa2rI4hW0zmqE8KT8uJx3WuJPjup/+ikatW3Jve
 Mnw1o4SS3rw2eknqz5NSbiA/mQH+e0psmzv3TCNTkRE4ln4sFH3g5QSA1B2obvV1zf3z
 EvQIn2+tNED6uYjQYjRniXWJQJuI80mvQpDMVlsVpyzZYVbjbCprYP+gwE5koVEQZWvd
 VvIhCMZ/ZXsYd+QngQPrtbRtdDUnpoLMUQU+howfGHIp75e+1DgXzoV1uFtEu9Fz0v3e
 oJdh6O2HZIoUW4SOjN5QMeWFGLoOnQW3GyUOFELwBQ2nd03L49zmB5zPIUR0Y/O7OKym
 G1og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KhowPTvl
Subject: Re: [Buildroot] [PATCH] package/forge: new package
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

Hi Yann, All,

On Mon, Aug 22, 2022 at 4:12 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> I see that you used the npm registry as the source for this package. So,
> I'd expect it to be an nodejs package, right? If so, then it should
> probably depend on nodejs being enabled.
>
> Here, I would have expected:
>
>     depends on BR2_PACKAGE_NODEJS

No, it is not a nodejs package. It also works on the browser, so it
does not depend on having nodejs in the target.

>
> So, I think I now see why you grabbed the package from the npm registry:
> the package has been built and the minified files generated.
>
> I'm afraid that I do not like that very much.
>
> Instead, you should grab the sources from th github repo, have the
> package depend on host-nodejes, and build the pacakge with $(NPM) build.

Thanks for the suggestion. I didn't know we could do that in recent
versions of buildroot.
It is indeed a much cleaner way  to handle npm packages, even though I
don't like the BUILD commands to download the dependencies.
I've uploaded a new version with your suggestions.

Best regards,
-- 
Johan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
