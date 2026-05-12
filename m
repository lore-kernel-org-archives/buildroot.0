Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8898CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24FA41B47;
	Fri, 15 May 2026 13:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9op43rKZ1eys; Fri, 15 May 2026 13:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE5A41B75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851825;
	bh=bVVAve2f7ehJGLAprXxt+aromX8QDCBnVmqlSjlHsEs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XUHjUMUWyP/2akHw+/1QNLNUpt7DwCN2UToK22ZHEbgT74RPtWHzVmkVDAEs5HZDL
	 i0Dt017G7ZdhlIxAl8WuydTamuWb3wd6V81FuulK3ix1PvQ1f+9u3LxyiRtQmANC57
	 QL1H+hQe72FTigOlopLoIAYs1ubcUOIbFOdpcHOiPYwR+7X9wVIvW83XC/hHW+J7fa
	 GRyEjXBpV1L9VM49Rz1ij+SQQQB9/8HgYdEEqWx0VZv+/W1rz0rQo4CN3RN1LNxbNH
	 S5qyzCufBpfl9Jdu2Em+WwQ+5l+MAmu6Vx9LJk/mgHC2SJR2UjDBY/i+QvkMQCSdSg
	 wKpUGpvcg71fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DE5A41B75;
	Fri, 15 May 2026 13:30:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FA936E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ED9B41A70
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvEfkINDf_AG for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0778B40E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0778B40E22
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AE6886356; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:18:15 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b0efb8c15e48abe0ea6b33c98361f7acce8463e0
X-Git-Newrev: 226f163aa06a579c5233877ac11da2400fff0a25
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.5AE6886356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/lcms2: security
 bump version to 2.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/226f163aa06a579c5233877ac11da2400fff0a25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://littlecms.com/blog/2026/04/17/lcms2-2.19/
https://github.com/mm2/Little-CMS/blob/lcms2.19/ChangeLog

Fixes CVE-2026-41254:
https://security-tracker.debian.org/tracker/CVE-2026-41254

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c409050184c743ebcf65640cc8eb5c56cc9f570e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index e2277ba610..0ff881158f 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.18
-sha1  3917db04b8d19b62ea6c9d8f4ff0404d145aca4a  lcms2-2.18.tar.gz
-# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
-sha256  ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347  lcms2-2.18.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.19
+sha1  bedb39ede32b76bc2cb24ee531d7433cf787b319  lcms2-2.19.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19
+sha256  49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216  lcms2-2.19.tar.gz
 # Locally computed:
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 4ffad41014..32a78a4f35 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.18
+LCMS2_VERSION = 2.19
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
