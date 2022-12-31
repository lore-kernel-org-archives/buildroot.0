Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142E1C3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 11:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9473981E01;
	Sat, 31 Dec 2022 11:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9473981E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v23SysmCsWWX; Sat, 31 Dec 2022 11:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB53B81DF0;
	Sat, 31 Dec 2022 11:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB53B81DF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E40831BF280
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 11:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCA1B81DF0
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 11:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA1B81DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPP2maXYtmsf for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 11:18:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD2781DE6
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AD2781DE6
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 11:18:22 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id f15so1854380uaq.8
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 03:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MYi5iehH/XFqMVDSM4rxXLQzxA6x14ClOggLvwY2oUw=;
 b=NZ3TrkXsGy59807aL8m+g9AMqgYyYxDd1e1zDiygVjwS25ZnC/s4SPD4SaavshAjuP
 ZTmyg7nD7BWeltk2LuSY09WIC791x7SsNGRPKsLP5788vJTx5ZffTtGFWA+FLqVyrA0d
 HrLuOG5LPpmK8N5ngna+BIg4QGxDA9Ei6wIkYlZSFx8xutZdYTrN7u2E3Y/PWldMtvOU
 fl9XmsuJtrMImxepC3S0Uq3T6+F/vQ0Bzzz5qbhDGqr4YyscIDytVpPgyS++dSpNMYRa
 kHx0bs6EDJc+qJdAP1zqm/ZgpV31ATrUG58iAjnhJt1i1skINPB8hqJHSDNsLXHcAubZ
 OHIA==
X-Gm-Message-State: AFqh2kp9CuI9E/CuMQ7FnyZ56ppzQz5gVDgvht+7n/uVFmwek81Ca8qe
 fp3Ims6KH2wukD6VOZRyEvAb+5AmyFlp9j1ubLg=
X-Google-Smtp-Source: AMrXdXvp4eZpIt+MwEUMLRawbvthzeHAPjJI7EuhIdAkC+rlczLFXBpeoSFsmmvQ9/CK2r0pdLmx4kzn0AatQyfyF9c=
X-Received: by 2002:a9f:3861:0:b0:419:c3a3:9d0 with SMTP id
 q30-20020a9f3861000000b00419c3a309d0mr3226815uad.98.1672485501912; Sat, 31
 Dec 2022 03:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20221227114842.2620182-1-unixmania@gmail.com>
 <20221229214611.GJ2498764@scaer>
In-Reply-To: <20221229214611.GJ2498764@scaer>
From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 31 Dec 2022 08:18:11 -0300
Message-ID: <CAJ4jsadDkjBaK8_GE_WaeNLVmmmY8e=Q9YanCtLUK17nWO8enA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MYi5iehH/XFqMVDSM4rxXLQzxA6x14ClOggLvwY2oUw=;
 b=bjZkPdrOM50GWkSEulPg7CoS2q2LPCc2vDztIley0M6Br+PHGyWAUONBMq/V1tFUCB
 py6lu3sICIS39CyLwi0SRkyRHktcrFItlJEgSGQkrMEgTz53OynlKf62ByyY+5SlnnJH
 rs1h2OmYZh06Sw7+kt0p7QvIEYwAD34RQgtJxMGdbiuTn8cBuvEn+VkPj3hX9MgNSj5f
 HGcsuMIl1dpMoFfenLeF2Jtn3hE/DP8AurCoEihbf0ZiGsmKp/AzKQUVKC6DSeKUoqKW
 NBif2PSHyNV9eUpXC2vwf7cB4YXKNzFVTNaGskHvVfpVhg7K2I5Fne+YVCliJrrlBw8I
 zh/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bjZkPdrO
Subject: Re: [Buildroot] [PATCH v2] package/qemu: refactor target emulator
 selection
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Dec 29, 2022 at 6:46 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, All,
>
---8<---
> Applied to master with a few changes:
>   - always build at least user or system

This is not good. It should be possible to build only the tools. I
will send a patch to fix this problem.

>   - add help text to BR2_PACKAGE_QEMU_CHOOSE_TARGETS
>   - simplify prompt for BR2_PACKAGE_QEMU_CHOOSE_TARGETS
>   - simplify list of targets with unique QEMU_TARGET_LIST_y
>   - extend the commit log with "Notes about the list of enabled targets"
>
> Regards,
> Yann E. MORIN.
---8<---

Thanks!

--
Carlos Santos <unixmania@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
