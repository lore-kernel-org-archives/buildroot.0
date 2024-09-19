Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CF7CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B79F54132E;
	Thu, 19 Sep 2024 09:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsovIVVu4OYe; Thu, 19 Sep 2024 09:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C06441819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C06441819;
	Thu, 19 Sep 2024 09:16:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA8A1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F64284949
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3obWIumDFDi for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF8184775
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FF8184775
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D66283C4D; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:18 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 8d5f51706da7218888df80c67b210d37432f563c
X-Git-Newrev: fc1b43b2e69ba92e58b13ed66fdba5d9f668b144
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.3D66283C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/boost: fix typos
 in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc1b43b2e69ba92e58b13ed66fdba5d9f668b144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit add472910818f7c77fc54f13a5a44ffc9c90228a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
