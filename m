Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAB4C369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 340AD82042;
	Tue, 22 Apr 2025 19:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysfYpwuauDSB; Tue, 22 Apr 2025 19:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3385C81EDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3385C81EDF;
	Tue, 22 Apr 2025 19:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22ED519F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 141C960F20
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3qvNP_tj9q2 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B6060E86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31B6060E86
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2078A860EA; Tue, 22 Apr 2025 19:03:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 20:45:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd0b07d51b6e80fefb6e21893b9e881848c5f799
X-Git-Newrev: ca6a6837e16063fe4e3e69f70c7a8d4bc2d3504a
X-Patchwork-Hint: ignore
Message-Id: <20250422190309.2078A860EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: add -v/--verbose option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca6a6837e16063fe4e3e69f70c7a8d4bc2d3504a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Running pkg-stats is currently quite verbose, as it shows one line per
package when checking for the upstream URL, and another one line per
package when checking for the latest version on
release-monitoring.org.

This noisy output is a bit annoying when pkg-stats is run in a
cronjob, like we do to update https://autobuild.buildroot.net/stats/
every day. This commit adds a -v/--verbose option, off by default, to
have a less noisy output.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 203e9def71bd49f228ef87f7749deadfbfe4e23c)
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/pkg-stats | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 33c21e77b4..c134e1ec06 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -464,7 +464,7 @@ def package_init_make_info():
 check_url_count = 0
 
 
-async def check_url_status(session, pkg, npkgs, retry=True):
+async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
@@ -472,30 +472,33 @@ async def check_url_status(session, pkg, npkgs, retry=True):
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
-                print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
+                if verbose:
+                    print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
                 return
     except (aiohttp.ClientError, asyncio.TimeoutError):
         if retry:
-            return await check_url_status(session, pkg, npkgs, retry=False)
+            return await check_url_status(session, pkg, npkgs, retry=False, verbose=verbose)
         else:
             pkg.status['url'] = ("error", "invalid (err)")
             check_url_count += 1
-            print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
+            if verbose:
+                print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
             return
 
     pkg.status['url'] = ("ok", "valid")
     check_url_count += 1
-    print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
+    if verbose:
+        print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
 
 
-async def check_package_urls(packages):
+async def check_package_urls(packages, verbose=False):
     tasks = []
     connector = aiohttp.TCPConnector(limit_per_host=5)
     async with aiohttp.ClientSession(connector=connector, trust_env=True,
                                      timeout=aiohttp.ClientTimeout(total=15)) as sess:
         packages = [p for p in packages if p.status['url'][0] == 'ok']
         for pkg in packages:
-            tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages))))
+            tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages), verbose=verbose)))
         await asyncio.wait(tasks)
 
 
@@ -580,27 +583,30 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 check_latest_count = 0
 
 
-async def check_package_latest_version_get(session, pkg, npkgs):
+async def check_package_latest_version_get(session, pkg, npkgs, verbose=False):
     global check_latest_count
 
     if await check_package_get_latest_version_by_distro(session, pkg):
         check_latest_count += 1
-        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
+        if verbose:
+            print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
         return
 
     if await check_package_get_latest_version_by_guess(session, pkg):
         check_latest_count += 1
-        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
+        if verbose:
+            print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
         return
 
     check_package_latest_version_set_status(pkg,
                                             RM_API_STATUS_NOT_FOUND,
                                             None, None)
     check_latest_count += 1
-    print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
+    if verbose:
+        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
 
 
-async def check_package_latest_version(packages):
+async def check_package_latest_version(packages, verbose=False):
     """
     Fills in the .latest_version field of all Package objects
 
@@ -623,7 +629,7 @@ async def check_package_latest_version(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.is_actual_package]
         for pkg in packages:
-            tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages))))
+            tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages), verbose=verbose)))
         await asyncio.wait(tasks)
 
 
@@ -1272,6 +1278,8 @@ def parse_args():
     parser.add_argument('--disable', type=list_str,
                         help='Features to disable, comma-separated (cve, upstream, url, warning)',
                         default=[])
+    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
+                        help='Increase verbosity')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
@@ -1325,11 +1333,11 @@ def __main__():
     if "url" not in args.disable:
         print("Checking URL status")
         loop = asyncio.get_event_loop()
-        loop.run_until_complete(check_package_urls(packages))
+        loop.run_until_complete(check_package_urls(packages, verbose=args.verbose))
     if "upstream" not in args.disable:
         print("Getting latest versions ...")
         loop = asyncio.get_event_loop()
-        loop.run_until_complete(check_package_latest_version(packages))
+        loop.run_until_complete(check_package_latest_version(packages, verbose=args.verbose))
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
