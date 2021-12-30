Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5A5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572BD410E9;
	Thu, 30 Dec 2021 12:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFqF6snKBm8r; Thu, 30 Dec 2021 12:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5514410E1;
	Thu, 30 Dec 2021 12:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFFC1C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DA14827D9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFLTfQA8WGhq for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:28:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3164827FD
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:28:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3612E240008;
 Thu, 30 Dec 2021 12:28:05 +0000 (UTC)
Date: Thu, 30 Dec 2021 13:27:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20211230132720.7698d5fa@windsurf>
In-Reply-To: <20211230073626.397440-1-fido_max@inbox.ru>
References: <20211230073626.397440-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.2.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 10:36:26 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Drop upstream patches.
> Release-notes: https://git.osgeo.org/gitea/postgis/postgis/raw/tag/3.2.0/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...VE_VASPRINTF-HAVE_ASPRINTF-templates.patch | 32 --------------
>  ...-forced-static-linking-of-liblwgeom.patch} |  0
>  ...S_DEBUG_LEVEL-define-to-configure.ac.patch | 29 -------------
>  ...fig-to-get-PROJ-version-if-available.patch | 42 -------------------
>  ...ix-cross-compilation-with-protobuf-c.patch | 42 -------------------
>  package/postgis/postgis.hash                  |  2 +-
>  package/postgis/postgis.mk                    |  2 +-
>  7 files changed, 2 insertions(+), 147 deletions(-)
>  delete mode 100644 package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
>  rename package/postgis/{0003-Disable-forced-static-linking-of-liblwgeom.patch => 0001-Disable-forced-static-linking-of-liblwgeom.patch} (100%)
>  delete mode 100644 package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
>  delete mode 100644 package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
>  delete mode 100644 package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch

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
