Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDE6CD98E4
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E0D842C63;
	Tue, 16 Jun 2026 16:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO2rpeB6cNP5; Tue, 16 Jun 2026 16:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1FE42B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781628654;
	bh=m7p5kZ2a8e0gXvj5JOIueFdV8uoFoLz2N1k/oLbz860=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=elVEb3EwQWB8HpQ4Jl9VoakpV1UUqBZbTFoE9KaAa2q2+W07VQyl6cECRxFn4suTK
	 mC3WOdTPnrzmG7NDzQ5gMHTjDZu5tSON20nXAqn+nrtab+kvMMrUBUxi4SZMRWpC+A
	 fU1Pd+uY6HhcYpw4XqeR5qCz84kpt2yfcegk1mbqkWsJ3Ei2/PvEo4xA8+O5tN/76+
	 T+/35K7TJcOt5KviK3UGaiyavevuAd0SCzG2pQnixIQQyqlxnkBPxyir7pCc9JYdyh
	 tLztuOnslrzHExG8NCSq/mO7/35RO8kIYsscmIHes52LpSe3aL0oi09BURQrQhOLep
	 CRf3M/K/92JIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1FE42B40;
	Tue, 16 Jun 2026 16:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 909FD2F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 764DA608DD
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjH2BtO4nVBw for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B751608D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B751608D6
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:50:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AF8380DA0; Tue, 16 Jun 2026 16:50:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 18:49:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbe867b895d19861cd809c953f88c576f2073223
X-Git-Newrev: 206ac6a19f09071b0bdf0f1edbf0c87e89d347de
X-Patchwork-Hint: ignore
Message-Id: <20260616165031.2AF8380DA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: bump version to 2.46.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/206ac6a19f09071b0bdf0f1edbf0c87e89d347de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceware.org/pipermail/binutils/2026-June/149568.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/{2.46.0 => 2.46.1}/0001-sh-conf.patch                | 0
 .../binutils/{2.46.0 => 2.46.1}/0002-poison-system-directories.patch  | 0
 package/binutils/Config.in.host                                       | 4 ++--
 package/binutils/binutils.hash                                        | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/binutils/2.46.0/0001-sh-conf.patch b/package/binutils/2.46.1/0001-sh-conf.patch
similarity index 100%
rename from package/binutils/2.46.0/0001-sh-conf.patch
rename to package/binutils/2.46.1/0001-sh-conf.patch
diff --git a/package/binutils/2.46.0/0002-poison-system-directories.patch b/package/binutils/2.46.1/0002-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.46.0/0002-poison-system-directories.patch
rename to package/binutils/2.46.1/0002-poison-system-directories.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8032bfe005..90315f8053 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -23,7 +23,7 @@ config BR2_BINUTILS_VERSION_2_45_X
 	bool "binutils 2.45.1"
 
 config BR2_BINUTILS_VERSION_2_46_X
-	bool "binutils 2.46.0"
+	bool "binutils 2.46.1"
 
 endchoice
 
@@ -32,7 +32,7 @@ config BR2_BINUTILS_VERSION
 	default "arc-2024.12-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
 	default "2.45.1"	if BR2_BINUTILS_VERSION_2_45_X
-	default "2.46.0"	if BR2_BINUTILS_VERSION_2_46_X
+	default "2.46.1"	if BR2_BINUTILS_VERSION_2_46_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index df2613055a..14fd65d4a9 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
 sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
-sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
+sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263b19d25302c37759784e14fcb4b9421b29e0e2c7f450bd99f6bb4595c  binutils-2.46.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
