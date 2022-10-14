Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE12DC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5540C60BAC;
	Fri, 14 Oct 2022 21:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5540C60BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUBN9Em-5UPh; Fri, 14 Oct 2022 21:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8896660B5C;
	Fri, 14 Oct 2022 21:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8896660B5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD8001BF300
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81A93415E3
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81A93415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-ulFwl6rbUa for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 21:11:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090EF415DD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 090EF415DD
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 21:11:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AADF2C0007;
 Fri, 14 Oct 2022 21:11:48 +0000 (UTC)
Date: Fri, 14 Oct 2022 23:11:47 +0200
To: Rufus Segar <rhs@riseup.net>
Message-ID: <20221014231147.05459ac1@windsurf>
In-Reply-To: <20220507161338.2125859-1-rhs@riseup.net>
References: <20220507161338.2125859-1-rhs@riseup.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665781908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jvx1H5U/h+HiVYAbgq2lzQkwqmliOzsy+tqdGSsWQeY=;
 b=Yf4eRpYGKYrKhq/grxZGPbf2HxKbZiv+Q3QeGjFZkX9c9uHERr9RlMRw5Ex8lDRpitGmJU
 laGcFFvdnjE73ndy4VFZ49fKPzCETDWEfy8JPNzZ44UTAdxCftQ5S4abRajv28aFza9FKc
 aWUQjsYNuZcGMz8Z4gGA0uNjCNC9fKK54gN+uhEMKvo4g5NyxRUkPIfuvl/WeaZ+L/Frys
 MIBQzcFYIVTcm9s3UneB+A6Wz6BUEr/sEtgPmkEUNm86GHujyELM8QCtrK0kjdqZ/fyl2r
 DgBBAxX8pceBIwWutQABYviV7sBAFg/VoXC9TAIdunto/6ddvqZMy7fUpXkBEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yf4eRpYG
Subject: Re: [Buildroot] [PATCH 1/1] package: add agent-proxy target and
 host packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rugus,

On Sat,  7 May 2022 17:13:37 +0100
Rufus Segar <rhs@riseup.net> wrote:

> Signed-off-by: Rufus Segar <rhs@riseup.net>

Thanks a lot for your contribution. Believe it or not, but after some
many months, I finally took the time to review and apply your patch.

However, I did quite a few changes:

 - I kept only the host variant of the package. Indeed, my
   understanding is that agent-proxy is meant to be executed on the
   developer workstation to de-multiplex the kgdb traffic from the
   console traffic. Therefore it was not clear why a target variant was
   needed. Of course, if additional justification/explanation is given,
   the target variant can be re-added via a follow-up patch.

 - Addition of an entry in the DEVELOPERS file

 - Addition of a .hash file with the hash of the tarball and hash of
   the COPYING file.

See below for some other comments.

> +AGENT_PROXY_VERSION = agent-proxy-1.97
> +AGENT_PROXY_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
> +AGENT_PROXY_LICENSE = GPL-2.0+

This was not correct: the license is GPL-2.0 only.

> +AGENT_PROXY_LICENSE_FILES = COPYING
> +
> +define AGENT_PROXY_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define AGENT_PROXY_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/agent-proxy $(STAGING_DIR)/usr/bin

This had not effect since AGENT_PROXY_INSTALL_STAGING is not set to
YES. But anyway, I dropped this since I dropped the target variant;

> +endef
> +
> +define AGENT_PROXY_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/agent-proxy $(TARGET_DIR)/usr/bin
> +endef
> +
> +define HOST_AGENT_PROXY_BUILD_CMDS
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_AGENT_PROXY_INSTALL_CMDS
> +	$(HOST_CONFIGURE_OPTS) $(INSTALL) -D -m 0755 $(@D)/agent-proxy $(HOST_DIR)/bin

$(HOST_CONFIGURE_OPTS) not needed here, and we want the full
destination path as the last argument, i.e $(HOST_DIR)/bin/agent-proxy.

Once again, thanks a lot for this contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
