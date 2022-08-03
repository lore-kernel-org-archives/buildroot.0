Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21485C19F29
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 23:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6319A4088D;
	Wed,  3 Aug 2022 23:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6319A4088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isrMIRedkQaN; Wed,  3 Aug 2022 23:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1939C4086E;
	Wed,  3 Aug 2022 23:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1939C4086E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF691BF35C
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 23:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 558C8404C8
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 23:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 558C8404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id noQiZ7STdWe1 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 23:30:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A917E401B7
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A917E401B7
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 23:30:19 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id f65so16419208pgc.12
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 16:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=GFnr+G7yXZFqwyDVJA9CkeddjFQglfPBX7ftgzzuVMg=;
 b=kEaErOkNb7RoF6YPzreomw5Mph9XJGp9cs+R713h7bD8ZobGYaClbRc3oV9DtRHPXq
 RYP/B5NUnnDzCfdP7nzsNXcTFbpVJ+dFs3YUGOBtzgDdrDTHdweJVylNNBsZwgJwVhzK
 A/ng3EnmequuGAZtRTIuhhLdZUmCJM5XVYtBeqlk/9TZVpae3tiA3/dluXgXy+Dm/5rM
 vmivSaOigxIkBOg9EEgZZpo/FkLS8Pid5/tNvGEPjw9lmZg37p1C4JAfIFhsKeXQ5EDV
 6sCBqRis20L37N9hvt8kh7d+pgzWdF1jFuoIjrk+vx3P/lmNQj8TMr+Ow1xCaKMt8e6P
 sRKA==
X-Gm-Message-State: ACgBeo2klpaC94OMBgXojqM4l1RNCoFXm/Bk/gfR1ZjFz5H8yco4WZ/8
 Tt1Uisb4v6dfWVJW/husbtommz4mBtC8m7djfxDLgHn8egI=
X-Google-Smtp-Source: AA6agR42hVfeMmk0+gw5zrJGFa2lAVRhK9TvaX0yb/twVQOAdax4KUQN1yCvHQEm9mhkb4V0d5749/VEMkidx4DnCu0=
X-Received: by 2002:a63:6fce:0:b0:41c:86b0:f361 with SMTP id
 k197-20020a636fce000000b0041c86b0f361mr6053997pgc.163.1659569418366; Wed, 03
 Aug 2022 16:30:18 -0700 (PDT)
MIME-Version: 1.0
From: Jameson Collins <jameson.collins@gmail.com>
Date: Wed, 3 Aug 2022 19:30:07 -0400
Message-ID: <CACoTCHeTKbTU4QSBs4qtyUXKDNOH+5u4Y-rGhy4QeuvK=kAENw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=GFnr+G7yXZFqwyDVJA9CkeddjFQglfPBX7ftgzzuVMg=;
 b=fhDXpAGZ4dTg8yexowvI55L8ZqmAMUAShEIDCFchyvTd0zM6cf38JFSHTIiCMajUi9
 +SFgDh3cekAC+DFok4njU4gyaIO5FCf/X5/ndNNITPUp4M33LP/L0be0zoBm+tkh6E8L
 iG1uEOe4AZOxJy1U9l8KIfZUTNPH0Zwr0igsoG95G1jJn9P1zWR9ZU7ohLVmoSTSEtYN
 cgNFFC5YRg+HFr0PbL7o9gWoUxpTgdWPk99p6JndE2V0FWPsllO/94tMLsACoAwFElRp
 h2MZO7yTMQxVi9/HmmeQLHiUSVr1+1MsG1twzB08F2eBm08dsS1hVqS3QmgPgPAh9vDL
 hnjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fhDXpAGZ
Subject: [Buildroot] Defining a package with no dependencies
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
Content-Type: multipart/mixed; boundary="===============4171874981535884688=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4171874981535884688==
Content-Type: multipart/alternative; boundary="000000000000a9741205e55e9d76"

--000000000000a9741205e55e9d76
Content-Type: text/plain; charset="UTF-8"

If I have a package that doesn't build anything, doesn't depend on
anything, and doesn't have anything depending on it, is it possible to tell
buildroot to build this package without first building the toolchain?

An example of a package like this might be the `flash-my-board` recipe that
is shown in the manual.  Yes, in this case the package doesn't make any
sense unless boot.bin existed, but you can see how it might be useful to
have a package that performs a task and not necessarily generate a build
product.

Thanks,
Jay

--000000000000a9741205e55e9d76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If I have a package that doesn&#39;t build anything, =
doesn&#39;t depend on anything, and doesn&#39;t have anything depending=C2=
=A0on it, is it possible to tell buildroot to build this package without fi=
rst building the toolchain?</div><div><br></div><div>An example of a packag=
e like this might be the `flash-my-board` recipe that is shown in the manua=
l.=C2=A0 Yes, in this case the package doesn&#39;t make any sense unless bo=
ot.bin existed, but you can see how it might be useful to have a package th=
at performs a task and not necessarily generate a build product.</div><div>=
<br></div><div>Thanks,</div><div>Jay</div></div>

--000000000000a9741205e55e9d76--

--===============4171874981535884688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4171874981535884688==--
