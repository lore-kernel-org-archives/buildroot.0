Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D44CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECDE14101D;
	Fri, 12 Jun 2026 11:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NT9IZ_3PQTh0; Fri, 12 Jun 2026 11:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 111F341129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263351;
	bh=y5RgZF4qxeo/vXw6dr695GCFRgoCydhpiTxv7V++1so=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1OBwghdBpuN5OT4A/asMdO2Lm8W8uSkwVFUJdvWWNyOAPG4NpM2K3ltJaOD3uv3b
	 ZRiVAJEIgqBJX4c6lb5Uf4sCeVeA26KFnjdwyWgL3AtlJLtf6iuVOZ7tUgUeNzfo7w
	 zkeczZlYHH3Hzn/l0TtY/C5Hzo3dWjmdejqCKNaOYhgu3NSWv0t6Q1gWadS+pFvBbR
	 wdLKIAEl0r41EWBuuF608x1xwyts5eemNZnjhA4jGB39subkXTBmq60lotUZoXELVF
	 UE01Hd9orykaWbdhtO0vjyx8BrPz1KMr7oD6thi1lehKhnHwX5ZvJfqSjOh922Q8nX
	 8cdw+nhDArekw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 111F341129;
	Fri, 12 Jun 2026 11:22:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D9C8F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5978E40657
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGlnXwFdDoCR for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A753840658
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A753840658
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8021E880E9; Fri, 12 Jun 2026 11:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:10:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dea44b42a7b07054d71f63108db70574eaec7efc
X-Git-Newrev: 0100b767a503a6baee4540c1580c0e809a5cc5ed
X-Patchwork-Hint: ignore
Message-Id: <20260612112203.8021E880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 utils/bump-stable-kernel-versions: automatically commit result
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0100b767a503a6baee4540c1580c0e809a5cc5ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since this script is often used to bump kernel versions in multiple
Buildroot branches, it makes sense to simply commit changes directly
rather than letting the developer do it by hand.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit fab50ed3b1532037fa67582a6b47ac4084daaa88)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/bump-stable-kernel-versions | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index 0e76cd1168..af85d32852 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -25,6 +25,7 @@ latest_version=$(sed -rn 's|^\tdefault "(.+)" if BR2_LINUX_KERNEL_LATEST_VERSION
 latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
 echo "${latest_version} -> ${latest_release_version}"
 
+updated_files_list=()
 updated_releases_list=''
 updated_versions='Update the latest kernel releases to:'
 
@@ -98,6 +99,7 @@ update_linux_hash() {
 
     # We were iterating over this file so we could not edit in-place.
     mv "$HASHFILE.new" "$HASHFILE"
+    updated_files_list+=("$HASHFILE")
 }
 
 while IFS= read -r -d '' hashfile; do
@@ -105,7 +107,12 @@ while IFS= read -r -d '' hashfile; do
 done < <(find linux/ -name '*.hash' -type f -print0)
 
 if [ -n "${updated_releases_list}" ]; then
-    echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
+    git add "${updated_files_list[@]}" linux/Config.in package/linux-headers/Config.in.host
+    git commit --verbose --edit --signoff --file=<( {
+        echo "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
+        echo
+        echo "${updated_versions}"
+    } )
 else
     echo '>>> Nothing happened.'
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
