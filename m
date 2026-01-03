Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B74FFA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D473940779;
	Sat,  3 Jan 2026 11:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nH7TDHAzWBMN; Sat,  3 Jan 2026 11:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD1E4077A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441524;
	bh=s9Tz1K6nqyFxrxP3vAj0WX9Tzl9pIN2mDzdvFFA07xM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eYZWUXRugmbB9f51xacWBoSG+x6s9DNxutDE5TAL5eMLc8Ov9dqnJtPO2Ynif3wtj
	 k3Qe6P5HrYL+1gGApGdG3197RkrtEwyXl5zMVNwpycwRdoA+MR8pCPFUNRFXpNvnux
	 NzIX2A3jzrwKMQ3ETS+XKCDwCtP2/Qo+LXdtPfSBqkF/j1aBj3yuIl7O2eQXLXSEMM
	 HLY7A/wuJ0A0zS/JtAVfDdeC4Qnlv42ibVhRWF+Tr0/UPfy7ZkvjC5SQOT5q5QByE+
	 hiX10Wv1P4nk2u+7pCCgYKF3sikeMIWYFGvI7idVB8QOZxwC/m6Dn6c98QXKmUZ/M9
	 9p/2mV1fljoiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD1E4077A;
	Sat,  3 Jan 2026 11:58:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF6D249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5179060801
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCZVQcGmVMDM for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9CE607F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C9CE607F5
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DAB488115; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:43:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e4aac8c1c48e2f4b166c04e7768b9179feebef0
X-Git-Newrev: 2f28805de4d9bf520a00f3f9f3b8f1bb060e7dc3
X-Patchwork-Hint: ignore
Message-Id: <20260103115842.8DAB488115@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: bump to version 2.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f28805de4d9bf520a00f3f9f3b8f1bb060e7dc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index b3388d1917..c9af5ebfb7 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  e2a443b2d5f9671ff33ef632051b8c8a  bleak-2.0.0.tar.gz
-sha256  a8043fc0f3af1a00a84963824195463ca39789ae4f6804d3d7b1423e6083254a  bleak-2.0.0.tar.gz
+md5  e757918dbfcba6bdfcb69e82048fc3a9  bleak-2.1.1.tar.gz
+sha256  4600cc5852f2392ce886547e127623f188e689489c5946d422172adf80635cf9  bleak-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 4aee0e95f4..abb556e348 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 2.0.0
+PYTHON_BLEAK_VERSION = 2.1.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/ce/cb/20f3dd0498a820278c7078dce786676d18342721a3723591d5853323b363
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/45/8a/5acbd4da6a5a301fab56ff6d6e9e6b6945e6e4a2d1d213898c21b1d3a19b
 PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
