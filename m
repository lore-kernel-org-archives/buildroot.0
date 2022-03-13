Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69558C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 13:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC96818E6;
	Sun, 13 Mar 2022 13:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZwUWmZkduI4U; Sun, 13 Mar 2022 13:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23855818D4;
	Sun, 13 Mar 2022 13:20:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 023721BF40D
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 13:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2FD98188A
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 13:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uabcn5Ud8_zt for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 13:20:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EAA480B2F
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 13:20:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57B36100003;
 Sun, 13 Mar 2022 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647177625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7z+Dxn2IiD9iP0ByGbNRjxIgfONSC/XK4R0oVdXqIzk=;
 b=LbtzMoK578MoSLgXIGeXnPFgx0Ixrp5vmMYvccuM6g+vqjK1tD3BOa+tbrwc/TAPw9Gkoj
 1EeWxwAX7mQtHHIZuCzvR2wyPvi6QkXLxsrEkJ+fkQqcWDQSh6cOYRJGHK597E9WZXpbtZ
 E1AFtOoIkDC73sDZ0n9tI4sJtdCtI8qsTQBGW8fnLLjvzuEwrDT+vEiWP3UGEsAcC/UIRa
 ywwQiPSsO4lOwKQSGpNTYXRPNjOmlpyNlQbuHZ91vms1l2mK9Qc8P0DUDr5Tln/QaHNuVU
 rkvsB4GAHieKRTsuIRUe4p7BJXmT8QSMNta2UmthGzeZsnZ8kSDe54UD9+UeDw==
Date: Sun, 13 Mar 2022 14:20:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220313142024.56b9493e@windsurf>
In-Reply-To: <20220313103737.751528-1-fontaine.fabrice@gmail.com>
References: <20220313103737.751528-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/ola: drop autoreconf"
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Mar 2022 11:37:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 66d348ae18c6e73d6ff9d935a241e55a65948be6 because
> for an unknown reason, the build fails if autoreconf is dropped:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolauartdmx.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolaserverplugininterface.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f8164c69da0b9fa38081e8b785d8234f0f297ae1
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ola/ola.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ola/ola.mk b/package/ola/ola.mk
> index 1874350784..5090076175 100644
> --- a/package/ola/ola.mk
> +++ b/package/ola/ola.mk
> @@ -9,6 +9,7 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
>  OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
>  OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
>  OLA_INSTALL_STAGING = YES
> +OLA_AUTORECONF = YES

Perhaps a comment above this line would be useful, to explain why
AUTORECONF is needed, otherwise there are risks for it to get dropped
again in the future.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
