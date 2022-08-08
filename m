Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A27C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 07:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFB840886;
	Mon,  8 Aug 2022 07:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFB840886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I01plMba3fHK; Mon,  8 Aug 2022 07:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C631140878;
	Mon,  8 Aug 2022 07:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C631140878
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5A01BF3EB
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 07:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 334E160ABF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 07:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 334E160ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qj4stZtysMY4 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 07:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E945360AB5
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E945360AB5
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 07:40:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z25so11487915lfr.2
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 00:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=utCjXrU6pvjyhqwS4MCP+ZLHnIbj0qNZnnw0ue6x3uQ=;
 b=ZV+2W80X0z3SmpGjG4sb2ScdYuHzpXoo8jFsm62DNgbWw6rTgkSyziQr5snSEv3DNa
 U7BGtK5NwPg8aofTF+5ZKqZUJS8icRzNj5fXX72IzKleyPohq4EdVmDUeSZMbr66o0iI
 qsknS4HsXWsmqFQNQZ1XuBZdPJByENy4K0TlmjI4t4u1rekk9NLuTY09K50U326OqI1H
 H33IE+DXqW4K3kXbgdnleo9k06BfP0SUrNiI4yHNIZT7oZPcJOVpOHDX+UYDXI30kF32
 N7EMEHapnaO5pa99xGMmhNWS0MjWHnJaqezUoAHo3QxU58ekMajbZCj/q5x0+Y6hnQKG
 DMHA==
X-Gm-Message-State: ACgBeo00VlTV/bSwC5VM7+hC+vO6a6n/P8UecnwvqMXBlqJWKKq3L3/e
 /1PqwoUOcuEYed+2524dGbheiSg1B/hmfQJOsZ8qN5tqs6KN8w==
X-Google-Smtp-Source: AA6agR65+wgTVgcmb62HUzj8wEP1jL7m1Wt+lF+etcQswNv1uZ2okJwFWasPjDzaPvrL2q4X2dQHGXSxHrPqVu0bTXY=
X-Received: by 2002:a05:6512:1587:b0:481:1946:8e1c with SMTP id
 bp7-20020a056512158700b0048119468e1cmr6520050lfb.163.1659944413546; Mon, 08
 Aug 2022 00:40:13 -0700 (PDT)
MIME-Version: 1.0
From: Federico Pellegrin <fede@evolware.org>
Date: Mon, 8 Aug 2022 09:40:02 +0200
Message-ID: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] Python pyc only and problem with scripts
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
Content-Type: multipart/mixed; boundary="===============2285772562520961829=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2285772562520961829==
Content-Type: multipart/alternative; boundary="0000000000001dcdbd05e5b5ed0d"

--0000000000001dcdbd05e5b5ed0d
Content-Type: text/plain; charset="UTF-8"

Hello all,
I've found a minor problem related to the rt-tests package, but that maybe
is slightly more generic and wanted to report and in case understand which
approach would be best to fix it (and contribute a patch then if possible).

The specific problem: rt-tests, besides a few compiled executables,
installs also two tools which are written in Python, namely hwlatdetect and
get_cyclictest_snapshot. These are Python scripts which get installed in
the PYLIB and then a symbolic link is done from /usr/bin to them, so ie we
have: /usr/bin/hwlatdetect ->
/usr/lib/python3.10/site-packages//hwlatdetect.py

Needless to say that once the pycompile.py script is run and original .py
files are removed, of course in the "PYC only" setup (which is the
default), then the link is broken and it will not work.
Additionally that pyc files will not work for scripts like that, so just
somehow fixing the link mentioned above would anyhow not work, as you need
to execute them eventually by explicitly naming the interpreter.

I could imagine that we could have some similar other cases when we are
installing Python scripts directly executed in PYLIB and not modules. But
I'm not sure that installing the scripts there is a good idea as well,
comparing with other distros that doesn't seem to be the case.
So maybe the problem is really in rt-tests after all and the location those
scripts get installed and I may just fix it that way (and contact upstream)?
Otherwise should it be more generic maybe could make sense to have a
facility to list some files that should not be converted to PYC?

Thanks for any input,
Federico

--0000000000001dcdbd05e5b5ed0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><br></div><div>Hello all,</div><div>I&=
#39;ve found a minor problem related to the rt-tests package, but that mayb=
e is slightly more generic and wanted to report and in case understand whic=
h approach would be best to fix it (and contribute a patch then if possible=
).</div><div><br></div><div>The specific problem: rt-tests, besides a few c=
ompiled executables, installs also two tools which are written in Python, n=
amely hwlatdetect and get_cyclictest_snapshot. These are Python scripts whi=
ch get installed in the PYLIB and then a symbolic link is done from /usr/bi=
n to them, so ie we have: /usr/bin/hwlatdetect -&gt; /usr/lib/python3.10/si=
te-packages//hwlatdetect.py</div><div><br></div><div>Needless to say that o=
nce the pycompile.py script is run and original .py files are removed, of c=
ourse in the &quot;PYC only&quot; setup (which is the default), then the li=
nk is broken and it will not work. <br></div><div>Additionally that pyc fil=
es will not work for scripts like that, so just somehow fixing the link men=
tioned above would anyhow not work, as you need to execute them eventually =
by explicitly naming the interpreter.</div><div><br></div><div>I could imag=
ine that we could have some similar other cases when we are installing Pyth=
on scripts directly executed in PYLIB and not modules. But I&#39;m not sure=
 that installing the scripts there is a good idea as well, comparing with o=
ther distros that doesn&#39;t seem to be the case. <br></div><div>So maybe =
the problem is really in rt-tests after all and the location those scripts =
get installed and I may just fix it that way (and contact upstream)?</div><=
div>Otherwise should it be more generic maybe could make sense to have a fa=
cility to list some files that should not be converted to PYC?<br></div><di=
v><br></div><div>Thanks for any input,</div><div>Federico<br></div><div><br=
></div><div><br></div><div><br></div></div>

--0000000000001dcdbd05e5b5ed0d--

--===============2285772562520961829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2285772562520961829==--
