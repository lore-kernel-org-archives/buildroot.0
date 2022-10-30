Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6716C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7426060AAE;
	Sun, 30 Oct 2022 22:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7426060AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plFG50AM8l-D; Sun, 30 Oct 2022 22:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE21C60803;
	Sun, 30 Oct 2022 22:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE21C60803
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A17A1BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F24F80FF8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F24F80FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIeniN7nZay7 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:40:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0245580FA9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0245580FA9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:40:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92122240003;
 Sun, 30 Oct 2022 22:40:42 +0000 (UTC)
Date: Sun, 30 Oct 2022 23:40:41 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221030234041.67e512cf@windsurf>
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667169643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFN4f4BREGA1J6CysuaghpmhpJt29acu+dyo8svNg+0=;
 b=EwHsPultFjGzbc/54jluUW41xTfYS4Ql4z6uv4WhO7DSUEM0U7x2ofQKVPzg5SpiWxQqIf
 nKKWnjRXYMfGXBC8DHxJvMcLh4FE5OxKi5+xwUX212L4q/UX8OpDNDK2IOj5gzgprm0XKt
 tIgw2Sir/tKHriBLYX/DI85pkfsRa4JsiKnCGq7CHjdxqhXDxnVRqvzqsApL0Crj8Bfnw4
 UeRVMZgv/SyX65tNd6w5Sedb2pg3GEv5rUz2SVsClb2NiXSGB7r6kHkNQLusqo6NQBQjX9
 MKX18M6eNCWN4d1HHWBYwDHohCj9Z880gDlc3NtvAzlIpCzLqffGmttOwPM5Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EwHsPult
Subject: Re: [Buildroot] [PATCH 0/9] bump skarnet software: s6, execline,
 mdevd, etc.
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joachim,

On Sun,  9 Oct 2022 17:59:28 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Joachim Wiberg (9):
>   package/skalibs: bump to v2.12.0.1
>   package/mdevd: bump to v0.1.6.0
>   package/execline: bump to v2.9.0.1
>   package/s6: bump to v2.11.1.2
>   package/s6-linux-utils: bump to v2.6.0.0
>   package/s6-portable-utils: bump to v2.2.5.0
>   package/s6-dns: bump to v2.3.5.4
>   package/s6-networking: bump to v2.5.1.1
>   package/s6-rc: bump to v0.5.3.2

Thanks, series applied. One thing that was missing from the commit logs
is the explanation of why the hash of the license file is changed. So I
checked why, and added the explanation in each commit log.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
