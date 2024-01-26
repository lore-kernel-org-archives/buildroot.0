Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA9C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24DDC41F76;
	Fri, 26 Jan 2024 16:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24DDC41F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcIuYTpFSe-w; Fri, 26 Jan 2024 16:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A1CF41913;
	Fri, 26 Jan 2024 16:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1CF41913
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 149011BF293
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E16F741768
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16F741768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8-f9vRyCmmd for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:03:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C489241913
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C489241913
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFAF360002;
 Fri, 26 Jan 2024 16:03:26 +0000 (UTC)
Message-ID: <e353a73a-a153-485b-bbef-307b2c2b28ef@korsgaard.com>
Date: Fri, 26 Jan 2024 17:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240125222140.1805844-1-peter@korsgaard.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240125222140.1805844-1-peter@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/xwayland: security bump to
 version 23.2.4
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
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
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
