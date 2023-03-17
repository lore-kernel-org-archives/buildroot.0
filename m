Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F55C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 07:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32999408AC;
	Fri, 17 Mar 2023 07:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32999408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RxuXLq3I98vH; Fri, 17 Mar 2023 07:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 786A940002;
	Fri, 17 Mar 2023 07:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 786A940002
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E59AF1BF25B
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 07:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BED64414D1
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 07:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BED64414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJ_8eFpa5PYf for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 07:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58841414A2
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58841414A2
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 07:11:02 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id o32so3677323vsv.12
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 00:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679037061;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SBgq6+XxKs4hAKDlkTG6uliW+M5a5dghEo8IbfWAbvQ=;
 b=ifgUC9f9FU8Zg2BiQV+721LYFFW9h3aFGZJ1USu92B8z+t3AnzC0ZC3C8dGJCHjdqN
 Xd0o7QOpt3iOgLKAkK1uomiG82z0jvDg7q2E40+kQZPCr3AkVjRKuKPSatVaE2Ru7yNF
 StqwNjFrgBpZORiM7kUj8yMX1Sc9qGIMDBq4MlXOTsj9sw6kqwAfVOx++49KmuIbGbwv
 z++5SHUryOfgEsUzYMFxyh9cEggncYmXwflE4wnYEBtWOW3opmHVBcc2+j1KJBErJ0Sq
 nahvin6OzokadiE3EzXk9XJjgN8PhnfzEmcoPoKiXAOgMqqusHz1MtcE9AQ1/wk2wImO
 rMMA==
X-Gm-Message-State: AO0yUKXlq5I/rt2pPlad8Ouxbu3wCtxEd2leMOqyJwe+LWHzRkSktplP
 GwIbWC+Ws6xs2n3AnaDjAdOgSf7pc9ACnNirBNtwbArh8UU=
X-Google-Smtp-Source: AK7set8WwKfTMhBrunnHefUJiOekLaU2e2vCgOccKzEEfARlN/nu5u+Zc+XC6alCePlZVyeP6K7pU36Pu5yN8jl0ylg=
X-Received: by 2002:a67:b04d:0:b0:421:947e:4470 with SMTP id
 q13-20020a67b04d000000b00421947e4470mr30182701vsh.2.1679037060928; Fri, 17
 Mar 2023 00:11:00 -0700 (PDT)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Fri, 17 Mar 2023 09:10:50 +0200
Message-ID: <CABRndgyV74UC_GgsN1xLJH1KdkFDwrQ=JemAz1Ck3SHSV-OxdA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679037061;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SBgq6+XxKs4hAKDlkTG6uliW+M5a5dghEo8IbfWAbvQ=;
 b=ji8VU4wzHt+eD23LS57T9khSEgiG03WGd7O4ibqIOqzqp6Wyh/OIfjtZlUQQamfd/D
 G0pqDnlykPY5Gs3agsc5Gehs325dLDSpEjvEUBinRgYCrbKv85DQRFpl6O923L327A4K
 AixpzDFGPfc4EjhttMFTmykQvhZI2B1DPympEMxLvysmO0eUwtn6QZ3+Phrxulaj13yE
 kwMx4xhAaOJKUlGsk93XwF/1x2YFxXq4onF3bitkdP5aybkLUjPqeHJ2RiKkhKhz92wJ
 qHbuu3V/cHKSrHyJdI6pKVNDFy9XQypsG+/tfRFjUipg1i+mvuBHvEZbEQvVTP0ccrzP
 iBGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ji8VU4wz
Subject: [Buildroot] 2023.02 : Authpriv.info dropbear: Early exit : failed
 to daemonize: no such device
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
Content-Type: multipart/mixed; boundary="===============4473648212298800946=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4473648212298800946==
Content-Type: multipart/alternative; boundary="00000000000094d92e05f7134732"

--00000000000094d92e05f7134732
Content-Type: text/plain; charset="UTF-8"

Hello,

I built rootfs for aarch64 (little endian) and used it to boot cortex A-53
with kernel 4.9.x
The rootfs contains also dropbear.
After login (+password) I noticed that dropbear is not running.
In var/log/messages I found:
Authpriv.info dropbear: Early exit : failed to daemonize: no such device

According to few links I found, the root cause is that there is no
/dev/null
It is probably created later.

After login I ran:
dropbear -F -E -E (and got other errors)

Can you please advise what can be done?
Should I just add delay in the script (created by buildroot) that runs
dropbear ?

Thank you,
Zvika

--00000000000094d92e05f7134732
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><div><br></div><div>I built rootfs fo=
r aarch64 (little endian) and used it to boot cortex A-53 with kernel 4.9.x=
</div><div>The rootfs contains also dropbear.</div><div>After login (+passw=
ord) I noticed that dropbear is not running.</div><div>In var/log/messages =
I found:</div><div>Authpriv.info dropbear: Early exit : failed to daemonize=
: no such device<br></div><div><br></div><div>According=C2=A0to few links I=
 found, the root cause is that there is no /dev/null=C2=A0</div><div>It is =
probably created later.=C2=A0</div><div><br></div><div>After login I ran:</=
div><div>dropbear -F -E -E (and got other errors)=C2=A0</div><div><br></div=
><div>Can you please advise what can be done?</div><div>Should I just add d=
elay in the script (created by buildroot) that runs dropbear ?</div><div><b=
r></div><div>Thank you,</div><div>Zvika=C2=A0</div></div>

--00000000000094d92e05f7134732--

--===============4473648212298800946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4473648212298800946==--
