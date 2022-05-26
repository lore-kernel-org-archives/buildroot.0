Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6509DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED63161319;
	Thu, 26 May 2022 08:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tj0zICw6CKCt; Thu, 26 May 2022 08:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082EF61175;
	Thu, 26 May 2022 08:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 595461BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 460224255F
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGdA-wgga5YK for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:40:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7DC142540
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:40:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0018510000A;
 Thu, 26 May 2022 08:39:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nu92F-00HJqs-39; Thu, 26 May 2022 10:39:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220421063028.3647447-1-james.hilliard1@gmail.com>
Date: Thu, 26 May 2022 10:39:59 +0200
In-Reply-To: <20220421063028.3647447-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 21 Apr 2022 00:30:28 -0600")
Message-ID: <87wne8r8kg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gstd: fix init file installation
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Fix a bug where the init subdir was accidentially removed from meson.

FYI, it is very helpful for the LTS maintenance if you mention when this
bug was introduced (E.G. from the bump to 0.14.0 in a334b9a7668b).


> ---
 >  ...-meson.build-add-missing-init-subdir.patch | 28 +++++++++++++++++++
 >  1 file changed, 28 insertions(+)
 >  create mode 100644 package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch

 > diff --git a/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
 > new file mode 100644
 > index 0000000000..ed3738e3d4
 > --- /dev/null
 > +++ b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
 > @@ -0,0 +1,28 @@
 > +From 689265cd522c770ad3e0391cae80ee884a8c475c Mon Sep 17 00:00:00 2001
 > +From: James Hilliard <james.hilliard1@gmail.com>
 > +Date: Thu, 21 Apr 2022 01:14:52 -0500
 > +Subject: [PATCH] meson.build: add missing init subdir
 > +
 > +Seems this got accidentially removed in:
 > +9f4490138c8892b1c86008134438b2ab405c9b0f
 > +
 > +Restore it so that init files are properly installed.
 > +
 > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > +[upstreeam: https://github.com/RidgeRun/gstd-1.x/pull/291]
 > +---
 > + meson.build | 1 +
 > + 1 file changed, 1 insertion(+)
 > +
 > +diff --git a/meson.build b/meson.build
 > +index a30f776..7a8690a 100644
 > +--- a/meson.build
 > ++++ b/meson.build
 > +@@ -300,3 +300,4 @@ subdir('gst_client')
 > + subdir('tests')
 > + subdir('examples')
 > + subdir('docs')
 > ++subdir('init')
 > +-- 
 > +2.25.1
 > +
 > -- 

 > 2.25.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
