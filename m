Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04896C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB14E82849;
	Tue,  6 Feb 2024 19:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPV9XUWyn7ER; Tue,  6 Feb 2024 19:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6440E8254D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6440E8254D;
	Tue,  6 Feb 2024 19:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 045481BF409
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E57C860F3C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzUQFn_jwxcm for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.89.224.132;
 helo=mx1.sberdevices.ru; envelope-from=ddrokosov@salutedevices.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78DB460F37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78DB460F37
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78DB460F37
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:47:23 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 51EC5120014;
 Tue,  6 Feb 2024 22:47:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 51EC5120014
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Tue,  6 Feb 2024 22:47:21 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 22:47:20 +0300
Date: Tue, 6 Feb 2024 22:47:20 +0300
To: Christian Hopps <chopps@chopps.org>
Message-ID: <20240206194720.suyww3i3bxcztgn5@CAB-WSD-L081021>
References: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
 <20230622171806.vywakqz7q7ezqnrv@CAB-WSD-L081021>
 <20230626121237.4z7alvantlkjc7ha@CAB-WSD-L081021>
 <20230626154719.GC646621@scaer>
 <20230627102456.ias6peqvoxxzjyik@CAB-WSD-L081021>
 <m25xz16e14.fsf@ja.int.chopps.org>
 <20240206115217.3r43du5b4wnt23a7@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206115217.3r43du5b4wnt23a7@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183247 [Feb 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains},
 {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;
 100.64.160.123:7.1.2; 127.0.0.199:7.1.2; smtp.sberdevices.ru:7.1.1,5.0.1;
 salutedevices.com:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 ymorin.is-a-geek.org:7.1.1;
 patchwork.ozlabs.org:7.1.1, FromAlignment: s, ApMailHostAddress:
 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/06 18:28:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/06 18:28:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/06 15:39:00 #23379857
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1707248841;
 bh=TNCQn/dU6t1TnwtJ8JoNRkgXSjEgH61bRIABipoE7FU=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
 b=cB9Ic1eZUQQv1KUGYkHmE6UDC/7Qy9ub5BtN2LqxKVwp5r4cp6jGFK6qsUKDJsOO/
 mJs0MTIpSlvrseQV0tOHzBIwFPdx7PKzu3kHlu9RQVM2IHQeuyYm2e5Gh2KnkdFRe4
 RC3Pta7Lkk4tQ0ZUNCeHfyOTbgKFvgx8nA4kvqrotxA4dRSE9l3YgQuhf4A5+39VfO
 jA2+Yq9Twnzzq61+xDl4eWSeiIyLhZQhr4f7HPXMNBicGEjcUBX7DrwKRXnRirGm8z
 t+WGn1VCZkL715pEXltXW7nl3gInctm/X/rgW6qFImbK5+bX3GxGiNPxnnE1WVHB8g
 QvlhWOI4XcJVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=salutedevices.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=cB9Ic1eZ
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
Reply-To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: rockosov@gmail.com, Herve Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

I've sent v2 patch series, please take a look:

https://lore.kernel.org/buildroot/20240206192543.7179-2-ddrokosov@salutedevices.com/

On Tue, Feb 06, 2024 at 02:52:17PM +0300, Dmitry Rokosov wrote:
> Hello Chris,
> 
> I had actually forgotten about this patch. Today, I will update it and
> would appreciate it if you could review it. I will add you to the CC.
> 
> On Tue, Feb 06, 2024 at 06:12:27AM -0500, Christian Hopps wrote:
> > 
> > Hi Dmitry, et al.,
> > 
> > I locally modified this patch according to the suggestion and am using it successfully. Will you be resubmitting this patch, or could I resubmit it with the suggested changes?
> > 
> > Thanks,
> > Chris.
> > 
> > Dmitry Rokosov via buildroot <buildroot@buildroot.org> writes:
> > 
> > > Hello Yann,
> > > 
> > > On Mon, Jun 26, 2023 at 05:47:19PM +0200, Yann E. MORIN wrote:
> > > > Dmitry, All,
> > > > 
> > > > On 2023-06-26 15:12 +0300, Dmitry Rokosov spake thusly:
> > > > > Please take a look into this patchset. I appreciate any feedback.
> > > > 
> > > > Don't be impatient. Your patch has been pending for about two seeks now.
> > > > We have 495 pending patches: https://patchwork.ozlabs.org/project/buildroot/list/
> > > > some of witch are so much older...
> > > > 
> > > > Yes, I know it can be frustrating. For various reasons, we've been a bit
> > > > less active than usual the past few months, but we'll eventually get to
> > > > it...
> > > > 
> > > > Regards,
> > > > Yann E. MORIN.
> > > > 
> > > 
> > > Thank you so much for the detailed reply! I wasn't aware of the backlog,
> > > and I apologize for any misunderstanding caused by my eagerness. I fully
> > > understand the situation now, so please don't worry - I'm happy to wait
> > > my turn. Thank you for your hard work in maintaining buildroot!
> > > 
> > > > > On Thu, Jun 22, 2023 at 08:18:06PM +0300, Dmitry Rokosov wrote:
> > > > > > Hello,
> > > > > >
> > > > > > Add Peter Korsgaard and move "buildroot" mailing list from Cc.
> > > > > >
> > > > > > Could you please take a look at this patchset? I believe that linux-mm
> > > > > > tools are helpful for investigating kernel memory distribution in
> > > > > > embedded systems.
> > > > > >
> > > > > > On Fri, Jun 09, 2023 at 02:34:15PM +0300, Dmitry Rokosov wrote:
> > > > > > > This toolset was designed to facilitate the testing, monitoring, and
> > > > > > > tracing of various things with virtual memory, pages, and slab objects.
> > > > > > > It is an invaluable resource for identifying and analyzing
> > > > > > > memory-related issues, such as leaks and bottlenecks, and can greatly
> > > > > > > enhance one's understanding of memory utilization within a system.
> > > > > > >
> > > > > > > The mm toolset includes:
> > > > > > >     - page_owner_sort: userspace helper to sort the output of
> > > > > > >       /sys/kernel/debug/page_owner, which helps to know who allocates
> > > > > > >       the page from kernel context
> > > > > > >     - slabinfo: the tool which gets reports about slabs, for example
> > > > > > >       show empty slabs, modify of slab debug options at runtime, display
> > > > > > >       all information about a slabcache
> > > > > > >     - page-types: a handy tool for querying page flags
> > > > > > >
> > > > > > > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > > > > > > ---
> > > > > > >  package/linux-tools/Config.in           | 18 ++++++++
> > > > > > >  package/linux-tools/linux-tool-mm.mk.in | 59 +++++++++++++++++++++++++
> > > > > > >  2 files changed, 77 insertions(+)
> > > > > > >  create mode 100644 package/linux-tools/linux-tool-mm.mk.in
> > > > > > >
> > > > > > > diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> > > > > > > index 880ad08f0f1c..3ecc45574b82 100644
> > > > > > > --- a/package/linux-tools/Config.in
> > > > > > > +++ b/package/linux-tools/Config.in
> > > > > > > @@ -171,4 +171,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
> > > > > > >
> > > > > > >  endif # BR2_PACKAGE_LINUX_TOOLS_HV
> > > > > > >
> > > > > > > +config BR2_PACKAGE_LINUX_TOOLS_MM
> > > > > > > +	bool "mm"
> > > > > > > +	select BR2_PACKAGE_LINUX_TOOLS
> > > > > > > +	help
> > > > > > > +	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs objects.
> > > > > > > +
> > > > > > > +	  - page_owner_sort: userspace helper to sort the output of
> > > > > > > +	  /sys/kernel/debug/page_owner, which helps to know who allocates
> > > > > > > +	  the page from kernel context
> > > > > > > +
> > > > > > > +	  - slabinfo: the tool which gets reports about slabs, for example
> > > > > > > +	  show empty slabs, modify of slab debug options at runtime, display
> > > > > > > +	  all information about a slabcache
> > > > > > > +
> > > > > > > +	  - page-types: a handy tool for querying page flags
> > > > > > > +
> > > > > > > +	  These tools are available only from kernel version 3.4.
> > > > > > > +
> > > > > > >  endmenu
> > > > > > > diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..a59f1c46ff97
> > > > > > > --- /dev/null
> > > > > > > +++ b/package/linux-tools/linux-tool-mm.mk.in
> > > > > > > @@ -0,0 +1,59 @@
> > > > > > > +################################################################################
> > > > > > > +#
> > > > > > > +# mm
> > > > > > > +#
> > > > > > > +################################################################################
> > > > > > > +
> > > > > > > +LINUX_TOOLS += mm
> > > > > > > +
> > > > > > > +MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> > > > > > > +
> > > > > > > +KVER = $(shell echo $(LINUX_VERSION_PROBED))
> > > > > > > +KVER_MAJOR = $(word 1,$(subst ., ,$(KVER)))
> > > > > > > +KVER_MINOR = $(word 2,$(subst ., ,$(KVER)))
> > > > > > > +
> > > > > > > +# For the first time tools/vm was introduced in the 3.4 kernel version
> > > > > > > +KVER_MAJOR_MIN = 3
> > > > > > > +KVER_MINOR_MIN = 4
> > > > > > > +
> > > > > > > +# Starting from 6.3 kernel version mm tools are located at tools/mm folder
> > > > > > > +# instead of tools/vm
> > > > > > > +KVER_MAJOR_MM = 6
> > > > > > > +KVER_MINOR_MM = 3
> > > > > > > +
> > > > > > > +define MM_BUILD_CMDS
> > > > > > > +	$(Q)if [ $(KVER_MAJOR) -lt $(KVER_MAJOR_MIN) ] || \
> > > > > > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MIN) -a \
> > > > > > > +		  $(KVER_MINOR) -lt $(KVER_MINOR_MIN) ]; then \
> > > > > > > +		echo -n "Your kernel version $(KVER_MAJOR).$(KVER_MINOR) is "; \
> > > > > > > +		echo "too old and doesn't have the mm tools." ; \
> > > > > > > +		echo -n "At least $(KVER_MAJOR_MIN).$(KVER_MINOR_MIN) "; \
> > > > > > > +		echo "kernel must be used." ; \
> > > > > > > +		exit 1 ; \
> > > > > > > +	fi
> > > > > > > +
> > > > > > > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > > > > > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > > > > > > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > > > > > > +		MM=mm; \
> > > > > > > +	else \
> > > > > > > +		MM=vm; \
> > > > > > > +	fi; \
> > > > > > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > > > > > > +		$(MM_MAKE_OPTS) $${MM}
> > > > > > > +endef
> > > > > > > +
> > > > > > > +define MM_INSTALL_TARGET_CMDS
> > > > > > > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > > > > > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > > > > > > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > > > > > > +		MM=mm; \
> > > > > > > +	else \
> > > > > > > +		MM=vm; \
> > > > > > > +	fi; \
> > > > > > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > > > > > > +		$(MM_MAKE_OPTS) \
> > > > > > > +		INSTALL_ROOT=$(TARGET_DIR) \
> > > > > > > +		DESTDIR=$(TARGET_DIR) \
> > > > > > > +		$${MM}_install
> > > > > > > +endef
> > > > > > > --
> > > > > > > 2.36.0
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > Thank you,
> > > > > > Dmitry
> > > > >
> > > > > --
> > > > > Thank you,
> > > > > Dmitry
> > > > 
> > > > --
> > > > .-----------------.--------------------.------------------.--------------------.
> > > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > > '------------------------------^-------^------------------^--------------------'
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
