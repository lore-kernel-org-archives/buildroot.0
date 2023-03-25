Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F1BC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8256A82089;
	Sat, 25 Mar 2023 21:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8256A82089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMGkBfTJvvaK; Sat, 25 Mar 2023 21:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6EF482079;
	Sat, 25 Mar 2023 21:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6EF482079
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CABA91BF39A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72BF9404AF
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72BF9404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fi6X6c8Iz1DP for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4A2B4047B
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A2B4047B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2A2B82AB5; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:56:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9e1cd239f179e15f7f4214e274282d4e2bb5b7d
X-Git-Newrev: 2bc95879f7d61d5e02bb5e90e3ba0eeade8fa166
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.B2A2B82AB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] manual: drop LIBFOO_GETTEXTIZE,
 add LIBFOO_AUTOPOINT
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bc95879f7d61d5e02bb5e90e3ba0eeade8fa166
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-autotools.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 8655a79693..ad96957f3d 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -130,10 +130,9 @@ cases, typical packages will therefore only use a few of them.
   passed to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. By default, empty.
 
-* +LIBFOO_GETTEXTIZE+, tells whether the package should be
-  gettextized or not (i.e. if the package uses a different gettext
-  version than Buildroot provides, and it is needed to run
-  'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
+* +LIBFOO_AUTOPOINT+, tells whether the package should be
+  autopointed or not (i.e. if the package needs I18N infrastructure
+  copied in.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
   values are +YES+ and +NO+. The default is +NO+.
 
 * +LIBFOO_LIBTOOL_PATCH+ tells whether the Buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
