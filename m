Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF57C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:28:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5F86109E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F5F86109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F116401D8;
	Thu, 19 Aug 2021 21:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZzKBLcEUkKU; Thu, 19 Aug 2021 21:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 379CF404E5;
	Thu, 19 Aug 2021 21:28:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 033211BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFFD14023F
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqRS0hVOMTD3 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:27:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29AFB40176
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:27:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 25CB0E0003;
 Thu, 19 Aug 2021 21:27:55 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:27:54 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210819232754.197dfc8b@windsurf>
In-Reply-To: <20210808144433.1281827-1-james.hilliard1@gmail.com>
References: <20210808144433.1281827-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python-autobahn: bump to
 version 21.3.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun,  8 Aug 2021 08:44:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Strip xbr contracts which are used only for the xbr feature which is
> entirely unsupported by buildroot.
> 
> Add patch to fix some xbr assets getting accidentially included.
> 
> Enable the optimized nvx cffi extension module when available.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - add hyperlink runtime dependency
> Changes v1 -> v2:
>   - backport patch from upstream to fix nvx support detection
> ---
>  ...r-packages-and-xbr-templates-package.patch | 54 +++++++++++++++++
>  ...y-default-and-don-t-publish-universa.patch | 60 +++++++++++++++++++
>  package/python-autobahn/Config.in             |  2 +
>  package/python-autobahn/python-autobahn.hash  |  4 +-
>  package/python-autobahn/python-autobahn.mk    |  6 +-
>  5 files changed, 122 insertions(+), 4 deletions(-)
>  create mode 100644 package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
>  create mode 100644 package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
