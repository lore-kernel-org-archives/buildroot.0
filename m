Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B0C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 08:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F1C080D50;
	Wed, 26 Oct 2022 08:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F1C080D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvavBLlCCoco; Wed, 26 Oct 2022 08:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C333180C41;
	Wed, 26 Oct 2022 08:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C333180C41
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 711881BF990
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 593A940225
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593A940225
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7loA4v3179o for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 420644012C
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 420644012C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B8A4870E4; Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 10:52:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 382d33dfa64202a79968ff54d729fb37479cbd65
X-Git-Newrev: e6c9a95a34eec997168780d9049560f26cfaeb60
X-Patchwork-Hint: ignore
Message-Id: <20221026085456.2B8A4870E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: security bump to version 5.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6c9a95a34eec997168780d9049560f26cfaeb60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2022-41317: Exposure of Sensitive Information in Cache Manager
  https://www.openwall.com/lists/oss-security/2022/09/23/1

- CVE-2022-41318: Buffer Over Read in SSPI and SMB Authentication
  https://www.openwall.com/lists/oss-security/2022/09/23/2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 22c6db8c70..b00d14011e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v5/squid-5.6.tar.xz.asc
-md5  2f2201a18a0a727ab589d951ebe4f815  squid-5.6.tar.xz
-sha1  a01f47b3e9ff06245c894773de30bfd88ab14f65  squid-5.6.tar.xz
+# From http://www.squid-cache.org/Versions/v5/squid-5.7.tar.xz.asc
+md5  7a3764a3c5833631a779d7827901cda7  squid-5.7.tar.xz
+sha1  141e8007d6b1cfee34654127a9ca025125b37b58  squid-5.7.tar.xz
 # Locally calculated
-sha256  38d27338a347597ce0e93d0c3be6e5f66b6750417c474ca87ee0d61bb6d148db  squid-5.6.tar.xz
+sha256  6b0753aaba4c9c4efd333e67124caecf7ad6cc2d38581f19d2f0321f5b7ecd81  squid-5.7.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 86a0c714c6..355af0b902 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 5.6
+SQUID_VERSION = 5.7
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v5
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
