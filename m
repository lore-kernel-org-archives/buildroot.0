Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01732C04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 08:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5225C60BD0;
	Wed, 28 Sep 2022 08:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5225C60BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXvZam4eWA9h; Wed, 28 Sep 2022 08:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60424605D5;
	Wed, 28 Sep 2022 08:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60424605D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1CA1BF831
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 08:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C440380DD5
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 08:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C440380DD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5TJywBgqp1PU for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 08:43:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B11880DCB
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B11880DCB
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 08:43:42 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso2876588pjq.1
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 01:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=ET0JrgPjL2hW7D1/l7uCcE8KCLqrfpJ3g7Rcl/RSIB8=;
 b=IAahN25raSwl4SjfhZbuPXGc3E3/FMgdmkX6ZFIelJPvD6z7nRWhzCDFjzEOq8Ep7G
 20Uj2GEQEmrGbXhpL5puPheK9GCpSj7vmsaaNUkdKjBgjTM0MftT+Gu6wyKZxlK8k6cR
 nEF9Hg7bZmw/NZrJw6wZd4fVw+4CSI981rv683vAWfSSjqwRKJCbydNprdtHs8ATMlP1
 aAdHh0E4m1h23jXDIvZe4es4IsHTcM/u7iY9yyVyroabdC2bPkxVZB4JQhT1rVdkHIbN
 JGZ52JiFXb9g6sgDpVSGrXvbu/aa/378q1TH/rOTOUYJHJgo2YNS1a7QigtWX9nAOsa+
 Ymcg==
X-Gm-Message-State: ACrzQf1Ew6Y04P6YutvnNd7X3aui5K541t4y7XLhvL43YY+Tw6Sue7rd
 cncx6uZVErRgBhX8kIlyO0OVWWN6A9cW88AKoGPmeD++0cWMQQ==
X-Google-Smtp-Source: AMsMyM4tQrY5x98RiIYtm+Gme4zlt6DVBY40dctUdBbt6W972Ix71AgXlhssML7Hlpj27NxXlo6EkXxc+iHS3IycK2s=
X-Received: by 2002:a17:902:b591:b0:178:bb0c:78af with SMTP id
 a17-20020a170902b59100b00178bb0c78afmr31186762pls.55.1664354621351; Wed, 28
 Sep 2022 01:43:41 -0700 (PDT)
MIME-Version: 1.0
From: Debananda Pal <debananda.pal@gmail.com>
Date: Wed, 28 Sep 2022 14:13:04 +0530
Message-ID: <CA+n_itoLuOOVedFgbFs5nv+F-O=KovkZmU9qP5AjCQ1GQNE9+Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=ET0JrgPjL2hW7D1/l7uCcE8KCLqrfpJ3g7Rcl/RSIB8=;
 b=fkfSCKuTpDhpnEThcaRadt/VzRRFA9EmsI/7Om8p7JBOQX90SFMprChviJMpN3Y/Ih
 x8GBw+JiwOAR361ZksCEarp3aXcBE+8ShaxirFYn4W9S0H/5xOw8uZr4v9miawzZhKXX
 6w2yyNvoDmlihNZuOObff/fAHdARi/ew6keF3THJW7lURPekHolNP/GVHKqI8DpYXJ9O
 AxcGp4kvoZVWpTOgPS2O6FDY7L1SUvjqqKDBhqIaT1Bg+bMkUmVemSMuwW2M99n0gTBR
 Tr7+7n1tvjj1eygzEClSJ8Gcec+Ed3jnsDpMQtD7crd5ywLcQDYBzpnx4/crQB9zok84
 mcrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fkfSCKuT
Subject: [Buildroot] Help needed to upgrade libglib2 on Buildroot
 2012.02-rc2-00001
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
Content-Type: multipart/mixed; boundary="===============6698107050369536261=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6698107050369536261==
Content-Type: multipart/alternative; boundary="000000000000fc6af905e9b8c1ab"

--000000000000fc6af905e9b8c1ab
Content-Type: text/plain; charset="UTF-8"

Hi Buildroot Team,

I am new in buildroot compilation.
We are trying to upgrade openvmtools to latest version and found there is a
dependency to update libglib2 and libffi.

I am trying to build openvmtools 12.1.0-20219665 source.
While upgrading openvmtools, I found that libglib2 version should be more
than 2.34.0.
  Now I have changed the version of glib2 to 2.72.4 and libffi to 3.4.3
version.
But while compiling, I am getting below error message :
--------------------------------------------------------------
make: *** No rule to make target 'host-libffi'
--------------------------------------------------------------
In libffi.mk, earlier it was used below way to call for compilation :
$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
------------------------------------------------------------------

Now latest libffi.mk (as mentioned in opensource libffi.mk), it is using
below way to start configure and compilation :
-------------------------------------------------------------
$(eval $(autotools-package))
$(eval $(host-autotools-package))
-------------------------------------------------------------

Please give your suggestion to go forward.

Thanks,
D Pal

--000000000000fc6af905e9b8c1ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Buildroot Team,<br><br>I am new in buildroot compilatio=
n.<br>We are trying to upgrade openvmtools to latest version and found ther=
e is a dependency to update libglib2 and libffi.<br><br>I am trying to buil=
d openvmtools 12.1.0-20219665 source.<br>While upgrading openvmtools, I fou=
nd that libglib2 version should be more than 2.34.0.<br>=C2=A0 Now I have c=
hanged the version of glib2 to 2.72.4 and libffi to 3.4.3 version.<br>But w=
hile compiling, I am getting below error message :<br>---------------------=
-----------------------------------------<br>make: *** No rule to make targ=
et &#39;host-libffi&#39;<br>-----------------------------------------------=
---------------<br>In <a href=3D"http://libffi.mk">libffi.mk</a>, earlier i=
t was used below way to call for compilation :<br>$(eval $(call AUTOTARGETS=
))<br>$(eval $(call AUTOTARGETS,host))<br>---------------------------------=
---------------------------------<br><br>Now latest <a href=3D"http://libff=
i.mk">libffi.mk</a> (as mentioned in opensource <a href=3D"http://libffi.mk=
">libffi.mk</a>), it is using below way to start configure and compilation =
:<br>-------------------------------------------------------------<br>$(eva=
l $(autotools-package))<br>$(eval $(host-autotools-package))<br>-----------=
--------------------------------------------------<br><br>Please give your =
suggestion to go forward.<br><br>Thanks,<br>D Pal<br></div>

--000000000000fc6af905e9b8c1ab--

--===============6698107050369536261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6698107050369536261==--
