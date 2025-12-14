Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F9D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AC964066E;
	Sun, 14 Dec 2025 21:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTdcukKyc5rx; Sun, 14 Dec 2025 21:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4199740643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747304;
	bh=2o7oAam7odjQR1vNXxg1RY9iHZ0i/DllQbz8PCXQDqs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N+TjEzSjUMSb17rUTPdLssmnvzKLRV1f36SBga4lrgKZVPGVM94xdGLCb/n+yRZAz
	 3hHT9EyNqf/+BuIVKFKw4nHlBNdT7Oc0RLgHidPtLjPhTK+jq+4OERuaMwhyoJfYC8
	 AdQIs1VnE+CZKMCcNIbg9qZWSfzS4YzdKmnvAfZa9wiEBVXoFV3e/TThaTPq1yNJjA
	 fywjMp0cGLLXujx+Fyah+9HK/mHc/Z7BYIRnM1u3PfquyEztNnDcGorBmDoeD0gVLx
	 /91NckfaA4Rn18+aM0bWxhbpu1iliTLt+rzEFOzBkLQPYk+8huMF7UjgMFrnzRsBdk
	 AthKd8ksWqNww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4199740643;
	Sun, 14 Dec 2025 21:21:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12980117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C75CC60B39
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJednymkB2TL for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DC160836
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08DC160836
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 083198355B; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3111f1f276d43ca4773d369e331e0fc3c478d581
X-Git-Newrev: 5e45bd67745a0ec114e564d11b8e15984464b831
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.083198355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastui: bump version to
 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e45bd67745a0ec114e564d11b8e15984464b831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pydantic/FastUI/releases/tag/v0.9.0
https://github.com/pydantic/FastUI/releases/tag/v0.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastui/python-fastui.hash | 4 ++--
 package/python-fastui/python-fastui.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastui/python-fastui.hash b/package/python-fastui/python-fastui.hash
index 37e7f0216b..a7a716d6e1 100644
--- a/package/python-fastui/python-fastui.hash
+++ b/package/python-fastui/python-fastui.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastui/json
-md5  bfc873f6ec7ab9cd406822793168ee7e  fastui-0.7.0.tar.gz
-sha256  08ec1b8437653fc37caaf3dae46566a43dbda3f190c62c43f8f3d063261dd1e8  fastui-0.7.0.tar.gz
+md5  0d618bea0cfdaa650efa7f0657abde35  fastui-0.9.0.tar.gz
+sha256  490ae906adea604f6fbb6270a8d1836611371dd304a1c556cad2785474a287f9  fastui-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1c39900853b2c98a5c98e1acc10e54ef06ba2693cdf85e8b28e3ede658888d79  LICENSE
diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
index 898bc26eb9..82906b1b79 100644
--- a/package/python-fastui/python-fastui.mk
+++ b/package/python-fastui/python-fastui.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTUI_VERSION = 0.7.0
+PYTHON_FASTUI_VERSION = 0.9.0
 PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
-PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/87/97/3f001410200256026ff98a4588ec8cb4f3b48bc74a28325e32bfb3b08ffd
+PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/c4/27/e52de3e3a3dd16cda6fac11d2b5b0ed8a54e14386a303bc8f757275df121
 PYTHON_FASTUI_SETUP_TYPE = hatch
 PYTHON_FASTUI_LICENSE = MIT
 PYTHON_FASTUI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
