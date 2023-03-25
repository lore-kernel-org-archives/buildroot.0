Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C68C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AEC981E56;
	Sat, 25 Mar 2023 21:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AEC981E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vsnJIdsfiFy; Sat, 25 Mar 2023 21:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B49481DED;
	Sat, 25 Mar 2023 21:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B49481DED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6356E1BF86D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BC6A416F5
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC6A416F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3gHAt1HwW6y for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B947416E2
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B947416E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 389CC82AB5; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:22:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5672e74fdc89a8f5a25789b454c28d5b9c33c3d4
X-Git-Newrev: 067a69412a5d274ed3771c52fb9864cc37cb16d8
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.389CC82AB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] manual: remove LIBFOO_GETTEXTIZE_OPTS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=067a69412a5d274ed3771c52fb9864cc37cb16d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-autotools.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index a041d91eb6..8655a79693 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -136,12 +136,6 @@ cases, typical packages will therefore only use a few of them.
   'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
   values are +YES+ and +NO+. The default is +NO+.
 
-* +LIBFOO_GETTEXTIZE_OPTS+, to specify additional options passed to
-  the 'gettextize' program, if +LIBFOO_GETTEXTIZE=YES+. You may
-  use that if, for example, the +.po+ files are not located in the
-  standard place (i.e. in +po/+ at the root of the package.) By
-  default, '-f'.
-
 * +LIBFOO_LIBTOOL_PATCH+ tells whether the Buildroot
   patch to fix libtool cross-compilation issues should be applied or
   not. Valid values are +YES+ and +NO+. By
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
