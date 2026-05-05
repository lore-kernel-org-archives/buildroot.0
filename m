Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86ACCD3439
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA5240BBD;
	Tue,  5 May 2026 19:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjnjOzKAHT_L; Tue,  5 May 2026 19:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A98240BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010844;
	bh=yd27OXo6Rjvwskb0v0dn20c4mrczhTAbj6s5b8mjmQE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UGmEvilQgyYjwEy9Ro5EaW/KM/x44G2p0yu/7ppgatfIuwMA8CXTxRBuCTTL2HhZK
	 mZv6bnFCKFKFKxf3XvBoq3Ujr6RvC4SEVfUee/1PwBqBcS0Ib9Z5NOOZEKiGavSrp3
	 ZXA+SfhJvwR2pylKOMuRJmj0khiXxGm67eksIqM1JD39QWMC5F0BB0OAdHiXNyrGOC
	 U9n1bR4czJ66tVi+XfZvfKm6epMIY3ItfcOME9HFKa9f5bEqs5k1/icZasPi1HN/Vu
	 AvEF9YCOtLQbP+I4/57eIxohSVH1EV+0DCQEQ3NHcX62uEJvTAdF172xRzkCzchdNr
	 ssXUhbsZj4TFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A98240BAC;
	Tue,  5 May 2026 19:54:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C2C280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB21403F1
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnCUbqTAhFq6 for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD2B403F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFD2B403F7
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 058468463D; Tue,  5 May 2026 19:53:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 21:53:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07f7ad9898d2412b66fec4492cc89d59063bdfd8
X-Git-Newrev: 8cde69e1011e82e44447803d6dbbaac96375d0a7
X-Patchwork-Hint: ignore
Message-Id: <20260505195356.058468463D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: run main
 function only if called as script
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8cde69e1011e82e44447803d6dbbaac96375d0a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The __name__ == '__main__' guard allows importing pkg-stats as a
module using importlib, circumventing the normal module filename
requirements. This in turn makes it possible to test/debug individual
functions.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5dcc812e2b..2b2194b9a5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1334,7 +1334,7 @@ def is_newer_version_available(pkg):
     )
 
 
-def __main__():
+def main():
     global cvecheck
 
     args = parse_args()
@@ -1403,4 +1403,5 @@ def __main__():
         dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
-__main__()
+if __name__ == '__main__':
+    main()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
