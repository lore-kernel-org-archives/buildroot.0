Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778BBEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B115613B3;
	Fri, 13 Feb 2026 19:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qq2_oFFIl6HU; Fri, 13 Feb 2026 19:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B98961402
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011594;
	bh=zs9ZzLAXtjWym+2HXM9GIHU43GcjlToXgMnjWXgG2os=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kd4mZ5pZtkqvGec1/Razo38ZfVTQ5FrCLxJazV3wdmrScWw0zMq4C/qPz0egzaWjE
	 L79ATdvZ4S0uJlVT7CHOsSiZ/s2s5IYS+5NIjUpTrPyfQWztiUDIHF5ti8xv82pHiZ
	 QzDDHn9mWlzkMvHhDzToFAZO1ZYuzlNx+p7SJp7z8JGs3ZAScrkftE3ml23vD8zYre
	 jFd+YBYNKqR8jlHO962I6LhhAaFhJb2Xja2IWYJi88SII3WEBxyqBQYVXFWzmmp8Ar
	 I17a+o6mY3ngtXy/EV1Lq++sNOE958/D1ZjQL+0sUhEAPMmfoNTdCxqW959vT7PHaj
	 kaT8cM+dR8aXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B98961402;
	Fri, 13 Feb 2026 19:39:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ED1EEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6471413DD
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFx40n52kalm for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DB0341280
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DB0341280
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22E4F83593; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:22 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6e0eb8753a7aea9189fd1445b539996b5e716fe5
X-Git-Newrev: 40f4ef8d4974b3ce25926668409921e0d430d680
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.22E4F83593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/asterisk: add
 workaround to fix build issues
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40f4ef8d4974b3ce25926668409921e0d430d680
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Sometimes asterisk buildsystem decides to remove our own
build menuselect stuff for the host. And then fails to
run the cross-compiled binary.

Add a patch to avoid removal of the menuselect stuff.

Fixes:
 - https://autobuild.buildroot.net/results/5f7/5f76f032ee596e928089b064b01f08adacade47a/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e4e71c6c83924716b826a4eb1096eefbfcaecd5f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0005-Makefile-don-t-clean-menuselect.patch     | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
new file mode 100644
index 0000000000..79c3174853
--- /dev/null
+++ b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
@@ -0,0 +1,26 @@
+From 844c1cddf38fd91e15a93eef96c67a5834fc9a78 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 10 Jan 2026 12:25:30 +0100
+Subject: [PATCH] Makefile: don't clean menuselect
+
+Upstream: not applicable
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b57f77477f..80035a09e7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -436,7 +436,6 @@ _clean:
+ 	rm -f doxygen.log
+ 	rm -rf latex
+ 	rm -f rest-api-templates/*.pyc
+-	@$(MAKE) -C menuselect clean
+ 	cp -f .cleancount .lastclean
+ 
+ dist-clean: distclean
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
