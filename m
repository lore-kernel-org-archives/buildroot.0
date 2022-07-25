Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D44C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 07:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F06610C5;
	Mon, 25 Jul 2022 07:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F06610C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OM7ajovpNFXI; Mon, 25 Jul 2022 07:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72EE36110A;
	Mon, 25 Jul 2022 07:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72EE36110A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34F2A1BF20B
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B560D405D6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B560D405D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hv0tJoiWBlCv for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 07:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53FA3405A5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53FA3405A5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 07:59:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6539F2000D;
 Mon, 25 Jul 2022 07:59:07 +0000 (UTC)
Date: Mon, 25 Jul 2022 09:59:06 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220725095906.210c84f9@windsurf>
In-Reply-To: <20211022061313.474808-1-fontaine.fabrice@gmail.com>
References: <20211022061313.474808-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658735947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mI1zY3Q/0gPr41bYH7QzgLnOKhfMSvFlimfBRcrH0Lw=;
 b=NvO01w9GyXcohF0mZxKOcjxLVL4KT7qpJ6GgiZC/RYD4lXYxtZ3XqMFrgYjboFpDoSllU/
 jfgpv0SezdeIjA3jp7puvWNkp6OBRaHb22OAo1pO0bQ2EgOFyJbNgaM8jD2HE5fp+HuqdD
 9V8LumuMCAYNyIbT43pP8ahxRd3Cm1LuQy+JIRYBkBZywNgBIUVijjO7weq8KfiN+ZeC5x
 1oKhubxX5EpUAnwxoFfEopkX47mX490YWkk5LkiwVsy8C28VzirQs1nTfVlNABRlUG2qPS
 qjVwZnCgqv/SsvpxxRZzkcMdJBmOfMzk1pEJyG2X6qim4q6U9SkRIu2mmxJKYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NvO01w9G
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: fix static
 build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 22 Oct 2021 08:13:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised since the addition of the
> package in commit 02ea01ea22e94ef353a638bf16f62f6e3ed1208e:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
> display.c:(.text+0xbb5): undefined reference to `tputs'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/77c/77c10947ddc749c54c7c233e3143f5cdf1edc73d/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...use-dependency-function-for-readline.patch | 51 +++++++++++++++++++
>  ...-use-library-instead-of-both_librari.patch | 33 ++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 package/gstreamer1/gstd/0006-meson.build-use-dependency-function-for-readline.patch
>  create mode 100644 package/gstreamer1/gstd/0007-gstd-meson.build-use-library-instead-of-both_librari.patch

I have finally applied this patch. Patch
0007-gstd-meson.build-use-library-instead-of-both_librari.patch was no
longer needed, and I renumbered patch 0006 to 0005. But definitely it
does fix the static linking issue (tested before and after your patch).
Thanks a lot!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
