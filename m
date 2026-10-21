Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D360A4ACB
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 17:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cv7dhmXk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37854608DC;
	Wed, 21 Oct 2026 17:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK3H9PO1ja1a; Wed, 21 Oct 2026 17:12:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44454608DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792602738;
	b=akvmWZQ5ll71VxJfY0y0bMacltXFr5qJ4aV5eNRsG1YgFIhpitIgg154R4rzIX59cF4X
	 b6kjcED9Rx2zuN27MYQePVyvvEhRfoN+EjvbFt0OHhHPrWx3EWna0yvzM1J7TBIid78gZ
	 0phUHGrIDxV5EO0mARRi/9mFFMGe72RrJsEkXM1xaE5/QNk2bSzKwS5G0tSmtNbRKNcQX
	 4SlKfLGVv0TYRUwCFt1QfX7NQoA6HhfE907WA0xYFFEXB/D63oK7kk0meqrGc/JYIhgiT
	 jR7+2gbPqLgZgH68dU6BbErddKf93hix9ORJKJaLrHYBm5eA9BpQpAngBJFTMvWJTlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792602738;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gQkTlyTUGCt3iHTh5oYe9b3dj5ZNvU5ZIh7+ZO8zTOk=;
	b=rW8qiN0GfjJiyJ9l5U0ix8tzU382qz9S1hBCHkCGmTyLRtlQwBnuy6DQlaN0UxP5bas0
	 xIGHnOptnHieMddnFUTwE02xBuqzlkgq5Ckp6zu0L0ns4kSu6oe7LlTnsmB5rL0bGILm0
	 IDpzpq8N9sbFY4zTVlThpqfe+0XYBpHFTJ9kQRmuk1jZqEoaJWRGqjwHx6ZKimsnOZxIz
	 iN3sTxw5fv6sfrSUy359RG1R40NKwd3D1L1ZATO3Y7KflLymS825aQMW4sFGqpuV6CIPe
	 hxkcLgcWde5hI5jXnvd9L/Yuv3ZHzarlHr5slmDPdvBcgqbTF60Hrh5gTwq63v8EAlw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792602738;
	bh=gQkTlyTUGCt3iHTh5oYe9b3dj5ZNvU5ZIh7+ZO8zTOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cv7dhmXkL5/WzC8A8JSPCYHqgkMHO6Y8tkJNznC/cn5oshWqDAn1ZeT0UB/ZPcuQr
	 RTA4dRk/opTKuCMDpFQalElbHGOERM8XhJE/3fZKhdoMMYBa6fIT3308GURq3QzC5Z
	 IjGXn8jdb/5eneidXu7H9PphWAmKRiZRGD+iU4Y70QBBR16YoSAQ8IPBfZK4Y/oIAQ
	 TJrXxPTGnmyzSL3CrZw4THVZ73obHJxq3iZxHtzqYwoioPiZRbb3z0v1/ulWufdxKp
	 LJRHxz4qnZMZ89C/lxL7Td78tv+l5llvOyVF0CuxZGxjK8mlR+C3brNw1RU6jNedoJ
	 2PATyfbHRNV2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44454608DE;
	Wed, 21 Oct 2026 17:12:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98423769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F2C403C2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZxDlU_e96yg for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 17:12:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 255554016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792602735;
 b=n0N/6H8owuQ4w7x52Cu0Cn8NJMedPQ/sRrmZIBOEAdHRhNvzpB9xe4X58paHbOSt6j6m
 uPerI32ahbgtdTQMU5tEUchi3CXfkL2BL/vFyYe6gDEwBTA60TvPMGZNiA7oQLbVYtDyh
 a2kjWitjoIh/XovmlHhWRY+lW1sXzXD86Cqf/oHBWBxKDfw3XjOEMDUSS5Yj89HLe3BRA
 4d9Lw90br26L6O58Qi736FWtNQfU9wu52lemeGJvMhIT0C19NMmxIc4xOxOhtZpKTx5S6
 R44zdVDbIB2glvpCRNTPs+Tu2sKMM6SduO5Y86laz5awyIDvFSvb+4PwtvqBpTxrQtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792602735;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JgXI2jYmuJBNNvfSaHzJxLCQlayBvuHlAizrYVqDmeI=;
 b=rmDO252nhBr0g4oh8x3no0btONpmerqyJiAhn06DjMIfydAxI92sWPVa+0nFq6o2/6yk
 wuUYR2BvzZ2VJmKMhuHR0w2s8Sad8vcKGZFFbXx4nqq9DfXc0IbtLKtqxAM1xO/aUo6z8
 eD8IkHw04DQRR71CA6SQQFtmC6LhbZTyyDmj0Dwwr0Ar/7bkwPKwGYwqM0SEXZuj9yZgk
 5D1LFRp2snriJP66S+j0QHxQva4oHxn+Q25kBe04yiwSmLQysG2WKn0dMsQWWgr1QYL8Q
 rZHtAVjC7T8uX7MNNgLzcZFjzu4nE/7U7PSDAdVLgIpq9kolnhHnvxGzG5muLS/kJag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 255554016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:12:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A56E599A4A; Wed, 21 Oct 2026 17:10:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 19:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9be6e35d3da84c9ba1ea792169641b38e086e34
X-Git-Newrev: 1e1d973a205771ffdeb03543bcba1c55f464bbb8
X-Patchwork-Hint: ignore
Message-Id: <20261021171050.A56E599A4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/bump-stable-kernel-versions: fix
 newline in commit message
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5120524423524386932=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5120524423524386932==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e1d973a205771ffdeb03543bcba1c55f464bbb8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

By default (xpg_echo disabled) bash's echo doesn't expand escapes,
which results in a literal '\n' being inserted in the commit
message. For example:
Update the latest kernel releases to:\n - 6.18.53 -> 6.18.54

Commit da01b7271a ("utils/bump-stable-kernel-versions: update for
split hash file") added the '\n' line, but at that point the variable
was never printed.

The bug became visible in
fab50ed3b1 ("utils/bump-stable-kernel-versions: automatically commit
result"), when echo "${updated_versions}" was introduced.

Since the script already uses bash arrays and the list of updated
versions fits an array well, use one. This allows us to easily print
its content with actual newlines without storing them in a variable.

The fixed string initially contained in 'updated_versions' is also
moved to an echo call, so that 'updated_versions' really contains only
the list of updated versions.

Fixes: fab50ed3b1532037fa67582a6b47ac4084daaa88 ("utils/bump-stable-kernel-versions: automatically commit result")
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 utils/bump-stable-kernel-versions | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index af85d32852..b02b854d95 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -27,7 +27,7 @@ echo "${latest_version} -> ${latest_release_version}"
 
 updated_files_list=()
 updated_releases_list=''
-updated_versions='Update the latest kernel releases to:'
+updated_versions=()
 
 update_linux_hash() {
     HASHFILE="$1"
@@ -85,7 +85,7 @@ update_linux_hash() {
                 fi
 
                 updated_releases_list="${updated_releases_list} ${release_version}.x"
-                updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
+                updated_versions+=("${old_version} -> ${new_version}")
             fi
         else
             # Different line: Reset hash list and just copy this line over as is.
@@ -111,7 +111,8 @@ if [ -n "${updated_releases_list}" ]; then
     git commit --verbose --edit --signoff --file=<( {
         echo "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
         echo
-        echo "${updated_versions}"
+        echo 'Update the latest kernel releases to:'
+        printf ' - %s\n' "${updated_versions[@]}"
     } )
 else
     echo '>>> Nothing happened.'

--===============5120524423524386932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5120524423524386932==--
