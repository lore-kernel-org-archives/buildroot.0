Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA1FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:34:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B38160F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B38160F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56275403F9;
	Tue, 26 Oct 2021 18:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grTaYhTLXC8S; Tue, 26 Oct 2021 18:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF39403ED;
	Tue, 26 Oct 2021 18:34:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ACC81BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3050C4011F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNljVHgQwNOT for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF4124022A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1760E88DD9; Tue, 26 Oct 2021 18:29:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:30:42 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 4bd955d5b70e1dc61ce14aef0205151b04107c6c
X-Git-Newrev: f61de573c18e527993df5efa8a542d663a5d16a2
X-Patchwork-Hint: ignore
Message-Id: <20211026182959.1760E88DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/smcroute: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=f61de573c18e527993df5efa8a542d663a5d16a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override SMCROUTE_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5c9764be06ff772dfa4bfbf860b936dbcd859640)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smcroute/smcroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0db0e084f6..45f4d6c1f0 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -16,7 +16,7 @@ SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
 SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-SMCROUTE_DEPENDENCIES = libcap
+SMCROUTE_DEPENDENCIES += libcap
 SMCROUTE_CONF_OPTS += --with-libcap
 else
 SMCROUTE_CONF_OPTS += --without-libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
