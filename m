Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7C1CA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB6F60A79;
	Sat,  2 Sep 2023 10:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB6F60A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgAT_I6-ahOl; Sat,  2 Sep 2023 10:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E02260A74;
	Sat,  2 Sep 2023 10:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E02260A74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF3841BF40A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97AD14011D
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97AD14011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3H7XitEaDGZ for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:19:47 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6CEB4010C
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 10:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6CEB4010C
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so1645813a12.1
 for <buildroot@buildroot.org>; Sat, 02 Sep 2023 03:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693649984; x=1694254784;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LSaQhxDQpM4czqZLtSNZuHWJXpPU4C48Z/RXZRpvvEU=;
 b=WjBExPCVfbNcH9DWhbLU7/j23HwTv/blSkNGGZinoenb7y/6pxRyS8iYmjrgFalA4c
 n9IaXZrUxVHL0LC0tx7Dtymdugz27vrB9swl1orhqLLHDD5wWC9xBq9KTDLevFziW86x
 u0bXCc7MEvMay3pUXE/eGawIc5lnDjSOmcL87c3dHpbdtXbY0Ff6DrcEpwVs20AAWsNw
 uDh00WQK/vn6dKl9aB951Ihd4qlEG/1/xDuoZ7XfOFuqI1CYoDJWqo33Vah0CQFzaOYU
 gs41UUQqxX+05WBPGLVM+vKzx0fOGkYE33s/MeMGQgyei+avHLwOcf/hVbu+HOzyVUFa
 90hA==
X-Gm-Message-State: AOJu0YyGh1z/tZp6GvFYwSA7BW0p4s5rMQj0bMl40p+pOnN2pVAWf/uh
 ufe9k86p/U6/tymJGOwlhjOKPgo8lR9ve81yBsD7jQkDCYPnog==
X-Google-Smtp-Source: AGHT+IF/bcSQwExQ2+sL2r4ZE97q4700sIlwKuzxy2utkhFRxHyCRXhbpuz6svST8FdFdoUWaPRsx9VDQ4PS4w+15DE=
X-Received: by 2002:a05:6402:40d5:b0:522:582f:91af with SMTP id
 z21-20020a05640240d500b00522582f91afmr8858994edb.9.1693649984544; Sat, 02 Sep
 2023 03:19:44 -0700 (PDT)
MIME-Version: 1.0
From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Sat, 2 Sep 2023 12:19:33 +0200
Message-ID: <CAPmASevJ9KynWxPBga3chKQCBVUCeZ-gt88LMfAzt6+-F6bZHw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693649984; x=1694254784; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LSaQhxDQpM4czqZLtSNZuHWJXpPU4C48Z/RXZRpvvEU=;
 b=O+pgKhP0hr/E0qQPOfX8b4VsbSGxZN6aL9DAuW3CIi2O8WHsP4UMTMtyjQchPOs378
 fAT77BanDkRVRcwfm/Dg929Z6SXl9ZRRih3l9XHswZJ76XCb7xhEzpsNstA5Jji7+2Ve
 2iAc2gg1nr8y0QxXIK0PFd5vwLqCgIPm26I6Fgt7bn46esZn686t39y1zNLRE1bNuAXD
 ceV0IUbsiv/maKXsIRhXhS2BSG9rMjJVfBHp32Lg0VH9/9fAd80kXoKoMcgpNQ59UWEL
 jlimc4gETutfnOZBv8rbradOVzSTadOvbewKYtJ+T0fiCUdEnx5xPKYkNx40gfw3bs/W
 EYVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=O+pgKhP0
Subject: [Buildroot] stat command missing
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
Content-Type: multipart/mixed; boundary="===============0141153262654336706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0141153262654336706==
Content-Type: multipart/alternative; boundary="000000000000b3e30306045d9d7a"

--000000000000b3e30306045d9d7a
Content-Type: text/plain; charset="UTF-8"

Hello! How to add the stat command to the image?
Is needed by QtCreator to deploy files to the remote target.

I tried to add CONFIG_STAT=y to the busybox config file but it's not
recognized.
Even a search in xconfig did not find anything related to stat.
Thanks

--000000000000b3e30306045d9d7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello! How to add the stat command to the image? <br>=
</div>Is needed by QtCreator to deploy files to the remote target.<div><br>=
</div><div><div>I tried to add CONFIG_STAT=3Dy to the busybox config file b=
ut it&#39;s not recognized.</div><div></div><div>Even a search in xconfig d=
id not find anything related to stat.</div><div>Thanks</div><div><br></div>=
</div></div>

--000000000000b3e30306045d9d7a--

--===============0141153262654336706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0141153262654336706==--
