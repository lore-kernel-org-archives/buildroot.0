Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C8EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169846147E;
	Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzHxqlZA2pcj; Fri, 13 Feb 2026 19:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D4C61456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011412;
	bh=4pI++At2BTDGB37iAHBNtLuJD37SCKwVbtWCNgU12tU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BFMn+7Ln1hs786hTwtXnpPQc1g9k09zZZLqaf1hlcXWbAbHJk6OqSkONG4+P57XMA
	 BL1NJFh5L71MrywBwVqyDmHsDxAZ2MsC2hxMPan9NGh0PDZnwrk12PA9Y3pAnntj/T
	 aP+OoZ5ellZdoqDg9b4jg0MCr/IZwZhgbdxYowgKqkBCCS3oOaobaQi+gOGsPVrgvc
	 y1zQ2KaHqmvvT/cLnGS/Bu6AXKm0FurmtY8HuLXREW3VHf6xi7cRvFnGJyBNWk92xc
	 gFzIuxWzwKsaSLepEKqbpZXU3s3LJ1rhc+6E/M6zylmOtiQ5QoxTrGkqjwgxDY/8gY
	 N565mMue+Nncw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D4C61456;
	Fri, 13 Feb 2026 19:36:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2C569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1BE441E39
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbG8s3cB0gwa for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F3FC41E45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F3FC41E45
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 146738268D; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 287645b65df4559adcb9f8490d9d52c837bb4544
X-Git-Newrev: b6f85bbc9caf83345bc2806382626c61f91e641b
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.146738268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: add -N/--needs-update option
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6f85bbc9caf83345bc2806382626c61f91e641b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This commit adds the -N/--needs-update option, disabled by default,
to list only packages with newer upstream versions. All other packages
will be excluded from the HTML or JSON output.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ed9466e7f90595d7cc1cbf1d67829ce8dd5f1188)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d2d36257d9..55aa63c861 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1313,12 +1313,22 @@ def parse_args():
                         default=[])
     parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
                         help='Increase verbosity')
+    parser.add_argument('-N', '--needs-update', dest='needs_update', action='store_true',
+                        help='Only include packages with newer versions available')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
     return args
 
 
+def is_newer_version_available(pkg):
+    return not (
+        pkg.latest_version['status'] in (RM_API_STATUS_ERROR, RM_API_STATUS_NOT_FOUND) or
+        pkg.latest_version['version'] is None or
+        pkg.latest_version['version'] == pkg.current_version
+    )
+
+
 def __main__():
     global cvecheck
 
@@ -1376,6 +1386,8 @@ def __main__():
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
+    if args.needs_update:
+        packages = [pkg for pkg in packages if is_newer_version_available(pkg)]
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
