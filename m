Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02C7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 17:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43A2140231;
	Wed, 29 Dec 2021 17:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBm_IH4mtG0J; Wed, 29 Dec 2021 17:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E35140168;
	Wed, 29 Dec 2021 17:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DECD1BF36C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990BC40168
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gi6ZPOB3wrgy for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 17:36:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65F054010C
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 17:36:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 87EEEE0006;
 Wed, 29 Dec 2021 17:36:33 +0000 (UTC)
Date: Wed, 29 Dec 2021 18:36:32 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211229183632.7ad17962@windsurf>
In-Reply-To: <20211229104149.560018-1-fontaine.fabrice@gmail.com>
References: <20211229104149.560018-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qpdf: bump to version 10.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Dec 2021 11:41:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version and C++14 now required)
> - openssl is an optional dependency since version 10.0.0 and
>   https://github.com/qpdf/qpdf/commit/0f2507234fbe3bd305404b1267607b9900857523
> - wchar is not mandatory since version 10.0.0 and
>   https://github.com/qpdf/qpdf/commit/2100b4ce152e9c70b3ce8760112d5a24ead4e52d
> - atomic is needed since version 10.0.0 and
>   https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c
> - C++14 is required since version 10.2.0 and
>   https://github.com/qpdf/qpdf/commit/1b3f84f967daf9a668a5b1f5337d5d3d96e9112b
> 
> http://qpdf.sourceforge.net/files/qpdf-manual.html#ref.release-notes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cups-filters/Config.in                |  8 +-
>  ...ests-cxx11.cc-fix-build-with-gcc-4.8.patch | 38 --------
>  ...to-be-safe-if-downstream-write-fails.patch | 86 -------------------
>  package/qpdf/Config.in                        |  9 +-
>  package/qpdf/qpdf.hash                        |  4 +-
>  package/qpdf/qpdf.mk                          | 14 ++-
>  6 files changed, 21 insertions(+), 138 deletions(-)
>  delete mode 100644 package/qpdf/0001-libtests-cxx11.cc-fix-build-with-gcc-4.8.patch
>  delete mode 100644 package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch

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
