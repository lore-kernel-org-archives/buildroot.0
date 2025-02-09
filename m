Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41357C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBBD85C93;
	Fri, 28 Feb 2025 17:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6JU7CMOaBoq; Fri, 28 Feb 2025 17:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0705C85C8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0705C85C8C;
	Fri, 28 Feb 2025 17:17:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD9768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B6A243FF2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfSI026uxP_k for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 775BD42545
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 775BD42545
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74A0A82AA8; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 22:18:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c95d5b8e1eb9ee04e3e9218c63e9e7bc489e0846
X-Git-Newrev: f3e7e28979b407b7b9a3742977fbdaa164d12fa1
X-Patchwork-Hint: ignore
Message-Id: <20250228163038.74A0A82AA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/docker: add curl
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3e7e28979b407b7b9a3742977fbdaa164d12fa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit afece24a7272 ("support/download: introduce curl backend for FTP
transfers") added curl download support, so add it to the container as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index baab3cadbc..d10d0beb27 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -28,6 +28,7 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         ca-certificates \
         cmake \
         cpio \
+        curl \
         cvs \
         file \
         flake8 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
