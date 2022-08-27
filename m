Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95262ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 12:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B270408E6;
	Sat, 27 Aug 2022 12:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B270408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ew2lMZA7xkH; Sat, 27 Aug 2022 12:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE192408A1;
	Sat, 27 Aug 2022 12:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE192408A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB1F21BF44A
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 12:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93E678126A
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 12:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E678126A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQTj53mhpQvI for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 12:08:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4317281251
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4317281251
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 12:08:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D4960780504;
 Sat, 27 Aug 2022 14:08:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 14:08:37 +0200
Date: Sat, 27 Aug 2022 14:08:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Message-ID: <20220827120837.GV37358@scaer>
References: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
 <20220614180152.15846-1-raphael.pavlidis@gmail.com>
 <a7ed0285-fea7-16f6-6ef8-9ff93fee1461@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7ed0285-fea7-16f6-6ef8-9ff93fee1461@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661602122;
 bh=S+xTUG8apM+rYwtGdb38iNA/793XLjFo2ul2CGyL75M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBtOaaD56LvPGIsMgZW1CuiwNVemTPAjcqdN/1j670bf9VxveCilOPyzRdYOiedl2
 Vk8ckz+/UawpmpnKYvjzLlqoKaJce2zMPve4BzOna3ebyb/cjKWLfawBMmQTihShBD
 Te46KhKmkSo9myrsRIUaRXthnykuDbsP0/phalsPYtjgVxchjp/akLM94ctMLbfC+D
 MubY4jc7ZkMNBZTpCSyR1v/6g6qs++THpOSpLLsKO6NlDX0BCmKrdzb0+CLZJvvvyI
 2lWymoGv5FSJVvhPe6KISOVLbxZPOiMpqaqz10Q6cInWlyDCI5hF+Ma+ld6PakefYR
 h5jQgkqwLid0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SBtOaaD5
Subject: Re: [Buildroot] [PATCH v2] package/slirp4netns: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2022-08-27 12:57 +0200, Raphael Pavlidis via buildroot spake thusly:
> Can I do something, so this patch is accepted? :)

Just a little nudge... ;-)

> On 14.06.22 20:01, Raphael Pavlidis wrote:
> >slirp4netns is for user-mode networking for unprivileged network
> >namespace.
> >
> >Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to next, thanks.

You forgot to add an entry in the DEVELOPERS file, and I forgot to
commit-amend my change, so I pushed a follow-up commit to add it.

Regards,
Yann E. MORIN.

> >---
> >Changes v1 -> v2:
> >   - Fix typo in SLIRP4NETNS_LICENSE_FILES
> >
> >  package/Config.in                    |  1 +
> >  package/slirp4netns/Config.in        | 20 ++++++++++++++++++++
> >  package/slirp4netns/slirp4netns.hash |  3 +++
> >  package/slirp4netns/slirp4netns.mk   | 15 +++++++++++++++
> >  4 files changed, 39 insertions(+)
> >  create mode 100644 package/slirp4netns/Config.in
> >  create mode 100644 package/slirp4netns/slirp4netns.hash
> >  create mode 100644 package/slirp4netns/slirp4netns.mk
> >
> >diff --git a/package/Config.in b/package/Config.in
> >index 3b089166da..216e04e98b 100644
> >--- a/package/Config.in
> >+++ b/package/Config.in
> >@@ -1903,6 +1903,7 @@ menu "Networking"
> >  	source "package/rtmpdump/Config.in"
> >  	source "package/siproxd/Config.in"
> >  	source "package/slirp/Config.in"
> >+	source "package/slirp4netns/Config.in"
> >  	source "package/snmppp/Config.in"
> >  	source "package/sofia-sip/Config.in"
> >  	source "package/sysrepo/Config.in"
> >diff --git a/package/slirp4netns/Config.in b/package/slirp4netns/Config.in
> >new file mode 100644
> >index 0000000000..22414dfbc9
> >--- /dev/null
> >+++ b/package/slirp4netns/Config.in
> >@@ -0,0 +1,20 @@
> >+config BR2_PACKAGE_SLIRP4NETNS
> >+	bool "slirp4netns"
> >+	depends on BR2_USE_MMU # libcap, libglib2, slirp
> >+	depends on BR2_USE_WCHAR # libglib2, slirp
> >+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, slirp
> >+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> >+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
> >+	select BR2_PACKAGE_LIBCAP
> >+	select BR2_PACKAGE_LIBGLIB2
> >+	select BR2_PACKAGE_LIBSECCOMP
> >+	select BR2_PACKAGE_SLIRP
> >+	help
> >+	  User-mode networking for unprivileged network namespaces.
> >+
> >+	  https://github.com/rootless-containers/slirp4netns
> >+
> >+comment "slirp4netns needs a toolchain w/ wchar, threads, headers >= 3.17"
> >+	depends on BR2_USE_MMU
> >+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> >+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> >diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
> >new file mode 100644
> >index 0000000000..e3115c1be0
> >--- /dev/null
> >+++ b/package/slirp4netns/slirp4netns.hash
> >@@ -0,0 +1,3 @@
> >+# Locally computed:
> >+sha256  b584edde686d3cfbac210cbdb93c4b0ba5d8cc0a6a4d92b9dfc3c5baec99c727  slirp4netns-1.2.0.tar.gz
> >+sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
> >diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
> >new file mode 100644
> >index 0000000000..7ff594cc44
> >--- /dev/null
> >+++ b/package/slirp4netns/slirp4netns.mk
> >@@ -0,0 +1,15 @@
> >+################################################################################
> >+#
> >+# slirp4netns
> >+#
> >+################################################################################
> >+
> >+SLIRP4NETNS_VERSION = 1.2.0
> >+SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
> >+SLIRP4NETNS_LICENSE = GPL-2.0
> >+SLIRP4NETNS_LICENSE_FILES = COPYING
> >+SLIRP4NETNS_DEPENDENCIES = libcap libglib2 libseccomp slirp
> >+
> >+SLIRP4NETNS_AUTORECONF = YES
> >+
> >+$(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
