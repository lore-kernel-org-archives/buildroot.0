Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874F8D4337E
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E432843A2;
	Fri, 12 Dec 2025 07:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhq9HYsRwB4Y; Fri, 12 Dec 2025 07:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31D28429D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526322;
	bh=OYwKFCRorIPP6glXHfx/T3mYddfnpgedAXUlb5b24tw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U7yRXJbJe1tqhGNWcigZxnEW/oqSmBB/AZPKk0j5slcYO1S+fgHKcjVC/PRaKp52e
	 hY67dFECAeVJNwyDz90Eh0JP90FUahEjDIELtvr52/YAp/oaDPa6uHNOn4C+2TfHxv
	 PQWihZA2LyjC/wQ3yif2yNRrbyn6aIK9jnXsj0zkT8KFs3EUrsPj6yspa479H7kzaV
	 yKsFYxaddOZhqbS25oB3n/faqQZ1DUlX5GHGGBis+4wLrZn/5YrsgXk+3Vv5fFZXJb
	 GCxm0fhYH/EdCFP2lsdVowZfP1Kqv0yWaqRfGlHbos3SHIMx8TI1byH9IGa6jw13Ig
	 zKV85iiL4AeDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31D28429D;
	Fri, 12 Dec 2025 07:58:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B7B5E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7352B41183
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDwcUCkflk1c for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 788E84111B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 788E84111B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 779CC869E8; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:21:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa5f4abdc34e8749babbf82847dcbaf4ec5650ba
X-Git-Newrev: c7770112edc91a8cafb8a96e65ff4db01c402686
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.779CC869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flare-engine: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7770112edc91a8cafb8a96e65ff4db01c402686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Minimum-CMake-version-3.5.patch           | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/flare-engine/0001-Minimum-CMake-version-3.5.patch b/package/flare-engine/0001-Minimum-CMake-version-3.5.patch
new file mode 100644
index 0000000000..ca7c1d500c
--- /dev/null
+++ b/package/flare-engine/0001-Minimum-CMake-version-3.5.patch
@@ -0,0 +1,26 @@
+From 9500379f886484382bba2f893faf49865de9f2c0 Mon Sep 17 00:00:00 2001
+From: Justin Jacobs <jajdorkster@gmail.com>
+Date: Sat, 5 Apr 2025 18:27:55 -0400
+Subject: [PATCH] Minimum CMake version = 3.5
+
+From the CMake 4.0 release notes:
+> Compatibility with versions of CMake older than 3.5 has been removed.
+
+Upstream: https://github.com/flareteam/flare-engine/commit/9500379f886484382bba2f893faf49865de9f2c0
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 897c19c3d..def8121c4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ Project (Flare)
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required (VERSION 3.5)
+ 
+ Set (PACKAGE "FLARE")
+ Set (VERSION "1.14")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
