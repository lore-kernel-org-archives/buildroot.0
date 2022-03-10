Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602BFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B06B84373;
	Thu, 10 Mar 2022 21:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTXW2vcMXhCy; Thu, 10 Mar 2022 21:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BC4841FE;
	Thu, 10 Mar 2022 21:50:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82B601BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71B7D4167E
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrwlD38-vTws for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:50:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47B91415E0
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:50:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA8BC200002;
 Thu, 10 Mar 2022 21:50:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nSQfp-003nwa-Q1; Thu, 10 Mar 2022 22:50:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220220121637.200393-1-fontaine.fabrice@gmail.com>
Date: Thu, 10 Mar 2022 22:50:17 +0100
In-Reply-To: <20220220121637.200393-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Feb 2022 13:16:36 +0100")
Message-ID: <875yolzdd2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/gdk-pixbuf: enable relocatable option
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Enable relocatable option to fix the following PPD build failure of
 > adwaita-icon-theme:

 > Can't load file: Unrecognized image file format

 > This failure is raised because the SVG library is not found by
 > gtk-encode-symbolic-svg. To find the SVG library,
 > gtk-encode-symbolic-svg depends on libgtk_pixbuf library which reads the
 > loaders.cache file using:
 > - a hardcoded path (which points to host-gdk-pixbuf per-package
 >   directory) if relocatable is disabled. The loaders.cache in this
 >   directory doesn't declare SVG support because it has not yet been
 >   updated by host-librsvg
 > - or a dynamic path corresponding to the binary location if relocatable
 >   is enabled.

 > So obviously, we need to set relocatable to true.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Drop relocatable from target
 >  - Enhance commit message

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
