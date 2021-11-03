Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A25BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5559E610FD
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5559E610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15E574017B;
	Wed,  3 Nov 2021 22:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zkj9Ts7mHHJe; Wed,  3 Nov 2021 22:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62FD7403AF;
	Wed,  3 Nov 2021 22:04:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7D0B1BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACEDE403B3
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elARVJxFKrUc for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:04:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E463403AC
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:04:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2B47340005;
 Wed,  3 Nov 2021 22:04:28 +0000 (UTC)
Date: Wed, 3 Nov 2021 23:04:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211103230426.3b8726c0@windsurf>
In-Reply-To: <b08f0641-06ec-c4ce-6960-2df5898cf6c2@gmail.com>
References: <20211031224207.1385633-1-romain.naour@gmail.com>
 <BY5PR19MB36687517E13A0EE264B37A5FFB8A9@BY5PR19MB3668.namprd19.prod.outlook.com>
 <7a877d3b-95b9-55dc-8756-88fa9bb51876@gmail.com>
 <CAFSsvmqUvKZVr+uCFCpinRM5sK-3UdBrMXUXzJ1kF=i1xnXNxQ@mail.gmail.com>
 <b08f0641-06ec-c4ce-6960-2df5898cf6c2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg
 module when systemd is enabled
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
Cc: Antoine Tenart <atenart@kernel.org>, Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 3 Nov 2021 22:06:43 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> > I just tested by adding xdg to SYSTEMD_SELINUX_MODULES which does
> > indeed fix the issue.  
> 
> ok but it's not clear to me if we need to add xdg to SYSTEMD_SELINUX_MODULES or
> REFPOLICY_MODULES.

Clearly to SYSTEMD_SELINUX_MODULES. The idea of REFPOLICY_MODULES is to list:

 (1) Mandatory refpolicy modules

 (2) refpolicy modules needed by other Buildroot packages, i.e.
     $(PACKAGES_SELINUX_MODULES)

 (3) refpolicy modules explicitly enabled by the user through the
     BR2_REFPOLICY_EXTRA_MODULES option

 (4) additional SELinux policy modules provided directly within a
     package directory, in package/<foo>/selinux/

In our case, it's the systemd refpolicy module that needs xdg, so
systemd.mk should be patched:

-SYSTEMD_SELINUX_MODULES = systemd udev
+SYSTEMD_SELINUX_MODULES = systemd udev xdg

Could you send an updated patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
