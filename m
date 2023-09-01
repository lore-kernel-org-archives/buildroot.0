Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B38CA0FE1
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 09:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1580041842;
	Fri,  1 Sep 2023 09:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1580041842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_GDhp-HZOGp; Fri,  1 Sep 2023 09:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 584954171A;
	Fri,  1 Sep 2023 09:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 584954171A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECF21BF380
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 09:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 786A760FC8
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 09:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 786A760FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXBzVizToKM0 for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 09:30:06 +0000 (UTC)
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4026460F15
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 09:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4026460F15
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-573912a7b14so1019705eaf.1
 for <buildroot@buildroot.org>; Fri, 01 Sep 2023 02:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693560605; x=1694165405;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l2nxM8r3aEtmpYciugcpFCGn0d8lSt1193J0Yb791MY=;
 b=A2wv43w5o7I9EJrt4NyaX1gG/op+hTdjPaMSF6DFxpevZ/TcJSQI8vtEWeH/REe2XK
 Rh8N1NPl926t5/cmYzV8tSqo5DRRDBelymft3KxwnOKmY2wcuHz5YGdfHyMK+SrabaAR
 zeGUQojPC3aRMCdTi6jwMjqH+XwwKme2VnJf8VejFyAWb1K7x4QjqKw48rEA5iLCKDRl
 jxRquXc3guGzK0kllGqTAkjWYWoA6jTgenxwbF3PDols2xHJa+Y+1fhoioB78bWB1S0X
 miX8Gf+eikAWsLSUn3NqW+uBZOnuYOnU+WufhVwTUeirGyyFh1YEkS2H49lmCFSue3fX
 EXgQ==
X-Gm-Message-State: AOJu0Yxz/JvqZVmmoFZXW3YZWc7xYZhYfmbKGdeJLgtR+ECsAANBKzSq
 jjFbRWHcoGO8pVrW2tjmyo6sM86VyDfmDR4iHPePmHFBE48=
X-Google-Smtp-Source: AGHT+IH1z6+TYAJCEZmIChkfOivf6s3nzh6sDw1TwIlQTaGTazSPESqYkI3G+Yfj4RZ3rjxZyrVdelapMHvkLJ/zNSA=
X-Received: by 2002:a4a:dfb4:0:b0:573:5539:43d9 with SMTP id
 k20-20020a4adfb4000000b00573553943d9mr1744703ook.9.1693560605053; Fri, 01 Sep
 2023 02:30:05 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 1 Sep 2023 11:29:57 +0200
Message-ID: <CADYjeStAix3iUX8WUMnNK0onAXeoN391idwxda0JndNNJf=-kA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693560605; x=1694165405; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l2nxM8r3aEtmpYciugcpFCGn0d8lSt1193J0Yb791MY=;
 b=fcSMyMuw3c4ah24cCD5JDIwXtZnb/2NS+l2ysF17SK2MspjCOhA4eonc7onqzCfn2a
 R1qtH0icdshGX1Ky3PdE9eqLmCE6Pe/TMsS9xhGzuPe7yf2WsJw0Zi2ejf0sUq4DzZ5d
 sslD+csw0RGWag+88/qzkMLfX3yYAXT3pGUrTkB0HKlkOmR0ssEUcRwfqbxGkUEd8bCl
 H4f1dx72n7M0nhxTxp+eVJe5uWIs3InUTnwPYMrjPMpVC4UaveZi+xCFCnHGT0db2iHt
 CQs+yjkZaagHI76fWprCTD93x7nPgYgfqu0LUJNhmy7bzppEAS+oILOT5wvOJfmfW+iz
 Ypqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fcSMyMuw
Subject: [Buildroot] How to enable imxvideoconvert_g2d in Buildroot?
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
Content-Type: multipart/mixed; boundary="===============0484730785024183178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0484730785024183178==
Content-Type: multipart/alternative; boundary="0000000000004518cb060448ce69"

--0000000000004518cb060448ce69
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to enable the "imxvideoconvert_g2d" element of gstreamer in
Buildroot. But I couldn't find any imxvideoconvert_g2d option under
gstreamer. Can anyone please let me know how to enable this option in
Buildroot? I am using Buildroot 2022 version.

Thanks in advance.

--0000000000004518cb060448ce69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I am trying to enable the &quot;=
imxvideoconvert_g2d&quot; element of gstreamer in Buildroot. But I couldn&#=
39;t find any imxvideoconvert_g2d option under gstreamer. Can anyone please=
 let me=C2=A0know how to enable=C2=A0this option in Buildroot? I am using B=
uildroot 2022 version.</div><div><br></div><div>Thanks in advance.</div></d=
iv>

--0000000000004518cb060448ce69--

--===============0484730785024183178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0484730785024183178==--
