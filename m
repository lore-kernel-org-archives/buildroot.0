Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B69CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18B3D61B55;
	Sat, 30 May 2026 17:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDtqV30uVeQ5; Sat, 30 May 2026 17:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8F661C76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780161810;
	bh=elp8K4rcRv7Q3xZbKJifseXJLZB+fT8mADU2FPRSyeo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U54EKLVTcFMgaMhLr0gCdxp+36nTkD9t/pDToHefo8caFlyeFkIKC1iTPNObYao+9
	 UWjy8Nn9EqMKoTecFYked3w5DOP5z8g2GkIVNPAbKISfSIlm1Lb/Gty8RzBUcPls1T
	 cv840sHvxlnqH2J9JIlY20iu0Mq+VeIvkZr0Hxn++FokHRueYObB+LLtROy+ZA280f
	 5yjCsVstJuktALfb77naPo0zUDZv48/IBMBhz/HU1tiQ0/qhmQQ1OjVMt7yx4aa7jo
	 jtyu1E87Jc8cJ+cZzpBXoDVaaGRYbBLpKEGAXi9Wf3lc3RLcel9hD6OjJdPFtU4FTn
	 L/rvgoJL9wv8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8F661C76;
	Sat, 30 May 2026 17:23:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF07D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5079842F2A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjdOvRPNIu1w for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7838242F27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7838242F27
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:23:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5875987533; Sat, 30 May 2026 17:23:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:22:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d4e403f025607b47659a36ad4ed90e57d7bb4f8
X-Git-Newrev: c6610787d804442666a2ff238ddff4f144383146
X-Patchwork-Hint: ignore
Message-Id: <20260530172315.5875987533@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gymnasium: propagate
 python-numpy dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6610787d804442666a2ff238ddff4f144383146
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit fb53371286f912fc3e4dfe9a61b6e5fcb2935c90 introduced the
python-gymnasium package, but it was not careful enough to propagate
dependencies of selected packages, causing messages such as:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUMPY
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && BR2_INSTALL_LIBSTDCPP [=n] && (BR2_TOOLCHAIN_USES_GLIBC [=y] || BR2_TOOLCHAIN_USES_MUSL [=n]) && BR2_TOOLCHAIN_GCC_AT_LEAST_9 [=y]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_GYMNASIUM [=y] && BR2_PACKAGE_PYTHON3 [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gymnasium/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-gymnasium/Config.in b/package/python-gymnasium/Config.in
index 19185f267c..a943c499ff 100644
--- a/package/python-gymnasium/Config.in
+++ b/package/python-gymnasium/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_PYTHON_GYMNASIUM
 	bool "python-gymnasium"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_PYTHON_CLOUDPICKLE # runtime
 	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS # runtime
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
@@ -9,3 +13,9 @@ config BR2_PACKAGE_PYTHON_GYMNASIUM
 	  of reference environments (formerly Gym).
 
 	  https://farama.org
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
