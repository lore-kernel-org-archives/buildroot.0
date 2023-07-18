Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F4AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AAF060DF9;
	Tue, 18 Jul 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AAF060DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmbPo5pKNWFV; Tue, 18 Jul 2023 20:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 285E361033;
	Tue, 18 Jul 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285E361033
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58B001BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3009A417A7
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3009A417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fk8NtCWcwan0 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:51:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6FCD417A5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6FCD417A5
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:51:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 643EFFF804;
 Tue, 18 Jul 2023 20:51:33 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:51:31 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230718225131.47f03dda@windsurf>
In-Reply-To: <20230715223616.847847-1-ju.o@free.fr>
References: <20230715223616.847847-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689713504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GS6sK0VcHqU9LImZVxj4lJDHnX/hZA2rWQyQelaHRIA=;
 b=dTU0vKQa4CMhLWajhA3Qt72P8kbffrxaamRAtJM/8AIs/rcKYKE87EbpNlo5AcVqlCJ+tW
 ujXjCRio8Jt1EYdpranggp6xdpXzvZA+45fiCiMFqMGadXRUvP3jfqxhdHl5sgRGnog5tg
 7VKnd+XIwybPKbVMUgVhoezRQwkeyx8/o0Bancu0PqUn8quneQaSMjRorbC2hW3iRbZ+nl
 wBIi+JmNj/ulXCGu8NeJ9is/QhgsLV1ejD9Scrxgv4FI3VGE8yr6bq2dMQHrbwV6khR5Y8
 tI2QlhUb4G4R0q/n53ThlpFACK3r6wrrbQ2Wd+ULprflhgFz3EW75/zILj1N4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dTU0vKQa
Subject: Re: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.2.2
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

On Sun, 16 Jul 2023 00:36:16 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For news since 5.2.0, see:
> https://git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.2.2
> 
> For detailed change log, see:
> https://git.savannah.gnu.org/cgit/gawk.git/tree/ChangeLog?h=gawk-5.2.2
> 
> This commit also removes the package patch, as it is included in
> upstream version 5.2.1, in:
> https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=baab183439ff4e0c6b77d62156d447e61fc1dcfb
> 
> The file .checkpackageignore is also updated to reflect this patch
> removal.
> 
> The motivation of this bump is mainly the RISC-V fixes.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                           |  1 -
>  .../0001-Fix-a-bug-with-Node_elem_new.patch   | 29 -------------------
>  package/gawk/gawk.hash                        |  4 +--
>  package/gawk/gawk.mk                          |  2 +-
>  4 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch

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
