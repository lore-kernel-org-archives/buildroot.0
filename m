Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636FFC001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 09:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85F2441517;
	Sun, 23 Jul 2023 09:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F2441517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfmOzeugj-Sm; Sun, 23 Jul 2023 09:15:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F02C4151A;
	Sun, 23 Jul 2023 09:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F02C4151A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D21C1BF589
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BEA64151A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BEA64151A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erPGo_ACX_cd for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 09:14:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E31841517
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 09:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E31841517
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BD46FF804;
 Sun, 23 Jul 2023 09:14:51 +0000 (UTC)
Date: Sun, 23 Jul 2023 11:14:49 +0200
To: Dmitry Rokosov via buildroot <buildroot@buildroot.org>
Message-ID: <20230723111449.7120549c@windsurf>
In-Reply-To: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
References: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690103692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iooGcIY+wzHapiqvl2rqBs3GzyrzNW0tSh9MZi4OVRE=;
 b=HCzJqno0l8mblapSficzLgAsR8Hnpkz0KOaC1h6fG6FRHD2oi4Sb9yU3MqPVZFL+GId5J8
 JuUXSnmNfua2GO9zYOlgUeOG2yFwA/ANlUlAdRb2/R9ajPAzhAmjhGVRAyZ4XKd39Gi3ll
 ZYKA0E5XB3lso5ZwI6Nu1LQZXLPEDgyJUb71iwqgKOawC1buL3XoR6D8fHX+U7kHi+1XoZ
 nozWdX6J3m/3mx9ep7bsc0JZYTflJlbjyCCn4cVqUQ2JdOrB9C359k/jiBomV47gN9vcSe
 zmZtcNudIgXcRJekQODhNRpAMongl5w/wuQar14BlyIU98i4Imb2vQC9Dec74Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HCzJqno0
Subject: Re: [Buildroot] [PATCH v1] package/linux-tools: introduce linux mm
 tools
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
Cc: rockosov@gmail.com, Herve Codina <herve.codina@bootlin.com>,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dmitry,

On Fri, 9 Jun 2023 14:34:15 +0300
Dmitry Rokosov via buildroot <buildroot@buildroot.org> wrote:

> This toolset was designed to facilitate the testing, monitoring, and
> tracing of various things with virtual memory, pages, and slab objects.
> It is an invaluable resource for identifying and analyzing
> memory-related issues, such as leaks and bottlenecks, and can greatly
> enhance one's understanding of memory utilization within a system.
> 
> The mm toolset includes:
>     - page_owner_sort: userspace helper to sort the output of
>       /sys/kernel/debug/page_owner, which helps to know who allocates
>       the page from kernel context
>     - slabinfo: the tool which gets reports about slabs, for example
>       show empty slabs, modify of slab debug options at runtime, display
>       all information about a slabcache
>     - page-types: a handy tool for querying page flags
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Thanks for your patch, and sorry for the delay to get back to you with
a review.


> diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> new file mode 100644
> index 000000000000..a59f1c46ff97
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-mm.mk.in
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# mm
> +#
> +################################################################################
> +
> +LINUX_TOOLS += mm
> +
> +MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> +
> +KVER = $(shell echo $(LINUX_VERSION_PROBED))
> +KVER_MAJOR = $(word 1,$(subst ., ,$(KVER)))
> +KVER_MINOR = $(word 2,$(subst ., ,$(KVER)))

All variables in a package must be prefixed with the package name.
Indeed, all variables in Buildroot are global, so if you define KVER
and another package defines KVER, they will conflict.

> +
> +# For the first time tools/vm was introduced in the 3.4 kernel version
> +KVER_MAJOR_MIN = 3
> +KVER_MINOR_MIN = 4
> +
> +# Starting from 6.3 kernel version mm tools are located at tools/mm folder
> +# instead of tools/vm
> +KVER_MAJOR_MM = 6
> +KVER_MINOR_MM = 3
> +
> +define MM_BUILD_CMDS
> +	$(Q)if [ $(KVER_MAJOR) -lt $(KVER_MAJOR_MIN) ] || \
> +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MIN) -a \
> +		  $(KVER_MINOR) -lt $(KVER_MINOR_MIN) ]; then \
> +		echo -n "Your kernel version $(KVER_MAJOR).$(KVER_MINOR) is "; \
> +		echo "too old and doesn't have the mm tools." ; \
> +		echo -n "At least $(KVER_MAJOR_MIN).$(KVER_MINOR_MIN) "; \
> +		echo "kernel must be used." ; \
> +		exit 1 ; \
> +	fi

I think this is not the approach we should take here, because it's not
the approach taken by the other makefiles in package/linux-tools/.
Rather than testing the kernel version, we test the presence/absence of
a Makefile.

So something along the lines of:

        $(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
		MM_SUBDIR=vm
        elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
		MM_SUBDIR=m
	else \
                echo "Your kernel version is too old and does not have the mm tool." ; \
                echo "At least kernel 3.4 must be used." ; \
                exit 1 ; \
        fi ; \
	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
		$(MM_MAKE_OPTS) $${MM_SUBDIR}

or something along those lines. And of course, ditto for the install
step.

Could you rework your patch accordingly?

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
