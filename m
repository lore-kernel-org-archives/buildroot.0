Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB499D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9153F410C3;
	Thu, 11 Dec 2025 19:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNFUiBLxFVZv; Thu, 11 Dec 2025 19:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879934110B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481404;
	bh=okeuxtp+enGgP5/aAVJtZUi0ZQZ6wXx7R/jCCowMM/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AsQD5y2CYxVtqTHUizrX7YeLA6xqxTPeKjuhxiZHQi2cbSMCo+ou4n3u+ZrO9eAWq
	 WhOyeupOLpqALd19nNSek3+U9rpiFC1C5rawTcVYpNL6FsyTjP6s54X4C/QOP44P0J
	 59004GiXed6nlO0weS3lRZP67Eog/5gblPBN2TgohLst6m4wd9lBTURFpRmmI8dEf5
	 rV+Rf5pbm8KiyvCVbH5Hr1aQC7IHzTbOlCKcurXwXPg+wKNjHNG/XIFEN1DHcg8PJN
	 LfNxojIUcUJVmpeoMniNpB2SAz4kPcMmkXN/l79NsjMKnfQOd72MFwz/nPWPGI7I71
	 f/x3ktGyoj4kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879934110B;
	Thu, 11 Dec 2025 19:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A872E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54BE880D2A
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiEAsahUynbi for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068AB80C56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 068AB80C56
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03D2B86BF1; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:17 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 67cdf2495f21564c596a1c49f3698c0215fdd04b
X-Git-Newrev: 83f3a7799ea0fce43b523627c0ec3c7ecfa08c98
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.03D2B86BF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/python3: security
 bump version to 3.13.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=83f3a7799ea0fce43b523627c0ec3c7ecfa08c98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

For release notes of this bugfix release, see [1].
While the release notes [1] does not mention any security fixes,
the more detailed change log at [2] has a security section:

- gh-139700: "Check consistency of the zip64 end of central directory
  record." refers to CVE-2025-8291 [3],
- gh-136065: "Fix quadratic complexity in os.path.expandvars()."
  refers to CVE-2025-6075 [4],
- gh-119342: "Fix a potential memory denial of service in the
  plistlib module." refers to CVE-2025-13837 [5].

Fixes:
- [3], [4] and [5].

[1] https://www.python.org/downloads/release/python-31310/
[2] https://docs.python.org/release/3.13.10/whatsnew/changelog.html#security
[3] https://www.cve.org/CVERecord?id=CVE-2025-8291
[4] https://www.cve.org/CVERecord?id=CVE-2025-6075
[5] https://www.cve.org/CVERecord?id=CVE-2025-13837

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add info in commit log about CVEs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9ae99d19b92aa922ab38cfc083944602d54e4eeb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index d1a8f3780f..778dca3b69 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3139/
-md5  516aabdf3de01eeefb6de1aacf9df810  Python-3.13.9.tar.xz
+# From https://www.python.org/downloads/release/python-31310/
+md5  5ada33c7f08d5d2df881657bdb8e848d  Python-3.13.10.tar.xz
 # Locally computed
-sha256  ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66  Python-3.13.9.tar.xz
+sha256  bc673c04375a1a3f0808c27ba8f0411ab811ad390a8740318ccb9c60fad8fd77  Python-3.13.10.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7aad14a8ca..6200b8af4e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
