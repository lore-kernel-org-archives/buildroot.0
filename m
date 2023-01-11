Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592EC54EBC
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653AE41913;
	Wed, 11 Jan 2023 19:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 653AE41913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUkaE1JhFnjX; Wed, 11 Jan 2023 19:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B062418F5;
	Wed, 11 Jan 2023 19:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B062418F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6674B1BF3ED
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D9182033
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D9182033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEPU67pvSNbw for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 19:40:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF0981F92
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDF0981F92
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:40:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61D9E1C0006;
 Wed, 11 Jan 2023 19:40:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pFgxj-001zvp-90; Wed, 11 Jan 2023 20:40:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221230093435.118865-1-fontaine.fabrice@gmail.com>
Date: Wed, 11 Jan 2023 20:40:39 +0100
In-Reply-To: <20221230093435.118865-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 30 Dec 2022 10:34:35 +0100")
Message-ID: <871qo0hnbc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: fix host package
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

 > Disable webp and zstd on host package to avoid the following build
 > failure with host-gdk-pixbuf raised since bump to version 4.5.0 in
 > commit 5b62ea01369b11f5a4320bb2c909168b21c2642c:

 > Run-time dependency libtiff-4 found: NO (tried cmake)

 > ../output-1/build/host-gdk-pixbuf-2.42.10/meson.build:330:2: ERROR:
 > Dependency lookup for libtiff-4 with method 'pkgconfig' failed: Could
 > not generate cargs for libtiff-4:
 > Package libwebp was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `libwebp.pc'
 > to the PKG_CONFIG_PATH environment variable
 > Package 'libwebp', required by 'libtiff-4', not found

 > [...]

 > Run-time dependency libtiff-4 found: NO (tried cmake)

 > ../output-1/build/host-gdk-pixbuf-2.42.10/meson.build:330:2: ERROR:
 > Dependency lookup for libtiff-4 with method 'pkgconfig' failed: Could
 > not generate cargs for libtiff-4:
 > Package libzstd was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `libzstd.pc'
 > to the PKG_CONFIG_PATH environment variable
 > Package 'libzstd', required by 'libtiff-4', not found

 > While at it, also disable libdeflate even if no build failures are
 > raised by autobuilders

 > Fixes:
 >  - http://autobuild.buildroot.org/results/320083dfec4d126043b036cbaec7c7b85069a50a
 >  - http://autobuild.buildroot.org/results/8ff1cfa254920749a43e235c4084b8524d0edf6f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
