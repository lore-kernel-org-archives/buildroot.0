Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6A6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 07:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC04E8428D;
	Fri, 11 Mar 2022 07:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6BQUNf9DxAx; Fri, 11 Mar 2022 07:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D793784364;
	Fri, 11 Mar 2022 07:11:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA3CB1BF297
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 07:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0AC584364
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 07:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xH7loo9Ts-Pc for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 07:11:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A24288434F
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 07:11:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so4831755wmf.0
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 23:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=n2otfFY5KP7Wss5vfTWUzk9tSB6jpk4ZX3GdSFKm9NU=;
 b=NCudNFXPhZ7HSK63cJQ/ZuyEOK6I5LeezqkxKtAPW765mMIN9YpZixIjohtZ1TtGv2
 blILwskm01OK4qp3qzNPDEGtHRRHZmpDL8e+2YL5yjXhZ0cKSRU+hSYeCXahxJY/INNC
 lGINOKKnYxnmo1InfmnN2rnKhlfboVXjJWdxWoRbMQw2YLi6PH2Asz5C6vrY1+KRzo1u
 o34F+D4627KXWhtRzVG21E3asRZoNYHrFqGAqX44gq/PbmUtpwTzSNNiE88HvZSprTta
 0Ujv53/OYgSJJOuMpgiWA1tvcRpw51718t6E5xfflplVKNsrDesLO8L/LHH30ZH9qfuo
 V6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n2otfFY5KP7Wss5vfTWUzk9tSB6jpk4ZX3GdSFKm9NU=;
 b=570i/Rd6nL4TkERuVxYKYQLtSLwqZy+qAgtx+JpavjE7lwGcx/PuVKSo1bLhxRjXL2
 VTudoMs6ssx1NaRh/KmwEFQNVD6NGU0NI5oBh+gNKPwqn+Q6B/Yln8qC6DFY+V5Zf9nk
 2ba9mIK867VpRvs8HFISr91fuMTi7YHx6EZzEw28PbHFwfCRiqfIIAhvbYLophUR0tnK
 aMkzU7gPftp0lJZB4vbT1MnGW+ZpZSF7vVHE6IOB9uBoFcFN0uvQSKOEfVPwtk201hQS
 s33SOWw4Y7Xv4YQ9ZweibMM6uyvLGCKS+upewrQkfU50iP0rS5ENYhCJSVLmaqlsgeQN
 +UKQ==
X-Gm-Message-State: AOAM533VSbv2twnNEPMswNrxvWuZwECN6dvNEI4tnv7fwkpV7yp7EQqE
 S9YM3vFEL5fU+UUdoanwvH/Gzpa97Get2JhvaWXRlFgCoUDUHDz00CM=
X-Google-Smtp-Source: ABdhPJywk4UhBRRWYwxgrPeL7wP6ZVmAUgtO32LXXEI7OZGCZs/sK+yUmpSRvPSZWLiauqd+c2SC7heyhs6lcvJAYTA=
X-Received: by 2002:a05:600c:3c98:b0:37f:2f14:7be7 with SMTP id
 bg24-20020a05600c3c9800b0037f2f147be7mr14641133wmb.180.1646982658323; Thu, 10
 Mar 2022 23:10:58 -0800 (PST)
MIME-Version: 1.0
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Fri, 11 Mar 2022 15:10:46 +0800
Message-ID: <CAHnHX5hroE_7UO1ZftG4VktkSOTCj6u6W7bRM-sBpe8WBM+_oA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] User and Group Utility in Buildroot
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
Content-Type: multipart/mixed; boundary="===============2217260765531646835=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2217260765531646835==
Content-Type: multipart/alternative; boundary="0000000000004cf74f05d9ec08d7"

--0000000000004cf74f05d9ec08d7
Content-Type: text/plain; charset="UTF-8"

Hi Guys

I need help here. I could not find the correct utils for the Linux user and
group management (useradd groupadd etc. etc.) in the Buildroot packages.
Can anyone show me which utils I need to select in order to activate this?.
Fyi I'm using buildroot-2022.02-rc3.

Thank you

--0000000000004cf74f05d9ec08d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Guys<div><br></div><div>I need help here. I could not f=
ind=C2=A0the correct utils for the Linux user and group management (useradd=
 groupadd etc. etc.) in the Buildroot packages. Can anyone show me which ut=
ils I need to select in order to activate this?. Fyi I&#39;m using buildroo=
t-2022.02-rc3.</div><div><br></div><div>Thank you</div></div>

--0000000000004cf74f05d9ec08d7--

--===============2217260765531646835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2217260765531646835==--
