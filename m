Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D595C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 06:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDB3A60BBE;
	Wed,  2 Apr 2025 06:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qV9zseYoxs2y; Wed,  2 Apr 2025 06:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A8760E8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A8760E8D;
	Wed,  2 Apr 2025 06:22:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD2117E
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D540D60E8D
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGgVJp-zY_LK for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 06:22:12 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5584E60BBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5584E60BBE
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5584E60BBE
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:22:10 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id DF8A4BDE2995;
 Wed,  2 Apr 2025 08:22:06 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 06:22:06 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: David Picard <david.picard@clermont.in2p3.fr>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.334.1743477301.2108631.buildroot@buildroot.org>
References: <mailman.334.1743477301.2108631.buildroot@buildroot.org>
Message-ID: <0ef87cdcfab106d7f5c71cfbf612399f@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1743574927; bh=dfaMaNvM1oihzVxQmIwzNGbd6YID3sOvfePKVzsmmLo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MrOroCzEmkupeZOzcj0ALyHMCzrMOzIpJ5MFf4lM95/B7RaOjBraPRJLARoRK67Dx
 TUywvSOtleLOaEkfnyxZ2LE7/IA4u/MDAp+vbuXo19uDXjuzg4RGXi+g6IwPOPF2S4
 QkDqplutehjiYG826XzL4ekAH7kZy3n8NL/k61dQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=MrOroCzE
Subject: Re: [Buildroot] guidelines to select a Wi-Fi/Bluetooth module
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi David,

Some things that I found useful in the past:

On 2025-03-31 15:38, David Picard wrote:
> 
> Hi,
> 
> I need to add Wi-Fi and Bluetooth connectivity to my system. But it's
> really hard to understand which driver supports which product.
> 
> Could you please me some piece of advice to guide my search for a 
> module ?

Linux wireless [1] has a documentation of implemented drivers with 
reference to supported manufacturers and chipsets. Unfortunately no 
reverse lookup, so a bit time-consuming to read ...

If you can obtain a block diagram of the board /the SoC, this might help 
to identify hardware connected via non-standard interfaces (SDIO, GPIO). 
In addition to the wireless module, you will need kernel drivers for the 
subsystem.

There is the brute force approach: if your hardware is supported by a 
major distribution, boot an installation image and record the output of 
dmesg, lsmod, lspci, lsusb. This might give you additional insight, 
which hardware is present on the system.

The target package wpa_supplicant is necessary for unattended wireless 
network access.

Kind regards,
Andreas

> David

[1] https://wireless.docs.kernel.org/en/latest/en/users/drivers.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
