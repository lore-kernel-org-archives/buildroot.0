Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BA5C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F1EE40236;
	Tue, 26 Jul 2022 22:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F1EE40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbJwT0w6oyuu; Tue, 26 Jul 2022 22:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FB1E401DD;
	Tue, 26 Jul 2022 22:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB1E401DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1C01BF9B9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3517240247
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3517240247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbSEZXiZFBxQ for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 419DD40118
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 419DD40118
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9925B86400; Tue, 26 Jul 2022 21:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 00:01:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ca7348fd445c6842ba2d8c20e4e76e49aa54fdb
X-Git-Newrev: f7403e4d35c89f14a6663dcd471382734b2a75ca
X-Patchwork-Hint: ignore
Message-Id: <20220726214921.9925B86400@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg-utils: drop host-diffutils
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7403e4d35c89f14a6663dcd471382734b2a75ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diffutils is now a host system dependency, so there is no need for
opkg-utils to depend on host-diffutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opkg-utils/opkg-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 369a4586e8..ad267c5c94 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -12,7 +12,6 @@ OPKG_UTILS_LICENSE_FILES = COPYING
 
 HOST_OPKG_UTILS_DEPENDENCIES = \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
-	host-diffutils \
 	host-lz4 \
 	host-xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
