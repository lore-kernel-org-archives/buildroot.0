Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382FCC3DA7D
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 09:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D734D40BE3;
	Thu,  5 Jan 2023 09:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D734D40BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESOWZajT5oPk; Thu,  5 Jan 2023 09:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF9440BDC;
	Thu,  5 Jan 2023 09:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF9440BDC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0EED1BF964
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 09:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E758210C
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 09:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E758210C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZ-KwBjGX5zE for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 09:26:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66E7E8205D
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 09:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E7E8205D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56D74875DD; Thu,  5 Jan 2023 09:26:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jan 2023 10:24:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60b4b04dc23d32641981df984f383c1bb3078f8c
X-Git-Newrev: d7d48b9840d242acf1b8bfb141c89904e53301fe
X-Patchwork-Hint: ignore
Message-Id: <20230105092626.56D74875DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/check: disable doc
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7d48b9840d242acf1b8bfb141c89904e53301fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

documentation can be disabled since version 0.13.0 and
https://github.com/libcheck/check/commit/8ca1f79a73c374e9e9172937938947584c921659

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/check/check.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/check/check.mk b/package/check/check.mk
index be82539469..ccffd08ee3 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -10,6 +10,7 @@ CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPL-2.1+
 CHECK_LICENSE_FILES = COPYING.LESSER
+CHECK_CONF_OPTS = --disable-build-docs
 
 # Having checkmk in the target makes no sense
 define CHECK_REMOVE_CHECKMK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
