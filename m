Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DE0C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2641081433;
	Sun, 14 Jul 2024 09:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfWJzKXdAHso; Sun, 14 Jul 2024 09:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 416CE81426
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 416CE81426;
	Sun, 14 Jul 2024 09:08:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30F131BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8A0081372
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kc3MYxjoDOzK for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8AE481376
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8AE481376
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C54AC843FE; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:10:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32b4912a75d19b8883ddd8ed0c5851b4fe14e96b
X-Git-Newrev: e7dc2ccdb085447c9c3c9d94014bd4ca518acc19
X-Patchwork-Hint: ignore
Message-Id: <20240714090820.C54AC843FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/dl-wrapper: fix
 shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7dc2ccdb085447c9c3c9d94014bd4ca518acc19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore         |  1 -
 support/download/dl-wrapper | 20 ++++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index db28680f40..d36a70c18f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1528,7 +1528,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
 support/download/cargo-post-process Shellcheck
-support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
 support/download/go-post-process Shellcheck
 support/download/hg Shellcheck
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 069b2c1c21..d1ba281f79 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -22,7 +22,7 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 main() {
     local OPT OPTARG
     local backend output large_file recurse quiet rc
-    local -a uris hfiles
+    local -a uris hfiles backend_opts
 
     # Parse our options; anything after '--' is for the backend
     while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
@@ -58,6 +58,7 @@ main() {
     # If we can neither link nor copy, fallback to doing a download.
     # NOTE! This is not atomic, is subject to TOCTTOU, but the whole
     # dl-wrapper runs under an flock, so we're safe.
+    # shellcheck disable=SC2166  # -a works in this case
     if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
         ln "${old_dl_dir}/${filename}" "${output}" || \
         cp "${old_dl_dir}/${filename}" "${output}" || \
@@ -112,6 +113,12 @@ main() {
         tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
         tmpf="${tmpd}/output"
 
+        # shellcheck disable=SC2206  # all three are dash-options
+        backend_opts=( ${quiet} ${large_file} ${recurse} )
+        if [ "${urlencode}" ]; then
+            backend_opts+=( -e )
+        fi
+
         # Helpers expect to run in a directory that is *really* trashable, so
         # they are free to create whatever files and/or sub-dirs they might need.
         # Doing the 'cd' here rather than in all backends is easier.
@@ -122,7 +129,6 @@ main() {
         # the next URI until it succeeds. Once out of URI to try, we need to
         # cleanup and exit.
         if ! "${OLDPWD}/support/download/${backend}" \
-                $([ -n "${urlencode}" ] && printf %s '-e') \
                 -c "${cset}" \
                 -d "${dl_dir}" \
                 -n "${raw_base_name}" \
@@ -130,7 +136,9 @@ main() {
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
-                ${quiet} ${large_file} ${recurse} -- "${@}"
+                "${backend_opts[@]}" \
+                -- \
+                "${@}"
         then
             # cd back to keep path coherence
             cd "${OLDPWD}"
@@ -194,8 +202,8 @@ main() {
     # Some backends (cp and scp) may create executable files, so we need to
     # carry the executable bit if needed.
     [ -x "${tmpf}" ] && new_mode=755 || new_mode=644
-    new_mode=$(printf "%04o" $((0${new_mode} & ~0$(umask))))
-    chmod ${new_mode} "${tmp_output}"
+    new_mode="$(printf "%04o" $((0${new_mode} & ~0$(umask))))"
+    chmod "${new_mode}" "${tmp_output}"
 
     # We must *not* unlink tmp_output, otherwise there is a small window
     # during which another download process may create the same tmp_output
@@ -227,7 +235,7 @@ main() {
 
 trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
 warn()   { trace "${@}" >&2; }
-errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
+errorN() { local ret="${1}"; shift; warn "${@}"; exit "${ret}"; }
 error()  { errorN 1 "${@}"; }
 
 my_name="${0##*/}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
