Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B7ECD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708454096D;
	Fri,  5 Jun 2026 12:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikB_8--X24mj; Fri,  5 Jun 2026 12:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5DE40975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663264;
	bh=Z8Frev709rBjMAHV9BmfBO1RS2p30dnXcQkD+Ns0dvg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e/Br9mh+oZRIzWqU00g0ryq+otw3/HJrDV2Jym7COx2Xpmo//eHWlu1M+Q8QReHW3
	 ZSf9+8ALbdzymTRyDc3ZlkSyedgzA1JuQ69yTNoQETiFtthMME3t/7lcCXZsUEGzSm
	 o5Z8Od5BmqZBtxyX/z3uVqMz71YM17CnhW5YpLrGOF+Jpg4s6a/ZGAXC0qpSeSlwxU
	 L6X3qAR0ee5n9trXkFuuS/pMW1twUDZ77eTX/GGeez9U4aWFvYUMzfZdUmZaEZ3Wis
	 I9Lyns37V3VVikkiYWBQNSZOlXcxOsAYQZCvhEAGqEEpFulxY8ar9AvgvvRhYs+xsm
	 Kbl+LTgvmO5fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5DE40975;
	Fri,  5 Jun 2026 12:41:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10DEA3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FAF582015
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v72hw4cp5IsV for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5332D82026
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5332D82026
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D87787B39; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:08:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 5b4f9325eb418580f58bea56ec0d3980355872af
X-Git-Newrev: 84c94299d0c3f46a251d45fc00c1fc8d4c2d6a6a
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.7D87787B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/bpftrace: remove
 configure option USE_SYSTEM_BPF_BCC
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84c94299d0c3f46a251d45fc00c1fc8d4c2d6a6a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 305c40613ceab985bfa2abd094a96f3eb2aba5d9 in 2025.08-rc1
bumped the package to 0.23.3 but forgot to remove the configure option
USE_SYSTEM_BPF_BCC which was removed upstream in version 0.20.0:
https://github.com/bpftrace/bpftrace/commit/ef6d9d42d3a7a87116651d6c561de3a0a2693185

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d2bd5b0a51e52c5cf008dbacfaab01acbcc46633)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bpftrace/bpftrace.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7b1b41781a..94f7c6b4f9 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -29,7 +29,6 @@ BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
 	-DENABLE_MAN:BOOL=OFF \
-	-DINSTALL_TOOL_DOCS:BOOL=OFF \
-	-DUSE_SYSTEM_BPF_BCC:BOOL=ON
+	-DINSTALL_TOOL_DOCS:BOOL=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
