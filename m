Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEB5C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 13:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E19840815;
	Wed, 28 Feb 2024 13:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKtHU-PLADOh; Wed, 28 Feb 2024 13:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49F9408E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49F9408E1;
	Wed, 28 Feb 2024 13:37:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 414A91BF2C8
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CA886069D
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fwjETJg45c5 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 13:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0798060670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0798060670
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0798060670
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:36:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2547560004
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:36:55 +0000 (UTC)
Message-ID: <49afb437-6c82-4f49-b308-2f36b0768bb0@korsgaard.com>
Date: Wed, 28 Feb 2024 14:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240125222140.1805844-1-peter@korsgaard.com>
 <20240125222140.1805844-2-peter@korsgaard.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240125222140.1805844-2-peter@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/xserver_xorg-server: security
 bump to version 21.1.11
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25/01/2024 23.21, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> 1) CVE-2023-6816 can be triggered by passing an invalid array index to
> DeviceFocusEvent or ProcXIQueryPointer.
> 
> 2) CVE-2024-0229 can be triggered if a device has both a button and a
> key class and zero buttons.
> 
> 3) CVE-2024-21885 can be triggered if a device with a given ID was
> removed and a new device with the same ID added both in the same
> operation.
> 
> 4) CVE-2024-21886 can be triggered by disabling a master device with
> disabled slave devices.
> 
> 5) CVE-2024-0409 can be triggered by enabling SELinux
> xserver_object_manager and running a client.
> 
> 6) CVE-2024-0408 can be triggered by enabling SELinux
> xserver_object_manager and creating a GLX PBuffer.
> 
> For details, see the advisory:
> https://lists.x.org/archives/xorg-announce/2024-January/003444.html
> 
> Switch to .tar.gz as the announcement mail only contained hashes for that:
> https://lists.x.org/archives/xorg-announce/2024-January/003442.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
