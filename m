Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971C1D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 692664097B;
	Thu, 11 Dec 2025 19:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqyAeBuHS0tE; Thu, 11 Dec 2025 19:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F3AC40F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481280;
	bh=5GJnK03G1WDmwetttYc3NgONu1egz1yWlgp4Oq3PSuM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sZasGtT4eywKF9Ud897djr4MvuR2aqGMDj/TSEBOtxHbTAm0WacrlJrT74N3xG3Vq
	 0M8NGDc7Q2dkne5hVvquW9rZPsx3q4V3qqEfAodUy9fwqhXnDGQkGJEZ7frhpwq0Lu
	 60QJ5sTmk+Yxd+Srjyogl5J1eIDBdodXspF3YGuOBAslc31R2DxE8L7Ss3eqz5WtF/
	 YmhQTppa1mIbxSYQxeWUQkTULTJPEwgvs0NelTexXe51zurydYFkcstJVX3UlEIvAB
	 DPtPl/F+oGU32HntUhkMOYh3Y2ieLQlQYkxASWwsNxyswOX4eI2gBuwFkKdUJhuHmn
	 MFtp1NGevNhgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F3AC40F31;
	Thu, 11 Dec 2025 19:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23108E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C03904007F
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYl0UIgCjfUU for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A93FF40029
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A93FF40029
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99E2486B46; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:41 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a2c5393f242d39d8453ea8dbc7f4cd7adf1e0625
X-Git-Newrev: 906620378b19c3c7acea119b513870e687d76b1c
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.99E2486B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: use an unique HTTP user-agent
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

commit: https://git.buildroot.net/buildroot/commit/?id=906620378b19c3c7acea119b513870e687d76b1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

As requested by the gnu.org admins:

"
Since August 2024, we've been under DDoS attacks from common command line
tools.

To fix this, we would need to change the user-agent from "Python/3.11
aiohttp/3.8.4" to "buildroot.org pkg-stats" instead.
"

It indeed probably makes sense to use an unique user-agent string, so rework
the script to do that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0981b4117dcbf323b7d90c6debf0f89685e21a95)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c659acb80e..7d9170e30f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -42,6 +42,8 @@ RM_API_STATUS_FOUND_BY_DISTRO = 2
 RM_API_STATUS_FOUND_BY_PATTERN = 3
 RM_API_STATUS_NOT_FOUND = 4
 
+HTTP_HEADERS = {'User-Agent': 'buildroot.org pkg-stats'}
+
 
 class Defconfig:
     def __init__(self, name, path):
@@ -469,7 +471,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
-        async with session.head(pkg.url) as resp:
+        async with session.head(pkg.url, headers=HTTP_HEADERS) as resp:
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
@@ -526,7 +528,7 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
 async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
     url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
     try:
-        async with session.get(url) as resp:
+        async with session.get(url, headers=HTTP_HEADERS) as resp:
             if resp.status != 200:
                 return False
 
@@ -553,7 +555,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
 async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
     url = "https://release-monitoring.org/api/projects/?pattern=%s" % pkg.name
     try:
-        async with session.get(url) as resp:
+        async with session.get(url, headers=HTTP_HEADERS) as resp:
             if resp.status != 200:
                 return False
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
