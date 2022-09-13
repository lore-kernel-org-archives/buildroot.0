Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AB1C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F6FC831F2;
	Tue, 13 Sep 2022 14:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6FC831F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9V6eZLAqII7; Tue, 13 Sep 2022 14:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE592831D5;
	Tue, 13 Sep 2022 14:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE592831D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6191BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A92482F99
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A92482F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WkPh3eF69Kk for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:53:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E310830E2
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E310830E2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8E2228382D; Tue, 13 Sep 2022 14:53:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:42:45 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4d8512dc76282ec8ecc7bf299248d1ef2a432242
X-Git-Newrev: 5e2277fb204bf6d08f1ddffb84b422a346d2942b
X-Patchwork-Hint: ignore
Message-Id: <20220913145313.8E2228382D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/babeltrace2: fix
 host package build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e2277fb204bf6d08f1ddffb84b422a346d2942b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

While building host-babeltrace2 asciidoc python3 module is required but
Buildroot doesn't make it available, so let's --disable-man-pages for host
as we do for target.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6685b5ae643aa7f832cb1a5edf4e417125cb58ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/babeltrace2/babeltrace2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index eedfc72b8c..2b2ab7db40 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -17,7 +17,7 @@ BABELTRACE2_DEPENDENCIES = libglib2 host-pkgconf
 # options for host packages, just build support for it
 # unconditionally.
 HOST_BABELTRACE2_DEPENDENCIES = host-libglib2 host-pkgconf host-elfutils
-HOST_BABELTRACE2_CONF_OPTS += --enable-debug-info
+HOST_BABELTRACE2_CONF_OPTS += --disable-man-pages --enable-debug-info
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 BABELTRACE2_DEPENDENCIES += elfutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
