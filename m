Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98290C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 18:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B0D822AF;
	Sat, 25 May 2024 18:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIi3dTMUR0Ef; Sat, 25 May 2024 18:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23DE5822B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23DE5822B0;
	Sat, 25 May 2024 18:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23C301BF281
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 18:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F56F4055A
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 18:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ma2_oO_gF1S8 for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 18:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72D5340558
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D5340558
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72D5340558
 for <buildroot@buildroot.org>; Sat, 25 May 2024 18:16:13 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-62a0894f1d3so12899147b3.1
 for <buildroot@buildroot.org>; Sat, 25 May 2024 11:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716660972; x=1717265772;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iiJYQa+e/11hG8+AulRPQtPdUo16E15OpbLO61pFks0=;
 b=shGprSioqlVkhWzoJSBZWxsm5J/4MIusM1519CAYY/YaOpsdfl7TVEACokz9bNWOeh
 5YP0tHx5TAmqkDHUpcNVyhoCHgXFBKX9etVe5XfU6cj79AMuZZ3Rjy63HNnKsn0jFN+Q
 bXUtAN9i8T5DYMiIqexuFurwmPEnGilo0CUbQWAgCWClDuLo0t8WxdL0sLdFGuTs0Q3j
 Xl39vbJrLHnbj3EmSQ6oldp8yTkmJNXMzemybRWecHIJC9ynrl60zKRitGwxzwoYJ7Lc
 obZksvcrN7pwRd0QlFW+Jgt8ET8GebaL0e/OxQMo8sD8t4C4FsyNm/siwUmdw+JP+37l
 2UKA==
X-Gm-Message-State: AOJu0YyKuXNzIeMpdwuIU8Jjdacp8m1AVHb0QyhPEz7qqmcwrWATe3rX
 fNsFBe1ae4ehRc4CUywHOfdwsum4i095XqAYV3l0/2fzlsIO54s8dvcO5hmeIuPYyocSeH9k3Tn
 HVivmzrWQwBbNLcfga863oKtTSa+XXQ==
X-Google-Smtp-Source: AGHT+IGar/hMMhis3U/YnQd347mTpkxce7+uCttxVNCg4q1tDs/ECM3W4/sxEriPypXBGBbqEtKSETTa6CykQZW71vI=
X-Received: by 2002:a05:690c:c99:b0:618:88d1:f15f with SMTP id
 00721157ae682-627fb1ca4c5mr64739497b3.0.1716660972043; Sat, 25 May 2024
 11:16:12 -0700 (PDT)
MIME-Version: 1.0
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Sat, 25 May 2024 20:16:01 +0200
Message-ID: <CAMdwsN_0XU0cbTHHixTWjVc-zShYjbw2g5UUJD0LoVA8qjW1hA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716660972; x=1717265772; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iiJYQa+e/11hG8+AulRPQtPdUo16E15OpbLO61pFks0=;
 b=GvY22I15lbclUBccq9j6HzqxtuFtzZzBre5WMpP/uXdorggKyWC4K9h2a+r0hReqft
 B7nloQePKZz7eDVg87Avc8rgnqCsyTJCMhgAF0wokOSNbbfHRWqy/Tc3m5ZDMd17Cdxo
 yxQwC12+rlcYZa0RnIZIWKt/Yh78mZK625y/GASuIk9NPO2TsOgSAjIRw0hdqLb0e9WG
 dOYeS54GK3UR766M5j6DpXaejS2buaivFbyqdZsSaw/usAlUGyjgYvWrFR3HaaLCeC8z
 pNWuynVgD+8BZCO4BF9I0byf/VbiF7voCu9InM0FD//Vb+qbdh8qdXIvK6b8TegW74jY
 P/9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GvY22I15
Subject: [Buildroot] build with BR2_TIME_BITS_64 fails on gcc-final due to
 libsanitize
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
Content-Type: multipart/mixed; boundary="===============2665343636752450018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2665343636752450018==
Content-Type: multipart/alternative; boundary="000000000000704d3206194b478f"

--000000000000704d3206194b478f
Content-Type: text/plain; charset="UTF-8"

Hello,

Started testing with the 64 bit time option as it's becoming a hot topic
for us, but when I moved to glibc and enabled this option, it immediately
started failing on gcc-final as libsanitize was not disabled, there seem to
be a couple places in there that undef FILE_OFFSET_BITS and this is causing
an error in glibc because it expects both TIME_BITS/FILE_OFFSET_BITS to be
set to 64.

GDB I seem to be running into the same issue.

My quick fix for now is manually disabling libsanitize and not building
gdb, of course I'd like to properly fix this but I'm unsure how to go about
this given that it's in gcc/gdb and that they have a reason for doing this
undef.

Any input is appreciated as I'd like to work on whatever form this fix
should take ASAP and get it mainlined as it's becoming quite urgent for us
to tackle.

Others who've been testing with this option enabled and any pitfalls,
feedback from you on how it's working at the moment and things I might have
to look at is also highly appreciated!

Best regards,
Jesse

--000000000000704d3206194b478f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Started testing with =
the 64 bit time option as it&#39;s becoming a hot topic for us, but when I =
moved to glibc and enabled this option, it immediately started failing on g=
cc-final as libsanitize was not disabled, there seem to be a couple places =
in there that undef FILE_OFFSET_BITS and this is causing an error in glibc =
because it expects both TIME_BITS/FILE_OFFSET_BITS to be set to 64.</div><d=
iv><br></div><div>GDB I seem to be running into the same issue.</div><div><=
br></div><div>My quick fix for now is manually disabling libsanitize and no=
t building gdb, of course I&#39;d like to properly fix this but I&#39;m uns=
ure how to go about this given that it&#39;s in gcc/gdb and that they have =
a reason for doing this undef.</div><div><br></div><div>Any input is apprec=
iated as I&#39;d like to work on whatever form this fix should take ASAP an=
d get it mainlined as it&#39;s becoming quite urgent for us to tackle.</div=
><div><br></div><div>Others who&#39;ve been testing with this option enable=
d and any pitfalls, feedback from you on how it&#39;s working at the moment=
 and things I might have to look at is also highly appreciated!</div><div><=
br></div><div>Best regards,</div><div>Jesse<br></div><div><br></div></div>

--000000000000704d3206194b478f--

--===============2665343636752450018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2665343636752450018==--
