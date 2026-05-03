Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7D9CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E014861329;
	Sun,  3 May 2026 14:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_m9RhMC0h8G; Sun,  3 May 2026 14:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D85276124B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819854;
	bh=7gu7VaCuxNUGAyN8AtIwuIo/CMvmVdhmSunw/+A4C6c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZkiL1Pe2z0gsnVgr6+EvCwRgopt+A5WwYLCvOqiGvKQOi/tIswd/dm9oymneADL1z
	 MwdmjwjpdCgWp4cUsM34D4hTed69DKTo7TCJ8Pv6ggLmcFWemGFwnYGXDOHjm9G9HF
	 4bPyBdwOJEwSFjJJBmwEIpx0fh3Em+wHRYM+SiKAkGL6FeWshHLInyGpqVeV3RvPGh
	 djckYe+j752dEPoo75KpQ3PqvHYF1vVSeZ+jjAGjVgu97uAlwzLVAANwJ0bZRBJwZX
	 7hnFN1jc6+VV57F0sIcSwcKOwV1XWMQNjPhtV1C5kld10m5372iv9re3iLfmQGNP1P
	 WLvgkmVnq3ymQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D85276124B;
	Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E72FA190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95FDC41531
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gp_mcM7bDCxe for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A26B40D99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A26B40D99
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 335FC83FAE; Sun,  3 May 2026 14:50:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 790b9185df82cc8373c00a6fc0ca1c29ed2406f5
X-Git-Newrev: 738fcefad61bde2584454b40592ecef7ffabd0b1
X-Patchwork-Hint: ignore
Message-Id: <20260503145025.335FC83FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-smorest: bump version
 to 0.47.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/738fcefad61bde2584454b40592ecef7ffabd0b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/marshmallow-code/flask-smorest/blob/0.47.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index f59d0a18eb..b48f4f7287 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  048a22ef87f5a98d3aa9287259023cb5  flask_smorest-0.46.2.tar.gz
-sha256  7d9099a37a5add415670d6904ae032eefc1d2ba2432f060d7c048c74fc655a80  flask_smorest-0.46.2.tar.gz
+md5  f3236d4faefd989d2bcfe7820fa0d6b4  flask_smorest-0.47.0.tar.gz
+sha256  a415ce7db3d7e63dd854eb16d59047686dbf5d31c4913e245fa5657f88e7788d  flask_smorest-0.47.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c8a48548bbb732a0bbd6a0dc2c556cfa1e6e5fe35d888cdf6a1974d69e0e312a  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 8298003968..34b3f81b38 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.46.2
+PYTHON_FLASK_SMOREST_VERSION = 0.47.0
 PYTHON_FLASK_SMOREST_SOURCE = flask_smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/20/09/70074c15a9644a1def601b4fc78c114d4b2f4275310bc3476d1411da3003
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/99/b0/5edd5f3231ea26b52e786588c45d786df26929d2be8fec634bcb871b2a3f
 PYTHON_FLASK_SMOREST_SETUP_TYPE = flit
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
