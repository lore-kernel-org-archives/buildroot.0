Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C061C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:49:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F915610C7
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F915610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1558783B9D;
	Wed,  6 Oct 2021 15:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78DzHZCoDmT7; Wed,  6 Oct 2021 15:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9688379C;
	Wed,  6 Oct 2021 15:49:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34A731BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31DB084006
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNsTB0IG-zWr for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:48:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8228A83FDD
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:48:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5199092BBC; Wed,  6 Oct 2021 15:46:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:45:18 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 0d24f4a11250537686d71b0e3618fab979690764
X-Git-Newrev: 1c9162731b12254f1c5130c97429476c3a100515
X-Patchwork-Hint: ignore
Message-Id: <20211006154612.5199092BBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/openldap: bump to
 version 2.4.59
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c9162731b12254f1c5130c97429476c3a100515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6097cd235e63f176d09c858223272f33d81affc4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/Config.in     |  2 +-
 package/openldap/openldap.hash | 10 +++++-----
 package/openldap/openldap.mk   |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/openldap/Config.in b/package/openldap/Config.in
index bd39d0d022..7a0b2f4b87 100644
--- a/package/openldap/Config.in
+++ b/package/openldap/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_OPENLDAP
 
 	  This only installs client-side support.
 
-	  http://www.openldap.org/
+	  https://www.openldap.org/
 
 if BR2_PACKAGE_OPENLDAP
 
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 8ce50d6133..71092c93d0 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.md5
-md5  c203d735ba69976e5b28dc39006f29b5  openldap-2.4.58.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.sha1
-sha1  875416827be3ad63f20004510a354db0aaceb2ed  openldap-2.4.58.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.md5
+md5  6036a03b3a67b4a1fe1246e0a2c7265a  openldap-2.4.59.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.sha1
+sha1  b154d06bbf40fafafb34fffc4b116946d931efef  openldap-2.4.59.tgz
 # Locally computed
-sha256  57b59254be15d0bf6a9ab3d514c1c05777b02123291533134a87c94468f8f47b  openldap-2.4.58.tgz
+sha256  99f37d6747d88206c470067eda624d5e48c1011e943ec0ab217bae8712e22f34  openldap-2.4.59.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index daa409ae1d..b5373544ab 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.58
+OPENLDAP_VERSION = 2.4.59
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
