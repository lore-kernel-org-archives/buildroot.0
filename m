Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7159D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F01E84127;
	Fri, 12 Dec 2025 07:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7wOgJ1ocNjW; Fri, 12 Dec 2025 07:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA31184121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526299;
	bh=f210FL+kzq9d9dNiUUUSkbnuZfxEDyJ8SHEeliquwf8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cAJwX/qFAzC0BRFNjZ3OUHwlA6M1nlBQUURW7r+FCLV5Q889+vp9Qm8zQq5vIdOp7
	 nIL3Z69ytmhcEMITyMt3fXjUHzyAbpFgxfiyurGrZpuVRIvyOfMra/UdRruPCHGi7v
	 3UDh8N4qi0yJ9UaDPjfp3VV+WGSM1uaHfPmX4TxW2QppxDxzmnRWSg+neH2uLTMRj6
	 eGDrPDnu85t6GFUax32EhYtuVqKDomG/hGaW79tzxJoupN4k7pBhODzmioXpJwshhr
	 z2LAv1ePwqQThi4emoZXrkAZKHu9A0lqR1P4skmY73J+NcjBdVjV+Rhb9UV3NXqs1h
	 mIRIVVEfU4Usw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA31184121;
	Fri, 12 Dec 2025 07:58:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EDC32E9
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 853DE4116D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvnMVV1JOoBC for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A9C41125
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A9C41125
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3EC885C4C; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:09:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 955e3ff9717907120cb717fca7fbd8faa77fd1e0
X-Git-Newrev: 264bada0c545685a3cc58473d034ef382810c702
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.E3EC885C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseview: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=264bada0c545685a3cc58473d034ef382810c702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t-Update-version-range-from-2.8-to-3.31.5.patch | 38 ++++++++++++++++++++++
 ...ts.txt-Fix-the-version-for-the-manual-too.patch | 26 +++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/package/pulseview/0004-CMakeLists.txt-Update-version-range-from-2.8-to-3.31.5.patch b/package/pulseview/0004-CMakeLists.txt-Update-version-range-from-2.8-to-3.31.5.patch
new file mode 100644
index 0000000000..2233887ab5
--- /dev/null
+++ b/package/pulseview/0004-CMakeLists.txt-Update-version-range-from-2.8-to-3.31.5.patch
@@ -0,0 +1,38 @@
+From c0676b3493fda29d97c271cfeb76267019b35695 Mon Sep 17 00:00:00 2001
+From: Soeren Apel <soeren@apelpie.net>
+Date: Thu, 15 May 2025 16:38:53 +0200
+Subject: [PATCH] CMakeLists.txt: Update version range from 2.8 to 3.31.5 to
+ avoid abort
+
+The error with CMake 4 on the github CI looks like this:
+
+CMake Error at CMakeLists.txt:22 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: http://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=c0676b3493fda29d97c271cfeb76267019b35695
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 0.4.2]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ec86073d..8580fa8e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,7 +19,7 @@
+ ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ ##
+ 
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 2.8.12...3.31.5)
+ 
+ include(GNUInstallDirs)
+ 
diff --git a/package/pulseview/0005-CMakeLists.txt-Fix-the-version-for-the-manual-too.patch b/package/pulseview/0005-CMakeLists.txt-Fix-the-version-for-the-manual-too.patch
new file mode 100644
index 0000000000..8c7518dd6e
--- /dev/null
+++ b/package/pulseview/0005-CMakeLists.txt-Fix-the-version-for-the-manual-too.patch
@@ -0,0 +1,26 @@
+From e2fe9dfb91c7de85c410922ee9268c3f526bcc54 Mon Sep 17 00:00:00 2001
+From: Soeren Apel <soeren@apelpie.net>
+Date: Thu, 15 May 2025 18:19:24 +0200
+Subject: [PATCH] CMakeLists.txt: Fix the version for the manual, too
+
+Upstream: https://github.com/sigrokproject/pulseview/commit/e2fe9dfb91c7de85c410922ee9268c3f526bcc54
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 0.4.2]
+---
+ manual/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/manual/CMakeLists.txt b/manual/CMakeLists.txt
+index 3b881a56..d6c54d61 100644
+--- a/manual/CMakeLists.txt
++++ b/manual/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ ##
+ 
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 2.8.12...3.31.5)
+ 
+ # External dependencies, required and optional tools.
+ find_program(ASCIIDOCTOR_EXECUTABLE NAMES asciidoctor)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
