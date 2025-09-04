Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3366CA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCF760831;
	Thu,  4 Sep 2025 16:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XvlgTAuhvNp; Thu,  4 Sep 2025 16:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F38860823
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F38860823;
	Thu,  4 Sep 2025 16:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E69106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F84400AE
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAya5uOYZPHP for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E777D400A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E777D400A1
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E59F187EEF; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:13:14 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 5d4d8ef5909ebd75a7ef5e006989285763ecdd49
X-Git-Newrev: 3e14a3d714cc9f0910ad0bd918c0f6ee4528a765
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.E59F187EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] utils/test-pkg: add new
 option -T/--toolchain-name
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6785312772310404489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6785312772310404489==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3e14a3d714cc9f0910ad0bd918c0f6ee4528a765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Recently when trying to reproduce a build error with test-pkg on the toolchain
br-arm-basic, I had to create a new CSV file with that toolchain only to be
able to run the test in that single case.

I believe having a command-line option right away in test-pkg would make this
much easier, as I can now run: `./utils/test-pkg -T br-arm-basic -p redis`

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit f3be464f7ad6f1376e929010bce55950b6710632)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 utils/test-pkg | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cd77964252..cea7ace7cb 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -22,8 +22,8 @@ main() {
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakc:d:n:p:r:t:T:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -66,6 +66,9 @@ main() {
         (-t|--toolchains-csv)
             toolchains_csv="${2}"; shift 2
             ;;
+        (-T|--toolchain-name)
+            toolchain_name="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -113,7 +116,9 @@ main() {
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
     mapfile -t toolchains < <(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
-                                | if [ "${random}" -gt 0 ]; then \
+                                | if [ -n "${toolchain_name}" ]; then \
+                                    grep -E "[/^]${toolchain_name}.config"
+                                elif [ "${random}" -gt 0 ]; then \
                                     sort -R | head -n "${random}"
                                 elif [ "${number}" -gt 0 ]; then \
                                     head -n "${number}"
@@ -288,6 +293,12 @@ Options:
         try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be
         used.
 
+    -T NAME, --toolchain-name NAME
+        Name of the single toolchain to use. It must be defined in the CSV
+        list of toolchains (see also -t / --toolchains-csv). If this option
+        is specified, then a single build will be performed on that
+        specific toolchain only.
+
     -k, --keep
         Keep the build directories even if the build succeeds.
         Note: the logfile and configuration is always retained, even without

--===============6785312772310404489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6785312772310404489==--
