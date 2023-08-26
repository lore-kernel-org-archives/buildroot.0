Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AE8C83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9853B408AF;
	Sat, 26 Aug 2023 19:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9853B408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBQ8smgZblsn; Sat, 26 Aug 2023 19:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA355405FA;
	Sat, 26 Aug 2023 19:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA355405FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3381BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022A1417AA
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022A1417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qb0LsklEg_9i for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:08:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0881E4177E
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0881E4177E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC5C286420; Sat, 26 Aug 2023 19:08:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 21:01:21 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 0f400122d89cab1f113f455e1a5fceeb45c395e1
X-Git-Newrev: d04b0ad4c313d9d2ebf82d39607b25f31e976d7e
X-Patchwork-Hint: ignore
Message-Id: <20230826190838.EC5C286420@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/openssh: security
 bump version to 9.3p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d04b0ad4c313d9d2ebf82d39607b25f31e976d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes CVE-2023-38408: https://www.openssh.com/txt/release-9.3p2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ccdeeb213ec04551237414e9bc7cb9aa52b2851)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 2be54431ec..df472e087d 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.3 (base64 encoded)
-sha256  e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8  openssh-9.3p1.tar.gz
+# From https://www.openssh.com/txt/release-9.3p2
+sha256  200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8  openssh-9.3p2.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 26d6bd504d..e14d752290 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION_MAJOR = 9.3
-OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION_MINOR = p2
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
