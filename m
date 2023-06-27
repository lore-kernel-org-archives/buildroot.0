Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECDCEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 10:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CCA041B8F;
	Tue, 27 Jun 2023 10:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CCA041B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blEt6uOCInBC; Tue, 27 Jun 2023 10:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC5341B92;
	Tue, 27 Jun 2023 10:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CC5341B92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 079B51BF2B3
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 10:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D49C982121
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 10:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49C982121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gV6XpDXewblK for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 10:25:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7258210A
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B7258210A
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 10:25:12 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id DC1515FD59;
 Tue, 27 Jun 2023 13:25:09 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Tue, 27 Jun 2023 13:24:58 +0300 (MSK)
Date: Tue, 27 Jun 2023 13:24:56 +0300
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230627102456.ias6peqvoxxzjyik@CAB-WSD-L081021>
References: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
 <20230622171806.vywakqz7q7ezqnrv@CAB-WSD-L081021>
 <20230626121237.4z7alvantlkjc7ha@CAB-WSD-L081021>
 <20230626154719.GC646621@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626154719.GC646621@scaer>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/27 02:11:00 #21585463
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687861509;
 bh=amLEnPXDNm8g9wWUniZLEngPa9ZrDAA/NEPVb1hA/Os=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=iYhbGjI+WBHKk+Ii1XAfxdnBiw79JW5PxIVnfUdQPm+hT4vvDX0Gfyt23GOIqroji
 GwcNqEDj/FNEeyLptO3Dn42AD1O2yvnjD2HqjVZL1K5q1XmaADrh6qDv3+L8IKiLIS
 O6H1TcqdiT6ipj3p7Y9ujQLCt+rp3QZkvc0wAX6z3YfaDLDfc+hC7V5f7IW9URxloG
 9AZvYbSiEkGICbAciGQhmNWVHIrKFYXcQruqfFOUxRQtRU1SclrwuP9thmY7CgJ+x1
 pw9ruByrkFO5qptecb4kyRVfWQpdb0uVJlBWfNKgr3zb+Cd84bp6dVMBADsT4dF+82
 pvaUCaasfLjNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=iYhbGjI+
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
Cc: Herve Codina <herve.codina@bootlin.com>, sdfw_system_team@sberdevices.ru,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 kernel@sberdevices.ru, rockosov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Mon, Jun 26, 2023 at 05:47:19PM +0200, Yann E. MORIN wrote:
> Dmitry, All,
> 
> On 2023-06-26 15:12 +0300, Dmitry Rokosov spake thusly:
> > Please take a look into this patchset. I appreciate any feedback.
> 
> Don't be impatient. Your patch has been pending for about two seeks now.
> We have 495 pending patches: https://patchwork.ozlabs.org/project/buildroot/list/
> some of witch are so much older...
> 
> Yes, I know it can be frustrating. For various reasons, we've been a bit
> less active than usual the past few months, but we'll eventually get to
> it...
> 
> Regards,
> Yann E. MORIN.
> 

Thank you so much for the detailed reply! I wasn't aware of the backlog,
and I apologize for any misunderstanding caused by my eagerness. I fully
understand the situation now, so please don't worry - I'm happy to wait
my turn. Thank you for your hard work in maintaining buildroot!

> > On Thu, Jun 22, 2023 at 08:18:06PM +0300, Dmitry Rokosov wrote:
> > > Hello,
> > > 
> > > Add Peter Korsgaard and move "buildroot" mailing list from Cc.
> > > 
> > > Could you please take a look at this patchset? I believe that linux-mm
> > > tools are helpful for investigating kernel memory distribution in
> > > embedded systems.
> > > 
> > > On Fri, Jun 09, 2023 at 02:34:15PM +0300, Dmitry Rokosov wrote:
> > > > This toolset was designed to facilitate the testing, monitoring, and
> > > > tracing of various things with virtual memory, pages, and slab objects.
> > > > It is an invaluable resource for identifying and analyzing
> > > > memory-related issues, such as leaks and bottlenecks, and can greatly
> > > > enhance one's understanding of memory utilization within a system.
> > > > 
> > > > The mm toolset includes:
> > > >     - page_owner_sort: userspace helper to sort the output of
> > > >       /sys/kernel/debug/page_owner, which helps to know who allocates
> > > >       the page from kernel context
> > > >     - slabinfo: the tool which gets reports about slabs, for example
> > > >       show empty slabs, modify of slab debug options at runtime, display
> > > >       all information about a slabcache
> > > >     - page-types: a handy tool for querying page flags
> > > > 
> > > > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > > > ---
> > > >  package/linux-tools/Config.in           | 18 ++++++++
> > > >  package/linux-tools/linux-tool-mm.mk.in | 59 +++++++++++++++++++++++++
> > > >  2 files changed, 77 insertions(+)
> > > >  create mode 100644 package/linux-tools/linux-tool-mm.mk.in
> > > > 
> > > > diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> > > > index 880ad08f0f1c..3ecc45574b82 100644
> > > > --- a/package/linux-tools/Config.in
> > > > +++ b/package/linux-tools/Config.in
> > > > @@ -171,4 +171,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
> > > >  
> > > >  endif # BR2_PACKAGE_LINUX_TOOLS_HV
> > > >  
> > > > +config BR2_PACKAGE_LINUX_TOOLS_MM
> > > > +	bool "mm"
> > > > +	select BR2_PACKAGE_LINUX_TOOLS
> > > > +	help
> > > > +	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs objects.
> > > > +
> > > > +	  - page_owner_sort: userspace helper to sort the output of
> > > > +	  /sys/kernel/debug/page_owner, which helps to know who allocates
> > > > +	  the page from kernel context
> > > > +
> > > > +	  - slabinfo: the tool which gets reports about slabs, for example
> > > > +	  show empty slabs, modify of slab debug options at runtime, display
> > > > +	  all information about a slabcache
> > > > +
> > > > +	  - page-types: a handy tool for querying page flags
> > > > +
> > > > +	  These tools are available only from kernel version 3.4.
> > > > +
> > > >  endmenu
> > > > diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> > > > new file mode 100644
> > > > index 000000000000..a59f1c46ff97
> > > > --- /dev/null
> > > > +++ b/package/linux-tools/linux-tool-mm.mk.in
> > > > @@ -0,0 +1,59 @@
> > > > +################################################################################
> > > > +#
> > > > +# mm
> > > > +#
> > > > +################################################################################
> > > > +
> > > > +LINUX_TOOLS += mm
> > > > +
> > > > +MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> > > > +
> > > > +KVER = $(shell echo $(LINUX_VERSION_PROBED))
> > > > +KVER_MAJOR = $(word 1,$(subst ., ,$(KVER)))
> > > > +KVER_MINOR = $(word 2,$(subst ., ,$(KVER)))
> > > > +
> > > > +# For the first time tools/vm was introduced in the 3.4 kernel version
> > > > +KVER_MAJOR_MIN = 3
> > > > +KVER_MINOR_MIN = 4
> > > > +
> > > > +# Starting from 6.3 kernel version mm tools are located at tools/mm folder
> > > > +# instead of tools/vm
> > > > +KVER_MAJOR_MM = 6
> > > > +KVER_MINOR_MM = 3
> > > > +
> > > > +define MM_BUILD_CMDS
> > > > +	$(Q)if [ $(KVER_MAJOR) -lt $(KVER_MAJOR_MIN) ] || \
> > > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MIN) -a \
> > > > +		  $(KVER_MINOR) -lt $(KVER_MINOR_MIN) ]; then \
> > > > +		echo -n "Your kernel version $(KVER_MAJOR).$(KVER_MINOR) is "; \
> > > > +		echo "too old and doesn't have the mm tools." ; \
> > > > +		echo -n "At least $(KVER_MAJOR_MIN).$(KVER_MINOR_MIN) "; \
> > > > +		echo "kernel must be used." ; \
> > > > +		exit 1 ; \
> > > > +	fi
> > > > +
> > > > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > > > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > > > +		MM=mm; \
> > > > +	else \
> > > > +		MM=vm; \
> > > > +	fi; \
> > > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > > > +		$(MM_MAKE_OPTS) $${MM}
> > > > +endef
> > > > +
> > > > +define MM_INSTALL_TARGET_CMDS
> > > > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > > > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > > > +		MM=mm; \
> > > > +	else \
> > > > +		MM=vm; \
> > > > +	fi; \
> > > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > > > +		$(MM_MAKE_OPTS) \
> > > > +		INSTALL_ROOT=$(TARGET_DIR) \
> > > > +		DESTDIR=$(TARGET_DIR) \
> > > > +		$${MM}_install
> > > > +endef
> > > > -- 
> > > > 2.36.0
> > > > 
> > > 
> > > -- 
> > > Thank you,
> > > Dmitry
> > 
> > -- 
> > Thank you,
> > Dmitry
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

-- 
Thank you,
Dmitry
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
