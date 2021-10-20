Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26067C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 11:36:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A589061361
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 11:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A589061361
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538124072A;
	Wed, 20 Oct 2021 11:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vnxeNgVxrO3; Wed, 20 Oct 2021 11:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1DC040724;
	Wed, 20 Oct 2021 11:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDE2A1BF955
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 11:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9CDD401AF
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 11:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5UeCgs73WJS for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 11:36:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9115940235
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634729803;
 bh=OYDRYg9wyZF1uYHz+zcknat0skLNapMujiTxr6v6INQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=G8eYtRe4C4Si09bIvtsYjpAV4F5gHjuCmLUOA8W6rgCCiBbtnOvT/0BAWQNKgOSlq
 UQCyNlgmrZyEfH9AXMZ5nO5VfrESIAjjsQ6FgAdpOaF35DINZOxl+TnUI2vRDSEiOM
 Okrtd2lhzlggv+GBSYzR2CWhrdjxOckRXTLvFZGU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.231.235.79] ([217.231.235.79]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Wed, 20 Oct 2021
 13:36:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-007290bc-de5f-4ff6-86dc-7caa998c06c5-1634729803292@3c-app-gmx-bap28>
From: Steve <sleepy_dog@gmx.de>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 13:36:43 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:BxOpInUKcjMsytu8LrS/FXGIqRtwN8HP7N8eoaByhMbKlByit2Qaop+lkk4kq3NRHfKDJ
 KXexCUOnymSFTPnvvrIBkUGZpv71kARpMxGl92URgxb7TiJelmqEcO2JIIsYWwN1r3XGpTbSOfPu
 jBgX+A+Vx2LUWGjLwTkLnWuE1k8HVyZbo97zIx/+zXyuQk8n8VWS804w80QMi0hB5BPbwRsTlTAM
 5CIJUKT6Rv7l+q9U7OqEXUO9AoT7f7LiB8Q4/PsrlNawvhCJOYPgQJMLeBpIdYj8CH3bI5XJzRud
 pM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:l97HpmLq9G4=:dKUOWD8MlSVMt8DmbXXBF0
 zTO0rH6ybhG1P7uDqS9plTLcBqLZpJHRYZ4tXvKbFoor1MX91fs9BsZUmWDm95Q6OnlhAyhjr
 puYCHjIm10ET4L6MvbNKlp+RgoKxMIKvLSAoN8tMzAqupd4AXJ1PvnkKsPWaqNz1vKTLiSW72
 lyh/idFMSAyTo+WDOio6p7/ipo2E+VILOyZD/ShII8HFf9j2/VSmwiHJufrwkMVFaB0kxMaFR
 ZmVIHuahN5k9g0x/4CTtOtv8T4mm1bUADnFCSHeKUP2qRO74ODLjjsoN2vZnjIwgCva6qmqSw
 yfJMQkhEp+88OWmyn2ELIxb7dhLlkvI6rQn7W7RCKukhPmhKCRGQCRwlXy+356i/LRa9pudZg
 rtJdZ3MZa4CfzaTKOLbIdQ2J9xEuc9W2PxCPr37OGtmtoWpNSLxCVdzrMPBIPWyDO09deO4U0
 L/xckqC7alUTZ3hYxUVPeflywc4nugUG/R4GER+upF2+AuNqVf7AGqTXU5YLYj657hqmAnisT
 7xCnzuam3bgEXOKLX4fJSfIAx0nvbvsmginEPyf3fMS7wbRqUKb7AtlHUT+HVkLmgib+bzT9x
 lS0EiQ1VK43QmGz+PDZYgN88XVzFawg7/7G+jBUTdtmoIbkf9IzeBBl0Dtw8ZJNeAl17N2ZIb
 fqnrgfrr4KrGo2VtjXtvAE/QVjQw6UL5ZMQd5dAgFMf1gsMqVF0uF/hSQMemaviyo4WztZdgH
 mK/Br4hLsPkt9JrA9+HjAa5/L6IGQrS39EOGXw2xo/Dc/SxNrBzDmWGfeGLyGnJxFhzic/P1s
 D6kqvgo
Subject: [Buildroot] openssh - kernel messages upon connection attempts
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
Content-Type: multipart/mixed; boundary="===============4265258478113643162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4265258478113643162==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hello all,</div>

<div><br/>
I recently downloaded buildroot and used the default config for RasperryPi3, altered to add openssh, among a couple other things.</div>

<div>(no idea whether that matters, I am using a USB connection from the raspi running g_cdc driver (ethernet + serial gadget), and am trying to ssh into it from the USB host computer the raspi is plugged into)<br/>
<br/>
I have found that root ssh&#39;ing into the machine is off by default. So I altered the sshd_config to, for now, say yes to PermitRootLogin. (I&#39;ll look into how to add a non-root user later - but this here *should* normally work, right? UNless something is broken)<br/>
Still, on the computer that tries to SSH into the buildroot raspi, I get &quot;connection reset&quot; immediately.<br/>
<br/>
There is a kernel message for each such attempt:<br/>
&nbsp; &quot;audit: type=1326 audit (time...) auid=... uid=1000 gid=1000 ses=... pid=... comm=&quot;sshd&quot; exe=&quot;/usr/sbin/sshd&quot; sig=31 arch=40000028 syscall=413 compat=0 ip=... code=0x0&quot;<br/>
<br/>
(the dots replace numbers I guess are pointless to type)</div>

<div><br/>
I searched a bit around and found threads in forums with similar seeming problems but somewhat different numbers in the message, claims of some problem with this stuff and libc6 and linux versions prior to 5.1, well if I &quot;uname -a&quot; here, it says &quot;5.10.46-v7&quot;, I guess that one should not have *that* problem, unless it has nothing to do with that.<br/>
<br/>
Any ideas?<br/>
&nbsp;</div></div></body></html>

--===============4265258478113643162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4265258478113643162==--
