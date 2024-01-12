Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50A5C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A8C883F15;
	Fri, 12 Jan 2024 17:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A8C883F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grLUvWFuKb7T; Fri, 12 Jan 2024 17:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D52844D9;
	Fri, 12 Jan 2024 17:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D52844D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DACD1BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7624D4036F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7624D4036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwVMFMvNfYaB for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76228401C2
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76228401C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65C3B85FA2; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:21:10 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 82db018b9372af2a77f4d191526a994337f43102
X-Git-Newrev: aed89aae186be7af067372e6baad8f4a9c6d23f7
X-Patchwork-Hint: ignore
Message-Id: <20240112174407.65C3B85FA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/valijson: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=aed89aae186be7af067372e6baad8f4a9c6d23f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
