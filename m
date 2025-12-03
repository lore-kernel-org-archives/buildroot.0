Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F89D15D85
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 853E18415D;
	Wed,  3 Dec 2025 21:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuoCXpV9Hazd; Wed,  3 Dec 2025 21:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B3BD83ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764797933;
	bh=YISNuf9NLPbN++rjQpfTrK08Zng5PYtsFfVF0GNzEcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kw9bDI5nerZX7MXmDlAZZuUfDGifn/xr3eK8J5DxnLw3Ir8qwegDh1OUH0SN0uhLF
	 UAqmolCkCB4jjUmc+dS+dtM+0Go5lmOVV51lxruTM0liiy9PVpRn5XPLaFZBc0V3jO
	 u5Aim0sQwU4OqsTfoyQBoiZiDSyq0lXPS4bBMwrjzkdCECIhdOqZkP+ZbvVukHxkvu
	 vDCWkoAmCeXIoBiFNAbQ+h/DIINc6Rhl3GK5/tJx9JJgzJZofvEMGGjwKoHu6z7eIe
	 s/3fAS3ois8jwOUkLnYXMogvY/oekNtxDHtoH2cLuAhn+xVVwhBOsvZEGZfxmiP3/h
	 yrUI3DCFxiZOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B3BD83ED2;
	Wed,  3 Dec 2025 21:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30F3BE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 225C583ED2
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0rOxyvTcrSS for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB7CF83E45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB7CF83E45
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3B718645D; Wed,  3 Dec 2025 21:38:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 22:32:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e88765aa1eb36035a88f67c7de88e0ec8ececcc
X-Git-Newrev: 0981b4117dcbf323b7d90c6debf0f89685e21a95
X-Patchwork-Hint: ignore
Message-Id: <20251203213850.D3B718645D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: use an unique
 HTTP user-agent
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0981b4117dcbf323b7d90c6debf0f89685e21a95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
