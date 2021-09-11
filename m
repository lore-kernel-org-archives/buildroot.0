Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF38C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C4E61100
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1C4E61100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A717940292;
	Sat, 11 Sep 2021 20:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDniS6WJ7cwq; Sat, 11 Sep 2021 20:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD6E44028A;
	Sat, 11 Sep 2021 20:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B43451BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2EA7608D1
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkmYuXWw1YdJ for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:52:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D44660814
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:52:18 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id l10so5825727ilh.8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEffxHLjlmoR/+5wEz9JW7Y4a92l7xGi2EsRRvkSkxI=;
 b=VqVbuTOSFrRs3MZ+NsOI2sCk45zdzjr4tHLmQ33ghBS+VWUXjcDJgA2lBVwO4ZWUIn
 b6XbnDn7WAgrmJl18VYOUEmyNKY01aFvUVqc/ZQWIWpur/gjRgpk5xGs0WEq6ivmmyPw
 wC+grKyR+tvc20u/iUdzVoomY+QfU/zbF+is8lTFkBuBfjlfNDVwXkrBMY5UNJmlFG+b
 0PEImjMFoNcr88/CxxIMFvthaQ3sB61Auj+ZLqren6FZwT9hkXQsGV2YGhmkxEo3fMXE
 dbGdtk5Ss2CCihvlyy/ZhZcNTX4diopFaaY8luYCTbK5Z7FlWnitXpK2o3PUgoPia1wN
 D+cQ==
X-Gm-Message-State: AOAM531g1Wwfpeq+ISGnKYOHarNw49PoisZ35Ze1Grgm9V94Z5bqs5X2
 5Kwc4Hv1Uctr59Nu6xdYiUNAmvDGn0tiN8aFJVf2RA==
X-Google-Smtp-Source: ABdhPJyPCz3O9bdd/LW0FjeKSFy1RSZL9h8/huqUweMSJpyWz8sFuBDAuGId9YGwkQa7yJK7Q/XRhQhpOe5Y0Z7Gv6A=
X-Received: by 2002:a92:194c:: with SMTP id e12mr2828581ilm.3.1631393538203;
 Sat, 11 Sep 2021 13:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB39937E02CFE8C1C61A541E41A0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
 <9cc92872-5f7d-149c-faa5-10e9f678332e@mind.be>
In-Reply-To: <9cc92872-5f7d-149c-faa5-10e9f678332e@mind.be>
From: James Knight <james.d.knight@live.com>
Date: Sat, 11 Sep 2021 16:52:09 -0400
Message-ID: <CALAjcgUFFcqC0DK9LuvQXrXh3qECxhvapioEVXcyg2UyHJjwsQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/3] package/rpm: bump version to 4.17.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Arnout,

On Sat, Sep 11, 2021 at 4:27 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> The commit message says 5.3+ but you only allow 5.3 exactly here. Could you
> test if 5.4 works as well, and update the dependency accordingly?

Will do.

I believe I just grabbed "BR2_PACKAGE_LUA_5_3" lazily, assuming it
would be treated as something such as >= 5.3. Doing another inspection
now of the configuration, that is not the case.

Would it be "best" to have a dependency on "BR2_PACKAGE_LUA" and
"!BR2_PACKAGE_LUA_5_1"? Or, would there be a better way to serve a
+v5.3 detection?
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
