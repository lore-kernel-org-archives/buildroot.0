Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9261BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 08:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F072C4051D;
	Thu, 28 Apr 2022 08:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE3KC1g1jh7v; Thu, 28 Apr 2022 08:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BDA540494;
	Thu, 28 Apr 2022 08:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 242181BF59A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1192340494
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 08:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Gn3QsGszIRE for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 08:45:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D83F400D7
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 08:45:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7798C20007;
 Thu, 28 Apr 2022 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651135556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jviQkwjmCVzF1BmVVfPDVIquMNRJ7Zf4DsT0n+amyx4=;
 b=pCDZPNv3gaQ31km4Cdq5Rm6bgejvJMBzbYCEF3BOILSEpWQnKwElUbT+dGIRe1QJ9+QK5p
 JF0aeLgmiCLX4O5jf6ROVRI52yHCuPnA3L+ew1CMEQjKUuRh9dqF/Y0qBqGSA988zxHGC8
 fWV9C4VhdLxUQUCtCETjG/W0/WoM7bjY/464jiU+FhYawKSajOOjlyvhCjJ4qNeO6Muoxo
 ZzUjy4WV8hMDEXHK0sh4axzZKdVVKSfr0Vnndx7LDuRQ0z1upv7iRkbWI0riLSfIZSSoBx
 N8R5O3WdHH6Qw83f+njec0bgkhrTswBjhFC5eMBebmabcvol6rOjZirSGvBRyw==
Date: Thu, 28 Apr 2022 10:45:55 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220428104555.62683882@windsurf>
In-Reply-To: <20220427201812.4037832-1-fontaine.fabrice@gmail.com>
References: <20220427201812.4037832-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: fix build with
 argp-standalone and NLS
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

Hello Fabrice,

On Wed, 27 Apr 2022 22:18:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with argp-standalone and NLS raised
> since commit 5430c8fedd0392e79e0c011825b056fea129980a:
> 
> configure:14644: checking for argp_parse in -largp
> configure:14669: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp  -lm -lm -lm  >&5
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
> /home/giuliobenetti/autobuild/run/instance-1/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'
> 
> [...]
> 
> In file included from freeipmi-argp-fmtstream.c:35:
> freeipmi-argp-namefrob.h:62:32: error: redefinition of 'argp_fmtstream_write'
>    62 | #define __argp_fmtstream_write argp_fmtstream_write
>       |                                ^~~~~~~~~~~~~~~~~~~~
> freeipmi-argp-fmtstream.c:395:1: note: in expansion of macro '__argp_fmtstream_write'
>   395 | __argp_fmtstream_write (argp_fmtstream_t __fs,
>       | ^~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/26090162396b1b8cedfc58e1790ced528fcc35c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

While your patch is indeed the most "immediate" fix, shouldn't we think
about providing a pkg-config file for argp-standalone, so that its
indirect dependency on libintl when static linking can be properly
described, and transparently discovered by users of argp-standalone?

Because otherwise here, you'll have to basically propagate this to all
users of argp-standalone, and to all users of users of argp-standalone.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
