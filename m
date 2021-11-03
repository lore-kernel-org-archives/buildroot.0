Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF03C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:48:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF4B60F90
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACF4B60F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0C780F86;
	Wed,  3 Nov 2021 17:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0o9gJCtNw0I; Wed,  3 Nov 2021 17:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE8F880D40;
	Wed,  3 Nov 2021 17:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEF151BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADE5B40383
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vREHYQXyFl1p for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:48:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63546401E9
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:48:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6BC6A24000B;
 Wed,  3 Nov 2021 17:48:41 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:48:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211103184840.09b66e0c@windsurf>
In-Reply-To: <20211102101920.3859519-1-fontaine.fabrice@gmail.com>
References: <20211102101920.3859519-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.11.0
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
Cc: Denis Bodor <lefinnois@lefinnois.net>, Michael Vetter <jubalh@iodoru.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Nov 2021 11:19:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball (and so drop autoreconf and first patch)
> - gnutls is an optional dependency since
>   https://github.com/strophe/libstrophe/commit/e490011b680633b3d4b734cd416b4ae2c21b3cc3
> 
> https://github.com/strophe/libstrophe/releases/tag/0.11.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../libstrophe/0001-make-autoreconfable.patch | 20 -------------------
>  package/libstrophe/Config.in                  |  2 +-
>  package/libstrophe/libstrophe.hash            |  2 +-
>  package/libstrophe/libstrophe.mk              | 17 +++++++++++-----
>  4 files changed, 14 insertions(+), 27 deletions(-)
>  delete mode 100644 package/libstrophe/0001-make-autoreconfable.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
