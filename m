Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FD6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:55:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBB876135E
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBB876135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A462607A6;
	Wed, 20 Oct 2021 12:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJ6FFdsjadDK; Wed, 20 Oct 2021 12:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19A7607F2;
	Wed, 20 Oct 2021 12:55:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E02D41BF951
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE03840560
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iysdaYR2H7iF for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 12:55:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1555740193
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634734548;
 bh=guckrBwHmAHzOmp+C+GtayWjCkpUFpZ1P02tgGJq5LY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ky7l0bTsX4Uy1YBqSq6Ls1nqFxkkmvCBiPpGGd85saogMRq9XaqyHlKko2EaXLsT1
 L8wZgA1pblKqDrrCPk1WW/ZYQr82BitjWbemWcQkVG5alHteImoaloV1jnpsw7NaG4
 LbyK4t4TCLLqNTMCj+aDnduMmL22x1MpWUv/csrg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.231.235.79] ([217.231.235.79]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Wed, 20 Oct 2021
 14:55:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-37320d19-a174-46c4-9f92-823a8454c4d5-1634734547955@3c-app-gmx-bap28>
From: Steve <sleepy_dog@gmx.de>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 14:55:47 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <52787ac7-f1cc-1c34-f8b3-03cda8a7d458@mind.be>
References: <trinity-072a3cc2-e02b-45ac-9f17-5037678caabf-1634728973216@3c-app-gmx-bap28>
 <107f4e64-9a30-0b86-48fc-769cf12976b8@mind.be>
 <trinity-925a029f-87a5-4638-b533-9c4c46e363cc-1634732988358@3c-app-gmx-bap28>
 <52787ac7-f1cc-1c34-f8b3-03cda8a7d458@mind.be>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:kDowMANDYAa17TUGzF57aaPbL+ujLJokqNWH2596zabko+CYqFtNYcBnyXLN2ng9mQOCd
 8vqzlr4ivePcl/odLAhjlCWW4nRlTz1eWXX6Yanxfobt4BVkCrvtRIVdSiE8orhokQsgg+vgmjNS
 ClGJAhX6HURlGlEf+w6/EkpkSoyWQf2K0P5pJG+ffKqmXBDTvt1xnQHqaoGJ2BuvRUqurTkQhoy8
 SBG1kaCZsASJLeiUnZ6piZIk9fT2GZxjcHrN3iBIkDYY6eNmW9mZSu5/14moPGF5h7znty0Rah0a
 JQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:sioykbqzvM0=:0uI8BVwJYg1KsUOIV8aYJ4
 nrlyXSqE4GBDEf7CPoKQaLOJqDiCH+/qCq+ro6OuwIEsFPVAohkJfWTEveeHI5cfus/lUhnjY
 KtuU988f9FrEZdaoO/btN+aEitogTHmABI/53rfcqXGpXDlXcrygpVKNIec48xopBPOGv7lry
 xLER6WtWF3c19i8r35PV+F6UJJ5OA/ycPORFO3Nh+HuyMJVXWFv/iwpX69qISdhucZL+wPS6p
 uW2VB021YRLq2BQwuy6tiE4nx1oOoGL8JOifRsiU0y31WCstcDj5jIFHNNjAnog4QcuLOM+Le
 GOEdsdRBWQByZRrNeC6+gPjVbPkRx3+va0460HLR532uxyFpm//oot+u5J+ZvR5UqcyHObxRN
 0JNHgYbJUg1nh8cwk4WrETzZ1+0wmgOYtmIykXvlpCYxndzWqvDhvyratP+YrkcRQiES34e27
 GOIzknh77rFypaNQWw8uWFwoktsv0CgYyu6YhovKC/WeLC1OsFROqhumz3nyFDbcpM9Onqdgd
 OmTqj24JYfCqxxuoWrspAdHFN1eLEIJ8pYvOWwbn0xGNgKWyHsbJdCXXc+Xd+fBM7/gn54SjZ
 LakuAd/poR9W8wBv9Xj4eph2UwQFBJDX84c8/dO7ga+I+tcTVqHbXBVJsU7FUgESq+fe/fttJ
 XCL4FTl8FDs46uYv5pR2bjAjIKm6lHQ0cYJOPMDF30HEXP1PD9vbQzFvC4fOx1OoLuMHOgF77
 A208EKJWgKDuhqBGI17CjHyx0wyBuDOCmGAFJ3vcwty/oR2CE+aLhk+nQl/2z8B2uBXMSwC3u
 /cy2JHj
Subject: Re: [Buildroot] htop - "No btime in /proc/stat: Success"
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
Content-Type: multipart/mixed; boundary="===============0753041865485535321=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0753041865485535321==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>&nbsp;</div>

<div>
<div>&gt;&nbsp;I don&#39;t understand how btime can be 0 though. Is the uptime (in /proc/uptime) also 0?<br/>
&nbsp;</div>

<div>No, it&#39;s now &quot;11014.58 22892.09&quot;</div>

<div>&nbsp;
<div name="quote" style="margin:10px 5px 5px 10px; padding: 10px 0 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
<div style="margin:0 0 10px 0;"><b>Von:</b>&nbsp;&quot;Arnout Vandecappelle&quot; &lt;arnout@mind.be&gt;<br/>
<br/>
On 20/10/2021 14:29, Steve wrote:<br/>
&gt; &gt; Is /proc mounted?<br/>
&gt; if &quot;mount&quot; outputting a line, among others, saying &quot;proc on /proc type proc<br/>
&gt; (rw,relatime)&quot; means that, then yes<br/>
&gt;<br/>
&gt; &gt; What is the contents of /proc/stat?<br/>
&gt;<br/>
&gt; # cat /proc/stat<br/>
&gt; cpu &nbsp;75 0 917 3631474 47 0 4 0 0 0<br/>
&gt; cpu0 26 0 336 907872 1 0 2 0 0 0<br/>
&gt; cpu1 23 0 536 907241 17 0 0 0 0 0<br/>
&gt; cpu2 19 0 22 908242 7 0 0 0 0 0<br/>
&gt; cpu3 7 0 23 908117 21 0 2 0 0 0<br/>
&gt; intr 123556 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 169 2275 0 3 0 0 0 0 0 0 0 0 0<br/>
&gt; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 60 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 644 0 0 0 0<br/>
&gt; 0 0 0 0 553 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0<br/>
&gt; 0 0 0 257 45046 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0<br/>
&gt; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0<br/>
&gt; 0 0 0 0 0 0 0 0 74548 0 0 0<br/>
&gt; ctxt 184781<br/>
&gt; btime 0<br/>
<br/>
Ah, so btime is there, but it&#39;s zero, and htop apparently doesn&#39;t like that.<br/>
<br/>
I don&#39;t understand how btime can be 0 though. Is the uptime (in /proc/uptime)<br/>
also 0?<br/>
<br/>
<br/>
Regards,<br/>
Arnout<br/>
<br/>
<br/>
&gt; processes 184<br/>
&gt; procs_running 1<br/>
&gt; procs_blocked 0<br/>
&gt; softirq 156657 0 70619 33 535 553 0 10351 72206 0 2360<br/>
&gt; *Von:*&nbsp;&quot;Arnout Vandecappelle&quot; &lt;arnout@mind.be&gt;<br/>
&gt;<br/>
&gt; On 20/10/2021 13:22, Steve wrote:<br/>
&gt; &gt; Hello,<br/>
&gt; &gt; a Linux image built with a recently downloaded buildroot, starting with the<br/>
&gt; &gt; defconfig for RaspberryPi3 and adding some things (htop if it wasn&#39;t already,<br/>
&gt; &gt; nano, openssh, openvpn; also the linux-menuconfig was altered, concerning USB<br/>
&gt; &gt; driver stuff).<br/>
&gt; &gt;<br/>
&gt; &gt; When, in menuconfig, I search with / for htop, it shows that htop and all<br/>
&gt; &gt; dependencies are met (all positive dependencies are [=y] and the one negative<br/>
&gt; &gt; (static libs) is [=n].<br/>
&gt; &gt; But when I call htop on the running system, I only get the line given in the<br/>
&gt; topic.<br/>
&gt; &gt; What could be the problem?<br/>
&gt;<br/>
&gt; This is squarely in the &quot;this shouldn&#39;t happen&quot; domain...<br/>
&gt;<br/>
&gt; Is /proc mounted?<br/>
&gt;<br/>
&gt; What is the contents of /proc/stat?<br/>
&gt;<br/>
&gt;<br/>
&gt; Regards,<br/>
&gt; Arnout<br/>
&gt;<br/>
&gt; _______________________________________________<br/>
&gt; buildroot mailing list<br/>
&gt; buildroot@buildroot.org<br/>
&gt; <a href="https://lists.buildroot.org/mailman/listinfo/buildroot" target="_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a><br/>
&gt; &lt;<a href="https://lists.buildroot.org/mailman/listinfo/buildroot" target="_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a>&gt;<br/>
&gt;<br/>
&gt; _______________________________________________<br/>
&gt; buildroot mailing list<br/>
&gt; buildroot@buildroot.org<br/>
&gt; <a href="https://lists.buildroot.org/mailman/listinfo/buildroot" target="_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a><br/>
&gt;<br/>
_______________________________________________<br/>
buildroot mailing list<br/>
buildroot@buildroot.org<br/>
<a href="https://lists.buildroot.org/mailman/listinfo/buildroot" target="_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a></div>
</div>
</div>
</div></div></body></html>

--===============0753041865485535321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0753041865485535321==--
