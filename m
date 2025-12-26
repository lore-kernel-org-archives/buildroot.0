Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0994FE8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4AA040884;
	Fri, 26 Dec 2025 18:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXdElJXIzlM6; Fri, 26 Dec 2025 18:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEDED40963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773287;
	bh=beWJrwz2wJiY/qBjPDKTlNtt4k0wMAdp/iV4VMgCHrw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FSmDiP53texxm0wMl1JYweLiu+/SAba9zGcaaCMrf6CZqL9EzFtscBRlEd+2h2nDM
	 258fUDJUK/xNZFb4xKVq0FzvraHf2HzPuQhGLE7mqyLl78PLTBT9sK3fAy5NyTkln1
	 KzeTH6SJO+vCVJinGJYaOG6vNDtG9xJCjxSA9Nj9cc+z18r/WbzmIURKBJcCoN4Pp1
	 CG15o9a73BEEjo5iOfGV112l88aTh1MedbJ2qEjJcJh5Gl00wrUvHeosNzjP5vRzJ/
	 hqdl0qAcXrvJ7XRUfS7S0BzSi+L29Gdsoxzb9Vp8dAZ3rD1QkcNQbUvJ/knHCCTkhu
	 Hl4mErzAO6r8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEDED40963;
	Fri, 26 Dec 2025 18:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16917B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0368580C1E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id El3eOy9D8N89 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E53E280AFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E53E280AFE
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E229A8461E; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 488d15b2ae0f059d1634cef0ccfe5500108ad920
X-Git-Newrev: fce0865c6969acbd2bc21c9531d8e693722754af
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.E229A8461E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpid-proton: bump version to 0.40.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fce0865c6969acbd2bc21c9531d8e693722754af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://qpid.apache.org/releases/qpid-proton-0.40.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.39.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.38.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.37.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.36.0/release-notes.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qpid-proton/qpid-proton.hash | 4 ++--
 package/qpid-proton/qpid-proton.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qpid-proton/qpid-proton.hash b/package/qpid-proton/qpid-proton.hash
index bead3c1807..3a736f428f 100644
--- a/package/qpid-proton/qpid-proton.hash
+++ b/package/qpid-proton/qpid-proton.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.apache.org/dist/qpid/proton/0.35.0/qpid-proton-0.35.0.tar.gz.sha512
-sha512  1031e3d45854107a516699e1d18269c6acb22549b2709c1fc1cd25eb870096de109077445f1b400edf231bb21a476a268e2d6674e986fc50e92a281549085543  qpid-proton-0.35.0.tar.gz
+# Hash from: https://archive.apache.org/dist/qpid/proton/0.40.0/qpid-proton-0.40.0.tar.gz.sha512
+sha512  3e7fe56ca1423f45f71d81f5e1d6ec5f21c073cc580628e12a8dbd545a86805b7312834e0d1234dde43797633d575ed639f21a96239b217500cc0a824482aae3  qpid-proton-0.40.0.tar.gz
 
 # Locally computed
 sha256  52310e65489d30afeefc8589479fc02862a875349c19edd165658a915009da82  LICENSE.txt
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 1f92068f18..c0b6be459b 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPID_PROTON_VERSION = 0.35.0
+QPID_PROTON_VERSION = 0.40.0
 QPID_PROTON_SITE = \
 	https://archive.apache.org/dist/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
