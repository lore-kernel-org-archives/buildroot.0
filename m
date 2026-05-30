Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62688CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7EA42C5C;
	Sat, 30 May 2026 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArsxE-ZUfu6H; Sat, 30 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2586042C53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129680;
	bh=5D/58QaCDwjzqzOyn6IV6akmRMFozBstg6kB5Ey5cs0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZsHoq/4JP2sjHb6BxxC0IJeetjGW6Bg/fr1pya7XHZbi7tsnWBi0DbwieMM2SHqFw
	 b9F+LfSaek5IvMtZJSy9HiQgr5M541vjYyDA4rqopOd0Xh/+r72VxVA0eKEO+HZqpw
	 NAFyF4fMyOut2Xqnsy+J4HziQiUrk/mfC3nzwKUqaviVubWs7RZQ7CQLYTDFPNORQ/
	 oJg02NECPheVxBspYaBsh9YhjAq64gcYrCDQ6VS8pKgAKj8rT9MONhZ4QFWCilYm0c
	 d3G7zC2yaPhxcWnTtjziQMDmqihXJwWPNaJ6fptn7Lie4z0mHOy7JxMV41fWpvzg4N
	 fWpzXqAGqVJOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2586042C53;
	Sat, 30 May 2026 08:28:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46127F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F368500C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycGC60MocCN6 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638C885008
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638C885008
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DA02837F2; Sat, 30 May 2026 08:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:25:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 758e5cdbddddcc41149e78626e12b834d288fa29
X-Git-Newrev: da01b7271a4a9048ae8e8ae18753edc5da785a44
X-Patchwork-Hint: ignore
Message-Id: <20260530082744.6DA02837F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/bump-stable-kernel-versions: update
 for split hash file
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da01b7271a4a9048ae8e8ae18753edc5da785a44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
linux hash files are split between pre- and post-6.17.

Since that commit, the script that automatically updates kernel
versions in Buildroot was broken, as it assumed only a single linux
hash file at a static location. Update the script to find all relevant
files, even if a new split occurs in the future.

In addition, this patch carries additional minor changes:
- Fix some minor shellcheck issues found with a newer shellcheck version
  than in the container (quoting, test -a -> -e)
- Move from wget to curl, as I had some issue on my home connection
  with the former (possibly ipv6 related or something)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/bump-stable-kernel-versions | 121 ++++++++++++++++++++------------------
 1 file changed, 65 insertions(+), 56 deletions(-)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index 577a6841c8..6303bf4010 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -16,7 +16,7 @@
 # OTHER DEALINGS IN THE SOFTWARE.
 
 # Check for updates to Linux stable releases. The script uses the versions found in
-# linux/linux.hash. For each of the versions it downloads the related hash list and tries
+# linux/*/linux.hash. For each of the versions it downloads the related hash list and tries
 # to find an updated stable release. If found it updates all related files and hashes.
 
 set -euo pipefail
@@ -26,70 +26,79 @@ latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
 echo "${latest_version} -> ${latest_release_version}"
 
 updated_releases_list=''
+updated_versions='Update the latest kernel releases to:'
 
-hash_list=
-while read -r line; do
-    # e.g.: # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-    url=$(echo "${line}" | sed -n 's|^# From \(https://www\.kernel\.org/pub/linux/kernel/.*/sha256sums.asc\)|\1|p')
-    # e.g.: sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
-    old_hash=$(echo "${line}" | sed -rn 's|^sha256 +([0-9a-f]+) +linux-.*$|\1|p')
-    old_version=$(echo "${line}" | sed -rn 's|^sha256 +[0-9a-f]+ +linux-(.+)\.tar\.xz$|\1|p')
-    if [ -n "${url}" ]; then
-        # Line contained a URL: Download hash list and use it.
-        if [ -a "${hash_list}" ]; then
-            rm "${hash_list}"
-        fi
+update_linux_hash() {
+    HASHFILE="$1"
+    hash_list=
+    while read -r line; do
+        # e.g.: # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+        url=$(echo "${line}" | sed -n 's|^# From \(https://www\.kernel\.org/pub/linux/kernel/.*/sha256sums.asc\)|\1|p')
+        # e.g.: sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
+        old_hash=$(echo "${line}" | sed -rn 's|^sha256 +([0-9a-f]+) +linux-.*$|\1|p')
+        old_version=$(echo "${line}" | sed -rn 's|^sha256 +[0-9a-f]+ +linux-(.+)\.tar\.xz$|\1|p')
+        if [ -n "${url}" ]; then
+            # Line contained a URL: Download hash list and use it.
+            if [ -e "${hash_list}" ]; then
+                rm "${hash_list}"
+            fi
 
-        hash_list=$(basename "${url}")
-        echo ">>> Downloading hash list from ${url}"
-        wget --no-verbose "${url}"
-        gpg --verify "${hash_list}"
+            hash_list=$(basename "${url}")
+            echo ">>> Downloading hash list from ${url}"
+            curl -q "${url}" > "${hash_list}"
+            gpg --verify "${hash_list}"
 
-        echo "${line}" >> linux/linux.hash.new
-    elif [ -n "${old_version}" ]; then
-        # Line contained a hash entry: Search for newer versions.
-        release_version=$(echo "${old_version}" | cut -f 1-2 -d .) # e.g.: 6.8 instead of 6.8.9
-        # e.g.: 19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
-        new_hash_entry=$(grep "^[0-9a-f]\+ \+linux-${release_version//./\\.}\.[0-9]\+\.tar\.xz$" "${hash_list}" | sort -V --key '2' | tail -1)
-        new_hash=$(echo "${new_hash_entry}" | cut -f 1 -d ' ')
-        new_version=$(echo "${new_hash_entry}" | cut -f 3 -d ' ' | sed -rn 's|linux-(.+)\.tar\.xz|\1|p')
+            echo "${line}" >> "$HASHFILE.new"
+        elif [ -n "${old_version}" ]; then
+            # Line contained a hash entry: Search for newer versions.
+            release_version=$(echo "${old_version}" | cut -f 1-2 -d .) # e.g.: 6.8 instead of 6.8.9
+            # e.g.: 19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
+            new_hash_entry=$(grep "^[0-9a-f]\+ \+linux-${release_version//./\\.}\.[0-9]\+\.tar\.xz$" "${hash_list}" | sort -V --key '2' | tail -1)
+            new_hash=$(echo "${new_hash_entry}" | cut -f 1 -d ' ')
+            new_version=$(echo "${new_hash_entry}" | cut -f 3 -d ' ' | sed -rn 's|linux-(.+)\.tar\.xz|\1|p')
 
-        if [ "$new_version" == "$old_version" ]; then
-            # Same version as before
-            echo ">>> Release ${release_version}.x already on newest version ${new_version}."
-            echo "${line}" >> linux/linux.hash.new
+            if [ "$new_version" == "$old_version" ]; then
+                # Same version as before
+                echo ">>> Release ${release_version}.x already on newest version ${new_version}."
+                echo "${line}" >> "$HASHFILE.new"
 
-            if [ "${old_hash}" != "${new_hash}" ]; then
-                # Hash changed! This should never happen!
-                echo ">>> Version hash changed for ${release_version}.x!"
-                echo ">>> It was: ${old_hash}"
-                echo ">>> It is:  ${new_hash}"
-                exit 1
-            fi
-        else
-            # Different version: update hash list, default headers, and possibly latest
-            # version.
-            echo ">>> Updating hash for ${release_version}.x in linux/linux.hash"
-            echo "sha256  ${new_hash}  linux-${new_version}.tar.xz" >> linux/linux.hash.new
+                if [ "${old_hash}" != "${new_hash}" ]; then
+                    # Hash changed! This should never happen!
+                    echo ">>> Version hash changed for ${release_version}.x!"
+                    echo ">>> It was: ${old_hash}"
+                    echo ">>> It is:  ${new_hash}"
+                    exit 1
+                fi
+            else
+                # Different version: update hash list, default headers, and possibly latest
+                # version.
+                echo ">>> Updating hash for ${release_version}.x in $HASHFILE"
+                echo "sha256  ${new_hash}  linux-${new_version}.tar.xz" >> "$HASHFILE.new"
 
-            echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
-            sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
-                package/linux-headers/Config.in.host linux/Config.in
+                echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
+                sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
+                    package/linux-headers/Config.in.host linux/Config.in
 
-            updated_releases_list="${updated_releases_list} ${release_version}.x"
-        fi
-    else
-        # Different line: Reset hash list and just copy this line over as is.
-        if [ -a "${hash_list}" ]; then
-            rm "${hash_list}"
-            hash_list=
+                updated_releases_list="${updated_releases_list} ${release_version}.x"
+                updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
+            fi
+        else
+            # Different line: Reset hash list and just copy this line over as is.
+            if [ -e "${hash_list}" ]; then
+                rm "${hash_list}"
+                hash_list=
+            fi
+            echo "${line}" >> "$HASHFILE.new"
         fi
-        echo "${line}" >> linux/linux.hash.new
-    fi
-done < linux/linux.hash
+    done < "$HASHFILE"
+
+    # We were iterating over this file so we could not edit in-place.
+    mv "$HASHFILE.new" "$HASHFILE"
+}
 
-# We were iterating over this file so we could not edit in-place.
-mv linux/linux.hash.new linux/linux.hash
+while IFS= read -r -d '' hashfile; do
+    update_linux_hash "$hashfile"
+done < <(find linux/ -name '*.hash' -type f -print0)
 
 if [ -n "${updated_releases_list}" ]; then
     echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
