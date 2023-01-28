Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0250C636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D4F60E41;
	Sat, 28 Jan 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D4F60E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pu_00HEBZbSa; Sat, 28 Jan 2023 20:52:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9189860AB1;
	Sat, 28 Jan 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9189860AB1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 809A21BF327
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AC7981A3E
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC7981A3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8NRhcIRIJOS for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:52:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8012781A39
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8012781A39
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:52:24 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id q9so5284946pgq.5
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 12:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iIm2lSnD2QU1q7k6E801kEdZGdppeKZyc3Ep/vTJMQk=;
 b=fjWUzOxusvry2tExiGaiMofdKS17Id+hMJMpjKTL6I4rH/i7a5ZTG4RmvSTNGUDlaj
 /PQwY5cP6WPfjXL3WTbNIrz8jH669uR7YKFXudIIDPYlBbhCIZ3vMlIJZBzRsr6bk/c9
 GiyAqD6fiG54C20qHxBS/GedJ7RPjlWJclBkL4SjNG6ojWqEqStviVleuFbBTYnwqWSl
 SgFYhTDmkQCzwiFy/Qmpr74BVr0luwVJEtVEhv0oWdhwo3rm+oSodcBUXjQrjECPjP9t
 w42NV8ijiDXY+SM9S5xtzoLPODD0o18e+rjFiPGV9fE98d4AOGkkFCshBzCLu0Sf6Xzi
 GJKw==
X-Gm-Message-State: AFqh2kqgYQROnDLWERKrNJpxCq99Wfp6wYfdMIh+P9x8pCTrGrssCL1Y
 lf6rUPdkeFUpJMoieEYs7i41P4EPnw+l0egYyrXHEHBS
X-Google-Smtp-Source: AMrXdXsrCXm6FkVO/KWTEeXjwzGHd/tk/9aOYMbl4fTTJ4aT3bjON5duYWZEM7zhKaafb7WEVeVltgm8bqxBmMhuncI=
X-Received: by 2002:a62:1c86:0:b0:58d:a84a:190b with SMTP id
 c128-20020a621c86000000b0058da84a190bmr5221854pfc.48.1674939143708; Sat, 28
 Jan 2023 12:52:23 -0800 (PST)
MIME-Version: 1.0
From: Ra C <rcrichlow9000@gmail.com>
Date: Sat, 28 Jan 2023 14:52:12 -0600
Message-ID: <CACHw65JhmQX27SkN0jSMAD-P=UuwOizZc+sG+WatprbH_PFFyQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iIm2lSnD2QU1q7k6E801kEdZGdppeKZyc3Ep/vTJMQk=;
 b=AJ2vXpmtZ588+UXQrd1zPnh0TAunb+UXuKyxwg51Fr+LqLBJ5XV03b0/BNULLwb4xN
 NVOKmavCtjTTsvanGAP42uihisYU+ErI7N+T9AV42Z+fj7qxHjgOPqpbF3Mm4kdR8VJL
 lNXOf64TCF4PkHoycu45oW5tkFfDZRHv1qyXSIOR8GCILUqJOLxoCRq18G8rcr1lgZp7
 eslbMB0I5eU/OmdWdKwwLSU5YOF0ooj36BT/C/MYn32TXdszWDTIXZz6u1FsBZcbeiZB
 fPqEkA7yZytjSKK0+kLUVSsCElY7M3R18YVo7j7U8cZSBwcyFSD6pImnKTJXzEhMIay3
 hWhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AJ2vXpmt
Subject: [Buildroot] stm32mp1 kernel won't boot on custom board
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
Content-Type: multipart/mixed; boundary="===============6262639900220626852=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6262639900220626852==
Content-Type: multipart/alternative; boundary="000000000000ae664e05f3592853"

--000000000000ae664e05f3592853
Content-Type: text/plain; charset="UTF-8"

I have a custom stm32mp157a board which runs OK with a modified 5.4 kernel.
I want to migrate to the latest stm supported kernel.
I built a stm32mp157a_dk1 target using the BR2_EXTERNAL feature described
here: https://github.com/bootlin/buildroot-external-st which builds a 5.15
kernel.

Using the same dtb , the 5.15 kernel fails to mount the root device (a
micro sd card on SDMMC1) and gets stuck in a loop looking for a device
matching the PARTUUID in class_find_device().  The only devices listed are
loop and ram.

The probe function in drivers/mmc/host/mmci.c, which gets called in the
working kernel prior to mounting the root device does not get called with
the 5.15 kernel.

I don't understand why this is happening given that the same device tree is
used in both cases and not sure where next to look.

--000000000000ae664e05f3592853
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a custom stm32mp157a board which runs OK with a mod=
ified 5.4 kernel.<div>I want to migrate to the latest stm supported kernel.=
</div><div>I built a stm32mp157a_dk1 target using the BR2_EXTERNAL feature =
described here: <a href=3D"https://github.com/bootlin/buildroot-external-st=
" target=3D"_blank">https://github.com/bootlin/buildroot-external-st</a> wh=
ich builds a 5.15 kernel.</div><div><br></div><div>Using the same dtb , the=
 5.15 kernel fails to mount the root device (a micro sd card on SDMMC1) and=
 gets stuck in a loop looking for a device matching the PARTUUID in=C2=A0cl=
ass_find_device().=C2=A0 The only devices listed are loop and ram.</div><di=
v><br></div><div>The probe function in drivers/mmc/host/mmci.c, which gets =
called in the working kernel prior to mounting the root device does not get=
 called with the 5.15 kernel.</div><div><br></div><div>I don&#39;t understa=
nd why this is happening given that the same device tree is used in both ca=
ses and not sure where next to look.</div><div><br><div><br></div></div></d=
iv>

--000000000000ae664e05f3592853--

--===============6262639900220626852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6262639900220626852==--
