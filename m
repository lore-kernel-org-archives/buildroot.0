Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04CFC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8688742AB4;
	Mon, 20 Feb 2023 22:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8688742AB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RatWcsxBOin3; Mon, 20 Feb 2023 22:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A734EFCE;
	Mon, 20 Feb 2023 22:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A734EFCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 122361BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CBAA416D2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CBAA416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3JP7gy42lDu for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 524A2416CB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 524A2416CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5002286494; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:19:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8405dcae33b47bd5b8cf5ef4faf0db01644a1d4a
X-Git-Newrev: d534bb8d93319212b3c083b083189e8e7b414637
X-Patchwork-Hint: ignore
Message-Id: <20230220205209.5002286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swig: depend on
 host-pcre2 instead of host-pcre
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d534bb8d93319212b3c083b083189e8e7b414637
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump of swig to version 4.1.1 in commit
260924e239627cbe1379cfc752939245d53a06e0, host-pcre2 is needed instead
of host-pcre. Since is change that was introduced in swig 4.1.0, as
stated in
https://sourceforge.net/p/swig/news/2022/10/swig-410-released/:

  Update optional SWIG build dependency for regex support from PCRE to PCRE2

Fixes:

   http://autobuild.buildroot.net/results/3a70042aad7376bcccf56d639ced93f504f47963

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swig/swig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index d432cab53d..ad585c3f97 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -7,7 +7,7 @@
 SWIG_VERSION_MAJOR = 4.1
 SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
-HOST_SWIG_DEPENDENCIES = host-bison host-pcre
+HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
 HOST_SWIG_CONF_OPTS = \
 	--with-pcre \
 	--disable-ccache \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
