Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA2BD75E5D
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 18:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDDD642EF9;
	Sat, 23 Nov 2024 18:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSCA-b0DjowJ; Sat, 23 Nov 2024 18:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DFA42EFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DFA42EFE;
	Sat, 23 Nov 2024 18:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D4331D93
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EF8984C6A
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rY5kwvJDbZPg for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 18:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A95284C69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A95284C69
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:08:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22BFC86546; Sat, 23 Nov 2024 18:08:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 19:08:17 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ba77d95931cb31f27dd7ac014fa1caa233a74020
X-Git-Newrev: 7805e72284cf6df517efa62a5a419458ce78a7c6
X-Patchwork-Hint: ignore
Message-Id: <20241123180856.22BFC86546@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/babeld: unbreak
 download hash
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7805e72284cf6df517efa62a5a419458ce78a7c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes https://autobuild.buildroot.org/results/9e35823ae09b8886c0fa193e903feb7bc69509a9/

Something went wrong when backporting commit 328a3b815d5a (package/babeld:
update URL site) and updating the download hash, the permissions were wrong
because of ACLs on the download directory leading to a wrong hash.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/babeld/babeld.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 5c33bc5ccf..8dbd24d87b 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  41a99b340b568a12ba58486cf07a63ab01b8dbbc8da1c4e833c30dc251340aaa  babeld-babeld-1.9.2-br1.tar.gz
+sha256  d1b41f246a437bdafa5551fb16ca957fc9402de1c53f3647ead9466d67fe3fe0  babeld-babeld-1.9.2-br1.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
