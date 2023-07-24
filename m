Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ADDC001DE
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 11:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4DC60F47;
	Mon, 24 Jul 2023 11:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC4DC60F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OgrX6KnXdBh; Mon, 24 Jul 2023 11:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB3760F32;
	Mon, 24 Jul 2023 11:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BB3760F32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD7A1BF4D6
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 11:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 128C360F32
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 11:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 128C360F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPxkxXUfJ_Px for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 11:08:35 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Jul 2023 11:08:34 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72E860BF3
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B72E860BF3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 11:08:34 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 60E35100007;
 Mon, 24 Jul 2023 14:03:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 60E35100007
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Mon, 24 Jul 2023 14:03:21 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 24 Jul
 2023 14:02:28 +0300
Date: Mon, 24 Jul 2023 14:03:20 +0300
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230724110320.qvj2v5e7kjo2qyfz@CAB-WSD-L081021>
References: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
 <20230723111449.7120549c@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723111449.7120549c@windsurf>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525
 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Track_E25351},
 {Tracking_from_domain_doesnt_match_to},
 p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1; 100.64.160.123:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1690196601;
 bh=nPKK0GP4Ozj0qRQ+tLd9+BHFA0dmz7VYwY9foPmEloA=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
 b=OE/tUCxeHKtcdbMKIN7lrQpYpX4sfR8EEfL2FjSFbA5mPbbq0NxQeysMn4LOvz7tn
 X3FrnsPLqITon9vAh5OyK36as7bF1FODoLSJWOhpu8AI7tw8yhEerBOLrhPRtGQA6F
 0I3dgEyceWAR37AWVp2ZlUb/LTlo1djv6ftZCd8if4TKOOFyRC3Q1ci8qQRdWZ/WTH
 +1vkbF6KNXiv779GUqW1LtvLiheJHEYsU9r2ECtNvTZZ6mV7NTkkhBjE4Wx4SegfNu
 UvMJtd4tv5duSQiRz6/lhxCMBthC7W9nXVSUJqFx5rvAYevJV5GD5HVVYp8tpcIa0/
 BQSTuprLVOGzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=OE/tUCxe
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Dmitry Rokosov via buildroot <buildroot@buildroot.org>,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru, rockosov@gmail.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sun, Jul 23, 2023 at 11:14:49AM +0200, Thomas Petazzoni wrote:
> Hello Dmitry,
> 
> On Fri, 9 Jun 2023 14:34:15 +0300
> Dmitry Rokosov via buildroot <buildroot@buildroot.org> wrote:
> 
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
> 
> Thanks for your patch, and sorry for the delay to get back to you with
> a review.

Many thanks for taking the time to review this patch series!

Please don't worry about the delay, as I completely understand that you
have a great deal of other review tasks to attend to.

> 
> 
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
> 
> All variables in a package must be prefixed with the package name.
> Indeed, all variables in Buildroot are global, so if you define KVER
> and another package defines KVER, they will conflict.
> 
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
> 
> I think this is not the approach we should take here, because it's not
> the approach taken by the other makefiles in package/linux-tools/.
> Rather than testing the kernel version, we test the presence/absence of
> a Makefile.
> 
> So something along the lines of:
> 
>         $(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
> 		MM_SUBDIR=vm
>         elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
> 		MM_SUBDIR=m
> 	else \
>                 echo "Your kernel version is too old and does not have the mm tool." ; \
>                 echo "At least kernel 3.4 must be used." ; \
>                 exit 1 ; \
>         fi ; \
> 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> 		$(MM_MAKE_OPTS) $${MM_SUBDIR}
> 
> or something along those lines. And of course, ditto for the install
> step.
> 
> Could you rework your patch accordingly?


Ah, okay. I had considered that approach but chose KVER testing instead.
No problem, I will rework it in the next version.

-- 
Thank you,
Dmitry
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
