Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B31C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D507440B61;
	Tue, 21 Feb 2023 20:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D507440B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCk0HXizd0ol; Tue, 21 Feb 2023 20:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3B9C4101B;
	Tue, 21 Feb 2023 20:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B9C4101B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44CD31BF94D
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EE8D8142C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EE8D8142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbMoqHUs5UAt for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C6D813FC
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C6D813FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 354C88666E; Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:34:02 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f09b5bec825e039130b3400461b067bb535e3434
X-Git-Newrev: 12123bd4a5fc1e63e6b4adc07a3ec5eef8c4f743
X-Patchwork-Hint: ignore
Message-Id: <20230221204903.354C88666E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/modsecurity2:
 disable pcre
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

commit: https://git.buildroot.net/buildroot/commit/?id=12123bd4a5fc1e63e6b4adc07a3ec5eef8c4f743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable pcre to avoid the following build failure if pcre-config is
found on host raised since bump to version 2.9.7 in commit
42e34cf10f9eb037aa8c48a4fb9e8f521901b983:

/home/thomas/autobuild/instance-0/output-1/per-package/modsecurity2/host/bin/../lib/gcc/mips64el-buildroot-linux-gnu/11.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: cannot find -lpcre: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/f4864f8cc1d07e357f6e5f8302c19ae94e9cf3af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 06af305874abc1eb4bb98dbd8aabe071fa5d77bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modsecurity2/modsecurity2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index c251291e64..88bbf3bb29 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -21,6 +21,7 @@ MODSECURITY2_CONF_OPTS = \
 	--with-apxs=$(STAGING_DIR)/usr/bin/apxs \
 	--without-curl \
 	--without-lua \
+	--without-pcre \
 	--without-yajl \
 	--without-ssdeep
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
