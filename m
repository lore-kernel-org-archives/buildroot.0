Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE0BC7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 10:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82BD460BB5;
	Sat, 25 Feb 2023 10:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82BD460BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orWF-jqG9ude; Sat, 25 Feb 2023 10:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B95060BBF;
	Sat, 25 Feb 2023 10:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B95060BBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EBF21BF82C
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D81660BB5
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 10:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D81660BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOJz4ngJ2cli for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 10:08:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B7A60BBF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4B7A60BBF
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 10:08:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 84B751C0003;
 Sat, 25 Feb 2023 10:08:02 +0000 (UTC)
Date: Sat, 25 Feb 2023 11:08:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225110801.6c7053fa@windsurf>
In-Reply-To: <20230223123644.402595-1-fontaine.fabrice@gmail.com>
References: <20230223123644.402595-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677319683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QDyAV8jmVyI9xMrbx7vNq+TIbclO2QbG9BkW7cUgrE=;
 b=npOzTKod3xPDSViAx0e6H1Gz9ivPs9wN7E1vwBGYqzEATasPdjR0DbXeJHOHcvNaQAbbNg
 sS2fVFYHQa9hnpUoWcJpDSFcRatNnvDt2ebn8BXg7eQ3TKK6o3BKJ5DtWoa4Wbw3HDzfkL
 yrONiIaLw4peviuxI+VN3J1Ix8EyUuzCKLEtZiXJ304OmACCqC9xPxUepEhT6DYjekEol4
 UpmeEE7keZaEYsVPFnnIdUAkNAh3tqhbBmhL20b3RJ/652wyTnyzPVVANtDT3pNXIBd8+F
 5GoXBtnD/SUI9jiC8YPTRAxlWYeT4/SVamG3/RjI9H/h9u3rQxDsCjWX+5FYFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=npOzTKod
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-babeltrace: fix popt
 static build with libiconv
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Feb 2023 13:36:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following popt static build failure with libiconv:
> 
> configure:18149: checking for poptGetContext in -lpopt
> configure:18172: /home/buildroot/autobuild/instance-2/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -I/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/include/uuid  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpopt  -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib -luuid    >&5
> /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/10.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): in function `POPT_fprintf':
> poptint.c:(.text+0x28a): undefined reference to `libiconv_open'
> 
> [...]
> 
> checking for poptGetContext in -lpopt... no
> configure: error: Cannot find popt.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4f465fe15664b1f9df3f26c331dc550852972f2f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...2-configure.ac-fix-popt-static-build.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
