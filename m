Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D68E7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DB35608CE;
	Fri,  3 Apr 2026 10:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDr7dXGibxIP; Fri,  3 Apr 2026 10:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B525D608A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212020;
	bh=wEdwrDSKvWItJe1FP51fOVu9vMBeToJLIm01L3YUVd4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YjP2zkO1oJ5WQQB6McwePrhMVbrsFp2uJx14O58vX9C1VVbCMZYUbP+iHELGryqqY
	 60aU+kSPM1zzrp3CjDd3lPhwMVUt3lTmz9PbABKBTZHExzb9qwqdVyx4JPIiWUZ0Rz
	 4kSKyWCehFtJIc/JAkjZR19IjXGOYIgaoiiSC5eXNlBh3nryZrrMYgDjnrFFxVXLCU
	 IdVsFSRNaakWTvHlxKtpZQot/sZpJ5L5441DV07Ka2Ja3A6Ik+h8lQ7WnuWt4ouE84
	 1m/zgCoEJlypHEr4CZjbpgbiYgUvsAVimpdi7o22XLjaCKnE3dMmto5q2XUVBoXK0E
	 6DRbKtIRstpFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B525D608A6;
	Fri,  3 Apr 2026 10:27:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7793F2D3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 698EE40E7E
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMIXdmM2waiI for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE7040E7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABE7040E7C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36ABF7FFAA; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd3884b7360f610fb2e01ce690f344188bf48cd4
X-Git-Newrev: 22eb284823338dd9cfbaf08c0a98943c482f21a8
X-Patchwork-Hint: ignore
Message-Id: <20260403102657.36ABF7FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/faketime: rebase
 patch on v0.9.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22eb284823338dd9cfbaf08c0a98943c482f21a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

As of glibc 2.43, faketime build was broken in buildroot because of a
missing const qualifier. A patch was applied to it in master to fix this
issue.
Sadly, due to a difference in faketime version between master (v0.9.12) and
2025.02.x (v0.9.10), the patch didn't apply properly in 2025.02.x.

Rebase the faketime patch on v0.9.10.
Fixes:
https://autobuild.buildroot.org/results/761/761250e8cbb2602abdc7752d182a44b6f7de5e11

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 23 ++++++++--------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
index ce84d40699..c889dfae29 100644
--- a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
+++ b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
@@ -1,4 +1,4 @@
-From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
+From 1f4f260977a7fcd09fb71b83ee64c4d87b868441 Mon Sep 17 00:00:00 2001
 From: Tomas Korbar <tkorbar@redhat.com>
 Date: Mon, 15 Dec 2025 11:03:21 +0100
 Subject: [PATCH] Add const qualifiers to fix build with ISO C23
@@ -8,15 +8,17 @@ Fix https://github.com/wolfcw/libfaketime/issues/524
 Upstream: https://github.com/wolfcw/libfaketime/commit/dbe865dfdba0145d993d70b7fd4ec88b2f47554b
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Thomas: Rebased for version v0.9.10]
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 ---
- src/libfaketime.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/libfaketime.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/libfaketime.c b/src/libfaketime.c
-index ef1dca9..02839c8 100644
+index e632395..955cf3c 100644
 --- a/src/libfaketime.c
 +++ b/src/libfaketime.c
-@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
+@@ -2365,7 +2365,7 @@ int timespec_get(struct timespec *ts, int base)
  static void parse_ft_string(const char *user_faked_time)
  {
    struct tm user_faked_time_tm;
@@ -25,15 +27,6 @@ index ef1dca9..02839c8 100644
    char * nstime_str;
  
    if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
-@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
- bool str_array_contains(const char *haystack, const char *needle)
- {
-   size_t needle_len = strlen(needle);
--  char *pos = strstr(haystack, needle);
-+  const char *pos = strstr(haystack, needle);
-   while (pos) {
-     if (pos == haystack || *(pos - 1) == ',') {
-       char nextc = *(pos + needle_len);
 -- 
-2.47.3
+2.53.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
