Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AB4C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30DAC83033;
	Sun, 18 Sep 2022 09:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30DAC83033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U64dxJ1sQb2u; Sun, 18 Sep 2022 09:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D14483145;
	Sun, 18 Sep 2022 09:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D14483145
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D32891BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC26682FAE
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC26682FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYOgV8gOILPF for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 176B882FA2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 176B882FA2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 046A984A39; Sun, 18 Sep 2022 09:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 11:35:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a3f28c84f5d686d5c5c4dd6abdc3229d81b5000b
X-Git-Newrev: fef387dfa9b45bfe637025f209a61c60403f4b3d
X-Patchwork-Hint: ignore
Message-Id: <20220918093925.046A984A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/polkit: fix typo
 in POLKIT_IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=fef387dfa9b45bfe637025f209a61c60403f4b3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The POLKIT_IGNORE_CVES variable was missing a "S",
therefore the CVE still showed up in the wrong column.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 58e60a32131fec1b363113cae592a45bb1999b05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 61666594a2..a8b371acf8 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -12,7 +12,7 @@ POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_INSTALL_STAGING = YES
 
 # Fix was comitted in a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
-POLKIT_IGNORE_CVE = CVE-2021-4034
+POLKIT_IGNORE_CVES += CVE-2021-4034
 
 POLKIT_DEPENDENCIES = \
 	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
