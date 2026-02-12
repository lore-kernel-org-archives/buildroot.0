Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9201EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841F484533;
	Fri, 13 Feb 2026 19:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rog2q5dOGQ6K; Fri, 13 Feb 2026 19:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF07E8456D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011336;
	bh=LV6ogj4XGpj53hV09f2zL5jq2eGJXvVH6RUS+7IwbMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1QiWexeRCCbLuAwpv7eFJ7jAy7hAfkRLmMI5xHVM9dJJGjiOlzaUwqzlkvbVhsCh
	 DFoojcN0nn6WoE1C3qD6Fw0tN8BVexAIeLbwQiZb/Gz4+XxhZCDmoZ6sh6b1+b6aaB
	 Fw3HM00tBIUx+td1Fh/x0kzSpsD+DqpxTz8Gr7V6tS8PawvJBkMl52PQ3bEitsFPdq
	 yQIsvii/VVFatPHRewK6t318DvGb+t8kBo8X75XF3e4Zpk3E8/s/Xz+mtH/E7pvyeu
	 fMef+ZjexmvirhHA5Now8lVpTuswGhiezKRMB4G0fTymb19h6tsXGKVfnzUy+7MR42
	 r2+zV7xlOH2oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF07E8456D;
	Fri, 13 Feb 2026 19:35:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E4C69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC9A68453C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yA81zZSKEApP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8339844E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8339844E6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D68883B01; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:20:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d3976bd05b9dc5fa593b8c4128561f2534955732
X-Git-Newrev: 8fd75e77357bfb463956172cc4dd88a1a0b52d21
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.9D68883B01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/testing/run-tests: specify multiprocessing method
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8fd75e77357bfb463956172cc4dd88a1a0b52d21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since Python 3.14, the multiprocessing library API has changed.
Quoting [1]:
"""
On POSIX platforms the default start method was changed from fork to
forkserver to retain the performance but avoid common multithreaded
process incompatibilities.
"""

Since this is expected to be under "if __name__ == '__main__'", we need
to have this in support/testing/run-tests regardless of how this will be
fixed in nose2. See [2].

Fixes:
[3]

[1] https://docs.python.org/3.14/library/multiprocessing.html#contexts-and-start-methods
[2] https://docs.python.org/3.14/library/multiprocessing.html#multiprocessing.set_start_method
[3] https://gitlab.com/buildroot.org/buildroot/-/issues/156

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
[Julien: slightly reword commit log and add links]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3d2141bceefda32bef06ddda594eaf8665913276)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/run-tests | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 2f670c03b8..1c4d2b4a85 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -142,4 +142,5 @@ def main():
 
 
 if __name__ == "__main__":
+    multiprocessing.set_start_method("fork")
     sys.exit(main())
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
