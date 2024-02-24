Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD29C54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 10:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B514882162;
	Sat, 24 Feb 2024 10:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXKIYEda0uN2; Sat, 24 Feb 2024 10:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A258214F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A258214F;
	Sat, 24 Feb 2024 10:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 163B71BF283
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 044B7820AB
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BUffB2lNm9J for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 10:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5085D81491
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5085D81491
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 10:17:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3448487A0D; Sat, 24 Feb 2024 10:17:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 11:15:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbedcfa221bc8826536a39b01eccf0626ab89bf1
X-Git-Newrev: 66cfd29e97a00d5210da38fe45ea2effe23bea94
X-Patchwork-Hint: ignore
Message-Id: <20240224101749.3448487A0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: security bump to version
 1.27.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=66cfd29e97a00d5210da38fe45ea2effe23bea94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2024-25629: Reading malformatted /etc/resolv.conf,
/etc/nsswitch.conf or the HOSTALIASES file could result in a crash.

https://github.com/c-ares/c-ares/security/advisories/GHSA-mg26-v6qh-x48q
https://github.com/c-ares/c-ares/releases/tag/cares-1_27_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index ee097a53c9..9a2b69c731 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  bed58c4f02b009080ebda6c2467ba469722ac6aebbf4497dc44a83d8c6194e50  c-ares-1.26.0.tar.gz
+sha256  0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b  c-ares-1.27.0.tar.gz
 
 # Hash for license file
 sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 29da6baa4b..c4441255a2 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.26.0
+C_ARES_VERSION = 1.27.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
