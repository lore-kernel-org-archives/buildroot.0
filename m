Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DEBC43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 08:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD56B40949;
	Tue,  5 Jul 2022 08:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD56B40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U79Y_ECOwYGs; Tue,  5 Jul 2022 08:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A597A40502;
	Tue,  5 Jul 2022 08:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A597A40502
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 839D61BF681
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 08:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CB9581D65
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 08:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CB9581D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ew9OWLP7fvHe for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 08:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886F6817B3
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 886F6817B3
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 08:41:58 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id i18so19340315lfu.8
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 01:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UfR4bltSrDaNRve/Zn4FkOxrZHUjRcdY80SbNZ0ttFA=;
 b=ZkGvJwoNwOwL/Ov12tnwPOLv1/QWVKgJDU+OUbyq2khD3gQ6X4tgYEZHplmP/9wh8c
 NBWVVYVilixQIM285st2LwPTkv4hzLKn08Zr2TExrN96/LlvaLx7d75USwF4KsE5T8ur
 2iMQkSC+gPfhxDkNSpwlP1qvFhpRoHhJis4F/JDqfo3hoyX9u/hFHaGwu9LsQXkjBFzg
 V4Ip4GdXCemMqn3/liN0Xrws726HQOvv2QxHmshaoQrVDe1PQIx2ToPTbnXbzEXHETqe
 lexi/n56Y0i6NIc5eFCV/hgtMuGqeO3de4piLRQ1fe2mgK0/sTet3t6AYN9VFIQ2cB/U
 /FTw==
X-Gm-Message-State: AJIora+I43cMsSzUco7t0nK9AAbM82WIRI4j+AZ5V/Uaxe+D5iILjzkG
 jWfmRKQakVQEc2G9W3cE/e20kfrflG2rHBbvRQFyly4nGNdn6A==
X-Google-Smtp-Source: AGRyM1u/K7+j0EFUI2vcdz2tqsqh+q1d2UDb5in6DyZ90bMPHWrrnt3UaGP8Pau04i1YjVedByK8OofwuksvMjc7SuY=
X-Received: by 2002:a05:6512:128f:b0:480:fd23:6647 with SMTP id
 u15-20020a056512128f00b00480fd236647mr22334195lfs.136.1657010516134; Tue, 05
 Jul 2022 01:41:56 -0700 (PDT)
MIME-Version: 1.0
From: Federico Pellegrin <fede@evolware.org>
Date: Tue, 5 Jul 2022 10:41:45 +0200
Message-ID: <CAM6O0ZiSwpyathbf+xVQnddT3frF7ik_SWzgy1DAo5COTefJxw@mail.gmail.com>
To: buildroot@buildroot.org, jugurtha.belkalem@smile.fr, 
 romain.naour@gmail.com
Subject: [Buildroot] package/bcc in buildroot ?
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
Content-Type: multipart/mixed; boundary="===============8970853099589045125=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8970853099589045125==
Content-Type: multipart/alternative; boundary="00000000000034121a05e30ad326"

--00000000000034121a05e30ad326
Content-Type: text/plain; charset="UTF-8"

Hello,
Lately I was looking at the necessity to integrate bcc in buildroot for one
of our projects.
I've seen that in the not too far past there was a few attempts to
integrate this, namely this should be the latest patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20201220151203.2206747-2-romain.naour@gmail.com/

I've for the time being tested that patch against buildroot master and it
works. I also bumped the bcc version to the latests available (0.24.0) and
besides very little changes (to one of the two patches) it also built
successfully.

I was wondering if there was still interest to add this as a standard
package as it would then be more useful to everyone and easier to maintain.
I could give a hand of course to try to do this if possible.

Reviewing the open points for the patch:
-) The two patches are still not upstreamed (not sure if there was an
attempt to upstream or not)
-) I guess some work would be needed around the dependencies as suggested
in the review, but hopefully there is no big showstopper.

Many thanks,
Federico

--00000000000034121a05e30ad326
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hello,</div><div>Lately I was looking =
at the necessity to integrate bcc in buildroot for one of our projects.</di=
v><div>I&#39;ve seen that in the not too far past there was a few attempts =
to integrate this, namely this should be the latest patch: <a href=3D"https=
://patchwork.ozlabs.org/project/buildroot/patch/20201220151203.2206747-2-ro=
main.naour@gmail.com/">https://patchwork.ozlabs.org/project/buildroot/patch=
/20201220151203.2206747-2-romain.naour@gmail.com/</a></div><div><br></div><=
div>I&#39;ve for the time being tested that patch against buildroot master =
and it works. I also bumped the bcc version to the latests available (0.24.=
0) and besides very little changes (to one of the two patches) it also buil=
t successfully.</div><div><br></div><div>I was wondering if there was still=
 interest to add this as a standard package as it would then be more useful=
 to everyone and easier to maintain. I could give a hand of course to try t=
o do this if possible.<br></div><div><br></div><div>Reviewing the open poin=
ts for the patch:</div><div>-) The two patches are still not upstreamed (no=
t sure if there was an attempt to upstream or not)</div><div>-) I guess som=
e work would be needed around the dependencies as suggested in the review, =
but hopefully there is no big showstopper.</div><div><br></div><div>Many th=
anks,</div><div>Federico</div><div><br></div><div><br></div></div>

--00000000000034121a05e30ad326--

--===============8970853099589045125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8970853099589045125==--
