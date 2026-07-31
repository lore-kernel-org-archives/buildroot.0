Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE39C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6EB160BA1;
	Fri, 31 Jul 2026 12:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsU3E5_8KpQh; Fri, 31 Jul 2026 12:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18BE860B92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500549;
	bh=V/DkSzb0Gtbk3TVRiE6BxXKQGwuEB9Lh0BwRmGwkzxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f0SmR6nIoqN4RwPlSiGwGK5rcq2/CWy+FXJ8L/CMKg0tda8qPtBj4RqjNuD4JDc+k
	 uQPdNSlL1A6Pu2mBWlAlB2egO2qnae6FGOPtJxHgQJtBHEJF5fVQnfhkiXKC476jie
	 TVW3Mdn5Oh02NnOC96bRfZIjO9SC+eW0Y5bDI4gRjoleGo7TKHh09f7sv1cz/z5mK1
	 TpKQPpxyOL0aXgJSaWeZ5W4s6YRQAk0eWg9BBTFsW7M2O9D08qofDxxG8cLIgcu9nJ
	 AuXFPea/3DzfHpwp9qIp6GTAjef9Uqsb3wMcJLKl/lwFFncR5gdUsa8sAP6q3FCed6
	 wd/E/yovQkBiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BE860B92;
	Fri, 31 Jul 2026 12:22:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7D4B36E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA07740470
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwwtjXH9nYZ4 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D16A640463
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D16A640463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0FA28873C; Fri, 31 Jul 2026 12:21:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:14:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4ca56d54b7c9e3e6d8ff50e0db56c3e0f14a09d3
X-Git-Newrev: f4dd8841eb1683c1b77eefaee4ff58271663067d
X-Patchwork-Hint: ignore
Message-Id: <20260731122143.B0FA28873C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libass: bump
 version to 0.17.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f4dd8841eb1683c1b77eefaee4ff58271663067d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes: https://github.com/libass/libass/releases/tag/0.17.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 77684698264d32cf20c4953b60b1021ae87e2a26)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 2f6b554e3d..2f4f718813 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eae425da50f0015c21f7b3a9c7262a910f0218af469e22e2931462fed3c50959  libass-0.17.3.tar.xz
+sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index f198ee89f0..ff42c6d621 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.3
+LIBASS_VERSION = 0.17.4
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
