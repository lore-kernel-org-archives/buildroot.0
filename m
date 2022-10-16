Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC096C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 20:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00B94404FE;
	Sun, 16 Oct 2022 20:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B94404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1m63ZZa0K9D1; Sun, 16 Oct 2022 20:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7FF7402A7;
	Sun, 16 Oct 2022 20:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FF7402A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB3BB1BF37C
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 20:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3B91402A7
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 20:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3B91402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsOVt83qm_Kc for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 20:45:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA58D40144
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA58D40144
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 20:45:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z97so13446640ede.8
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 13:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WYjuqcZzrO1OZ3Hm1tAGfk0QerPL29ZWGJhzBbRw8Vc=;
 b=67/1rADVyNToHLyYFacdajNnauOAhJ0M1y8nfn2sbOUNLld/rJKHgDFBgLZpQ5iwH5
 Zp+DbNE42saY5glsnuMBGb3o3OTxLrFl1BWCZpM0CB1c8TSUIKk20z9zSOYEiGs+yyDP
 o/9UmDNXRsoVHzOhpvy0dhUU56htkhYMwACIWdIoNNWhh0dgOBsRBOlIVd4r//G92j7B
 DQuE/jwTSC/koTqfdzrnqqnGBC0VHAt733SsHD186dmgETYHDLxyh7RfPsabspbQYWnr
 B3l2g9VRaGa8BOJWh4B4YviP/3pHknzeMJTsyxDLrrwB+J6KrozX5XNbF50/DXgAo/9j
 kppw==
X-Gm-Message-State: ACrzQf11boxKSxnKT9tP3oD3qsaDqeHSp5p+ktoRaP2mGlgb9j8Jawfz
 G9lRns6zRzX9zVZh8yRIBNDP+YGlWnWsf+N0ThN++NL6
X-Google-Smtp-Source: AMsMyM7hFATQjGG3+WMBwtdvk3708o7m1OLHuvr3NSvcLdZ8ok7aMebclpVVJOPwHAeHNR1V1A5SILPGfYZOriGLVMY=
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id
 fj11-20020a0564022b8b00b0043a5475f1aemr7346631edb.363.1665953148236; Sun, 16
 Oct 2022 13:45:48 -0700 (PDT)
MIME-Version: 1.0
From: samuel ammonius <sfammonius@gmail.com>
Date: Sun, 16 Oct 2022 18:15:36 -0230
Message-ID: <CALbUA4hghH3s=f=71LvQzKMAwBXDy09LUv0Jegp_1vLnWC40Rw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WYjuqcZzrO1OZ3Hm1tAGfk0QerPL29ZWGJhzBbRw8Vc=;
 b=NQIWWnsYmmYmnnbJnutEGm/YtgBLwVjvkDMCstny6+7SZvfDgFSTVMy0FKaiDLyQ6I
 +4VFCpXBnRx3Pn2AnBn3Z7GnsghzZAHeSin+s98q7zDtlua0r0GYsT769K25uIaMlE7m
 wqTuIBB502Jiy6gPPLtGGNePC/acA7sYk993ZCU64yuK3o2S4+tkg6KnBrQMZcRVDCOu
 fAJTp4XMPkVacaEITDV8+Rp/GjDXMLjW5P7oqsKAz6vq5EJab58Th+TeJudFuQPcBqA1
 /BOhKQ8/Wl2LI7SLM/PaTvEm668x9PmTxZI/bcqWN9eIFkfUUWk34txQ17SymB71sH7F
 mblQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NQIWWnsY
Subject: [Buildroot] Help with isolinux: "No DEFAULT or UI configuration
 directive found!"
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
Content-Type: multipart/mixed; boundary="===============5559313492006713069=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5559313492006713069==
Content-Type: multipart/alternative; boundary="0000000000009cf7e405eb2cf178"

--0000000000009cf7e405eb2cf178
Content-Type: text/plain; charset="UTF-8"

Hello everybody,

I don't know anything about embedded systems or bootloaders or most of the
stuff involved with buildroot. I wanted to make an installer that could be
burned to a USB to run a graphical app that depends on Qt. I have the
dependencies and filesystem all set up, but booting the generated iso9660
image gives me this message:

Booting from DVD/CD...

ISOLINUX 6.03  ETCD Copyright (C) 1994-2014 H. Peter Anvin et al

No DFEAULT or UI configuration directive found!

boot: _


Typing anything into the "boot" prompt just repeats the same error message.
Does anyone know how this problem could be fixed?

---
Thanks,
Sam

--0000000000009cf7e405eb2cf178
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everybody,<div><br></div><div>I don&#39;t know anyth=
ing about embedded systems or bootloaders or most of the stuff involved wit=
h buildroot. I wanted to make an installer that could be burned to a USB to=
 run a graphical app that depends on Qt. I have the dependencies and filesy=
stem all set up, but booting the generated iso9660 image gives me this mess=
age:</div><div><br></div><div><blockquote style=3D"margin:0 0 0 40px;border=
:none;padding:0px"><div><font face=3D"monospace">Booting from DVD/CD...</fo=
nt></div><div><font face=3D"monospace"><br></font></div></blockquote><block=
quote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div><font face=
=3D"monospace">ISOLINUX 6.03=C2=A0 ETCD Copyright (C) 1994-2014 H. Peter An=
vin et al</font></div></blockquote><blockquote style=3D"margin:0 0 0 40px;b=
order:none;padding:0px"><div><font face=3D"monospace">No DFEAULT=C2=A0or UI=
 configuration directive found!</font></div></blockquote><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div><font face=3D"monospace=
">boot: _</font></div></blockquote><br></div><div>Typing anything into the =
&quot;boot&quot; prompt=C2=A0just repeats the same error message. Does anyo=
ne know how this problem could be fixed?</div><div><br></div><div>---</div>=
<div>Thanks,</div><div>Sam</div></div>

--0000000000009cf7e405eb2cf178--

--===============5559313492006713069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5559313492006713069==--
