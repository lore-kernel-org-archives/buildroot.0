Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BFAECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8784E410A4;
	Sun, 28 Aug 2022 09:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8784E410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cumoWNQ2B-Ba; Sun, 28 Aug 2022 09:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 223D3408A9;
	Sun, 28 Aug 2022 09:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 223D3408A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D37E1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DCA2402A1
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DCA2402A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7bqzKg_hj8i for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 594F64024A
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 594F64024A
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AB53587E7A; Sun, 28 Aug 2022 09:36:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 11:51:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b16ffabb5eff2fe9601f6cc01bfdb5fe431d846
X-Git-Newrev: 5ac1b1866db3e3e386d609c0f3b502789f6f8da5
X-Patchwork-Hint: ignore
Message-Id: <20220828093654.AB53587E7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: patch subjects shall not be
 numbered
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ac1b1866db3e3e386d609c0f3b502789f6f8da5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The script "utils/check-package" checks that patch email prefix are
not be numbered. See:
https://git.buildroot.org/buildroot/tree/utils/checkpackagelib/lib_patch.py?h=2022.08-rc1#n42

The error message recommends to generate patches to be included in
Buildroot with the command 'git format-patch -N'.

The patch policy section in the Buildroot manual does mention that.

This commit adds a note about that requirement.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/patch-policy.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index e704a0d3f3..063ef984d8 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -44,6 +44,11 @@ These patch files should be named +<number>-<description>.patch+.
 - The field +<number>+ in the patch file name refers to the 'apply order',
   and shall start at 1; It is preferred to pad the number with zeros up to 4
   digits, like 'git-format-patch' does. E.g.: +0001-foobar-the-buz.patch+
+- The patch email subject prefix shall not be numbered. Patches shall
+  be generated with the +git format-patch -N+ command, since this
+  numbering is automatically added for series. For example, the patch
+  subject line should look like +Subject: [PATCH] foobar the buz+ rather
+  than +Subject: [PATCH n/m] foobar the buz+.
 - Previously, it was mandatory for patches to be prefixed with the name of
   the package, like +<package>-<number>-<description>.patch+, but that is
   no longer the case. Existing packages will be fixed as time passes. 'Do
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
