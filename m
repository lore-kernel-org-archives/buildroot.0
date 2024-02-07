Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FC8C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E941641709;
	Wed,  7 Feb 2024 17:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MiB0jNTj91vK; Wed,  7 Feb 2024 17:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B1F8416EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B1F8416EC;
	Wed,  7 Feb 2024 17:16:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3EC1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54AD640925
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4CGPQqKQvHq for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.89.224.132;
 helo=mx1.sberdevices.ru; envelope-from=ddrokosov@salutedevices.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 447944091F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 447944091F
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 447944091F
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:15:56 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id B27E8120022;
 Wed,  7 Feb 2024 20:15:53 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B27E8120022
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 20:15:53 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 20:15:53 +0300
Date: Wed, 7 Feb 2024 20:15:52 +0300
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207171552.nrn7dnbvltc3oy4b@CAB-WSD-L081021>
References: <20240206192543.7179-1-ddrokosov@salutedevices.com>
 <20240206192543.7179-2-ddrokosov@salutedevices.com>
 <ZcNFe1ZYKxgVfuuA@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcNFe1ZYKxgVfuuA@landeda>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183284 [Feb 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains},
 {Track_E25351}, {Tracking_from_domain_doesnt_match_to},
 ymorin.is-a-geek.org:7.1.1; salutedevices.com:7.1.1;
 nightly.buildroot.org:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; smtp.sberdevices.ru:7.1.1,5.0.1;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/07 06:08:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/07 07:12:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/07 13:31:00 #23397662
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1707326153;
 bh=/4MV8G/VY0prQ3IIp1KPYn10IInovWX2TKO1Ca9EbX0=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
 b=ijnQsf0s8Jw0xfcjBtcwXgG20PZPZ/vrDHbfWJgxVVa8aGYO0mPXAjhTdgS3VEfIg
 5t5JlGJW26Xb74C6VlXCIvQ8+YOW9Pe/XQ2pGbIJMfZPZCLl3mDrvf/2/pcmyFDpJB
 yBXG5hHuvndTkTR36qh0ghvJRN2E+/zUS+2ihVyr0cpWXalKcIRrkl8a3Z7TENIqlk
 bfsipwjK0rJcyX1vc/OB9WfNhZCdpkop0ikEhikzcb655pfkzjq3SeZbCGEiG2hUWL
 44AXfTZYc+JZlCXLolwKS7sS95VrzG7yvk/Ca1vT3WX71JbwNL7z725fch8xXOJdSk
 7vn0CmlmbAEYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=salutedevices.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=ijnQsf0s
Subject: Re: [Buildroot] [PATCH v2 1/2] package/linux-tools: introduce linux
 mm tools
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
 buildroot@buildroot.org, Alexey Romanov <avromanov@salutedevices.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru, rockosov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

Thank you for such a quick response!

On Wed, Feb 07, 2024 at 09:55:23AM +0100, Yann E. MORIN wrote:
> Dmitry, All,
> 
> On 2024-02-06 22:25 +0300, Dmitry Rokosov spake thusly:
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
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> 
> I've applied, after making a few changes:
> 
>   - don't depend on linux, already a patch dependency
>   - don't set CC: default is based on CROSS_COMPILE
>   - no need to fully recheck at install time
>   - move the option for alphabetical ordering
>   - fix check-package
> 
> See below for a few more omments...
> 
> > ---
> >  package/linux-tools/Config.in           | 18 +++++++++++
> >  package/linux-tools/linux-tool-mm.mk.in | 41 +++++++++++++++++++++++++
> >  2 files changed, 59 insertions(+)
> >  create mode 100644 package/linux-tools/linux-tool-mm.mk.in
> > 
> > diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> > index 8a0b6d5802cc..ede966ec792d 100644
> > --- a/package/linux-tools/Config.in
> > +++ b/package/linux-tools/Config.in
> > @@ -185,4 +185,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
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
> 
>     $ ./utils/docker-run make check-package
>     package/linux-tools/Config.in:244: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/linux-tools/Config.in:247: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/linux-tools/Config.in:250: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/linux-tools/Config.in:251: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
> 

I will run check-package for the next contribution. Thank you very much
for fixing the coding style problems.

> >  endmenu
> > diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> > new file mode 100644
> > index 000000000000..5431e0574b04
> > --- /dev/null
> > +++ b/package/linux-tools/linux-tool-mm.mk.in
> > @@ -0,0 +1,41 @@
> > +################################################################################
> > +#
> > +# mm
> > +#
> > +################################################################################
> > +
> > +LINUX_TOOLS += mm
> > +
> > +MM_DEPENDENCIES = linux
> 
> No need to add an explicit dependency: the linux-tools micro-infra
> already handles it in a generic way; indeed, there is no reason for each
> individual linux-tool to add a dependency on linux: they all have that
> dependency.
> 

Yep, you are totally right. It was needed for LINUX_VERSION_PROBED
variable. Without this dependency we couldn't get LINUX_VERSION_PROBED
environment value.

> > +MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> 
> No need to explicitly set CC: the kernel Makefile sets it based on
> CROSS_COMPILE already.
> 

Hmmmm, very strange. AFAIR, withoug explicit CC I can't build
linux-tools-mm with cross compilation. I will check the final merged
patchset and back to the thread if any.

> > +define MM_BUILD_CMDS
> > +	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
> > +		MM_SUBDIR=vm; \
> > +	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
> > +		MM_SUBDIR=mm; \
> > +	else \
> > +		echo "Your kernel version is too old and does not have the mm tool." ; \
> > +		echo "At least kernel 3.4 must be used." ; \
> > +		exit 1 ; \
> > +	fi ; \
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > +		$(MM_MAKE_OPTS) $${MM_SUBDIR}
> > +endef
> > +
> > +define MM_INSTALL_TARGET_CMDS
> > +	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
> > +		MM_SUBDIR=vm; \
> > +	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
> > +		MM_SUBDIR=mm; \
> > +	else \
> > +		echo "Your kernel version is too old and does not have the mm tool." ; \
> > +		echo "At least kernel 3.4 must be used." ; \
> > +		exit 1 ; \
> > +	fi ; \
> 
> For install, we do need to know which directory to use, indeed, but we
> already do know one exists, as it was used at build, above; so we do not
> need the error case. I've simplified this part and added a comment to
> explain it.
> 
> Applied to master with those changes, thanks.

Okay, many thanks, appreciate it so much!

> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > +		$(MM_MAKE_OPTS) \
> > +		INSTALL_ROOT=$(TARGET_DIR) \
> > +		DESTDIR=$(TARGET_DIR) \
> > +		$${MM_SUBDIR}_install
> > +endef
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
