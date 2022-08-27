Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC959ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 05:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D1382F11;
	Sat, 27 Aug 2022 05:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D1382F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raDdC6JQ0kry; Sat, 27 Aug 2022 05:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6EF82EF1;
	Sat, 27 Aug 2022 05:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F6EF82EF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 805971BF316
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 05:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B63A60BC4
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 05:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B63A60BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuomicqNhTug for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 05:27:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31CE60BBF
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A31CE60BBF
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 05:27:38 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id v23so3270809plo.9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 22:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=WTQC6sg0DxgkO8RcneBQXR/X/9/sKYINxU0YQF0LKRw=;
 b=HrAsquF9iYOZqJW2TLoG/1Zcs0IRY3Ygvjl5yQao3TYcS4cw73l3dKfbJcqYDK9UHd
 a9XXj0fTiAv2y2cgaT5tilB8aJMrPipXmMjzI7/HLY3K6OlNQkYPX8sjT0z9mFx2tiiM
 THd9rA1/7bwYjl+exPr4aai5Kh+lqtxojPnoYWPMVRU9JIh9AXwGvbkwH1lwWNWa6d+g
 6nBhqMXH/AUAlzNM+JpfMmhTN0JrTr3D9+wvXRrvl1yxPaP/kcferdss/brj/MX9WcJG
 4/oDv3wRW/td6o9bVqH5g6kb07wqUxmF6R09EEX6bUr3h2Z9MIrMF1tY/rFIFrX4ZGRp
 vWaw==
X-Gm-Message-State: ACgBeo06nXEQrOh3eE62f1VQCUTbKg5yeNxaTCfN+iAN/zJSaIpnG7AE
 B+SPjDGS79aZDGHCyhnrtjeIAcjb0Bf0VRxukYStUxcKTjsRbg==
X-Google-Smtp-Source: AA6agR6/T0pzVTIF/q9xHP6JJedrHlLB/GUKpsC0BeYwgRqdbpYmKcgufNxfa+L0hrahFKrdzG0B6bEdYbV9Ejjh0Xk=
X-Received: by 2002:a17:90b:3c0a:b0:1fb:129a:a5eb with SMTP id
 pb10-20020a17090b3c0a00b001fb129aa5ebmr7559013pjb.94.1661578058143; Fri, 26
 Aug 2022 22:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220826211451.33719-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220826211451.33719-1-fontaine.fabrice@gmail.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 27 Aug 2022 07:27:27 +0200
Message-ID: <CAB1t1CwHQx=557eBkkBZPAA92dj+GYXMdpHM5WJdYOc1VNJ9JQ@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=WTQC6sg0DxgkO8RcneBQXR/X/9/sKYINxU0YQF0LKRw=;
 b=l5icyuPYTOzxIYpVBUigsKvpNUKBwHcqS2H9JxkXBJUMysSpeq7dUb8k36bB8aMprd
 ZFYy1Q0fLl3l0KZR6SMzNkNPBupJxZ0oU+ZDJCQx/8fa0J2rqZeX7baF5ZPBISbbiNLk
 qkUayfhKEsD0Supjt58y+evTLrCg3HipY1A+xsdyEpfl+cdN4X+H41OFNPcg6hzSMhCT
 2PwWVhYRRHbLxkg4YyEuiA9qrn8aXPUKNflVXRM46RrnU1RHusuVFNwgAFkHwaros5rb
 lw5HVIqBSYRykfkLc/E/+ijGeceTs1uSgKRCrmmyf53hTSGHBjdiZpHsakThX5jvCZye
 NhsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l5icyuPY
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: security bump to
 version 1.3.3
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
Cc: Olivier Van den Eede <olivier.van_den_eede.ext@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8551761814494696243=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8551761814494696243==
Content-Type: multipart/alternative; boundary="000000000000ec1e5c05e73249fc"

--000000000000ec1e5c05e73249fc
Content-Type: text/plain; charset="UTF-8"

Hi Fabrice, all,

thanks!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

FYI Olivier Van den Eede has also sent valid patch for this but it haven't
reached patchwork not even ML.
I guess he's not subscribed, thus only people in Cc got the mail.

Kind regards,
Petr

--000000000000ec1e5c05e73249fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Fabrice, all,<div><br></div><div>thanks!</div><div>Revi=
ewed-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com">petr.vorel@=
gmail.com</a>&gt;<br></div><div><br></div><div>FYI=C2=A0Olivier Van den Eed=
e has also sent valid patch for this but it haven&#39;t reached patchwork n=
ot even ML.</div><div>I guess he&#39;s not subscribed, thus only people in =
Cc got the mail.</div><div><br></div><div>Kind regards,</div><div>Petr</div=
></div>

--000000000000ec1e5c05e73249fc--

--===============8551761814494696243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8551761814494696243==--
