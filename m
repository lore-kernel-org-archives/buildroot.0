Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976E4CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 22:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9D3407A0;
	Mon,  3 Nov 2025 22:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeX0FMWbgnqX; Mon,  3 Nov 2025 22:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5293B407A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5293B407A2;
	Mon,  3 Nov 2025 22:54:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF876462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 22:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B121660B02
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 22:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QsVu8fqOqcD for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 22:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B12360AF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B12360AF6
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B12360AF6
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 22:54:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DB8FEC0DA97;
 Mon,  3 Nov 2025 22:53:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 834CE60628;
 Mon,  3 Nov 2025 22:53:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E40E10B5004F; Mon,  3 Nov 2025 23:53:56 +0100 (CET)
Date: Mon, 3 Nov 2025 23:53:56 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org,
 Julien Olivain <ju.o@free.fr>
Message-ID: <20251103235356.0b00bb4b@windsurf>
In-Reply-To: <03c04d13-43b7-45da-a5c5-e8754f861e30@gmx.de>
References: <20251103135354.776-1-kory.maincent@bootlin.com>
 <03c04d13-43b7-45da-a5c5-e8754f861e30@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1762210437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SPJMnPpaAS2iMT9uT+CgMlneLhp9CS0FLFhoXUPBByE=;
 b=HGL891Np89wJ5oqatf/4wtfXnsV+rkhW/IDqSDioPtoPEbHEj/0FBOT4JVVwuVRebDWaOV
 A05NZpico78uhQxdO5GnfYfqCmz6Jp/+zpxbVrXFRVfkD6JkVYQdc21vEMCK7BCSZZT+ik
 Un9Q8dZH9M5rrBbi4AowdQnZHIPrTYE5FB39aEtaLLhmA/KvAkr7O9icv2X4RJo8z++sc6
 NNEUKQ/IUSz7qVy3fzoo7eXPpo5iTCbRDBD6wS4mGF5k69kormvxYFQKLHeScFUjtm+IJt
 lOEuDVkXIipNu01k9HdEJSmRNAuuLKKqsxOFvmaK6dkct2ssEpzVap6RBDfNzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HGL891Np
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: Bump to version
 2025.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 3 Nov 2025 23:46:36 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> You might rightly ask why I'm using both, but a) some examples in the 
> U-Boot documentation do [2], and b) that's how I noticed the issue in 
> the previous patch, so I kept it to notice similar issues. Point is, 
> some people might want to use other hash algorithms.
> 
> Enabling CONFIG_TOOLS_CRC32 in autoconf.h the same way as 
> CONFIG_TOOLS_SHA256 works, but U-Boot supports a few more hash 
> algorithms that some people might want to use. Unless I missed 
> something, the full list should be:
> 
> CONFIG_TOOLS_CRC16
> CONFIG_TOOLS_CRC32
> CONFIG_TOOLS_MD5
> CONFIG_TOOLS_SHA1
> CONFIG_TOOLS_SHA256
> CONFIG_TOOLS_SHA384
> CONFIG_TOOLS_SHA512
> 
> Question is: What's the best way to fix this?

If it's host-uboot-tools, just enabling support for everything.

> I can send a simple patch that adds all the (currently available) hash 
> algorithms to autoconf.h. But that feels kind of messy, plus there's the 
> question what else may be broken (just unnoticed so far).
> 
> I see in the commit log that many years ago uboot-tools used KConfig and 
> that was then ripped out in 2015 due to licensing concerns I don't quite 
> understand (commit daf2c705a7252b662afe0100bfe1a3ebf75c1c2f, the 
> licensing concern is stated without explanation in 
> package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch). 

The licensing concern *may* be out of date.

For some background, read
https://en.wikipedia.org/wiki/OpenSSL#Licensing. Basically, the OpenSSL
1.x license is incompatible with the GPL license, so you can't link
GPLv2 code (U-Boot code) with OpenSSL 1.x. However, the license of
OpenSSL was changed, and as of OpenSSL 3.x, it's released under Apache
2.0, which is compatible with the GPL. Since we're now using OpenSSL
3.x in Buildroot, I believe this licensing concern is moot.

> Interestingly the commit message for 
> 2ebf652589491ac2f8f3825afa5f75156c88b0a0 (2022) states it'd be better to 
> switch (back) to KConfig. Unless someone can explain the license 
> concern, I'm inclined to agree (but also with the statement it'd be a 
> major change).
> 
> We could also add settings in Buildroot config, but that seems like it'd 
> combine the worst of the other two options.

To me it doesn't make sense to add an option for each and every hash.
What should be made optional is the OpenSSL dependency. So for me it's
OK to have uboot-tools built by default without FIT signature support
(doesn't require OpenSSL), and an option to enable FIT signature
support (which needs OpenSSL, and that should enable every possible
hash supported by U-Boot).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
