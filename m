Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA99C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AF9240901;
	Tue, 11 Jan 2022 21:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4NJPruI-aS2; Tue, 11 Jan 2022 21:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E92B408FE;
	Tue, 11 Jan 2022 21:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 303BE1BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ED8B6FB36
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2P0x_bcS7-Lm for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:14:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24E316FB29
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:14:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6836B1C0005;
 Tue, 11 Jan 2022 21:14:57 +0000 (UTC)
Date: Tue, 11 Jan 2022 22:14:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220111221456.6b96cc93@windsurf>
In-Reply-To: <20220111174345.2482393-1-fontaine.fabrice@gmail.com>
References: <20220111174345.2482393-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gstreamer1-mm: drop
 package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jan 2022 18:43:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gstreamer1-mm is not compatible with glibmm-2.68 API and not actively
> maintained anymore (one commit during the last 3 years):
> https://gitlab.gnome.org/GNOME/gstreamermm/-/issues/17
> https://gitlab.gnome.org/GNOME/gstreamermm/-/commits/master
> 
> As this is the only package that doesn't support glibmm-2.68 and because
> it can't be easily patched, drop it to avoid the following build failure
> raised since commit dddb65efbdf2c7952f22a1e51009f17f1676db4a:
> 
> Package 'giomm-2.4', required by 'virtual:world', not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3479688334765fbbe4cb9620f4d3596f7d710404
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy                              |  7 +++
>  package/gstreamer1/Config.in                  |  1 -
>  .../0001-Fix-build-against-glib-2-68.patch    | 44 -------------------
>  package/gstreamer1/gstreamer1-mm/Config.in    | 29 ------------
>  .../gstreamer1-mm/gstreamer1-mm.hash          |  6 ---
>  .../gstreamer1/gstreamer1-mm/gstreamer1-mm.mk | 24 ----------
>  6 files changed, 7 insertions(+), 104 deletions(-)
>  delete mode 100644 package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
>  delete mode 100644 package/gstreamer1/gstreamer1-mm/Config.in
>  delete mode 100644 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
>  delete mode 100644 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk

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
