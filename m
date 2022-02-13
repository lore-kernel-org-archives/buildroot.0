Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA13C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 16:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5206540352;
	Sun, 13 Feb 2022 16:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drLxjRt8-dXz; Sun, 13 Feb 2022 16:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91A2840323;
	Sun, 13 Feb 2022 16:56:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED001BF421
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38C7D814B5
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZ3aTB4SppCI for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:56:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B77E81497
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:56:57 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o2so26209350lfd.1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 08:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OO4ePggYWfSJzU1hehQXA6jDwhFROvaBH3uPHaupyd4=;
 b=UqI6hsZIWs6huOYmCyvri7abynzovVH0DNwwdGmNzOD8/xnDDz628jPHEcPzHIaeL3
 NhA8X/vuyRuLlJR0FMyum3mRFEFYaEps9PwlKDFK+8BibEycP5pf17YEed9VAMn19TF8
 kLIg981Pw4STYBZvOY8lsw/BbHCMCEhukcmeVR7sq+GcB7fFvC5e56FQCLw+3n9fR0NL
 gfEYzCOucBweMNiE5HvIIEZBhwsYi4bVTNjO4eAJ7Ci442sGD8XWjvm9jr+7/QqKgZzu
 xXnXsSIaq8YKCj+tB3t6onQYhUR8JAwujb+08w/JdRZH3vy/o8ats7PT6Z01CTjrFRmv
 krtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OO4ePggYWfSJzU1hehQXA6jDwhFROvaBH3uPHaupyd4=;
 b=m24+Cg/Hw4UdgUYkva2sVHXLRAWDhAhhzTfmkVAjnXfJAr/Qc7DHt87pNvvbeSaSC0
 Id1BQh3tyq1jcXw9fQhNGCPNiNZ+IVnO4Oob4hdGZY9DQekk5/SpN2T0ahAOPjVIC9vA
 3AgkKa7rxZm636j6NYBuMpdEgtGgrmVsX1C8pPAjwhy4YzbMYXqp2t9rJ754dsnBFBLu
 Yzg5WPbThIwNumo/ofrWj6G1xk4fLBQNrb1XpJ0q2Q/4NuY3UQzhjWO40Hpc0QDYjsDo
 zvVVzKihzOcE0Bkto8JlkzD+9EaPNKiRjeJmeLUhOyIpw8ebRHrGvevJC5NgylUbiF6t
 971A==
X-Gm-Message-State: AOAM533zjoVYyPn2Q9DTRqGpgl2LMDC/ZFCbN43EsQRiAZBWFKpzuOFn
 aKDTzcK9M41nq5s2Mxf4d+dYidEtj+k=
X-Google-Smtp-Source: ABdhPJztQQOGkcoLmarZ/r3str5vGGp8Ik3MTpflAmJDCwYnrcKlOK6cCav8BJD4Tmy1Okn+DSz+iQ==
X-Received: by 2002:a05:6512:159e:: with SMTP id
 bp30mr7940390lfb.324.1644771414546; 
 Sun, 13 Feb 2022 08:56:54 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id d25sm3797402lfe.297.2022.02.13.08.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 08:56:54 -0800 (PST)
Date: Sun, 13 Feb 2022 19:56:53 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Ygk4VULr4YJRkqkb@curiosity>
References: <20220213155208.560001-1-geomatsi@gmail.com>
 <20220213155208.560001-3-geomatsi@gmail.com>
 <5cbbc353-0bd4-6bfd-c18a-d2d29d419dd5@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cbbc353-0bd4-6bfd-c18a-d2d29d419dd5@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] package/wpa_supplicant: fix mesh
 configuration build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> > Consider the following wpa_supplicant configuration:
> > 
> > BR2_PACKAGE_WPA_SUPPLICANT=y
> > BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> > BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> > BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> > 
> > This configuration fails to build with the following error:
> > 
> > /path/to/output/build/wpa_supplicant-2.10/build/wpa_supplicant/src/common/sae.o: in function `hkdf_expand':
> > sae.c:(.text+0x3c8): undefined reference to `hmac_sha384_kdf'
> > collect2: error: ld returned 1 exit status
> > make[1]: *** [Makefile:1894: wpa_supplicant] Error 1
> > 
> > Looking into wpa_supplicant Makefile:
> > - CONFIG_MESH for some reason needs SAE, so it enables CONFIG_SAE
> > - CONFIG_SAE enables only HMAC_SHA256_KDF
> > 
> > This is apparently not enough. At least HMAC_SHA384_KDF is required
> > for successful build. This commit adds a minimal patch for
> > wpa_supplicant that fixes specified build configuration.
> > 
> > Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >   .../0001-mesh-enable-HMAC_SHA384_KDF.patch    | 30 +++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> >   create mode 100644 package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
> > 
> > diff --git a/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch b/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
> > new file mode 100644
> > index 0000000000..d765c1dbbc
> > --- /dev/null
> > +++ b/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
> > @@ -0,0 +1,30 @@
> > +From 08986b7da7e580f5deb570aaa654df38fb23397a Mon Sep 17 00:00:00 2001
> > +From: Sergey Matyukevich <geomatsi@gmail.com>
> > +Date: Sun, 13 Feb 2022 18:26:23 +0300
> > +Subject: [PATCH] mesh: enable HMAC_SHA384_KDF
> > +
> > +Mesh support CONFIG_MESH needs SAE, so it enables CONFIG_SAE.
> > +In its turn, CONFIG_SAE enables only HMAC_SHA256_KDF option.
> > +This is apparently not enough for successful build. At least
> > +HMAC_SHA384_KDF is required for successful build.
> > +
> 
>  You said that this patch was sent to hostapd. If that is true, please add a
> patchwork link for it, like:
> 
> Upstream: https://patchwork.ozlabs.org/project/hostap/patch/20220130074139.2972-1-yegorslists@googlemail.com/
> 
> 
>  However, that patch looks a bit different, so you'll need to explain why.

Suggested solution seems the be slightly simpler.

> Also, you dropped Yegor as an author, that's not very nice...

I didn't. I sent my version of the fix. Communication on hostapd mailing
list usually takes a while. As soon as upstream patch is accepted, we
will replace this one with the upstream one keeping appropriate authorship.
If you still have some concerns, feel free to drop my second patch. 
We will ask Yegor to send his version.

Original discussion:
https://patchwork.ozlabs.org/project/buildroot/patch/20220131194818.2084092-1-geomatsi@gmail.com/

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
