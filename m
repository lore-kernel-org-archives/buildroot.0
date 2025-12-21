Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4224DE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1846B407E5;
	Sun, 21 Dec 2025 22:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8JTXGkUkgTS; Sun, 21 Dec 2025 22:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD122407C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355156;
	bh=RnjDnIYiZXNMbFKv2JEmm+vPERTqL+wSYVhsur/Sp80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kxmZaodLaiIz1MLrSwz8/ntyDn7SXtEqYwVlZxZYRmWOUWqp3TUO35etVfC2NI6Tv
	 yB91i7wEd+H3OGY7yCNrYAeh+iVbjMs5TtPB/qoO6/kU+auEStiOlUlxEQ4GmXwqpx
	 iON98Xu8sl2Scb2ZkfVfRFgmzP1+tgLJXbQ7KkFiE+iZ0O4Wzxx5jbNCPMkSGWRHql
	 SwwwXIG950tnqXn4unf0ZzIxKjiBgnmLLJhvN3MKoQEUNf7//43W96qOBUbukEFouA
	 IjxdVN6hEl1HqRcXl3pB0q+TxtNSsJ6bId+UYNxiMr3rSqFd8ueGmk4Gbzb4s4u3MT
	 5InneA73W7FXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD122407C0;
	Sun, 21 Dec 2025 22:12:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C320195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D53C60837
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29vIU-8KYXmg for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D2D960756
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D2D960756
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BA90870BB; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca3855c13f5803cd7e47a1b3299786ab4546abdb
X-Git-Newrev: b7505ca7625dc3ea4f5a26424c41978e3f03a56d
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.2BA90870BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-colorlog: bump version to
 6.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7505ca7625dc3ea4f5a26424c41978e3f03a56d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/borntyping/python-colorlog/releases/tag/v6.10.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 464ec55321..9dd7dd9354 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  eded3e4cf270c1d1fabc170826f4d735  colorlog-6.9.0.tar.gz
-sha256  bfba54a1b93b94f54e1f4fe48395725a3d92fd2a4af702f6bd70946bdc0c6ac2  colorlog-6.9.0.tar.gz
+md5  177e72715015e36226abdcac193dc82a  colorlog-6.10.1.tar.gz
+sha256  eb4ae5cb65fe7fec7773c2306061a8e63e02efc2c72eba9d27b0fa23c94f1321  colorlog-6.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index c23e1c720f..1b03c3eb19 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.9.0
+PYTHON_COLORLOG_VERSION = 6.10.1
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/d3/7a/359f4d5df2353f26172b3cc39ea32daa39af8de522205f512f458923e677
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/a2/61/f083b5ac52e505dfc1c624eafbf8c7589a0d7f32daa398d2e7590efa5fda
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
