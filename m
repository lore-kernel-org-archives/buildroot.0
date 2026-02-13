Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC7EEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B356D613BF;
	Fri, 13 Feb 2026 19:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfFST2IiEpKt; Fri, 13 Feb 2026 19:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B99D8616DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011562;
	bh=QUGWu4CU/CSkQ6V/kAnfU01pdJPBqPg2F7L1JbDbUcM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y/JU+HUqFAzkwg4Q6DRlnBEnATYyCMzcDwn1hRghLJL/mwliG9WZ6yMvxAqWAfEg/
	 R3TDkNO+40O3g2Z+gu/4l9PDz1ZRp/n1N7b5Bv7Ad0/xvENylcpSfIMoVt7ElbxU5/
	 jOIpmGqmYZ5Q322qZpHIBZFJXpfKMA3sTpG4VUskzNGmBklJhY/AlsugpfMzw99zyG
	 mMUnmPe1A+Dx9lXIndDzH7cuh6KfUBYY8pfa9sJoae2op2nxxkYjR5W+NQsjfwIMpf
	 5es6wvISAVFfhFh2gLlsAurFucyal7gQ5vvp+wgMFe4kYto0CxOZSmJyH4teBJSrTz
	 4tyy1qmh0KRyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B99D8616DB;
	Fri, 13 Feb 2026 19:39:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C499A283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBB2841303
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXaU634AxaB0 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FA14413C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FA14413C0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 952A5825CC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ba56a26342a56a18b32976f8c4783b06f41def3e
X-Git-Newrev: efa9144d57d52c41c7cb9b11afb07d8697ea4b17
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.952A5825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/efa9144d57d52c41c7cb9b11afb07d8697ea4b17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
