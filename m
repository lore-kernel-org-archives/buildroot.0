Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB15EEE14DC
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 10:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6528260B5A;
	Thu,  7 Sep 2023 10:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6528260B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtK9hANW-JCE; Thu,  7 Sep 2023 10:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2B960AC2;
	Thu,  7 Sep 2023 10:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA2B960AC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E91B21BF403
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D000F40489
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D000F40489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0WUEopV7KsQ for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 10:03:52 +0000 (UTC)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 329E940204
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 10:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329E940204
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-57129417cecso383421eaf.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 03:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694081031; x=1694685831;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=boA+gRmY7k830IBFIISP1K7kZdOKZdfM6LlO0iVSCxs=;
 b=hjimV0bbltjoYFnkOpZoBNujOoBHSTi8Z9/vMwwU6SfAZkOXNJ2MtwoDPjux9je/Qw
 6E9I+0/jCxzJYFAoNl5OkW3eGweuYpspI0HHsb6Ta+A4TONGp6RsHq02RfbzdL+Y7V1X
 O4qbEFZFpHf2+WaaRbLyyF+snfuTPCa5B83T1vF25cUea1kBIMRcSgRBO+tjq9eSfKZb
 7niWQGN4jHPM8HS7jXlyJ1/ZFQPVmAs488ypeXrzS3OA1/JGQYuYL2SZPt08y33FH+pD
 MYS/bf3zSsD4rnVvMPvmtE/ogGkYZDoiI4OjgPQHOCEIvjDN6XIuCm9oDWp7lBRhx/nX
 UrlQ==
X-Gm-Message-State: AOJu0YzJtY2wroqei9hhUhxp9FTlIMqjEFp+fo5U93Fu207E/cS+/FZ7
 DeYp9GdUqrOAFUNqSKl6V4cgoLSr1wb57LvP0iyzRmzYQnc=
X-Google-Smtp-Source: AGHT+IF8Ry74iV7gMlqlZScqg+0hdNp8bXIjE2a6gUBygj8iSMFl2P/2zGZCXvCjWCGeWOXEgvhCKyWYhndP3bgYozE=
X-Received: by 2002:a4a:a5c4:0:b0:56e:9c66:e8a3 with SMTP id
 k4-20020a4aa5c4000000b0056e9c66e8a3mr1469008oom.4.1694081031085; Thu, 07 Sep
 2023 03:03:51 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 7 Sep 2023 12:03:40 +0200
Message-ID: <CADYjeSuybuLKr2oHeABvQOwdtcratHm11UrwK76HxA6TBRPnHA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694081031; x=1694685831; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=boA+gRmY7k830IBFIISP1K7kZdOKZdfM6LlO0iVSCxs=;
 b=igDNYUmsluHmtJ1wxONDcSwqMtM1+5Sus5fhtsMEWNtTbwmI4A0JH+aJHeM/1XNQJS
 3lN1vUi7un3B+t2zQvOz/MvcvAKU3qu5oh6h51zvr6a/bbTiP6xBFa7D97EpQS/6rgW/
 hRLEl7WMcF9IaNo/ULQSurTZhWUHj17HFVtGMNkAbEod+QBID3YU9MpKFDA8jCk+A2dO
 0AOso7aOO4s6Z3p7tm3kYmBgR5ZfxtreXZEOdbUxkp8Q88NgzyV2XGBHrWYD4iqSwtCB
 f4TuqqZ55d7r3hi/h2zbdG07kerp0OZ2F7RiTb49/rPvEnEwpsHAsF3HLbbwwfcITUag
 9MkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=igDNYUms
Subject: [Buildroot] Unable to configure USB webcam in Buildroot
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
Content-Type: multipart/mixed; boundary="===============7262417246490741018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7262417246490741018==
Content-Type: multipart/alternative; boundary="0000000000001421800604c1fa48"

--0000000000001421800604c1fa48
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to configure a Logitech USB Webcam for my NXP i.MX 8M board. I
have enabled CONFIG_MEDIA_USB_SUPPORT=y in the linux-menuconfig.
But when I do "ls -l /dev/video*" I get "No such file or directory" and
"v4l2-ctl --list-devices" shows "Cannot open device /dev/video0, exiting.".

Can anyone please let me know how to enable USB webcam in Buildroot?

Thank you,
Sourabh

--0000000000001421800604c1fa48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div><br></div><div>I am trying to configure a L=
ogitech USB Webcam for my NXP i.MX 8M board. I have enabled=C2=A0CONFIG_MED=
IA_USB_SUPPORT=3Dy in the linux-menuconfig.<br>But when I do &quot;ls -l /d=
ev/video*&quot; I get &quot;No such file or directory&quot; and &quot;v4l2-=
ctl --list-devices&quot; shows &quot;Cannot open device /dev/video0, exitin=
g.&quot;.</div><div><br></div><div>Can anyone please let me know how to ena=
ble USB webcam in Buildroot?</div><div><br></div><div>Thank you,</div><div>=
Sourabh</div></div>

--0000000000001421800604c1fa48--

--===============7262417246490741018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7262417246490741018==--
