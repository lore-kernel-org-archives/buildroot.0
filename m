Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D493C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 12:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB2B683A47;
	Fri, 10 Nov 2023 12:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB2B683A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUTrJMYssHn4; Fri, 10 Nov 2023 12:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED93D83AA3;
	Fri, 10 Nov 2023 12:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED93D83AA3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D167F1BF997
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AE5240533
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AE5240533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeWKrJ_xhd_b for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 12:27:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 329C3418D3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329C3418D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2043186F34; Fri, 10 Nov 2023 12:27:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 13:20:30 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c07d5a4db17b6379d4d2ee5f9c4b11cef4eb5004
X-Git-Newrev: 45ccfb34ff4d50b60c233f96f5a69872fa6dc9ea
X-Patchwork-Hint: ignore
Message-Id: <20231110122703.2043186F34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/freeradius-server: fix python build
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

commit: https://git.buildroot.net/buildroot/commit/?id=45ccfb34ff4d50b60c233f96f5a69872fa6dc9ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure raised since bump to version 3.2.3 in
commit 4155139365247ea702bb536848dd1e771f98f0d2:

In file included from /home/thomas/autobuild/instance-1/output-1/host/include/python3.11/Python.h:38,
                 from src/modules/rlm_python3/rlm_python3.c:37:
/home/thomas/autobuild/instance-1/output-1/host/include/python3.11/pyport.h:596:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  596 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/36143ab06b66a047aa2247ea66b1df0d6c1cbd66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fdae1d231cae302bf903c128b77fd78db3dc0342)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeradius-server/freeradius-server.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 107eaf3ee4..16a817b680 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -149,7 +149,9 @@ FREERADIUS_SERVER_CONF_OPTS += --without-pcre
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python3
+FREERADIUS_SERVER_CONF_OPTS += \
+	--with-rlm_python3 \
+	--with-rlm-python3-config-bin=$(STAGING_DIR)/usr/bin/python3-config
 FREERADIUS_SERVER_DEPENDENCIES += python3
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
