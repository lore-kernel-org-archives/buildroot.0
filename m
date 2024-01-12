Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7809C47258
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719EC84675;
	Fri, 12 Jan 2024 17:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 719EC84675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7g4kjyrHuw0W; Fri, 12 Jan 2024 17:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE038466D;
	Fri, 12 Jan 2024 17:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE038466D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80DD21BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D556E84608
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D556E84608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8t3M8ByIB0W for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FCC784602
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FCC784602
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F14785F35; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:21:27 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f635b7c773c86c98ab0bb7629b38f1c867dd8fc1
X-Git-Newrev: b44f8dde55dfc911205cb3de4028dd14f3c56e1c
X-Patchwork-Hint: ignore
Message-Id: <20240112173721.0F14785F35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/valijson: drop
 unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=b44f8dde55dfc911205cb3de4028dd14f3c56e1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit d264b6e81e1a03c36df55c66771ed26dd767a522 forgot to drop
valijson_INSTALL_HEADERS option which has been removed with
https://github.com/tristanpenman/valijson/commit/c7d5f2cbec08b0e649fdeee6a99f2f1343baaa75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a1dce92c728a8df097dee7400305e116485a120a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/valijson/valijson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 51a9353960..875c913b09 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -11,6 +11,6 @@ VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_CPE_ID_VENDOR = valijson_project
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
-VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE -Dvalijson_BUILD_TESTS=FALSE
+VALIJSON_CONF_OPTS = -Dvalijson_BUILD_TESTS=FALSE
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
