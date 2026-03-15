Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FA2F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0503416CD;
	Sun, 15 Mar 2026 22:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4hzRXdmMbgd; Sun, 15 Mar 2026 22:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEF2C416DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613201;
	bh=DNu7S+GI53tfMMy7Tp4iAwG71Gn8l+IV7DIEJfIRI5M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GNKGLd7J+/1a0dPZh1dVKjMIlYxy2JaJG8EiQg1LnBlxt+oTpzApiDX+VrDOnFBuA
	 vU4BIG0v22UYfYILN8x9swK0H6aw53R9arFWz4Fg6C+lTPgHVDxZZdXKQNyIAVLLLL
	 2X+7AvHhYMcZuYPZ7lF0wIAtkg/WYUJV6m2+sb4LIUMVzbg9xr/hb0fZk2ws9w97yi
	 qgbpFXOtSa4RpGN9qVmteMq82O02/xsskzljTMxfx9TCvVBlN08JkDHfsleg4LL8Ih
	 MSjnci8svBMHFsACucdalqlkfUBDBWG70X/Ovi8ytBTURW4IYnQl7rHDWg0y2z336X
	 2GAik4nH2JOWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF2C416DA;
	Sun, 15 Mar 2026 22:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4421B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C58840A22
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DOwf3lk4gep for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B702840AB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B702840AB9
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0543983D9E; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c479ac460172be6203b543de30c83f98055aa54b
X-Git-Newrev: df796e693c3b7049e23536b5b403b55a06f4bc77
X-Patchwork-Hint: ignore
Message-Id: <20260315221805.0543983D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump version to 3.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df796e693c3b7049e23536b5b403b55a06f4bc77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/urwid/urwid/blob/3.0.5/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index dd9c208ad0..56ea763deb 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  6cf95702b787fd7e5f90e74d9900f000  urwid-3.0.4.tar.gz
-sha256  c3d0d2f47602b21949ffb8669a7ef0a8ca5fa13ed5c1ee1d2d81edf05616187f  urwid-3.0.4.tar.gz
+md5  ee84dfeeac19cb4b09a9d90b64029c20  urwid-3.0.5.tar.gz
+sha256  24be27ffafdb68c09cd95dc21b60ccfd02843320b25ce5feee1708b34fad5a23  urwid-3.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index b3069fdaff..0c29c9ab75 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 3.0.4
+PYTHON_URWID_VERSION = 3.0.5
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/e0/4d/f0832a6bf0986bdd770d61f9cf9e9915741171502c0c399bf934c72a3e5e
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/b1/59/67cd42db7c549c0c106d2b56d2d2ec1915c459e0a92722029efc5359e871
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
