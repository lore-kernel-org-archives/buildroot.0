Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41135D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF32C611A0;
	Wed, 17 Dec 2025 21:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsPrwWo0uBVp; Wed, 17 Dec 2025 21:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EA6610FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007909;
	bh=KvrL7nOdfbbbLllBzIb9Qh6UaAZPY+14mjoA1JRg1rA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K/+h1yay0IIlG8wUxJvIi1I7W/WmVv/0hOwt2EnQKop1ahifBG0wHCl5NY97gMrvd
	 vcYSjvSe/UGfVBj0mzbQGBsjMk+ZkXZKXNKSPYJEKWqC0G8ss5sP1U5mJeaYB8uNdS
	 AZIaz5eWLe3AU9EjMI+OM9yKWH+e9SL+Wx5DINieHq23HQ28vg5VPn6rK3sK+zzQ+s
	 seoUZnNQVXjoIR5u6Jci40wtES9HwPOlq80RFh0weUlMlw57EyJyl6x4nNWdVyetVH
	 BSZc4ENFZnBy/Di1wrx0Kv8yUQAkllux8IIE99RArplx/LaM4vGKHz2bW6cW72QUZh
	 G0RqkN+w7hg1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28EA6610FF;
	Wed, 17 Dec 2025 21:45:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4984375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D97C283AD3
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bX8rLiUzmh8 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2413A83B52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2413A83B52
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 233AA86198; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae6ff907b6f1583398c9299ef8713eee5a617de5
X-Git-Newrev: cfe183efbeef55f417e923b344da90fd7e74d85f
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.233AA86198@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typeguard: bump version to
 4.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfe183efbeef55f417e923b344da90fd7e74d85f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/agronholm/typeguard/blob/4.4.4/docs/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index 8cd3dd0dc6..e567715fa9 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  842237266846dbb102b7239fcf4faeb6  typeguard-4.4.1.tar.gz
-sha256  0d22a89d00b453b47c49875f42b6601b961757541a2e1e0ef517b6e24213c21b  typeguard-4.4.1.tar.gz
+md5  4f97177b802372a70bb571b2aff09313  typeguard-4.4.4.tar.gz
+sha256  3a7fd2dffb705d4d0efaed4306a704c89b9dee850b688f060a8b1615a79e5f74  typeguard-4.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index df5433993d..71d7f11858 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.4.1
+PYTHON_TYPEGUARD_VERSION = 4.4.4
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/62/c3/400917dd37d7b8c07e9723f3046818530423e1e759a56a22133362adab00
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/c7/68/71c1a15b5f65f40e91b65da23b8224dad41349894535a97f63a52e462196
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
