Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755F1EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 17:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A63B83BAC;
	Thu, 22 Jun 2023 17:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A63B83BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ME1-0Wnxcbup; Thu, 22 Jun 2023 17:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B87583B11;
	Thu, 22 Jun 2023 17:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B87583B11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB311BF4DA
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 17:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECEA7405F4
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 17:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECEA7405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M67cnaqRJdVc for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 17:18:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95CA7401C2
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95CA7401C2
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 17:18:13 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 8672C5FD12;
 Thu, 22 Jun 2023 20:18:09 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Thu, 22 Jun 2023 20:18:06 +0300 (MSK)
Date: Thu, 22 Jun 2023 20:18:06 +0300
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Herve Codina <herve.codina@bootlin.com>, Peter
 Korsgaard <peter@korsgaard.com>, <buildroot@buildroot.org>
Message-ID: <20230622171806.vywakqz7q7ezqnrv@CAB-WSD-L081021>
References: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/22 14:26:00 #21556046
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687454289;
 bh=EV+UQw1j5slApDzwmwirAkRI4qIYYb1RFDfT1MpoFk4=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=GpwKAzhVKzmdBed7Gyq+akr5XqPAc8z0fQR53/+77HnIc35xlXcVYEiTwafOzZglP
 wIp06JUkHxln/ys8+052EZP2ZHnTTrr6zLjtSG2xAz23E5yGzo+yTeaVUS+xPZztg2
 0ZunXdhjbMq1+Q+o9gWTBMdiEcU2T6x1iZb0/pdX6orwHwI/XvDKDDNexK6QFBfXMX
 lbm96vyyg48x4JVXo6qaowWa8v+FjB1CXXjsmC+QGP8TXalhU3rHt4svwlnGI7KFkk
 qsP++vU3bUehtb0Dg9o2L0STrsgcCcZU0InyvJkP069KNiGosXIE8m1DOvhiE6sxLj
 7S7rbFJ3uYrfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=GpwKAzhV
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
From: Dmitry Rokosov via buildroot <buildroot@buildroot.org>
Reply-To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: kernel@sberdevices.ru, rockosov@gmail.com, sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Add Peter Korsgaard and move "buildroot" mailing list from Cc.

Could you please take a look at this patchset? I believe that linux-mm
tools are helpful for investigating kernel memory distribution in
embedded systems.

On Fri, Jun 09, 2023 at 02:34:15PM +0300, Dmitry Rokosov wrote:
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
> ---
>  package/linux-tools/Config.in           | 18 ++++++++
>  package/linux-tools/linux-tool-mm.mk.in | 59 +++++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 package/linux-tools/linux-tool-mm.mk.in
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 880ad08f0f1c..3ecc45574b82 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -171,4 +171,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
>  
>  endif # BR2_PACKAGE_LINUX_TOOLS_HV
>  
> +config BR2_PACKAGE_LINUX_TOOLS_MM
> +	bool "mm"
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	help
> +	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs objects.
> +
> +	  - page_owner_sort: userspace helper to sort the output of
> +	  /sys/kernel/debug/page_owner, which helps to know who allocates
> +	  the page from kernel context
> +
> +	  - slabinfo: the tool which gets reports about slabs, for example
> +	  show empty slabs, modify of slab debug options at runtime, display
> +	  all information about a slabcache
> +
> +	  - page-types: a handy tool for querying page flags
> +
> +	  These tools are available only from kernel version 3.4.
> +
>  endmenu
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
> +
> +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> +		MM=mm; \
> +	else \
> +		MM=vm; \
> +	fi; \
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +		$(MM_MAKE_OPTS) $${MM}
> +endef
> +
> +define MM_INSTALL_TARGET_CMDS
> +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> +		MM=mm; \
> +	else \
> +		MM=vm; \
> +	fi; \
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +		$(MM_MAKE_OPTS) \
> +		INSTALL_ROOT=$(TARGET_DIR) \
> +		DESTDIR=$(TARGET_DIR) \
> +		$${MM}_install
> +endef
> -- 
> 2.36.0
> 

-- 
Thank you,
Dmitry
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
