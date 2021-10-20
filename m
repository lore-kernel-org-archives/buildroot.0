Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3934C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 11:23:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD0661057
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 11:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDD0661057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A8B60C15;
	Wed, 20 Oct 2021 11:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhEiGb36axKz; Wed, 20 Oct 2021 11:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E163D6080D;
	Wed, 20 Oct 2021 11:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 955211BF955
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 11:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8338240385
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 11:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5I3lumxXmQV for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 11:22:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67556401AF
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634728973;
 bh=m5qgpSRcJhbmIQya+CfjU4r20FT7LcTGhCmaV+z2wto=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Jrl5PzAXnHzqV48QRCNQY/5zEJ3/XzqWOyhcerq/0RB9RlE1eZtksyvBydbapoVxl
 0kpclqrluuG4aB3IhhZFFdpr8XdNweymGFHl/Ui0iMmdIHrPMWAn9+TPsfPa+AHj5v
 PN90rNDN9i2lixHS2Z2bKdA69z1Jz9deV77kX02o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.231.235.79] ([217.231.235.79]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Wed, 20 Oct 2021
 13:22:53 +0200
MIME-Version: 1.0
Message-ID: <trinity-072a3cc2-e02b-45ac-9f17-5037678caabf-1634728973216@3c-app-gmx-bap28>
From: Steve <sleepy_dog@gmx.de>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 13:22:53 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:3lEYY0mFDj+L56MQzMMkVssGTuvQVqa8vjzXs4m3fEYttMx+QwvpI2JPKThQUyC8ajWwD
 yXeupz/m8gq8k3aSxKVBdq3CH5DuPkBiMdK8Lpu8QxCxqGQBM5BcIBaOdOBwfRd7Y0XTt4LM1nBZ
 m+5avHIdcxxrYDYTpghE17oLaqvI5CDeijvDzvDzYERZDcUvRjkSA3QLZ87EV7e1PObyyijUxdg3
 BKgXjIWt+KuVadCMxTGaH6ugFJj0H0h/tdBhDND9bU7eahYSlO2DA56nGsjzT9D5s9QkYOQaqvuc
 2U=
X-UI-Out-Filterresults: notjunk:1;V03:K0:awaz357r5Gg=:O7Z1iw767KnggFLHxzx9OQ
 UTmQeHoMATAfqJd4jBpf8O+ObRi8vvE86GkWq+/4eTHuI23PVw90nMHHkeBUY6/wQZalkMidy
 DJ+/zEoeNq8pWlIOeIDe3j/Y2OiUkJGjCumrr+bEbnGICR96SZ0/UYYLrjpMDyux2XVt0Df0p
 bN2UFmuVHKd9Kt4t40vPs9q67qOnr5zXwI+jF0kNBgBlzokBivq0Gc0ktzP/edkaoXKv98Rof
 e7p56pYnZ7l3FOApt2RjoNCI/tYk+SDf3ky2CaGYIrUsOHhnPsQ7ZPjzGPWDb7c1M7ORMAAhA
 Oi0kbDAaaALtVm6IB8EFsDtMsE65Ql5Peu3PPFohHoJxrbog5wLjOT8HRFVQm0g6DaWMRs9DM
 vhzwim13cJ0Ad4hYeiJ/HZZc5gwgFyXwkgFpvbz1HdCH+m3qZtlNWbFPFNlmnKToHVDbUb0B+
 CL1oQfPZT7eZkaYysqF3K3BHNrgn+d3i9iXf5s1qtd+40FYb7G8V+GePmAt6EJ5dCb4go7K/o
 8uy7F8pRtjYpFDNVzKNQtGR0dNeiTReJ5SgK/nyy0hkPGGAQuxMjH0ZXOUxrrwknsvmkvKSzO
 q9HlbWKialPb9mZWPax0bUWtZe0meVGWkbp4ZXKKvKJG+gQL7zmFFL3dqz8OG3oukI1E0+Sob
 Gc8JxzGL082YFWjEnXuzzMlxffBO4nGArvU6IbjVPpiwGoWDJDrf1DAcS12f1QeTFDxuS1sND
 kG/gfwkQmKj6YVhpOrVvBFjFD0gRUU3ko0Pl+u5Obt+WrHRRJ8MZ6I3YWzmA5kCFVFRtUbt4A
 4GaTWOK
Subject: [Buildroot] htop - "No btime in /proc/stat: Success"
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
Content-Type: multipart/mixed; boundary="===============4118250920458274133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4118250920458274133==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div style="font-family: Verdana;font-size: 12.0px;">
<div>Hello,</div>

<div>&nbsp;</div>

<div>a Linux image built with a recently downloaded buildroot, starting with the defconfig for RaspberryPi3 and adding some things (htop if it wasn&#39;t already, nano, openssh, openvpn; also the linux-menuconfig was altered, concerning USB driver stuff).<br/>
<br/>
When, in menuconfig, I search with / for htop, it shows that htop and all dependencies are met (all positive dependencies are [=y] and the one negative (static libs) is [=n].<br/>
But when I call htop on the running system, I only get the line given in the topic.<br/>
&nbsp;</div>

<div>What could be the problem?<br/>
&nbsp;</div>
</div></div></body></html>

--===============4118250920458274133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4118250920458274133==--
