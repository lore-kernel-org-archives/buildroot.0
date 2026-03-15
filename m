Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41E5F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83A140A22;
	Sun, 15 Mar 2026 22:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4YwJYDq6igU; Sun, 15 Mar 2026 22:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E92C7413E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613124;
	bh=0W6Xip1nNPkMtMIpkvJSELi4dDS//xttyWI67U7ny7c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q3D33OfE+tQTIkAGJt6nSr8d13tg0lKGmyqaeOojyRi9awUZ9nn+vu19ijV++ZdZe
	 uu0ghv71swu1NIHCD+ISiRhwY1q6K3qJHLM+FANKjbJUdNxfHjwjK3xPDIj0fCHQv3
	 mOAY8lF+LJ7t5GewjNbq1zrbROI13oZnkBQutRFqfbP8dJvRFRQx6I7P+oXuGgQQgr
	 h9tIrPg5sNMS5dg87ipscOpE+zqtiw6Crc02elDfys7AJ8TRH0ZnOMwEZ3ok+4aIIK
	 d+gubNHAXfsYUCHD+CRH0wFhfXGGZCEHBTbS55ZiDTgyo3zvCktkBx4+Z+fogStq+J
	 /FNUk0NdCsfvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E92C7413E2;
	Sun, 15 Mar 2026 22:18:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E50D1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43F7640A82
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNxS2WU1TuUm for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661EE40891
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 661EE40891
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95AC785BFF; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e49c6e18bfa185a68e3172cd46313aa19525904
X-Git-Newrev: 9e08e5029fb375fad5a62c767acd1309f090c79b
X-Patchwork-Hint: ignore
Message-Id: <20260315221800.95AC785BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiomqtt: bump version to
 2.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e08e5029fb375fad5a62c767acd1309f090c79b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/empicano/aiomqtt/blob/v2.5.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiomqtt/python-aiomqtt.hash | 4 ++--
 package/python-aiomqtt/python-aiomqtt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiomqtt/python-aiomqtt.hash b/package/python-aiomqtt/python-aiomqtt.hash
index eab5a1938f..01dc68f671 100644
--- a/package/python-aiomqtt/python-aiomqtt.hash
+++ b/package/python-aiomqtt/python-aiomqtt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomqtt/json
-md5  9ded3fea036dc979d7855a6b3fd1dc33  aiomqtt-2.4.0.tar.gz
-sha256  ab0f18fc5b7ffaa57451c407417d674db837b00a9c7d953cccd02be64f046c17  aiomqtt-2.4.0.tar.gz
+md5  75cb0ed1ad029d19cb76478879aba12b  aiomqtt-2.5.1.tar.gz
+sha256  25a0a47d157e8f158d2da1110ea4786c0615518751e94f7b04976c977a8ff20d  aiomqtt-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2cdee9e997c759749069649dfb9060fdb885da82bc50c0dcb4841b1dcab0b032  LICENSE
diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
index c5b932838d..53a2125d87 100644
--- a/package/python-aiomqtt/python-aiomqtt.mk
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMQTT_VERSION = 2.4.0
+PYTHON_AIOMQTT_VERSION = 2.5.1
 PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
-PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/45/9a/863bc34c64bc4acb9720a9950bfc77d6f324640cdf1f420bb5d9ee624975
+PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/70/44/cfc58272783a11729462dc6df5adbfeabd084f840f609054ac772ae98c19
 PYTHON_AIOMQTT_SETUP_TYPE = hatch
 PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
 PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
