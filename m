Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654C1C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 20:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC473840DE;
	Sat, 31 May 2025 20:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SL19IsbwIgLM; Sat, 31 May 2025 20:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0980E840BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0980E840BC;
	Sat, 31 May 2025 20:48:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 540F5127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 363C1608A9
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dypNLG8c2YRI for <buildroot@buildroot.org>;
 Sat, 31 May 2025 20:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=daggs@gmx.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00A6660872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00A6660872
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00A6660872
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:48:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [87.70.229.102] ([87.70.229.102]) by web-mail.gmx.net
 (3c-app-mailcom-bs07.server.lan [172.19.170.175]) (via HTTP); Sat, 31 May
 2025 22:47:58 +0200
MIME-Version: 1.0
Message-ID: <trinity-f2a1a1fc-1bbd-45d3-9c9a-808b94135388-1748724478625@3c-app-mailcom-bs07>
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 22:47:58 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:4SYmCIxA9LyyHvC+Y4PP127fuwBmIt4CKJfbkdFxDgBZSA5zWDcBovdVDJaDjUXP2pHGi
 LhkmOrD8rlLcc4KnQr9KZvvI25684VUkSL22awqlaALb7W95cWPgUvVNKeJ5KR40b2vGqVpLAEld
 IytkLYSHDexNFGRPKllJofiMKY03vLDD1Ldow5CcUgA5khLPAAu8h+niGe+A0dBEOg1kYfyGI1b9
 oj2yMjHAo1seaaUsPOYW7qxaR3q8F7TXTSwUMp4Scgz/shUj673uAVX5ojraRzehLV+az8Hy64T4
 zM=
UI-OutboundReport: notjunk:1;M01:P0:DoB6v9eOOzQ=;zwrUdq87ylxdYO3y0fSgAsgxUDe
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.com; 
 s=s31663417; t=1748724478; x=1749329278; i=daggs@gmx.com;
 bh=aRNsIH4tpybxgltTlTACYQfAWpUPtS3ERWQdWJIz2Wg=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
 Content-Type:Date:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eqGlsNeEUnWPMzdYc+RrweRdLdwj4yP/3f/8tybYPV19tF0A71+TcGT6ZjNYNBt9
 fAIl3SNkgrS0gS4qoreTcunsrOAXesvNr4CrSQ2Aylwqi/r1WN2pchG0m6lj5YNvF
 V4EDIbiaD6+Iq3+uEWX5byuS5Fzc5rzMQm3wp6/fSeioU0M44wj5Wcj5Ccb4X2FoM
 qLOfqUZHI1x7PaOR+7wMNyIHb5Rt45Tl4s0SM0Myu4jxxa4umleagyAPKZxBeEN3W
 K4/eNMECXrI3qeNEl6ooa7tQ4AGQOfrn/asbjPDAzzAzAgxdgbkg4GhKm17Hj4v8j
 eYLmh6p2p4jXAs5xFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=daggs@gmx.com header.a=rsa-sha256
 header.s=s31663417 header.b=eqGlsNeE
Subject: [Buildroot] virtio nic behaves stangely
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: daggs via buildroot <buildroot@buildroot.org>
Reply-To: daggs <daggs@gmx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Greetings,

I'm working on an image to boot on qemu, the system run with systemd and dhcpcd built.
the nic is virtio, when I boot the system, it gets a proper ip and all works well, if I ssh into it, it gets another ip for the same device
and that renders external connection not working.

this is what I see before th# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP8000> mtu 1500 qdisc fq_codel qlen 1000
    link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    inet 172.23.179.10/24 brd 172.23.179.255 scope global dynamic enp1s0
       valid_lft 43187sec preferred_lft 43187sec
3: sit0@NONE: <NOARP> mtu 1480 qdisc noop qlen 1000
    link/sit 0.0.0.0 brd 0.0.0.0

this is after:
# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP8000> mtu 1500 qdisc fq_codel qlen 1000
    link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    inet 172.23.179.10/24 brd 172.23.179.255 scope global dynamic enp1s0
       valid_lft 34882sec preferred_lft 34882sec
    inet 169.254.240.238/16 brd 169.254.255.255 scope global enp1s0
       valid_lft forever preferred_lft forever
3: sit0@NONE: <NOARP> mtu 1480 qdisc noop qlen 1000
    link/sit 0.0.0.0 brd 0.0.0.0

any ideas why? or what to look for?

Thanks,

Dagg


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
