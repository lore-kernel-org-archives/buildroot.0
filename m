Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C2E7DF08
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DEED606B1;
	Mon,  2 Feb 2026 16:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUHMZxW9Cd7J; Mon,  2 Feb 2026 16:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B63E606F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770050654;
	bh=pRtm8TVgi8W944dc/PGZ0eLv+Y4mfEe49N688XR5W2I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ExFHnHzqu+vUu0skOk8sQcMzLzAoFIGpc8uNv9bvPbyz7y+bDErabrc0HLl6foTnO
	 a1M+E51LBoxuBXlX5+TeY6uPy0bMvfohkZwQGbNsC11qgCJO0yPCAwgaoiKLWkqdmX
	 Txwyv+TwikziGoCy8pTs3PvEWClhdTpHefhlk4pDPm7fkh05nCyZ+zjO1tZHQL1/RI
	 rqtsqVziv0bPDUXtMrMgHTqdXTuto0vJwkQXinW45mxxRsIaq7KabxO06dlmn3CkSq
	 K7HcuCahS93g1GtB0EN/l3yB3NaJGAQ977dIFA2lV/tO1WHxgA1R5jy1LGHoPD+naK
	 D76qI0LRmQkCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B63E606F7;
	Mon,  2 Feb 2026 16:44:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D46291E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF2514032E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8nSHg-ruVkS for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAC7B401E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAC7B401E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:44:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B760A863D5; Mon,  2 Feb 2026 16:44:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 17:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 934d3e62e658a641e2236afcf1cb60fe0385f78d
X-Git-Newrev: 3d2141bceefda32bef06ddda594eaf8665913276
X-Patchwork-Hint: ignore
Message-Id: <20260202164411.B760A863D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/run-tests: specify
 multiprocessing method
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d2141bceefda32bef06ddda594eaf8665913276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
