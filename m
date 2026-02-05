Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D147ECD9A3
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 20:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45FD94151B;
	Thu,  5 Feb 2026 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX0RYGRofKtn; Thu,  5 Feb 2026 20:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BCEB41260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770325172;
	bh=0KIMnI4Q+TMxZrSj4tHEIZTPGvgdOOkghb7L94dWdoE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FNOAMFKwD8yyXSURKrQ0uNGMVhcOTJCjS3KR9JN8Wu8545+LfD1BD67paWQfIHLdA
	 mA/J8HPBzKHyuX/lrKThBIkC0qFOpMO4UiGgzYrBhbfBu0s40HHXREowukLogtyyf9
	 Sgs/wj/n6XoMqSrn1S+x+wEYyX0bZxVH6WEB2cTYq2aqtLwQYGn0WrLS1oMNaVh3zT
	 9EVi4Ehlhgd/nIvnPkY3bcObTBc8R0NzSeYFojeUacA8yy4i988itYDzt7x2V+49JY
	 5B9t0cIQ7sHt5VsuzA7leCm/0dZgn4nGCfTBVC+fnD3I0cCVHwVt/XdFGtJKAWTG8z
	 EcbL+nTQZKYDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BCEB41260;
	Thu,  5 Feb 2026 20:59:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72ECF470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56DCB41260
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B569TA0M8C4u for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 20:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C014125F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37C014125F
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:59:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2390386A1C; Thu,  5 Feb 2026 20:59:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 21:57:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39d8525edef2662044136462a68ead5f2053b5a7
X-Git-Newrev: 766a6e5c0ba77fbcb7c7141cb4f66be2d20dc7e7
X-Patchwork-Hint: ignore
Message-Id: <20260205205930.2390386A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: fix patch header
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/766a6e5c0ba77fbcb7c7141cb4f66be2d20dc7e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit [1] introduced a patch to fix CVE-2025-62291. Since [2] the
security patches neeed to reference the vulnerability with the `CVE: `
trailer in the patch header.

[1] b009935e27 package/strongswan: add patch to fix CVE-2025-62291
[2] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/strongswan/0001-eap_mschapv2_failure_request_len.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
index 8442cc7816..7442c123c4 100644
--- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
+++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
@@ -21,7 +21,7 @@ Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
 overflow and causes the daemon to get aborted immediately instead.
 
 Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
-Fixes: CVE-2025-62291
+CVE: CVE-2025-62291
 Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
