Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCD9C433FE
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:48:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BF460F42
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3BF460F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7482480F12;
	Sat,  4 Sep 2021 20:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSnwgeCjOTIn; Sat,  4 Sep 2021 20:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C72A280F0A;
	Sat,  4 Sep 2021 20:48:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB7351BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A194014E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAp3OgGafGKj for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF5B140105
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:46:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4000E884AB; Sat,  4 Sep 2021 20:44:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:36:15 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: e476efa252294f025b5ce10e3e93519ad848e53c
X-Git-Newrev: 362b7143ead9c0de5dee0f32fb599bb3e5f3ee0b
X-Patchwork-Hint: ignore
Message-Id: <20210904204450.4000E884AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/terminology: set
 eet path
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=362b7143ead9c0de5dee0f32fb599bb3e5f3ee0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Set eet path to avoid the following build failure raised since bump to
version 1.9.0 in commit	6ac557a54bb4613e79728ad96724e7681c9c3c18 and
https://git.enlightenment.org/apps/terminology.git/commit/?id=f15dd2881a5e87e7f3b03594983826f7480c12e7:

/home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh: 30: /home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh: /usr/bin/eet: not found

Fixes:
 - http://autobuild.buildroot.org/results/767acf73e4eade48cd3fdb43e9dd599ba7ef9661

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 770ff2bc25404fb219221b843de2a0b35d2522eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/terminology/terminology.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index c17a6b0771..29b59fb39e 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -12,7 +12,9 @@ TERMINOLOGY_LICENSE_FILES = COPYING
 TERMINOLOGY_CPE_ID_VENDOR = enlightenment
 
 TERMINOLOGY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) efl host-pkgconf
-TERMINOLOGY_CONF_OPTS = -Dedje-cc=$(HOST_DIR)/bin/edje_cc
+TERMINOLOGY_CONF_OPTS = \
+	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
+	-Deet=$(HOST_DIR)/bin/eet
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 TERMINOLOGY_CONF_OPTS += -Dnls=true
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
