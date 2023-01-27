Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F6CC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933F241D0C;
	Fri, 27 Jan 2023 12:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933F241D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbqRYiJm_Nfv; Fri, 27 Jan 2023 12:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37FC41D00;
	Fri, 27 Jan 2023 12:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37FC41D00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E25C1BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2802C61284
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2802C61284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDIFtisiLMgv for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:42:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCEED60ADA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCEED60ADA
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 12:42:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2EBC3FF802;
 Fri, 27 Jan 2023 12:42:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pLO3q-001zGs-5D; Fri, 27 Jan 2023 13:42:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <5ad733d655927dd855102810e494becce05f53a4.1673953185.git.baruch@tkos.co.il>
Date: Fri, 27 Jan 2023 13:42:30 +0100
In-Reply-To: <5ad733d655927dd855102810e494becce05f53a4.1673953185.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Tue, 17 Jan 2023 12:59:45
 +0200")
Message-ID: <87ilgs5etl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sexpect: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > sexpect is useful for shell controlled testing.
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  DEVELOPERS                   |  1 +
 >  package/Config.in            |  1 +
 >  package/sexpect/Config.in    |  7 +++++++
 >  package/sexpect/sexpect.hash |  3 +++
 >  package/sexpect/sexpect.mk   | 13 +++++++++++++
 >  5 files changed, 25 insertions(+)
 >  create mode 100644 package/sexpect/Config.in
 >  create mode 100644 package/sexpect/sexpect.hash
 >  create mode 100644 package/sexpect/sexpect.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index e8e0dffcd392..f2fc4acece43 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -294,6 +294,7 @@ F:	package/ebtables/
 >  F:	package/i2c-tools/
 >  F:	package/libcurl/
 >  F:	package/libpcap/
 > +F:	package/sexpect/
 >  F:	package/socat/
 >  F:	package/strace/
 >  F:	package/tcpdump/
 > diff --git a/package/Config.in b/package/Config.in
 > index 995dae2c5755..da47cbd4ed06 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -2568,6 +2568,7 @@ comment "Utilities"
 >  	source "package/rtty/Config.in"
 >  	source "package/screen/Config.in"
 >  	source "package/screenfetch/Config.in"
 > +	source "package/sexpect/Config.in"
 >  	source "package/sudo/Config.in"
 >  	source "package/terminology/Config.in"
 >  	source "package/time/Config.in"
 > diff --git a/package/sexpect/Config.in b/package/sexpect/Config.in
 > new file mode 100644
 > index 000000000000..7fbdf9b99eb1
 > --- /dev/null
 > +++ b/package/sexpect/Config.in
 > @@ -0,0 +1,7 @@
 > +config BR2_PACKAGE_SEXPECT
 > +	bool "sexpect"
 > +	help
 > +	  sexpect is another implementation of Expect which is specifically

check-package complained about the length of this line:

package/sexpect/Config.in:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

So I rewrapped and committed, thanks.

> +	  designed for Shell scripts (sh, bash, ksh, zsh, ...)
 > +
 > +	  https://github.com/clarkwang/sexpect
 > diff --git a/package/sexpect/sexpect.hash b/package/sexpect/sexpect.hash
 > new file mode 100644
 > index 000000000000..d5121176269e
 > --- /dev/null
 > +++ b/package/sexpect/sexpect.hash
 > @@ -0,0 +1,3 @@
 > +# Locally calculated
 > +sha256  f6801c8b979d56eec54aedd7ede06e2342f382cee291beea88b52869186c557c  sexpect-2.3.14.tar.gz
 > +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
 > diff --git a/package/sexpect/sexpect.mk b/package/sexpect/sexpect.mk
 > new file mode 100644
 > index 000000000000..7b878600e41f
 > --- /dev/null
 > +++ b/package/sexpect/sexpect.mk
 > @@ -0,0 +1,13 @@
 > +################################################################################
 > +#
 > +# sexpect
 > +#
 > +################################################################################
 > +
 > +SEXPECT_VERSION = 2.3.14
 > +SEXPECT_SITE = $(call github,clarkwang,sexpect,v$(SEXPECT_VERSION))
 > +SEXPECT_LICENSE = GPL-3.0
 > +SEXPECT_LICENSE_FILES = LICENSE
 > +SEXPECT_SUPPORTS_IN_SOURCE_BUILD = NO
 > +
 > +$(eval $(cmake-package))
 > -- 

 > 2.39.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
