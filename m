Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17C5EEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BADE64081E;
	Thu,  1 Jan 2026 09:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7k8WfMHbhn6M; Thu,  1 Jan 2026 09:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FE540859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260580;
	bh=tvodYUnA1DRH+nqfKBmTxgowlOTkb506k7ij0nuNg/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=grdJeFiMSeDQ6kWFj49Qizmo5aBlDs46jbfEG1fqC3pISZcdxB9AcRIFGLK/F6KMq
	 ycCdEIY8xpg/+f3qx2CC/tpvQgHpcdq114GhY8pxIK0RuR1PFL72LbK0ZP9MU2XI4x
	 /bu4jB7srpSLrCWLssKvaUM97YDvPrMK0WObPiWHcW1ZtX/GqBuu33XK1V2KT7zYXi
	 gVefcIv8Mc3BwcmQCbBPwl7lFjK6YEi4IrGQt5RpBHVWN5WBKn2d2t1XjfJyfiRpXx
	 Vmbmt06wgYm91g6kj5ySv6nM9LIbHxz1imMzKxF8x/Exh5jD3juqs1CAS8QEIEtrnp
	 K+JJb8xKZJUPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2FE540859;
	Thu,  1 Jan 2026 09:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3B2351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B13381584
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHsFX4v2GD3J for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E09A814BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E09A814BD
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CC6486FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a964cf5134bbe9cea00f53c6e99a69b6e331834
X-Git-Newrev: c2176a9af0af2179847106b50f6a532cff4bdb6b
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.8CC6486FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-socketio: bump to version
 5.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2176a9af0af2179847106b50f6a532cff4bdb6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 3535c00819..11c6557077 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  fa264f1d5086cda8df1e01e7feb4a09c  python_socketio-5.12.1.tar.gz
-sha256  0299ff1f470b676c09c1bfab1dead25405077d227b2c13cf217a34dadc68ba9c  python_socketio-5.12.1.tar.gz
+md5  2020f7a9aa9fc74786ff2bdc8b48a68f  python_socketio-5.16.0.tar.gz
+sha256  f79403c7f1ba8b84460aa8fe4c671414c8145b21a501b46b676f3740286356fd  python_socketio-5.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index b07e6a689c..2c6b581c1e 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.12.1
+PYTHON_SOCKETIO_VERSION = 5.16.0
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/ce/d0/40ed38076e8aee94785d546d3e3a1cae393da5806a8530be877187e2875f
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b8/55/5d8af5884283b58e4405580bcd84af1d898c457173c708736e065f10ca4a
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
