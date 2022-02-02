Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400D9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E019840924;
	Wed,  2 Feb 2022 10:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzdWhXxxQLTt; Wed,  2 Feb 2022 10:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2217941648;
	Wed,  2 Feb 2022 10:21:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7C91BF588
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D6E460B20
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_je8rUVTSjm for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30EC260B31
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DF7EC200005;
 Wed,  2 Feb 2022 10:21:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nFClX-00067b-A6; Wed, 02 Feb 2022 11:21:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220202075651.1205886-1-fontaine.fabrice@gmail.com>
Date: Wed, 02 Feb 2022 11:21:31 +0100
In-Reply-To: <20220202075651.1205886-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Feb 2022 08:56:51 +0100")
Message-ID: <871r0lzhzo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jasper: disable programs
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
Cc: Michael Vetter <jubalh@iodoru.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable demo programs through JAS_ENABLE_PROGRAMS option which is
 > available and enabled by default since version 2.0.14 and
 > https://github.com/jasper-software/jasper/commit/e02518ce7161cd37ded64af78ac520e0424a9b12

 > As a side-effect, this will avoid the following build failure raised
 > since bump to version 2.0.33 in commit
 > f791221c8616bfa6d338ce6c287353395cc2c61a:

 > [ 96%] Linking C executable imginfo
 > /home/buildroot/autobuild/instance-3/output-1/per-package/jasper/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
 > attempted static link of dynamic object
 > `/home/buildroot/autobuild/instance-3/output-1/per-package/jasper/host/x86_64-buildroot-linux-uclibc/sysroot/lib/libc.so.1'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b106fdf32ffa9e0ef1254e0a29fdcdc821020e08

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
