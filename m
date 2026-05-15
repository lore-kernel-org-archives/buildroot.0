Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67416CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31035856E4;
	Tue,  9 Jun 2026 13:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TytZyasshUVR; Tue,  9 Jun 2026 13:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B41368569C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010122;
	bh=T4RLak0innUehoZ2O7yf8jHlo/5IFmsPDDX35Ua6VII=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KS8DSkYWSTSXgIMC6L2dA5pdUNINOR4CCCq2RDi9HCGK7Z7WpLlFHIum+6aQrQpgG
	 AxgfYQtelOZz00TElvM2tfuMPZ9y/A19gCpyXD+oTPWtvtgiHeuYbwldKhKK8oc/sw
	 +UJ7U4zVG5DTOZHumniLZzjyrScVXJKZ3Z1VLiBtFvEceNPrKkuPNwWcfk5cDaju2i
	 NAP5gxPyTBUYCbbNHRFz/OjyolgFayR2l9fBp/1ui2Jy0a60ESH0ZjxV/+7wBYTyrk
	 h3ae2EdOpYP+LQYNXHgenZKLTECRahmmT92JFFo1PY6SqKkx0SO0V2bWaTXefKPxaP
	 qDkbTCLjDWl3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B41368569C;
	Tue,  9 Jun 2026 13:02:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11CB5190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 004C442552
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ae7I7C4WmbNX for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F2FD423C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F2FD423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E7CD87E8D; Tue,  9 Jun 2026 13:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:13:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2195c46d2d10c4254d328cd791f2455c08791ab2
X-Git-Newrev: 40ceef27819a51263310fc1c81f7bbe3d4e2fab5
X-Patchwork-Hint: ignore
Message-Id: <20260609130115.6E7CD87E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gymnasium: add missing
 toolchain dependencies for numpy
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40ceef27819a51263310fc1c81f7bbe3d4e2fab5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

python-gymnasium selects python-numpy, but does not inherit the toolchain
requirements of numpy, which can lead to automatic selection of numpy
without proper toolchain support (C++, gcc >= 9, glibc/musl).

Fix this by adding all necessary toolchain dependencies that numpy
requires. Also update the help URL and add a comment explaining the
toolchain requirements.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gymnasium/Config.in | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/python-gymnasium/Config.in b/package/python-gymnasium/Config.in
index 19185f267c..b93fe6ccc8 100644
--- a/package/python-gymnasium/Config.in
+++ b/package/python-gymnasium/Config.in
@@ -1,11 +1,22 @@
 config BR2_PACKAGE_PYTHON_GYMNASIUM
 	bool "python-gymnasium"
-	select BR2_PACKAGE_PYTHON_CLOUDPICKLE # runtime
-	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS # runtime
-	select BR2_PACKAGE_PYTHON_NUMPY # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP  # python-numpy
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL  # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9  # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9  # host-python-numpy
+	select BR2_PACKAGE_PYTHON_CLOUDPICKLE  # runtime
+	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS  # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY  # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS  # runtime
 	help
 	  A standard API for reinforcement learning and a diverse set
 	  of reference environments (formerly Gym).
 
-	  https://farama.org
+	  https://gymnasium.farama.org
+
+comment "python-gymnasium needs a glibc or musl toolchain w/ C++, gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
