Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FAECA0FE4
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E90C616D8;
	Thu, 21 Aug 2025 19:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9E-SmZL-daw; Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6086170C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA6086170C;
	Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D211C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D509583F18
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X7svzGoT-Pn for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2319183EED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2319183EED
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F7AD878DB; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:51:01 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d071870aa1de1af0f9e42296eeb9402d797ab7f2
X-Git-Newrev: bf00957b30d9e84c7dcad893f37b4a548a37ed1a
X-Patchwork-Hint: ignore
Message-Id: <20250821192006.1F7AD878DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] Makefile: release: make
 .tar.gz reproducible
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf00957b30d9e84c7dcad893f37b4a548a37ed1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Drop the timestamp from the .tar.gz to make it reproducible, similar to how
it is done in support/download/helpers.

Notice: .xz files do not contain a timestamp

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 802d0930602fe8fef6bc9f021760b3da9ab8650e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ecdd42cf5d..ea96efaa9d 100644
--- a/Makefile
+++ b/Makefile
@@ -1255,7 +1255,7 @@ release:
 	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar --owner=0 --group=0 \
 		--mtime="$$(git log -1 --pretty=format:%ci)" $(OUT)
-	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
+	gzip -9 -n -c < $(OUT).tar > $(OUT).tar.gz
 	xz -9 -c < $(OUT).tar > $(OUT).tar.xz
 	rm -rf $(OUT) $(OUT).tar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
