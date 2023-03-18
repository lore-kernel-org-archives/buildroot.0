Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10909C7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A384882003;
	Sat, 18 Mar 2023 21:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A384882003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8b9qHV05Gm4D; Sat, 18 Mar 2023 21:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E423981FFA;
	Sat, 18 Mar 2023 21:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E423981FFA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6EF41BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DCCC403B8
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DCCC403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iagfWVFpzaVf for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDAA400B9
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADDAA400B9
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:46:27 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x3so33176031edb.10
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 14:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679175985;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hufxeq3Kks2bWtzUM4WHJ/xfQGe/k95qbECe6XfKJ/4=;
 b=qMS3IGtG5izAWD25GjtR+/9maAkKCTkFI6M0330bEJAyYQ1FRcIHyvvWV9rMYzApRz
 mKMRXuYB7vq6iCJrgh3Ao6JUgF3+U9QoZ9F+rrgCTR9YL+mcMahmt+0rqjeVazVaHAUT
 glK/8cK2ifGkJqKg11fce+ORcFP6Ug/mK1hDPh62sLLv5eKNhMbLZT5MpMDqRzdpKYXD
 vDqEv1iwjNMQip+/jqIsQucHR9WV7r2BZhAnYZiXuEj6I4X4X1NVdxlL4EemHHqreoWu
 3S1j/LjiWjZR8DtxbPrW4ednR5oOtfub2Wbx3DTqNVLx1XahHK8mMP7ZfAxe6L/U7vBp
 7TXw==
X-Gm-Message-State: AO0yUKUkhioTvpUjfGHgVyp0bWRoV4gJPbUE5fOQwdEVT4mpNb2n7H8i
 r/wp3Mbb7tR+tvnWBupBPchhvV7zuFNVUxT6YWAc/TcJKpI=
X-Google-Smtp-Source: AK7set/RbgWM6vCJSF72cJT5gYxbDXy7i0UT1ophOwCCB2vBcFes0Z/VdMM0XD4V0vvffsB6EvxBlKY8AL57TbQLjjw=
X-Received: by 2002:a17:906:eb8f:b0:932:187f:6dc3 with SMTP id
 mh15-20020a170906eb8f00b00932187f6dc3mr1793533ejb.15.1679175985447; Sat, 18
 Mar 2023 14:46:25 -0700 (PDT)
MIME-Version: 1.0
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sat, 18 Mar 2023 23:46:15 +0200
Message-ID: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>,
 giulio.benetti@benettiengineering.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679175985;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hufxeq3Kks2bWtzUM4WHJ/xfQGe/k95qbECe6XfKJ/4=;
 b=PdGivB7xlnAG/RWEFMgOi4GPx5GKZVU/F3wsKkUldVMk7qCLKWBZ/xdnmpgmKjEK/9
 3PEhywKXoJyJooS8VdvfjNsJ+Mw8RgkreeH5YO70Ek8Kfa54ANkCdayLyjp9567JuK6b
 sClIUI2dEg1fJnYqVPmg4cr0UAz1QVoluEDb0M8hNssODCLsaFg1oEqcT1nMR022clwF
 /g/uufQ/An2bBqr1FbuUUif01AFVXf493ejy5N/S3hKIEmTYuEBpi6hlL7AUfQ4zSiDq
 YDaTO69IuxxiJKNtHv17hRZbVcEXUYehpOdk7TMfYd3sgfahNRVx7jqCqE6ku2W/6Dyh
 S23Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PdGivB7x
Subject: [Buildroot] package/rtl8189fs: bug in conf, and a question
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
Content-Type: multipart/mixed; boundary="===============3388507099957553326=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3388507099957553326==
Content-Type: multipart/alternative; boundary="00000000000020d40605f733a03f"

--00000000000020d40605f733a03f
Content-Type: text/plain; charset="UTF-8"

Hi!
I'm trying to prepare a patch for MangoPi MQ (Allwinner D1s RISC-V). I'm
almost there - Samuel Holland managed to mainline initial support for this
board, so vanilla linux kernel 6.3-rc2 boots fine (with proper/modified
u-boot version).
The WiFi module is based on rtl8189ftv chip (SDIO connection) and its
driver seems to be problematic.
First, buildroot's package/rtl8189fs is currently broken; it points to the
wrong commit (seems to be copy paste error, inherited from
package/rtl8189es). The result is unusable. I updated it to the correct
commit (on the correct branch) and the driver builds fine and loads fine.
There are couple of issues though:
- for some reason the debug mode in driver is set
-  driver seems to constantly restart the module, and it emits endless
debug messages

So, is there anybody for whom the rtl8189fs linux driver works fine with
kernel 6.3-rcX?

PS. I can prepare a patch to fix the package/rtl8189fs but I expect Giulio
to bump the version again for both package/rtl8189es and package/rtl8189fs
soon.

Best regards,
Indrek

--00000000000020d40605f733a03f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div>I&#39;m trying to prepare a patch for MangoPi MQ (=
Allwinner D1s RISC-V). I&#39;m almost there - Samuel Holland=C2=A0managed t=
o mainline initial support for this board, so vanilla linux kernel=C2=A06.3=
-rc2 boots fine (with proper/modified u-boot version).</div><div>The WiFi m=
odule is based on rtl8189ftv chip (SDIO connection) and its driver seems to=
 be problematic.</div><div>First, buildroot&#39;s package/rtl8189fs is curr=
ently broken; it points to the wrong commit (seems to be copy paste error, =
inherited from package/rtl8189es). The result is unusable. I updated it to =
the correct commit (on the correct branch) and the driver builds fine and l=
oads fine. There are couple of issues though:</div><div>- for some reason t=
he debug mode in driver is set</div><div>-=C2=A0 driver seems to constantly=
=C2=A0restart the module, and it emits endless debug messages</div><div><br=
></div><div>So, is there anybody for whom the rtl8189fs linux driver works =
fine with kernel 6.3-rcX?</div><div><br></div><div>PS. I can=C2=A0prepare a=
 patch=C2=A0to fix the package/rtl8189fs but I expect=C2=A0<span style=3D"c=
olor:rgb(51,51,51);font-family:sans-serif;font-size:13.3333px">Giulio to bu=
mp the version again for both=C2=A0</span>package/rtl8189es and package/rtl=
8189fs soon.</div><div><span style=3D"color:rgb(51,51,51);font-family:sans-=
serif;font-size:13.3333px"><br></span></div><div>Best regards,</div><div>In=
drek</div><div><br></div></div>

--00000000000020d40605f733a03f--

--===============3388507099957553326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3388507099957553326==--
