Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F82C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 20:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD8E415FD;
	Mon, 18 Jul 2022 20:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD8E415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxOmp3civJ_w; Mon, 18 Jul 2022 20:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1BE3408AC;
	Mon, 18 Jul 2022 20:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1BE3408AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B16591BF3D4
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83A6D60F32
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83A6D60F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dgHtbiHb_EI for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 20:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3549E60F2B
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3549E60F2B
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 20:11:55 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 z12-20020a056830128c00b0061c8168d3faso8361793otp.7
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 13:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CUcZQwrgob6km/RlrMgXNP1fErr7zF0PoJgK+D+FYCc=;
 b=6dGbdWw6H3sCD1sdndiq5cQ0Rns9FR+kav4a0AyQEYl3UMFlEU0b0XXj/Na/286qq0
 5uWRnv4SAIS5DoEdJ6pcx4IMFUswHi4WucrYNqWUGMWZNFqrN7rSjj+coESoj9Q+g1Lx
 kQGlBg7bKz9y6/oSd939LIi96lu9AWi9pP1heSMrx39jmOYy3csQOFjHotvR/b6QeYO8
 KFq+CpNUPfAW6kFOl2i3lAiUwXRVqCwNHL3BANmzI/TDEQdoPfvRDn1ETES4UqOyEFr0
 DvGHl/7mPMyPvRBtbhWqauCCAIX552TQ9mjTS5tLdO79+ZWDsBf4wrBFVlno906wV1SZ
 mrnw==
X-Gm-Message-State: AJIora+1py3h36wQaAWwQQt7GfTy6sA59uyXQc999cWb54keu23W8UTY
 CnIWTwkh/3LiyoAZDtfsOUyE+k158kQRs/juOGARJWdYbLE=
X-Google-Smtp-Source: AGRyM1t4BDZF9MS0usvoiurdRILvOBMb7TjtishniNTjPWYD8mm5TnFTjm/OygIEGdiE6vdXaZYpCk/xZvtB/qUHKK8=
X-Received: by 2002:a9d:4f0a:0:b0:61c:ae80:3d36 with SMTP id
 d10-20020a9d4f0a000000b0061cae803d36mr1246060otl.151.1658175113928; Mon, 18
 Jul 2022 13:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220718043901.873466-1-james.hilliard1@gmail.com>
 <20220718120537.5c77cfb0@windsurf>
In-Reply-To: <20220718120537.5c77cfb0@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 18 Jul 2022 14:11:43 -0600
Message-ID: <CADvTj4psaiXnXa+tj2shCts+O4oXeBZ_ZWMyAwP=uNuxB3i6rA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CUcZQwrgob6km/RlrMgXNP1fErr7zF0PoJgK+D+FYCc=;
 b=ZaCsd/544fDRdLQmE3CbGjkVTu3VD2xiWQ1ONHyQeRNIw+XL2ebTITIr5IXGCb8mHB
 8WNd84GfxC3si6e9Bm2EcBrUsRbs+wc05Zmpp/H0rFN52/3RZAefqjR4nMojS5CIlS55
 roJTiqPyf4aacc8aBVzdK+24YzQk3GZBzeD4Rvqe8DBeHqTUrjjiQQJSdkt9Cza7dcKb
 K5jql5OWXTfmztm3NFi7gIH02DUKTs+ft3ssgWDDgJuYS675OKhphRnkFNP5pUQr4R1i
 slxqWw92MZ/6GKvg2GvybcWvapTFYHCt+H0EClWk/PEVYkYdG9hUqXVn+FnVNSSICFSn
 fpkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZaCsd/54
Subject: Re: [Buildroot] [PATCH buildroot-test v2 1/1]
 scripts/autobuild-run: make hung build timeout configurable
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 18, 2022 at 4:05 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 17 Jul 2022 22:39:01 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > A reasonable value for this may vary depending on system load, specs
> > and how many parallel builds are being run, so we should make it
> > configurable.
> >
> > Tweak LoadConfigFile parser to properly convert arg types.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I am just wondering if it really makes sense to make this configurable.
> Indeed, it's very hard to figure out what is the "right" value.
>
> Have you seen specific problems with the current timeout?

Yeah, I've had to raise it in some cases, mostly when running lots
of single threaded builders on slower systems, there's a few packages
like browsers that seem to often take a very long time to build and
potentially run into timeout issues.

>
> Thoas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
