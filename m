Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2FCC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BADF141730;
	Wed,  7 Feb 2024 17:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izYElsIedYI9; Wed,  7 Feb 2024 17:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26D5F41703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26D5F41703;
	Wed,  7 Feb 2024 17:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE261BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D2040151
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U31vOuLNO_uE for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.89.224.132;
 helo=mx1.sberdevices.ru; envelope-from=ddrokosov@salutedevices.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5276C41FEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5276C41FEE
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5276C41FEE
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:19:10 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 9554E120022;
 Wed,  7 Feb 2024 20:19:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9554E120022
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 20:19:08 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 20:19:07 +0300
Date: Wed, 7 Feb 2024 20:19:07 +0300
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207171907.m3ksufcpalqhahfz@CAB-WSD-L081021>
References: <20240206192543.7179-1-ddrokosov@salutedevices.com>
 <20240206192543.7179-3-ddrokosov@salutedevices.com>
 <ZcNIZ3wz9y2GTg9R@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcNIZ3wz9y2GTg9R@landeda>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183285 [Feb 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 10
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Prob_stat_susp_url_only},
 {Tracking_one_url, url2}, {Tracking_uf_ne_domains}, {Track_E25351},
 {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 100.64.160.123:7.1.2;
 ymorin.is-a-geek.org:7.1.1; smtp.sberdevices.ru:7.1.1,5.0.1; 127.0.0.199:7.1.2;
 salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/07 16:51:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/07 07:12:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/07 13:31:00 #23397662
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1707326348;
 bh=of68IdaoiO1Xc58Hj/LxK/5gWyY8XnL/twqx3AkNIjM=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
 b=RC3m7O/QFlilfYTxGGHi5lqxiy4G0f1wadUabi0skCqok+kYgpFJtiklDwoJOCsOa
 XBe2V9+U3YGShflbE+z6+HCEaCRUgtZQglre4VNuptGNOLlo4YHss3FAVBc/BRGMCG
 TPtXuXjdWTK9dX1jZoQIJCKWwCVXRZa8tDVGjWHMRY7mwY1d+SPlDYs0Wj6Dxm4n+F
 4Exq/2gLEiBr34kuT4FTGTTNclzV8TlwgvBia2NShg8u3gwZPkRYZdrjxoFzvzoPOC
 VzAMKStMD4Li11dBWPWWls7ktsjvmLA3kXGl1IfweG/vBOgb4zMnSvtlPGNH0OKXCL
 uBSkHDhgpA/dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=salutedevices.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=RC3m7O/Q
Subject: Re: [Buildroot] [PATCH v2 2/2] package/linux-tools: multilib build
 supported
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
Cc: chopps@chopps.org, Herve Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org, Konstantin Menyaev <KAMenyaev@sberdevices.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru, rockosov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

Thank you very much for such a quick response!

On Wed, Feb 07, 2024 at 10:07:51AM +0100, Yann E. MORIN wrote:
> Dmitry, All,
> 
> On 2024-02-06 22:25 +0300, Dmitry Rokosov spake thusly:
> > From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> > 
> > - LINUX_TOOLS_MAKE_OPTS option introduced:
> >     allows to override CROSS_COMPILE param
> 
> What is the rationale for this? How is it supposed to be used?
> 
> CROSS_COMPILE is already part of LINUX_MAKE_FLAGS, so there is no reason
> to pass it explicitly either.
> 
> Otherwise, I am not convinced anout the "multilib" title either, because
> Buildroot does not do multilib systems anyway, so I am missing the point
> of the patch...
> 
> If you feel there really is a nedd, please resubmit with an extended
> commit log. Thanks!

Okay, we will try to describe it with extra comments and resubmit the
patch in the separate email.

> 
> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> >  package/linux-tools/linux-tool-gpio.mk.in      | 2 +-
> >  package/linux-tools/linux-tool-iio.mk.in       | 2 +-
> >  package/linux-tools/linux-tool-mm.mk.in        | 2 +-
> >  package/linux-tools/linux-tool-pci.mk.in       | 2 +-
> >  package/linux-tools/linux-tool-perf.mk.in      | 2 +-
> >  package/linux-tools/linux-tool-selftests.mk.in | 2 +-
> >  package/linux-tools/linux-tool-tmon.mk.in      | 2 +-
> >  package/linux-tools/linux-tools.mk             | 2 ++
> >  8 files changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
> > index e825db1b1127..dcee11002e8c 100644
> > --- a/package/linux-tools/linux-tool-gpio.mk.in
> > +++ b/package/linux-tools/linux-tool-gpio.mk.in
> > @@ -6,7 +6,7 @@
> >  
> >  LINUX_TOOLS += gpio
> >  
> > -GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> > +GPIO_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
> >  
> >  define GPIO_BUILD_CMDS
> >  	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
> > diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
> > index 27ab0ed7ed63..1372faafd1a8 100644
> > --- a/package/linux-tools/linux-tool-iio.mk.in
> > +++ b/package/linux-tools/linux-tool-iio.mk.in
> > @@ -6,7 +6,7 @@
> >  
> >  LINUX_TOOLS += iio
> >  
> > -IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> > +IIO_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
> >  
> >  define IIO_BUILD_CMDS
> >  	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
> > diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> > index 5431e0574b04..51a54026dea4 100644
> > --- a/package/linux-tools/linux-tool-mm.mk.in
> > +++ b/package/linux-tools/linux-tool-mm.mk.in
> > @@ -7,7 +7,7 @@
> >  LINUX_TOOLS += mm
> >  
> >  MM_DEPENDENCIES = linux
> > -MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> > +MM_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) CC="$(TARGET_CC)"
> >  
> >  define MM_BUILD_CMDS
> >  	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
> > diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
> > index 17246f5d7ed2..48c3435a5c8a 100644
> > --- a/package/linux-tools/linux-tool-pci.mk.in
> > +++ b/package/linux-tools/linux-tool-pci.mk.in
> > @@ -6,7 +6,7 @@
> >  
> >  LINUX_TOOLS += pci
> >  
> > -PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> > +PCI_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
> >  
> >  define PCI_BUILD_CMDS
> >  	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
> > diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> > index ee308a85dfd1..38910cda7d75 100644
> > --- a/package/linux-tools/linux-tool-perf.mk.in
> > +++ b/package/linux-tools/linux-tool-perf.mk.in
> > @@ -19,7 +19,7 @@ PERF_ARCH=$(NORMALIZED_ARCH)
> >  endif
> >  
> >  PERF_MAKE_FLAGS = \
> > -	$(LINUX_MAKE_FLAGS) \
> > +	$(LINUX_TOOLS_MAKE_OPTS) \
> >  	JOBS=$(PARALLEL_JOBS) \
> >  	ARCH=$(PERF_ARCH) \
> >  	DESTDIR=$(TARGET_DIR) \
> > diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
> > index e29c7f59debd..144dd6616f2b 100644
> > --- a/package/linux-tools/linux-tool-selftests.mk.in
> > +++ b/package/linux-tools/linux-tool-selftests.mk.in
> > @@ -22,7 +22,7 @@ SELFTESTS_DEPENDENCIES = \
> >  	$(if $(BR2_PACKAGE_OPENSSL),openssl)
> >  
> >  SELFTESTS_MAKE_FLAGS = \
> > -	$(LINUX_MAKE_FLAGS) \
> > +	$(LINUX_TOOLS_MAKE_OPTS) \
> >  	ARCH=$(SELFTESTS_ARCH)
> >  
> >  # O must be redefined here to overwrite the one used by Buildroot for
> > diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
> > index 56c328c51fd7..7c33915049c2 100644
> > --- a/package/linux-tools/linux-tool-tmon.mk.in
> > +++ b/package/linux-tools/linux-tool-tmon.mk.in
> > @@ -7,7 +7,7 @@
> >  LINUX_TOOLS += tmon
> >  
> >  TMON_DEPENDENCIES = host-pkgconf ncurses
> > -TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> > +TMON_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) \
> >  	CC=$(TARGET_CC) \
> >  	LDFLAGS="$(TARGET_LDFLAGS)" \
> >  	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> > diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> > index 81b1fbc17605..38bb2c83966a 100644
> > --- a/package/linux-tools/linux-tools.mk
> > +++ b/package/linux-tools/linux-tools.mk
> > @@ -26,6 +26,8 @@ LINUX_TOOLS_PATCH_DEPENDENCIES = linux
> >  # may install shared libraries and headers (e.g. cpupower).
> >  LINUX_TOOLS_INSTALL_STAGING = YES
> >  
> > +LINUX_TOOLS_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CROSS_COMPILE="$(TARGET_CROSS)"
> > +
> >  LINUX_TOOLS_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
> >  	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
> >  		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
> > -- 
> > 2.43.0
> > 
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
