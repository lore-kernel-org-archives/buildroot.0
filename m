Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEECC6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 09:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 765AD40272;
	Thu, 30 Mar 2023 09:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 765AD40272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vM8-ACCnGaGk; Thu, 30 Mar 2023 09:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1EE1401E1;
	Thu, 30 Mar 2023 09:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1EE1401E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 408341BF84C
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 09:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27411401E1
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 09:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27411401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pu1rPEw9FDSF for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 09:56:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B053740150
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B053740150
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 09:56:57 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id o20so16070744ljp.3
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 02:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170215;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ezyHyysA/dkBdAfCic8Cr975yWWFlKH2xlhaaWvSxdM=;
 b=xE4oKE/V0NqnydrbMvhRS0n1cNzexuBWhSStl9QLrtoGCvgFvH2qcvd0dr68cfSnq4
 FZDFC3RCvlhhzX3gtmu1UvTIaA1bcb6+MedrMWxGyQWcmELOFlShr2CCNT6nsfzZlTTl
 6A5UUs9vPpUtbjGuIoahoeQg3XvUg2/2T5h0+IfKZIjzbrNBATFTZIljN4I1eBSPqv0/
 /bOgcDClBjUc34jH4RKYLPRoQRPjRz2BAynV82v8C5FOrjinJQGlMLX9x7bVgDrO2dkw
 dGB9IrmZ7cvG5bBSn23hxwmfH3XnsaRqlAgVQ9Vdrmy44Z1M9WFo9HbRKSBeRB/6H8Zg
 yytA==
X-Gm-Message-State: AAQBX9cbJB/b4tnpFm4ASm/Zbqp0i2dt+DuS+lBgfEFzUw5WAYRz41O/
 B81EfrXdOycZh9JccdXofkNxusJlLMobl5KqNmq4ZG6urorr2ehmQ/w=
X-Google-Smtp-Source: AKy350a58gZsBfJfqld4kL3xIo1mk+mpYipLTOzubl90+TbWitBrJ2FcG69OJn8I+kTvg9sRYOXV4srwle44ZHTrxY0=
X-Received: by 2002:a2e:8257:0:b0:29b:d21c:e859 with SMTP id
 j23-20020a2e8257000000b0029bd21ce859mr6995802ljh.3.1680170215022; Thu, 30 Mar
 2023 02:56:55 -0700 (PDT)
MIME-Version: 1.0
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Thu, 30 Mar 2023 11:56:44 +0200
Message-ID: <CADSVbUutZxbDOSWVFqmCAtvqneiW15Rt1RQLz-vyaDB83FkiGQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680170215;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ezyHyysA/dkBdAfCic8Cr975yWWFlKH2xlhaaWvSxdM=;
 b=X3cb9c6VMuGRvJvGPfQIlWSLStCUzbhPhe339G9XzVt/6FvQf3Wk28PIwIu0Il/9OX
 kZHpLRSw75RwQXGqCgP2ldRAo4I5aCOUZ3hTibQ4PQhxz+zWeu5tharA4A14x4G4Tgi9
 j1gE2KpODmlVhoXWbX1RKmxsFr+yi1BS6KramEz24L/0AY1gWqM3EuI1U4zFJGxZm4Cm
 YZlaCbsihnXJ1Nu5PqMvY49vgbYdtqHWWC4/nrpHNLypcj6A0ElPjyqhkSJy/3IUn8S7
 mvg1HlHHDLH9r4HN/6QUyngeOz5yTB/Lnfo/TWNVJWIv4OJToaKtNyGlMzEPBpOl80Xn
 ZmEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=X3cb9c6V
Subject: [Buildroot] Problem with enabling rust support in the kernel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I started working on enabling the rust support in the kernel within
buildroot and encountered several hurdles. The main problem is that
subsequent updates to rustc tend to break the build because of
deprecation of different features. As it stands now, the mainline
kernel (version 6.2) supports rustc version 1.62 (version 1.65 if compiled with
WERROR=n). At https://github.com/Rust-for-Linux/linux you can find
patches which enable the support of version 1.66. Using version 1.67
and above will not build again. This is a problem since rustc is
already up to version 1.68 within buildroot and it isn't possible to
manage different versions of the package at the same time.
Additionally, the kernel expects the rust-sources to be present in the
build directory at $(@D)/src which is also necessary if an external
rustc is used.

Another (arguably smaller problem) is the dependance on rust-bindgen
which deprecated the options --blacklist and --whitelist in version
0.63.0. They were already replaced by --blocklist and --allowlist in
version 0.58.0 but are still used for compilation in the kernel (whose
recommended version is 0.56.0). This should be a relatively easy fix
but it's not upstreamed yet.

I am not sure if given these circumstances it is feasible to actively
support this feature inside buildroot yet, as long as the kernel
doesn't support a minimum version of rustc which is their goal in the
future: https://github.com/Rust-for-Linux/linux/issues/971#issuecomment-1438247073

Best regards,
Sebastian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
