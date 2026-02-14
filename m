Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40293EF48C9
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F33D540B1D;
	Sat, 14 Feb 2026 11:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qWWAyM38DvN; Sat, 14 Feb 2026 11:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A6940B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771069665;
	bh=QW3Mw5qGazqt42FfGnKazE+tnBwMRnOUtPX4vSxpHYY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lLvHBB0c8Vnr0gPUVcNKcMJKBNhBGNbnilCr3RHNxdAdb/USLksMdGjMMnX1QwFOz
	 JpQykaEUg3wMQDabG7ytCdq9qmrkGzGQ9hc2Z654NyDKwEBVOzvc7f8zxySQ12CixY
	 mk0+efxSL8es/FOfPe7bpz8gA7Eugo0qp1hK9zJiYBqWlhsYgdNEf8jAowxLorI5tc
	 97N1TBcB5m8eA6LENgbByAKQKvwBD8RTxsKIqk82xnlc5wrJ81Xth9ckuRCv7yvzdT
	 rcoJpiG6xwIVvrrPx+LRc20N7MwztCyX+DAaIJDASYS8kqE4mLQzz1NqeLILVFlVtr
	 SqZrSzr1M7cfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A6940B01;
	Sat, 14 Feb 2026 11:47:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C5969
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 041F8403CB
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1dxwW_cBcTU for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 727C440343
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 727C440343
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54D9486D2C; Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 12:42:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 385fb9d1c1f02e94cc61e622ca10e112f6f43d46
X-Git-Newrev: 87e2a72e13b870530cdeb7ec9f21036aa994d43c
X-Patchwork-Hint: ignore
Message-Id: <20260214114741.54D9486D2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87e2a72e13b870530cdeb7ec9f21036aa994d43c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE `dash:dash` is valid and has a single CVE associated to it. See
[1] & [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2009-0854
[2] https://security-tracker.debian.org/tracker/source-package/dash

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dash/dash.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 78effa791c..143972f01a 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -11,6 +11,8 @@ DASH_LICENSE_FILES = COPYING
 # We're patching configure.ac
 DASH_AUTORECONF = YES
 
+DASH_CPE_ID_VENDOR = dash
+
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
