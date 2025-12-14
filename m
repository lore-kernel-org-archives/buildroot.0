Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83135D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E732814DE;
	Sun, 14 Dec 2025 17:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxu0YGxwTVl7; Sun, 14 Dec 2025 17:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A1DF814C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734471;
	bh=dCVclc94P98CECe389X55lt+TVyXEYGfiigsm2GsQo4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FDj2E6CttFERTBo1nkcUNKlQI6YbFQzAHLnwC2D3wHunCvOU+iD3R4j3CR5WDyj5T
	 3NhTbW9CzfeNOCdyibul0y6Ga8ojv81lIkm5GghwtIP7qKLDQ/tPsXkhFXflnZwmOx
	 4eFIzRiKcYOTAPEomrDlS5jCkpK9Nut1Gam3WVBLohXkkzkDKQNPDUe2ZF2GubGnj2
	 Ib96zX82u15W5L1asK5bDS9lwKlM9IdespQJle3fjHsFe2jTqglTtSIj+qYJ/i/QBz
	 9mBDi6Zv+YijsY6YyRMxKWewYgCrVKasjQCtHU7Mh5NUx1gvnAMZqfNza3XylXiM8H
	 xo5TQ7n1uYaKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A1DF814C3;
	Sun, 14 Dec 2025 17:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C1B9117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70B8481149
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-mf627JSyKv for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3FD8144D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD3FD8144D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE9BB86E98; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2fba76874c35792a8d4f384de541808c8b37f1b
X-Git-Newrev: 3195e244ff37fbf8ab9ebcf7a804f995d5b03468
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.AE9BB86E98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argon2-cffi-bindings: bump
 version to 25.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3195e244ff37fbf8ab9ebcf7a804f995d5b03468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/hynek/argon2-cffi-bindings/blob/25.1.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash    | 4 ++--
 package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
index e088d3dad1..9237741eb4 100644
--- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argon2-cffi-bindings/json
-md5  f1591e1af7dea9ef3e5b982e2c196c1d  argon2-cffi-bindings-21.2.0.tar.gz
-sha256  bb89ceffa6c791807d1305ceb77dbfacc5aa499891d2c55661c6459651fc39e3  argon2-cffi-bindings-21.2.0.tar.gz
+md5  135e9e3b3a166e602bc0512899254894  argon2_cffi_bindings-25.1.0.tar.gz
+sha256  b957f3e6ea4d55d820e40ff76f450952807013d361a65d7f28acc0acbf29229d  argon2_cffi_bindings-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9c158d4f433627f48ac24b6b4d37970afe4172514673c5318014d7cca157c6df  LICENSE
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
index f0d71e803a..b9a28f6908 100644
--- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 21.2.0
-PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2-cffi-bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/b9/e9/184b8ccce6683b0aa2fbb7ba5683ea4b9c5763f1356347f1312c32e3c66e
+PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 25.1.0
+PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2_cffi_bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
+PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/5c/2d/db8af0df73c1cf454f71b2bbe5e356b8c1f8041c979f505b3d3186e520a9
 PYTHON_ARGON2_CFFI_BINDINGS_SETUP_TYPE = setuptools
 PYTHON_ARGON2_CFFI_BINDINGS_LICENSE = MIT
 PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
