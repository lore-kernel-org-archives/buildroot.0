Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C53C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165A781E50;
	Mon, 21 Nov 2022 21:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165A781E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEaY7ZxDemk7; Mon, 21 Nov 2022 21:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 392F681E43;
	Mon, 21 Nov 2022 21:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 392F681E43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAE551BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39DF81E43
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39DF81E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DiiRttilmAk for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:42:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB15281E27
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB15281E27
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:42:41 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id k5so11559218pjo.5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 13:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MI9fdySdrBCcDOoCyGTo0lHH6Ij9PWEjHEWXpQFQiMA=;
 b=5qmAAeh68sYxqwEetwYUyGJvuFwcT5w/DvK0TBmMBwMUxRN6lHOw/iTve7jcPViQFJ
 OH06urnUDxFnAcLHrS6HIgezF1PFTnatVE5L1U1+scyW5f3NJ1r4rjR5Q8xdJBHMVpQh
 Fh4o6/s9nStfu9TSwyLUmujgWI4gw1labKLwmTRO/sosYnxhkSJxZ3HfQBv1HRFUPVcO
 z2asX2V1fvOJXU0k3sFGf8BTHp9H1fsie92Kd+2D0vTo40WZFIsHKW1Eu8AHcuReGLk1
 xEKdopDvX9i85EU/yLmMh2EICJNsPZj/JzyF5vzpAyPDEyVwY70IPyY+TEMA5LZ8kQg8
 JJsA==
X-Gm-Message-State: ANoB5pl7kn7eARUH26O+FrTbd6lkQRhab3h6tsPfWB/Rv1UbAQNyQaiR
 6WicEXrfS6JcfwIPdFC2E6uUwN5cBh37VVcbLgU=
X-Google-Smtp-Source: AA0mqf4BeAheKwToB4pAw7JJl7nYS+kmIHtfieq0RHI7ciuRE9IuKJuT/ZupLpu6skZqNofz3xxJkrEGpLyYwdOMp08=
X-Received: by 2002:a17:903:22c4:b0:184:cb7e:ba36 with SMTP id
 y4-20020a17090322c400b00184cb7eba36mr800185plg.57.1669066961197; Mon, 21 Nov
 2022 13:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20221119224225.589941-1-ju.o@free.fr>
In-Reply-To: <20221119224225.589941-1-ju.o@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Nov 2022 17:42:29 -0400
Message-ID: <CADvTj4q0J0tT6fJu9X=eukjURr=kK7WBf6k6Hxsjb4hyCgLvPw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MI9fdySdrBCcDOoCyGTo0lHH6Ij9PWEjHEWXpQFQiMA=;
 b=FDo1TG+o4cv18HO/hzI00N1shrao7nQeneyUvbdZex+6HDqdIrVDRu1ofMWzqiLHDT
 Odi8cOea42L1ORen250j7fojw4TTdjJ3dHs3DcBezrpLxtxmBCB1FzmZpRNShsVjyL5G
 TDzMN/teae4aWJ4U/px6GOtvhaj6Hzt9Eg7t1aAAf4llshKUz7pTuy8SA8/xuwhyniZ6
 Hf1Lgrbv4AaSnHO9x2SWUNkvMh7P9JxxCAaSB5WPIGL1rbwFKYl3UR4nOx//ZDf6LmiU
 /hdSo86QhclDJ6N0UTkta7bhxkkuPJ5KDktlmN2RxdDbCrSUUsoiprfOTqZ/POLkmDXO
 7/Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FDo1TG+o
Subject: Re: [Buildroot] [PATCH next 1/7] package/python-idna: set
 _SETUP_TYPE = pep517
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 19, 2022 at 6:43 PM Julien Olivain <ju.o@free.fr> wrote:
>
> Python idna package switched to pyproject.toml in commit:
> https://github.com/kjd/idna/commit/2a00e518efe55d2eeb62cd3f88ace7db41338603
> which is included in idna v3.4.
>
> When using the old setuptools infra, the package is incorrectly
> installed as v0.0, which is then incorrectly detected by other
> packages when using setuptools pkg_resources.
>
> The issue can be reproduced with the command:
>
>     python3 <<EOF
>     __requires__ = ["idna >= 2.5"]
>     import pkg_resources
>     EOF
>
> which will fail with output:
>
>     pkg_resources.ContextualVersionConflict: (idna 0.0.0 (/usr/lib/python3.11/site-packages), Requirement.parse('idna>=2.5'), {'hyperlink'})
>     pkg_resources.DistributionNotFound: The 'idna>=2.5' distribution was not found and is required by hyperlink
>
> This commit changes _SETUP_TYPE to pep517 to fix this issue.
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/python-idna/python-idna.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
> index 4d9994a9c7..f8641aeaf8 100644
> --- a/package/python-idna/python-idna.mk
> +++ b/package/python-idna/python-idna.mk
> @@ -9,7 +9,7 @@ PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
>  PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438
>  PYTHON_IDNA_LICENSE = BSD-3-Clause
>  PYTHON_IDNA_LICENSE_FILES = LICENSE.md
> -PYTHON_IDNA_SETUP_TYPE = setuptools
> +PYTHON_IDNA_SETUP_TYPE = pep517

Should be:
PYTHON_IDNA_SETUP_TYPE = flit

At the moment technically both do work(since our pep517 infra depends
on flit) but explicitly using flit is more correct and should ensure the correct
flit build dependencies are always pulled in.

>
>  $(eval $(python-package))
>  $(eval $(host-python-package))
> --
> 2.38.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
