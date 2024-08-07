Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D6C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 114DB40215;
	Wed,  7 Aug 2024 10:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULfJky9Lx6l4; Wed,  7 Aug 2024 10:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB6640306
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB6640306;
	Wed,  7 Aug 2024 10:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 732191BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A6740120
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Q7DR7uCroIp for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ED12400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ED12400A4
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CE7384487; Wed,  7 Aug 2024 10:05:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 12:04:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6f4d79df21b2affa1ccc5133c44647072d21058
X-Git-Newrev: 9f66a80bf0482346262194eff163b2cc00aae760
X-Patchwork-Hint: ignore
Message-Id: <20240807100529.5CE7384487@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swipl: host-swipl needs host-zlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f66a80bf0482346262194eff163b2cc00aae760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-swipl fails to configure with CMake error message:

    Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)

This commit fixes the issue by adding the missing host-zlib
dependency.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swipl/swipl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index 9ba841084e..595f5e975b 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -9,6 +9,8 @@ SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
 
+HOST_SWIPL_DEPENDENCIES = host-zlib
+
 SWIPL_DEPENDENCIES = host-swipl zlib
 
 # A host-swipl is needed to compile the target prolog boot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
