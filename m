Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556D2C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 07:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D8A4191C;
	Fri, 16 Sep 2022 07:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7D8A4191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVPc4Vhb9To6; Fri, 16 Sep 2022 07:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E9340354;
	Fri, 16 Sep 2022 07:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E9340354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57FC91BF41F
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 07:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3342582AC3
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 07:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3342582AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKvveUVHoftz for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 07:38:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AB7782AA9
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AB7782AA9
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 07:38:44 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id u189so21815587vsb.4
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 00:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=BsCQ5Qn7mpGkimcqhMMNz67Dh8IPLJw8jVKpg4Orkg4=;
 b=nXNstuP35yIYqekBqqKZyrjCL+bZdCt2YwIlLw8MTid66Iqsb+21fP8LksHfVbJm4S
 s0MiTnODhie6c+VCSSw188lBr49i8sQV4S9ovXGFfQ+g/HwHm1VYhp/y+BBWpzouYoOA
 JFqY4LuikPUsrzValfSiWO7s1MZC5lt4DKVcu7mjjnA0V5fP2MfjMuz0rEx9U1J13hn3
 /bRerznPX55vgOGzaxtiukTBB8kCex/A28/sVbcmZria5kSqGJTn4g1N3R7LtZg+OgTs
 HRKTXn8DiYkPllHJIFWyD3Ox3Xf39npJlI/GNI94n800Q8zPExyNA5pCoWLKRXey2MCi
 kf9w==
X-Gm-Message-State: ACrzQf1p+77MTDdCBmwsGzLVBHR7F/vVlkQ88T5S9mo9EXuJ6csmt/lK
 qJncsfSmyXuw2h5kS9WZuv9pv2Om/m76tSp0ayRBzv2nmxA=
X-Google-Smtp-Source: AMsMyM6TVW95+MPa0quv2mgv3W+XtpJpMX7su79IlR7kDZFgBWZTWzNt2RnAc1+yVOkq0sdqC3MQC3y9auzu2dkTqGQ=
X-Received: by 2002:a05:6102:3669:b0:398:56d4:b878 with SMTP id
 bg9-20020a056102366900b0039856d4b878mr1490821vsb.75.1663313921747; Fri, 16
 Sep 2022 00:38:41 -0700 (PDT)
MIME-Version: 1.0
From: Oliver H <oliver0189.htex@gmail.com>
Date: Fri, 16 Sep 2022 09:38:29 +0200
Message-ID: <CA+QDH8LdmJBt4O_PfN+gGgZXWgdvOrVrpf3S=qfFbhh+BY+mWg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=BsCQ5Qn7mpGkimcqhMMNz67Dh8IPLJw8jVKpg4Orkg4=;
 b=itJP2EASTCjW0D1VnAKRBG9kfjju4PzdbyCxhVmavPXXpMvO2Pv228lctSJRF0HJ6n
 RJ6hJAP7nEwpWFZpM+q1AcQYIkNGa78ip+6OyXQt9559EEa463Bt3hWiLpBa7KEVQObp
 oM2OtwXba+fo2fsI90ccXA/aDoOEOSw9Qv7OEYfMKJZCdYkf9hYKFScVKgHyx9Iuy/rE
 c8Q8A91sxVI6ZGJmfnPjo6Lt1CdJxH1AqD7CkRpQYlnMOHLiJEuSOBcq4lGWbI58zRYO
 SQNFmgWR5/pp3yBmr5TxHCDG4Kfx9Q2/FQYirysaxqdFSZYSBw+gU+d3HNhk4lKWAM53
 trCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=itJP2EAS
Subject: Re: [Buildroot] Adding *.so lib to buildroot
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
Content-Type: multipart/mixed; boundary="===============2491731136582991339=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2491731136582991339==
Content-Type: multipart/alternative; boundary="00000000000074aeb405e8c67395"

--00000000000074aeb405e8c67395
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working on a project to debug the linux kernel with qemu. I generate
the rootfs with buildroot.

Problem is when qemu is started with the kernel and with init process (a
simple program with pthread). The kernel boots and no problem with
debugging.

When running, the init process (a program that uses an external library)
stops booting with an error (function not implemented). So since the
external library is not included in the buildroot rootfs I assume the error
persists.

The external library is built and *.so lib files are generated. Question :
Is it possible to add directly the *.so file to generate the rootfs with
the library included. Please suggest methods to handle this.

Thank you,
Oliver

--00000000000074aeb405e8c67395
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am working on a project to debug =
the linux kernel with qemu. I generate the rootfs with buildroot.</div><div=
><br></div><div>Problem is when qemu is started=C2=A0with the kernel and wi=
th init process (a simple program with pthread). The kernel boots and no pr=
oblem with debugging.</div><div><br></div><div>When running, the init proce=
ss (a program that uses an external library) stops booting with an error (f=
unction not implemented). So since the external library is not included in =
the buildroot rootfs I assume the error persists.</div><div><br></div><div>=
The external library is built and *.so lib files are generated. Question : =
Is it possible to add directly the *.so file to generate the rootfs with th=
e library included. Please suggest methods to handle this.</div><div><br></=
div><div>Thank you,</div><div>Oliver</div><div>=C2=A0</div></div>

--00000000000074aeb405e8c67395--

--===============2491731136582991339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2491731136582991339==--
