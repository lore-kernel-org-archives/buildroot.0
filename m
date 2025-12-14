Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD2FD5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247D68153E;
	Sun, 14 Dec 2025 17:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3ULFz4pgfCP; Sun, 14 Dec 2025 17:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A00E81549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734478;
	bh=sEjAgA8XEacniMNbgTS7mckMoXuZMo0FJPOOMCLjH6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VIwsL92RLqZ7VmgnbGs/0hiMNqjXQ2fxM9iPWVXQVVIkpFmfiD5AAbJIXU68iTVbB
	 5Mke/Lyh3YpbgxhGmC/gg+VJqR65QV+58xWthnXOclj0N+xswjNd89vskh96juW3en
	 F8dnx5vCN+5Y4bsDJuQx7t+prs5ti5gs2GvG2fS1vpZWEVHrTrRfohJB1zfQCLzuVx
	 Km9RYOCCGtenvOxwF3e+5QyHowF5ddnRR1OS/XbmHR7l553hASDrdtWJstSO119d0q
	 991hmv0o8FBPZYLQS5GRmEuB3NDcS6A9kLUdmoWCUSGW4Bts6W3HOWpEScYWVHxSRb
	 Tyq47dwJVfrlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A00E81549;
	Sun, 14 Dec 2025 17:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E17117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 151DA60B55
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsKsXVjN4Osc for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370A860D96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 370A860D96
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3635286E96; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02b4cc424bed1c2c4a027e313659fe035d1b1b7a
X-Git-Newrev: 818218ae7e33d0e7ad6071c2778d6e61b910ae30
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.3635286E96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-calver: bump version to
 2025.10.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=818218ae7e33d0e7ad6071c2778d6e61b910ae30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/di/calver/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-calver/python-calver.hash | 4 ++--
 package/python-calver/python-calver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-calver/python-calver.hash b/package/python-calver/python-calver.hash
index ebc054e617..c1321475ae 100644
--- a/package/python-calver/python-calver.hash
+++ b/package/python-calver/python-calver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/calver/json
-md5  e1fd924b9bf953c0b28c49bdfe117d7a  calver-2022.6.26.tar.gz
-sha256  e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b  calver-2022.6.26.tar.gz
+md5  35c480c59ceca9dc0d51f214df5523a5  calver-2025.10.20.tar.gz
+sha256  c98b376c2424642224d456b2f70c51402343e008c63d204634665e1a2a2835f5  calver-2025.10.20.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-calver/python-calver.mk b/package/python-calver/python-calver.mk
index 2fd5468ed4..ca3d9d4dbb 100644
--- a/package/python-calver/python-calver.mk
+++ b/package/python-calver/python-calver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CALVER_VERSION = 2022.6.26
+PYTHON_CALVER_VERSION = 2025.10.20
 PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
-PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/b5/00/96cbed7c019c49ee04b8a08357a981983db7698ae6de402e57097cefc9ad
+PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/4a/96/0c57e3e228ffc54074867406b659b197678674f1f0bf600d114965289834
 PYTHON_CALVER_SETUP_TYPE = setuptools
 PYTHON_CALVER_LICENSE = Apache-2.0
 PYTHON_CALVER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
