Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A4EC0218F
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 15:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BFB48B47;
	Sat,  1 Feb 2025 15:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMjZ0xLoNqhd; Sat,  1 Feb 2025 15:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39D3848CE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D3848CE3;
	Sat,  1 Feb 2025 15:16:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A49E183
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 15:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7707A408E8
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 15:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sShWpb3USbd for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 15:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C60E40173
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C60E40173
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 15:16:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E87A865FC; Sat,  1 Feb 2025 15:16:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 16:12:33 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a34ad4d8304fd457f2609017c2a1f8d2e6297719
X-Git-Newrev: 9cea6d4fd84befd02872a087a78002b81f8ae46c
X-Patchwork-Hint: ignore
Message-Id: <20250201151614.6E87A865FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/go: security bump
 to version 1.22.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cea6d4fd84befd02872a087a78002b81f8ae46c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

go1.22.11 (released 2025-01-16) includes security fixes to the crypto/x509
and net/http packages, as well as bug fixes to the compiler, the runtime,
and the net package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 4b5b14d479..3daa25c790 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d339bf2462bc97b64ca4c1037  go1.22.10.src.tar.gz
+sha256  a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe  go1.22.11.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ed15ae9fd5..cb61c8f946 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.10
+GO_VERSION = 1.22.11
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
