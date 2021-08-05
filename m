Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DC2C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:48:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA89261078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA89261078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6250440264;
	Thu,  5 Aug 2021 21:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gnzehyd5IUxY; Thu,  5 Aug 2021 21:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EF3B4026E;
	Thu,  5 Aug 2021 21:48:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4CD31BF2BB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D31954026E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-f17vW_ldyE for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:48:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BD8B40240
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 21:48:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 937F5240007;
 Thu,  5 Aug 2021 21:48:37 +0000 (UTC)
Date: Thu, 5 Aug 2021 23:48:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210805234836.77fde375@windsurf>
In-Reply-To: <20210805212540.3032007-1-fontaine.fabrice@gmail.com>
References: <20210805212540.3032007-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libesmtp: security bump to
 version 1.1.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu,  5 Aug 2021 23:25:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> After more than a decade, libESMTP version 1.0.6 is superceded. Despite
> proving robust a little bitrot has occurred, especially regarding
> OpenSSL support. The original application data APIs are prone to memory
> leaks and are deprecated in favour of safer replacements. Version 1.1
> updates libESMTP without breaking API and ABI compatibility and
> provides a basis for future development.
> 
> In addition to updates to the codebase, documentation is modernised and
> is more comprehensive.
> 
> All libESMTP users are encouraged to upgrade from version 1.0.6.
> 
> - Update license files
> - Update indentation in hash file (two spaces)
> - Switch to meson-package
> - Handle threads and tls meson options
> - libesmtp-config has been dropped:
>   https://github.com/libesmtp/libESMTP/issues/8
> - Fix CVE-2019-19977: libESMTP through 1.0.6 mishandles domain copying
>   into a fixed-size buffer in ntlm_build_type_2 in ntlm/ntlmstruct.c, as
>   demonstrated by a stack-based buffer over-read.
> 
> https://github.com/libesmtp/libESMTP/releases/tag/v1.1.0
> https://libesmtp.github.io/changes-since-v1.0.6.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libesmtp/Config.in     |  1 +
>  package/libesmtp/libesmtp.hash |  6 +++---
>  package/libesmtp/libesmtp.mk   | 24 +++++++++++++++++-------
>  3 files changed, 21 insertions(+), 10 deletions(-)

Wow, it's a massive bump for a security bump. So, I've applied to
master, but it's a bit risky. Could you make sure that collectd and
syslog-ng continue to build fine after this bump ?

Applied to master anyway, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
