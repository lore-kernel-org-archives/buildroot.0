Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406BEEEAA6A
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B962E404F9;
	Thu, 14 Sep 2023 19:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B962E404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VRQ8APmR2pJ; Thu, 14 Sep 2023 19:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13CD41F74;
	Thu, 14 Sep 2023 19:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13CD41F74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23E371BF3C3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F10B341854
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F10B341854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScX_ThsYEv9v for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:47:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B085B405F5
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B085B405F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0A4920003;
 Thu, 14 Sep 2023 19:47:34 +0000 (UTC)
Date: Thu, 14 Sep 2023 21:47:33 +0200
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230914214733.5db06617@windsurf>
In-Reply-To: <CADYjeSuUpRDgDQt4PWKFF-gVxWBmb=xB4Aa_FrMsVyvbFzWnqg@mail.gmail.com>
References: <CADYjeSs78_vitxWDHo=zDMC9MJyaW7zcaQhuJn2n3AmzkvtZjA@mail.gmail.com>
 <20230914151436.4c5e8073@windsurf>
 <CADYjeSuUpRDgDQt4PWKFF-gVxWBmb=xB4Aa_FrMsVyvbFzWnqg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694720855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovdORDqv55WV8TdkDNApgu5pTDOzDwXKUOleiZlorS8=;
 b=nDyrET8Sl13HKtYWah4tLbpqQNfmG0FFpVSwoNygU7YNnty6SOVtkBaPiG3uA4wNez/+OM
 KgC+sa8JDBSk0YvjETDtT94QJjAY9p716px+kO+a/XiVIf1XpGWquvxDXdeUT2M9Srq7yc
 6KB+L4gLjSsAeJjQgvoG1c8EeSjV6HDI3t2IUu8vLQUvq1m8hNoyLYravHAS8ko56fLnM/
 gjJNQFQ220Ebew2bQe3s0uvFmR4zQN+F//yEIIFoHQHYRPNWJMVkFHN2OjZXZidhrX4C/S
 kTVNqoxIW+84bZwt0WybtoM+ZooKY54nXRcBxSRreEj+cTXxm6zwHj9YlIULug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nDyrET8S
Subject: Re: [Buildroot] Error linking against target architecture while
 building new package
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

On Thu, 14 Sep 2023 17:25:37 +0200
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> vsi_nn_daemon.c:25:10: fatal error: vsi_nn_daemon.h: No such file or
> directory
>    25 | #include "vsi_nn_daemon.h"
>       |          ^~~~~~~~~~~~~~~~~
> compilation terminated.
> make[4]: ***
> [/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:
> bin_r/vsi_nn_daemon.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> vsi_nn_ops.c:25:10: fatal error: vsi_nn_ops.h: No such file or directory
>    25 | #include "vsi_nn_ops.h"
>       |          ^~~~~~~~~~~~~~
> compilation terminated.
> make[4]: ***
> [/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:
> bin_r/vsi_nn_ops.o] Error 1
> vsi_nn_node_attr_template.c:26:10: fatal error: vsi_nn_node.h: No such file
> or directory
>    26 | #include "vsi_nn_node.h"
>       |          ^~~~~~~~~~~~~~~
> compilation terminated.
> 
> However, "vsi_nn_daemon." header file is available in
> /build/imx-nn-accelerator-lf-5.15.71-2.2.1/include/OVXLIB/vsi_nn_daemon.h
> and
> /build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/include/vsi_nn_daemon.h
> Also as you can see in above log, LDFLAGS=""...

If those headers are part of the imx-nn-accelerator code, it probably
means that the fact we're passing CFLAGS="..." overrides some CFLAGS
defined by the package Makefile, while it should append to the CFLAGS
passed in the environment. Sometimes it requires tweaking the Makefile
of the package, sometimes it means CFLAGS need to be passed in the
environment of make (by Buildroot) instead of as argument:

	$(TARGET_MAKE_ENV) \
		$(TARGET_CONFIGURE_OPTS) \
		...
		$(MAKE) -C $(@D)

This really requires a package-specific investigation.

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
