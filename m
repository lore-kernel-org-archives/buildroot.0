Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6CEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 13:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0814830E2;
	Thu, 28 Apr 2022 13:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVbzCzOBSLgb; Thu, 28 Apr 2022 13:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03B7083183;
	Thu, 28 Apr 2022 13:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 352811BF3A0
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 13:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FC81419D2
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 13:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcsy36qWHUxy for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 13:28:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6071A41487
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 13:28:03 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id y76so9047207ybe.1
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=IBkOFbY9l1VsIhi1Yuqye4wd04v6CkyHocZgjlljN88=;
 b=qwWNCsv5/E3XVxKUC5eETvVjRSzkY//Q5mlZS+6QaYCsYwg/rn59ycjqIHjkC3M0fb
 WC8B/TdBv+/JKFEBHW0NImd8BiaNNdyquJElmIrwcX9wi70ZAxaxBTIhw9cD4lMLqSCx
 A8zdf9G6Ia3FKzLsdKyt7epiDXlwALj38xhGFWexyjJ2ZSbUh4whGisVli8H+dTQQ8BY
 047DTfSKcLNqtnCXm7/Xvu53Ro+Ydd7NGpaN7p70l80WH9E4eH9xVf9MYnpo/T4w6Uc1
 L1pcDZaicnqxKbePB+7gYLrVA6CTIOvNd4ol/SnQ6ykm3tNGAr/yS5mCefFAOy9F06Jr
 YiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IBkOFbY9l1VsIhi1Yuqye4wd04v6CkyHocZgjlljN88=;
 b=WVJ+PfHm30W2G9lluugwCuWAE9KvYqJDX/2FmfC4NfPNdMPUbbJ9ObgWU7UYdV97s1
 26UV8wVHpD2tq4Z6Dd4XjPXUuEbBJSD2l5us4NB2a1eObJw+s3im0NhBMiBy+ONW3jL8
 8w65lvUSY+uCylO1n1Igx16uzS/bJskpzO33bVm8IgnxPmIi+tHDzTWA909AeXCmpKCR
 hzLA9jl20SUs7InquOEotsYm5Wa021USj7BhPVAwW/tyf5JA6oHBUq8Ux7KhzBAuIad4
 e03DlBlaaeBA3OqI6LVT/O20HCyyo9hGr1VqtPMWiAaPNMqC2eUo4JV7MYQgXXoH55RT
 rTVQ==
X-Gm-Message-State: AOAM531vF5HZgDSRPWurWjombp92bGsEeBvIPKNMEsN2cQnO9Iq46rhE
 /xyoP9XqCWQAVqB/+5wP40dW9ODgIlO2+NLTcRpHhGDki1o=
X-Google-Smtp-Source: ABdhPJwyR5jykSvsD16k4MOOtQw2HhUZc4H3SLkeV7XdxOJq2leUfDt6gZR+kwvCEHL1bXo6rY7vAH0Ekd2v277m9T4=
X-Received: by 2002:a05:6902:4:b0:648:3cd9:3f6 with SMTP id
 l4-20020a056902000400b006483cd903f6mr23587689ybh.316.1651152482171; Thu, 28
 Apr 2022 06:28:02 -0700 (PDT)
MIME-Version: 1.0
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 28 Apr 2022 07:27:51 -0600
Message-ID: <CAGrGpJBudcMYNH93sXmXqgPjy9o2r91T_1JbpHCOBudXxMSmfQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-04-23
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
Content-Type: multipart/mixed; boundary="===============5235654511505268956=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5235654511505268956==
Content-Type: multipart/alternative; boundary="0000000000002b7ef405ddb6e546"

--0000000000002b7ef405ddb6e546
Content-Type: text/plain; charset="UTF-8"

TO: buildroot@buildroot.org

I thought this failure  was fixed  on February 16 by Arnout Vandecappelle
with commit  e253e41ce2e5:
package/sdl2_ttf:  add harfbuzz optional dependency

I cannot figure out why it is reappearing again now?

Peter

--0000000000002b7ef405ddb6e546
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>TO: <a href=3D"mailto:buildroot@buildroot.org">buildr=
oot@buildroot.org</a></div><div><br></div><div>I thought this failure=C2=A0=
 was fixed=C2=A0 on February 16 by Arnout Vandecappelle with commit=C2=A0 e=
253e41ce2e5:=C2=A0 <br></div><div>package/sdl2_ttf:=C2=A0 add harfbuzz opti=
onal dependency</div><div><br></div><div>I cannot figure out why it is reap=
pearing again now?</div><div><br></div><div>Peter<br></div><div><br></div><=
div><br></div></div>

--0000000000002b7ef405ddb6e546--

--===============5235654511505268956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5235654511505268956==--
