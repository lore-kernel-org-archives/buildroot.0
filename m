Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4359C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8528140468;
	Mon,  5 Feb 2024 17:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8528140468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWCqNgfd646C; Mon,  5 Feb 2024 17:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918C541A2B;
	Mon,  5 Feb 2024 17:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 918C541A2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC3E1BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 357FC41841
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357FC41841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGnVDrV6oKFz for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:26:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB25241859
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB25241859
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A4731C0007;
 Mon,  5 Feb 2024 17:26:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rX2jR-00CVAr-2Y;
 Mon, 05 Feb 2024 18:26:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240110205100.147660-1-ju.o@free.fr>
Date: Mon, 05 Feb 2024 18:26:09 +0100
In-Reply-To: <20240110205100.147660-1-ju.o@free.fr> (Julien Olivain's message
 of "Wed, 10 Jan 2024 21:51:00 +0100")
Message-ID: <871q9qstzi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/imx8mmpico: uboot needs
 openssl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Commit 78e8f383 "configs/imx8mmpico: bump bsp components to version
 > tn-kirkstone_5.15.71-2.2.0" bumped components, but forgot to add
 > BR2_TARGET_UBOOT_NEEDS_OPENSSL=y.

 > This commit adds it to the defconfig to fix the build.

 > Fixes:
 > - https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180248

 >     In file included from tools/imagetool.h:24,
 >                      from tools/aisimage.c:7:
 >     include/image.h:1166:12: fatal error: openssl/evp.h: No such file or directory
 >      1166 | #  include <openssl/evp.h>
 >           |            ^~~~~~~~~~~~~~~

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Change v1 -> v2:
 > - Regenerated the patch, to fix a corrupted patch context.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
