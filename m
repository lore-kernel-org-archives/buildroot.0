Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136B0D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF8F402AB;
	Sun,  7 Dec 2025 17:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPSXWMsu0ZCn; Sun,  7 Dec 2025 17:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14602402E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126882;
	bh=Sr3/b1gXS/7py0W7SmVT2utBSxHxjjs4aL90HjVOCW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r6t2nbBxQ4qceZn5pr6IC+jrqjioHZCqhKddVcnlH8Jzx5HVCFe3SuT/P2K/uRnYe
	 yna2nMovFCSNBL+IxpgpM5S//GzQ0J+6xJvxnYG+n28XRBSPXIlQVXKrxUmgKDAUJe
	 2GKOlDm3w0cMZWM+Org2c985GtBLLZhzg3QUxR1QS7XPYSXMbL/UVkP06b4PkcVytu
	 Cw2F+bEUt5FUGUfmChb2Nr3hnuxxAVlqSnwUWYEC4s4+jkE6/sV8jGXQyP86SCvoZu
	 xe8tzWzAxYupCDtc2EILQ42GZFWc3v5Vu4Vznfs5rccW0C5nEEHuUreumEC5TfN1RX
	 2W4XhAS06sEVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14602402E7;
	Sun,  7 Dec 2025 17:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E55DE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DCE140416
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1xTibd8DDZz for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A50C40168
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A50C40168
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87987867B3; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d29711322c98c6ed535208deffb82d8e23d433df
X-Git-Newrev: f3192e35e2437241b4385157c91d8cc16163f97a
X-Patchwork-Hint: ignore
Message-Id: <20251207170112.87987867B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mbpoll: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3192e35e2437241b4385157c91d8cc16163f97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...cmake-Set-minimum-required-version-to-3.5.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/mbpoll/0002-cmake-Set-minimum-required-version-to-3.5.patch b/package/mbpoll/0002-cmake-Set-minimum-required-version-to-3.5.patch
new file mode 100644
index 0000000000..0df22ddedd
--- /dev/null
+++ b/package/mbpoll/0002-cmake-Set-minimum-required-version-to-3.5.patch
@@ -0,0 +1,41 @@
+From baad0efca89f0d8fe370591283d87a6e8e7dee4c Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 7 Jul 2025 20:05:36 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+
+Upstream: https://github.com/epsilonrt/mbpoll/commit/baad0efca89f0d8fe370591283d87a6e8e7dee4c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11dcd05..d72c5ea 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ # -*- CMakeLists.txt generated by CodeLite IDE. Do not edit by hand -*-
+ 
+-cmake_minimum_required(VERSION 2.9)
++cmake_minimum_required(VERSION 3.5)
+ 
+ # Workspace name
+ project(mbpoll LANGUAGES C)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
