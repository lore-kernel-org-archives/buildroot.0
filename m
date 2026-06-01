Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FF7CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B50B9605E1;
	Mon,  1 Jun 2026 19:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5AsUoLhL48Z; Mon,  1 Jun 2026 19:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C84F3605E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341473;
	bh=IHYdO621KnVeaLTOq9E3sbK5B54ty4sqAeMQ9hZYnAE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aCm8pMx+aufBF5FalQyuOqAikISvtezxP5WEmctsqeHN28IjRZ8khDnExkMhF0N/z
	 rpDxuxQMNDaWWdulFDWzMKKtIPXjd/CbPoY3gALZrNL40CKuyNNfNVdTikaB9Ue0dN
	 caG1FWbOcv3rAJtXZEjUVCgWKQ6/ANO6emZES01+uymbAf1g7pOTUi/GMAkbZZV7I8
	 8MeHIkacLdVu8XX2iE6SYgiV1BKey6ffhxXF0OOiWQbeMVCX2curw5hFVfkGhRnX9P
	 wqNaFc2d2xyMCPlzKAhNjHLcCSj6V7B0V9Bs/c8bEcEXJK4q4xcbc0tT1mpWMNNwXS
	 7jxvRsWt8VYNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C84F3605E5;
	Mon,  1 Jun 2026 19:17:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46A11F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 380C8605E1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b41Y5we2hFfk for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56545605AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56545605AC
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:17:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4532A8780C; Mon,  1 Jun 2026 19:17:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 21:16:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79431203c3951aaeea145d06760fe3426309fc05
X-Git-Newrev: fab50ed3b1532037fa67582a6b47ac4084daaa88
X-Patchwork-Hint: ignore
Message-Id: <20260601191737.4532A8780C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/bump-stable-kernel-versions:
 automatically commit result
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fab50ed3b1532037fa67582a6b47ac4084daaa88
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since this script is often used to bump kernel versions in multiple
Buildroot branches, it makes sense to simply commit changes directly
rather than letting the developer do it by hand.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
