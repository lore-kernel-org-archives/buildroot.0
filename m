Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783EAEE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B3A608F9;
	Tue, 10 Sep 2024 20:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXjzClfQpAsI; Tue, 10 Sep 2024 20:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026C960AA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 026C960AA8;
	Tue, 10 Sep 2024 20:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 160001BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 029E1608C0
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umjtdAbZ4ihc for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C43D608BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C43D608BD
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0916386F60; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2619c021891daed6a1dfce4bacecf825434108cd
X-Git-Newrev: add472910818f7c77fc54f13a5a44ffc9c90228a
X-Patchwork-Hint: ignore
Message-Id: <20240910205131.0916386F60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix typos in help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=add472910818f7c77fc54f13a5a44ffc9c90228a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 908a53fea0..c7c90aa9ab 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -4,7 +4,7 @@ comment "boost needs a toolchain w/ C++, threads, wchar"
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
-	# Boost could theorically be built with threading=single, but
+	# Boost could theoretically be built with threading=single, but
 	# that unfortunately doesn't work. Until someone fixes that,
 	# let's depend on threads.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -241,7 +241,7 @@ config BR2_PACKAGE_BOOST_MATH
 	  C++ standard.
 
 	  Quaternions are a relative of complex numbers often used to
-	  parameterise rotations in three dimentional space.
+	  parameterise rotations in three dimensional space.
 
 	  Octonions, like quaternions, are a relative of complex
 	  numbers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
