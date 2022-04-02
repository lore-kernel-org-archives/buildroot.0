Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB60DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 20:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678A1417C7;
	Sat,  2 Apr 2022 20:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmGRRpCRjOCf; Sat,  2 Apr 2022 20:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8221D417C5;
	Sat,  2 Apr 2022 20:25:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA1801BF853
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 20:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FA9A417C5
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 20:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E3ec28ECUBVy for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 20:25:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C4B7417C0
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 20:25:55 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id h196so4714416qke.12
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pZl3uu4YWzdsTvQOp0VNRDpjfZq/SgKZvtoHUpkV5fM=;
 b=X0mS0Q+hvJS+OH21veMGY3V7kLjuDGhGom2lD/NHNjkrtIApCdcrDgG2DOjN9k/nZP
 Oo1Tu02VROMdXLwNxsa477IM/T8Wt5HnVCk/LOy25glPUNV0IRVOQnDepfbyTJ8APLHe
 1FOzCINIgctD8dS3Oy5Lxm/9LZwLo95Hj26bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pZl3uu4YWzdsTvQOp0VNRDpjfZq/SgKZvtoHUpkV5fM=;
 b=JxifoVee2/H5K8llDsnNLlcqG5IYbWcLPd2SEVNncOzyyconywJXS8wGltf4bkpdVu
 8swevSYK4+ztOBF6FZ9xAejVYnEK2ShWsAslCFbne0w3RsLIhQIN7ZrdVf9yPjk8Uyce
 /h8AF/pye9h+VQnSo1iP9Kg58LqYerNXz11BgfXkVEsdIpqepJmaT0AUGrqD+hF3juaZ
 k9j4SdYPip696k+GxqVNylblBInNweF/R/HCssnASp0dSWrlg3sk8mLQ0jWDEYXbnwM3
 mhVVMeNgSd34Ypgt8ajfZpgaWJohoba/YzsL7iyO5q1bKKqZfTq3LLJviljoFTTn/n23
 PP8A==
X-Gm-Message-State: AOAM533hi81lVpHiJwbtS9lOGsnzp1Q848lo5SJL1EWDyRIepFRpxcTZ
 gw36QqFZUZaIUhY8J3R42xJkEy9R0GKOhwDBSiSXpXXdj3B3T8WQ
X-Google-Smtp-Source: ABdhPJzgDE0nzFnWNYtzN3dzx4EgLiixupZqzzE2da4VsLmwpal3hEizDnyuUd3OA0anp3TuakscGEhT1T4DSU7LfnM=
X-Received: by 2002:a05:620a:40cb:b0:67e:cdf4:5523 with SMTP id
 g11-20020a05620a40cb00b0067ecdf45523mr10094514qko.238.1648931154757; Sat, 02
 Apr 2022 13:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220401215653.1703616-1-mmayer@broadcom.com>
 <20220402172618.GC1811301@scaer>
In-Reply-To: <20220402172618.GC1811301@scaer>
Date: Sat, 2 Apr 2022 13:25:44 -0700
Message-ID: <CAGt4E5tgfp7r+hkrqMHsKGZtKw-moJcFXYbzV=1rKpJW78o1CA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package: replace git:// URLs with https://
 URLs where possible
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 2 Apr 2022 at 10:26, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> On 2022-04-01 14:56 -0700, Markus Mayer via buildroot spake thusly:
> > Replace the remaining git:// URLs with their https:// equivalents as
> > this is more secure and also more palatable to corporate firewalls.
> >
> > This leaves package/dahdi-linux as the sole package still using a
> > git:// URL for cloning.
>
> I was a bit sad to have that one be an outlier, so I checked...
>
> I went to the Asterisk gitweb:
>     https://git.asterisk.org/gitweb/
>
> Then I checked the main repository, asterisk:
>     https://git.asterisk.org/gitweb/?p=asterisk/asterisk.git;a=summary
>
> This is labelled as:
>     Mirror of the Asterisk Project (https://gerrit.asterisk.org)
>
> So I went there, and noticed:
>     BROWSE -> Repositories
>
> And surely there is an entry for dahdi-linux;
>     https://gerrit.asterisk.org/admin/repos/dahdi-linux
>
> Which has instructions to download over https:
>     https://gerrit.asterisk.org/dahdi-linux
>
> So I migrated that one too. We no longer have git:// downloads now.
> Woot-woot! \o/

Awesome. Thanks for finding and adding the new URL for dahdi-linux.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
