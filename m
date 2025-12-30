Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F2CE95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD5A60879;
	Tue, 30 Dec 2025 13:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg-cNKKI34fo; Tue, 30 Dec 2025 13:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B74560B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099638;
	bh=LBROdMaEUVJtTINOwnrDnrdXf7/clRvzSRPAkdRXsig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sqWomy5COyQR5LWUWxhNt0tdUa/KMU36Iuek+BgqUchLzKafHzX29Ipn/HFJlaVSr
	 bLPaqVC9rnLAovShZfdzY3MCFAiQwkon+EaJGWTnPtuC2v+Broebb2aLvLntnz1WQI
	 FfdtNeZqujPVDwOY7vycX71vjOyGAe+5aF/JN6qs1Ejk0Jx7ozNDCANUdgezf4RvMJ
	 1aoa0fP5wS2ELNTxkAzkgvd8NsX+kwkxQIWJzBCs2qevli2zBi9Zdr7tZMk4gOS3s3
	 0oC+1sD7NBNB1XIhRi6AohI0DFVhMnPlB6U2xUh/+LsBPC6osPmOvXwTVihfQFqpq6
	 6dzCpSmdreMcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B74560B15;
	Tue, 30 Dec 2025 13:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A06CA177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 294506065A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0my3paa-6AQ1 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C6B606AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C6B606AE
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60A6E87A70; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:00:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 601e3ae5bdb4ba5864a2e28db77e33b1a9edfa54
X-Git-Newrev: d50e0fa0facfec7cbdab7af36281dfbefefd5a79
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.60A6E87A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncssh: bump to version
 2.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d50e0fa0facfec7cbdab7af36281dfbefefd5a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index e484386cab..03427599d8 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  367f96d0ad12d7a3a44d6b1c4e7c6b8b  asyncssh-2.21.1.tar.gz
-sha256  9943802955e2131536c2b1e71aacc68f56973a399937ed0b725086d7461c990c  asyncssh-2.21.1.tar.gz
+md5  0b1bd9d856dfc1b283ae1cd07d2bbee1  asyncssh-2.22.0.tar.gz
+sha256  c3ce72b01be4f97b40e62844dd384227e5ff5a401a3793007c42f86a5c8eb537  asyncssh-2.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 6fad7924c3..5d4a056d32 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.21.1
+PYTHON_ASYNCSSH_VERSION = 2.22.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/6b/b8/065c20bb5c9b8991648c0f25b13e445b4f51556cc3fdd0ad13ce4787c156
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/fc/d5/957886c316466349d55c4de6a688a10a98295c0b4429deb8db1a17f3eb19
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
