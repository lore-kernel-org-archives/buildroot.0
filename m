Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200B2C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 23:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691F04182E;
	Mon, 27 Mar 2023 23:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 691F04182E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWpqKtxNS1MY; Mon, 27 Mar 2023 23:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72268417C8;
	Mon, 27 Mar 2023 23:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72268417C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 732AF1BF3E5
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 23:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58340417C8
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 23:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58340417C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfJBKNBi2uul for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 23:24:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB9C4179D
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FB9C4179D
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 23:24:31 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id cm5so964298pfb.0
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 16:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679959471;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8zMUTu5rQ649H1W9ojG741/IJWdmyFJjwKeddjIryv4=;
 b=DY91f/eXHQVSnvGGNBXv8JgjOmDD+hB1vqGr1mSo/CX3IJOR40WMLbCRrJd3+qndVD
 o7LndUyaV2c7m9e4FUGEGhPeAXAIhdRq8PYj+UVDazysuZN+gIDHpeixyzs7yLpnz3d6
 LO6jaz4tbKfO9xPIy2HcTQtFPLkIKtqJtniQPX2xN+D7Ta0au59hu8jIRJoTyPl4hkqF
 a3kVF2YEvGJqAzgN/rsE9RPaM4CjKR00eBCqlC6+HJIOR8iW2ecity2g2eskoQRpplGq
 iTndum85dpkP1FBKFNy5QPTYihkoFCjUUnWEu5NLRU7cAUWkX4CIrss1VRePnV9V9V7y
 c+Eg==
X-Gm-Message-State: AAQBX9dWoXfxqjHDHE/S2YtdRX347oY7vShKz7WL2lN67YZp4OfCSy7z
 +DFUSMvDpIpk+npknAkJ2Vx1AAoYQ7PrM7AH/sfkExTYol8=
X-Google-Smtp-Source: AKy350ab3QkXiZqqnltRCc8v/cxdWRIoRipMA7mvT7oOPXGRtgljCmiWx8/6w+KXMuXv9AKorRS2ThLF/fDO7TgkRZ0=
X-Received: by 2002:a05:6a00:84e:b0:628:123c:99be with SMTP id
 q14-20020a056a00084e00b00628123c99bemr7507419pfk.2.1679959470580; Mon, 27 Mar
 2023 16:24:30 -0700 (PDT)
MIME-Version: 1.0
From: Charles Lohr <lohr85@gmail.com>
Date: Mon, 27 Mar 2023 16:24:19 -0700
Message-ID: <CAGu26P-VdZMH1007cH_eTiA4BqkrYUfYgy5jexP=8dRAoaYopQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679959470;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8zMUTu5rQ649H1W9ojG741/IJWdmyFJjwKeddjIryv4=;
 b=IaNHoc3fXdb83kNRfkjafZ1gvBuyCepBy2AOGy0qVTFwxM6QQUsGiKh1zjuAIr0nn+
 CgX3Ap1q93Yol40bV+pAqf8wM+IEz6PY4GxUY8Hx9jwHE0Upe1KxxXNOmdnVVi6VGLmS
 oT5yGTqll25J9DWoc0vAtsJhBVy7+utYpnxbAFnsi1gbu01I7sSbFTAmFRCcmjq1OsdS
 9bTQAGbLZFQBjjv/1LdKuhFWivWUs0t1BFwV2ij5xCyL3Z2S9qAqndllVAR6xiWOGODJ
 rrgaqBvfVHFdFPG7opixGMnHDVRUvbhIJXOajPTpctHSJRcYQNMIMGd9w8DxbsZ4ohAA
 F1fQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IaNHoc3f
Subject: [Buildroot] Proper way to auto-login-shell-as-root
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
Content-Type: multipart/mixed; boundary="===============2560195125481857377=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2560195125481857377==
Content-Type: multipart/alternative; boundary="0000000000007b29b605f7ea0b20"

--0000000000007b29b605f7ea0b20
Content-Type: text/plain; charset="UTF-8"

Are there any mechanisms to add `login -f root` to the /etc/inittab, to
allow for auto-shell-login versions using busybox's init?

I.e. something like the following:

console::respawn:/bin/login -f root

I can make it work if I manually edit output/target/etc/inittab, but I'm
hoping to make it work in configuration instead of requiring wacky
additions.

Charles

--0000000000007b29b605f7ea0b20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Are there any mechanisms to add `login -f root` to th=
e /etc/inittab, to allow for auto-shell-login versions using busybox&#39;s =
init?</div><div><br></div><div>I.e. something like the following:</div><div=
><br></div><div>console::respawn:/bin/login -f root</div><div><br></div><di=
v>I can make it work if I manually edit output/target/etc/inittab, but I&#3=
9;m hoping to make it work in configuration instead of requiring wacky addi=
tions.</div><div><br></div><div>Charles<br></div></div>

--0000000000007b29b605f7ea0b20--

--===============2560195125481857377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2560195125481857377==--
