Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02A0C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A22A417FF;
	Wed, 30 Aug 2023 20:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A22A417FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2quQM9JCQhN; Wed, 30 Aug 2023 20:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3BBF417FD;
	Wed, 30 Aug 2023 20:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3BBF417FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD38F1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96618417FD
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96618417FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyeqFuDkyPhc for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:49:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95FBE417E9
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95FBE417E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8229486635; Wed, 30 Aug 2023 20:49:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:22:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 829610c701ba322514facd8e24ef4b9518a00601
X-Git-Newrev: 8997c746fa53db665e00dc5e325600cdf7a0a71c
X-Patchwork-Hint: ignore
Message-Id: <20230830204913.8229486635@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix typos
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8997c746fa53db665e00dc5e325600cdf7a0a71c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3248e3678d..eea900124c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -84,7 +84,7 @@ class Package:
     all_ignored_cves = dict()
     all_cpeids = dict()
     # This is the list of all possible checks. Add new checks to this list so
-    # a tool that post-processeds the json output knows the checks before
+    # a tool that post-processes the json output knows the checks before
     # iterating over the packages.
     status_checks = ['cve', 'developers', 'hash', 'license',
                      'license-files', 'patches', 'pkg-check', 'url', 'version']
@@ -259,7 +259,7 @@ class Package:
         if var in self.all_cpeids:
             self.cpeid = self.all_cpeids[var]
             # Set a preliminary status, it might be overridden by check_package_cpes()
-            self.status['cpe'] = ("warning", "not checked against CPE dictionnary")
+            self.status['cpe'] = ("warning", "not checked against CPE dictionary")
         else:
             self.status['cpe'] = ("error", "no verified CPE identifier")
 
@@ -499,7 +499,7 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
 
 
 async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
-    url = "https://release-monitoring.org//api/project/Buildroot/%s" % pkg.name
+    url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
     try:
         async with session.get(url) as resp:
             if resp.status != 200:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
