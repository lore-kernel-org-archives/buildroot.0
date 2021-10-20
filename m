Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93687C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 17:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01EE260FE8
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 17:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01EE260FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CB44077D;
	Wed, 20 Oct 2021 17:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVUPGDgqqyWz; Wed, 20 Oct 2021 17:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27E1440757;
	Wed, 20 Oct 2021 17:31:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0FBD1BF94D
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 17:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B069C608E2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 17:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gk0_N99BC2Z9 for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 17:31:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 577FB6084F
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634751087;
 bh=xHKMwnScHOmGhJuEnNbXkRjr7vqFfyY33FX/6VWjTGI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=jt3zSZxL6bXb0dnB2OzXHcOUAsUWribIx3YFduICdNQ1AYEvNAQIzK/a34yIaFiua
 mN9RlY7ljNrAmqV+/oCiPFZZcnJlAnrcXA2DTZ1v9QcAg407ND1LmNRyrXR6zTdPWP
 KqiZjNh8ctEGjpsB0nadCynKOmAZws2C/rMT5q24=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.231.235.79] ([217.231.235.79]) by web-mail.gmx.net
 (3c-app-gmx-bs04.server.lan [172.19.170.53]) (via HTTP); Wed, 20 Oct 2021
 19:31:27 +0200
MIME-Version: 1.0
Message-ID: <trinity-32102c61-d17b-4389-b079-2deaf932e799-1634751087143@3c-app-gmx-bs04>
From: Steve <sleepy_dog@gmx.de>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 19:31:27 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211020185435.48c2eddb@gmx.net>
References: <trinity-007290bc-de5f-4ff6-86dc-7caa998c06c5-1634729803292@3c-app-gmx-bap28>
 <e9c4ad82-8cdd-9c17-6d77-8ebf2449fb37@mind.be>
 <trinity-09b27e65-87f1-4757-866e-d1edf67f30e9-1634737088797@3c-app-gmx-bap28>
 <20211020185304.60af9ff8@gmx.net> <20211020185435.48c2eddb@gmx.net>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:RmODBr97vXn/YKTS6DhFZ6XjJTzowPGPkYa9L/pl8CfWk7ww5wZuZuFprqxD6z4jNJzy5
 /d+JR+/jJpD62NKQUfl+RUG0y41kg4od2DCuPrnoDiQn0J1pELcSF8LQ+p/C3OKlwE0eNcC0r6h2
 VF/GhmJZphiUPvr8B8pv5ucNxIB+1ZTRZvSV5GT1lSyBE2PkSDZeHSucU+I88w3jb6f0UFKuXMHv
 BNESGPhg6iIU5qCa7VVJ/qCyu0ZWFVgn7+BmiLFEutU02MOQJlhMpCuReuE6zt8KwR1jsv9N+euR
 Dk=
X-UI-Out-Filterresults: notjunk:1;V03:K0:MIG1iVUHTco=:sfP6Skvx6rzxBvwDemL32X
 zBtd/QRt3hSt2P15YMmmeIzWg5La/2gnTvAxbZFP/VKapmDFalwGVJjEyM8N/mL2x1wf13Zs8
 H31PIWLfoVQrJJvAPKsEa77a0MSwheOb+j++vJirHPeg4GAmXtC9UuL1k3EK++riIwRMtrpaY
 MNtDakMmOKXJb7AKgnEyqPK1GDL5qMklurXYmcM14SwcjyHW2DHKHnaaBIYCRMF3rV1b5BB2g
 ulMWJs4XKD+nKwgabuOPkdK2XvJKAn6l1U63CQnunu8cMTc1G8+kMX7PtVQmumW5Fiwt3kr85
 vVf7ndQbeJ02f7VsxvNOPHTe2/je6u8/GqzJGJ0O0Jmswc8+f8IrvlR0v78R2F2vqF6SEJej0
 KQNVoyOpGsbUT0KYaQK9keRcbYoesCsmDw80NoSVRS5wL4NZsfNII3jKIyRJOsdgoH2TLQJ6h
 fuTCMeIJ5RA7J7E/DMtYJdjoNT/OLLoQNuTZGKRusoeb6ibkkuF+KByEm+kpewBlTjDq74JG3
 orvdXl2Slx5yMIZZUkRN+K1Y1Q7ITTXxzMYpa43NBfUfmOa0jdIIWAwEUXOsyfWWJ/UdlT8lJ
 kZbLCNkjH9n1+ixgSkNibOSiS4L60aK5VS7VvdwUNHdlNNo0h7gh5SsQAmufKkEPo1p8ngCKQ
 Zp6Dym2/AVCixZNH9CisNfnpl+85xjWhskv0bQSJ1oDx3+nBKPVYzRU301O0YkLhUVyrPHx2P
 Dlw01HBTpP2kset3jETGonm7LCXJoXAkpgjvyTQIlVKgs8nDKi4H131asr0yapGdoeSNnSzHJ
 o/KJYnw
Subject: Re: [Buildroot] openssh - kernel messages upon connection attempts
 (always ending with "connection reset" at the other end)
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
Content-Type: multipart/mixed; boundary="===============6880960873377924282=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6880960873377924282==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>&nbsp;</div>

<div>
<div>thanks for that!</div>

<div>&nbsp;</div>

<div>I don&#39;t like the options I am seeing, but it is what it is :)</div>

<div>&nbsp;</div>

<div>&nbsp;
<div style="margin: 10.0px 5.0px 5.0px 10.0px;padding: 10.0px 0 10.0px 10.0px;border-left: 2.0px solid rgb(195,217,229);">
<div style="margin: 0 0 10.0px 0;"><b>Von:</b>&nbsp;&quot;Peter Seiderer&quot; &lt;ps.report@gmx.net&gt;<br/>
&nbsp;</div>

<div>Hallo Steve,<br/>
<br/>
&gt;<br/>
&gt; This is maybe a known feature/bug of the combination of openssh and (some) external<br/>
&gt; toolchains, see [1] for discussion, patch/hack to avoid the problem and/or<br/>
&gt; the hint to use another/internal toolchain..., or use dropbear instead of openssh...<br/>
&gt;<br/>
&gt; Regards,<br/>
&gt; Peter<br/>
&gt;<br/>
<br/>
And the missing link:<br/>
<br/>
[1] <a href="https://bugs.busybox.net/show_bug.cgi?id=13671" target="_blank">https://bugs.busybox.net/show_bug.cgi?id=13671</a><br/>
<br/>
Regards,<br/>
Peter</div>
</div>
</div>
</div></div></body></html>

--===============6880960873377924282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6880960873377924282==--
