Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229F7C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 10:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C53660F24;
	Mon, 26 Sep 2022 10:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C53660F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDA4OHXmOR5H; Mon, 26 Sep 2022 10:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF8860B6C;
	Mon, 26 Sep 2022 10:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCF8860B6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4981BF3EC
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 677EE60EC6
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 677EE60EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oRG4BPhYGpN for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 10:17:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 595F260B6C
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 595F260B6C
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 10:17:16 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 129so4701612pgc.5
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 03:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cpHv5RdXMuBce494Cq0UMVI5boM/raQnNi90zt5+nh4=;
 b=YRhwUwpkdj/W99fZu/49PEQg2VwPIV2ZIcvC5wCKRq2uDFJfP2vlGuCnTU5jvl4rPO
 Oc3q9/eWo0blM3GMrpXil0JPLk2HnUvE4nSAppxQOeMlgOAfnRMm+emOzjwi5DXfaOvD
 7EPPDHYE3mBizxJPWaWGGW1IShN4N3IFm1rFBoxwrm91dFYyNwS6avxbBViBjUQAv3XN
 IvRmfwcJ3bxwZO2k81HTxRy7py6w8c6+YaPD1H+pEYKF2gwkBx7uRkft3Muqz6lKkz93
 7WRnwDrzz02nn1bK3hn5i4qKOgG9xsSq3HVvIUTRemBhuXv+PCsLQXXTpkV7a5JcgQ1q
 wRyw==
X-Gm-Message-State: ACrzQf2qb4Fkiw5mkbpXyr7ZxSRL4D73ElHP7ausIyDARI/2hwXQ89Ov
 Yagf0mUvLMYdJgTl8hrJYSO3ZOsgRprb1KKFsNMaU6uw
X-Google-Smtp-Source: AMsMyM6w6RW6rk9+DOUekdRPd4SpUIS/FE+aA8aIBlEk8puwiIsjjMRfxxx+CiVkdfmbyWPdlyPQ9pl9DJnljcaf7aM=
X-Received: by 2002:a05:6a00:1747:b0:548:8629:cec5 with SMTP id
 j7-20020a056a00174700b005488629cec5mr22704726pfc.41.1664187435723; Mon, 26
 Sep 2022 03:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
 <20220925214700.5e222e95@windsurf> <20220925215340.43f64019@windsurf>
 <3124822.5fSG56mABF@harderbit> <20220926120059.1c0c677b@windsurf>
In-Reply-To: <20220926120059.1c0c677b@windsurf>
From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Sep 2022 12:17:04 +0200
Message-ID: <CAJtjsKbXry53n6HTcvV9jPyxJ4fcCbryAn7Vtk_8i=Q9qfed5g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cpHv5RdXMuBce494Cq0UMVI5boM/raQnNi90zt5+nh4=;
 b=asTtdRoJOeuNOckM7hS53P6tPJIPzp7ZcLq67cJA/lhKlHbRxvy/LkHpEiAh1rxPJe
 VMmRM1JvZsHNvFIQuoOvsMPhdrQfz5LnTS9K2KU/zuE/jOFzj/NlSAnTG+fxkJyqBhyz
 hjxK/8gnt9UVDov/GsE6ArAdiyy/3WJk413uNScDpCMpo+N40aaauUJfOVVe73lQFlrG
 j6g+mMEcqOunvNlkw5SpctHN8LUWx7Hlpgxp/8/Gk7dHkqSXD6g5i7ZNXig0+FYPMPtE
 2fHmieHRrlGyP0yiUX6E6BtWI6bm5FzWi+kBbh/4WiWDaiq/z90FtoYaM4iaWPgqWXZV
 JBMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=asTtdRoJ
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, All,

On Mon, Sep 26, 2022 at 12:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>  - Be able to vendor JS dependencies. I already started working on it,
>    and it does work with npm, but my test package (forge) only
>    provides a package.json to describe dependencies, so they are not
>    locked and therefore not reproducible.

That's a good point. I'll report this issue to forge developers. Every
npm packages should have a package-lock.json file in their repository.

-- 
Johan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
