Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67115D4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FCB8422B;
	Fri, 12 Dec 2025 07:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx27BOOPtlNr; Fri, 12 Dec 2025 07:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F15840A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526292;
	bh=+tatpe3sJBJCxBho+I6uy70tfWK35j1GvWsV+RH49c4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EIBWtfPFAAHeTBDfEtlWBSDhly/FX/2zH+gAaHvvoTqfa7OR8Vf2LzBQ/keZT4Q31
	 A8fShF7a9YzixDcR0qxB00p5fboyluL+WDRK33OnhSvnAF0hbzLMh8NsfwULJWxXVO
	 QIRIFN9RjRgUzIa5c1VG3Qir99v0a3hlmoZOCs3S2HOvU2aQ+9QrKd9N03nTNgrQ0E
	 k8rR60Lr3S2/6LiJAx+s1PdEEW9qJTPjtv5AI9EqX2PCTpZqAptBJez5LVfO063j1a
	 g8ZQ5d/WOyrzTssQUZfHTkrXlELifiGHfPpREhWEfiNfrqqC0A4PCXQWDWNolnVPSc
	 Dm2ti6+zII8Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F15840A5;
	Fri, 12 Dec 2025 07:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E76CC2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA514116C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjRRWmOOGAhD for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2051241113
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2051241113
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F75485C4C; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d50b1bdd58d81c83dac401f927d95dd1601aabc8
X-Git-Newrev: 3b3db28739a2d050f930b0b99af76344fae37079
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.1F75485C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4qt: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b3db28739a2d050f930b0b99af76344fae37079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...se-3.10-as-minimum-required-cmake-version.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/log4qt/0001-Use-3.10-as-minimum-required-cmake-version.patch b/package/log4qt/0001-Use-3.10-as-minimum-required-cmake-version.patch
new file mode 100644
index 0000000000..311366b851
--- /dev/null
+++ b/package/log4qt/0001-Use-3.10-as-minimum-required-cmake-version.patch
@@ -0,0 +1,28 @@
+From dd869e9c5a5e2d306b930b00487a488441131d9a Mon Sep 17 00:00:00 2001
+From: Johann Anhofer <johann.anhofer@meon-medical.com>
+Date: Wed, 26 Feb 2025 15:41:20 +0100
+Subject: [PATCH] Use 3.10 as minimum required cmake version set cmake policy
+ CMP0071 to new (AUTOMOC, AUTOUIC)
+
+Upstream: https://github.com/MEONMedical/Log4Qt/commit/dd869e9c5a5e2d306b930b00487a488441131d9a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported for version 1.5.1]
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bf99ad8..2a02433 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,8 @@
+-cmake_minimum_required(VERSION 3.3.0)
++cmake_minimum_required(VERSION 3.10)
+ project(Log4Qt VERSION 1.5.1)
++if(POLICY CMP0071)
++    cmake_policy(SET CMP0071 NEW)
++endif()
+ 
+ #
+ # in-source builds should be avoided
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
