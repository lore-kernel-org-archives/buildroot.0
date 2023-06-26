Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D224DEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 12:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F0EA40BD7;
	Mon, 26 Jun 2023 12:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F0EA40BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ge3puZzY_aHm; Mon, 26 Jun 2023 12:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 652FF40A14;
	Mon, 26 Jun 2023 12:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 652FF40A14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 970411BF387
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 12:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EB0740986
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 12:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EB0740986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BhyZDxJPMLk for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 12:12:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1AA40981
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D1AA40981
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 12:12:42 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 905D35FD49;
 Mon, 26 Jun 2023 15:12:39 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Mon, 26 Jun 2023 15:12:37 +0300 (MSK)
Date: Mon, 26 Jun 2023 15:12:37 +0300
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Herve Codina <herve.codina@bootlin.com>, Peter
 Korsgaard <peter@korsgaard.com>, <buildroot@buildroot.org>, Arnout
 Vandecappelle <arnout@mind.be>
Message-ID: <20230626121237.4z7alvantlkjc7ha@CAB-WSD-L081021>
References: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
 <20230622171806.vywakqz7q7ezqnrv@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622171806.vywakqz7q7ezqnrv@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/26 05:54:00 #21579740
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687781559;
 bh=zhX7g9a1LQW5WxDsfZXQPAxkFZ/NnXxvDkVZ5S1RihI=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=LI5eUtoFig+WnCErsfGOMiNhpiX//h3hSmCdzeMO1TBmBg9sMedqLyTmWgmXfp+48
 9AVlcTaBKnY7+48xpwFOS7d6yYfnVedvGt9k5H9lsqX0cGBBy8QByS9IN1efvMppuF
 A1FB2p5TK3P6MPrGMEiYADHFgiXs4+JKQ64+alEma1YJ7dPG/d176/arrHfpBnDl4s
 xT5CDCOgh3TXqY2GGmDo/w4hn9TlgkaAa1b/q1dL1ZK44lcFxkSSKJ52OMLUNlAaO5
 6lNJAQNqBalRk8VsQJIUkE3b+SPmozvEDwstq+R2CIzK7pMJm4SbjwnyvyIKj5KkO/
 DnKzF3Iw+2Ufg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=LI5eUtoF
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

Hello Arnout,

Please take a look into this patchset. I appreciate any feedback.

On Thu, Jun 22, 2023 at 08:18:06PM +0300, Dmitry Rokosov wrote:
> Hello,
> 
> Add Peter Korsgaard and move "buildroot" mailing list from Cc.
> 
> Could you please take a look at this patchset? I believe that linux-mm
> tools are helpful for investigating kernel memory distribution in
> embedded systems.
> 
> On Fri, Jun 09, 2023 at 02:34:15PM +0300, Dmitry Rokosov wrote:
> > This toolset was designed to facilitate the testing, monitoring, and
> > tracing of various things with virtual memory, pages, and slab objects.
> > It is an invaluable resource for identifying and analyzing
> > memory-related issues, such as leaks and bottlenecks, and can greatly
> > enhance one's understanding of memory utilization within a system.
> > 
> > The mm toolset includes:
> >     - page_owner_sort: userspace helper to sort the output of
> >       /sys/kernel/debug/page_owner, which helps to know who allocates
> >       the page from kernel context
> >     - slabinfo: the tool which gets reports about slabs, for example
> >       show empty slabs, modify of slab debug options at runtime, display
> >       all information about a slabcache
> >     - page-types: a handy tool for querying page flags
> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  package/linux-tools/Config.in           | 18 ++++++++
> >  package/linux-tools/linux-tool-mm.mk.in | 59 +++++++++++++++++++++++++
> >  2 files changed, 77 insertions(+)
> >  create mode 100644 package/linux-tools/linux-tool-mm.mk.in
> > 
> > diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> > index 880ad08f0f1c..3ecc45574b82 100644
> > --- a/package/linux-tools/Config.in
> > +++ b/package/linux-tools/Config.in
> > @@ -171,4 +171,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
> >  
> >  endif # BR2_PACKAGE_LINUX_TOOLS_HV
> >  
> > +config BR2_PACKAGE_LINUX_TOOLS_MM
> > +	bool "mm"
> > +	select BR2_PACKAGE_LINUX_TOOLS
> > +	help
> > +	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs objects.
> > +
> > +	  - page_owner_sort: userspace helper to sort the output of
> > +	  /sys/kernel/debug/page_owner, which helps to know who allocates
> > +	  the page from kernel context
> > +
> > +	  - slabinfo: the tool which gets reports about slabs, for example
> > +	  show empty slabs, modify of slab debug options at runtime, display
> > +	  all information about a slabcache
> > +
> > +	  - page-types: a handy tool for querying page flags
> > +
> > +	  These tools are available only from kernel version 3.4.
> > +
> >  endmenu
> > diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> > new file mode 100644
> > index 000000000000..a59f1c46ff97
> > --- /dev/null
> > +++ b/package/linux-tools/linux-tool-mm.mk.in
> > @@ -0,0 +1,59 @@
> > +################################################################################
> > +#
> > +# mm
> > +#
> > +################################################################################
> > +
> > +LINUX_TOOLS += mm
> > +
> > +MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> > +
> > +KVER = $(shell echo $(LINUX_VERSION_PROBED))
> > +KVER_MAJOR = $(word 1,$(subst ., ,$(KVER)))
> > +KVER_MINOR = $(word 2,$(subst ., ,$(KVER)))
> > +
> > +# For the first time tools/vm was introduced in the 3.4 kernel version
> > +KVER_MAJOR_MIN = 3
> > +KVER_MINOR_MIN = 4
> > +
> > +# Starting from 6.3 kernel version mm tools are located at tools/mm folder
> > +# instead of tools/vm
> > +KVER_MAJOR_MM = 6
> > +KVER_MINOR_MM = 3
> > +
> > +define MM_BUILD_CMDS
> > +	$(Q)if [ $(KVER_MAJOR) -lt $(KVER_MAJOR_MIN) ] || \
> > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MIN) -a \
> > +		  $(KVER_MINOR) -lt $(KVER_MINOR_MIN) ]; then \
> > +		echo -n "Your kernel version $(KVER_MAJOR).$(KVER_MINOR) is "; \
> > +		echo "too old and doesn't have the mm tools." ; \
> > +		echo -n "At least $(KVER_MAJOR_MIN).$(KVER_MINOR_MIN) "; \
> > +		echo "kernel must be used." ; \
> > +		exit 1 ; \
> > +	fi
> > +
> > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > +		MM=mm; \
> > +	else \
> > +		MM=vm; \
> > +	fi; \
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > +		$(MM_MAKE_OPTS) $${MM}
> > +endef
> > +
> > +define MM_INSTALL_TARGET_CMDS
> > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > +		MM=mm; \
> > +	else \
> > +		MM=vm; \
> > +	fi; \
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > +		$(MM_MAKE_OPTS) \
> > +		INSTALL_ROOT=$(TARGET_DIR) \
> > +		DESTDIR=$(TARGET_DIR) \
> > +		$${MM}_install
> > +endef
> > -- 
> > 2.36.0
> > 
> 
> -- 
> Thank you,
> Dmitry

-- 
Thank you,
Dmitry
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
