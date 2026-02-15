Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5D2E63F07
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 17:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF7B40A55;
	Sun, 15 Feb 2026 17:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSUXAi9yVvOs; Sun, 15 Feb 2026 17:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C9840A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771175556;
	bh=p1fan5LYWaRizXQT38q6eRawzWp6zjJ0u8ZsCwU3LLU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FGW3o180hXkbFEHRQ3omTYN/UeRmpZ6i+PKxmg+26VLZAtqfY5r9CiAQnEKBBWCZ7
	 3JmIPA8LNhutzMSuaAjaWlyNPCvmhnOpw5Oace6j056mUJ9g+LM+uaakJF6yyMD6Mm
	 qSUGkKOKx+eZGBHfWM+t73byOkn9EnLY9oDjiImLHfer6fKy+iX6Y8aRT6yWfTNfcl
	 sEeml18uPQbEeAB/s10goWtxoJs1wnMwXLt9N3AqY1qELvn12dw0tu8kgYxlhA9b43
	 wsTDCQP+1FoJzHLJgQnMqipW3M004ZBP5P2byTKp8aNd0VYEUz4bCj9uWq2ira4oKK
	 5FpYuQwZYKRkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C9840A3E;
	Sun, 15 Feb 2026 17:12:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2E3C35B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97ECF8233B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dc29tZRlpRwY for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 17:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E610D81E98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E610D81E98
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:12:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7EC386E6C; Sun, 15 Feb 2026 17:12:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 18:10:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 073c6af03e765c930e01da56c78f2770bdfb52a6
X-Git-Newrev: d6e219adf0dec76cbf0d68eafb4739651562031b
X-Patchwork-Hint: ignore
Message-Id: <20260215171233.C7EC386E6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: ignore CVE-2023-45539
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6e219adf0dec76cbf0d68eafb4739651562031b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CVE-2023-45539 has incomplete informations (see [1]) and will be
reported as exploitable by pkg-stats for haproxy v2.6.22.

The vulnerability has been fixed upstream since version 2.6.15 [2][3].

This commit mark this vulnerability as ignored.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-45539
[2] https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
[3] https://security-tracker.debian.org/tracker/CVE-2023-45539

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/haproxy/haproxy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 77195d966b..f60cb1e08a 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -11,6 +11,10 @@ HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
 HAPROXY_CPE_ID_VENDOR = haproxy
 
+# Incomplete NVD annotations, fixed since v2.6.15
+# https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
+HAPROXY_IGNORE_CVES += CVE-2023-45539
+
 HAPROXY_MAKE_OPTS = \
 	LD=$(TARGET_CC) \
 	PREFIX=/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
