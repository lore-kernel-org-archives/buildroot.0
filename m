Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60284CD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D5D84232;
	Sun,  3 May 2026 14:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOJ1qenrtvD6; Sun,  3 May 2026 14:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 684738431D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819912;
	bh=21Rc33JjlAjraBB8YQDnz74qXhldDMBwoy/10PK+/Xw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZgGX3PlwKNjNiXtD45NNyXhwUiZlJrF+XpYZE8pmOHfyHuL2PHR7+p1zfy3Jvcbd6
	 oJWE2yxo48bHvt8KAYCH71ryif1VQLBZzSDofxoOI3fyJLM64dUrwhdl+6c5bjcUna
	 n6pABo5J6MdEKDnev0ltdXwCp8xy6a9wC8qA1ENq5L3C7L4xCX9jwkvrgzdn7IDetL
	 VUtBVJLNQTmsFvmJxDmUUddI71Nq5vDUOGLlZxqsztJQAkja5wtNyV9aywI3x8+2NQ
	 5m279RUyUzl5s2R1m9NhqCd6PGNdhUqZzrJ4GLobXabY1q0yP+7yeysQi/jrieK5dB
	 xlmldCGs5hqtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 684738431D;
	Sun,  3 May 2026 14:51:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD6AC127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3CAC4074C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1W5ixO_oajy for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4753F4072A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4753F4072A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0495F83FC0; Sun,  3 May 2026 14:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4271a270fb2defc3c2728d9c22b94bd6ff3e95e3
X-Git-Newrev: 3e084b53658295a5d9f1f93b17d3461f872540e6
X-Patchwork-Hint: ignore
Message-Id: <20260503145053.0495F83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmodem: bump version to
 0.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e084b53658295a5d9f1f93b17d3461f872540e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://pypi.org/project/xmodem/0.5.0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-xmodem/python-xmodem.hash | 4 ++--
 package/python-xmodem/python-xmodem.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xmodem/python-xmodem.hash b/package/python-xmodem/python-xmodem.hash
index 65a9b6afda..585ae4e585 100644
--- a/package/python-xmodem/python-xmodem.hash
+++ b/package/python-xmodem/python-xmodem.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmodem/json
-md5  0a21c269cb4d3995d13a2615c24fed0a  xmodem-0.4.7.tar.gz
-sha256  2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0f293cd21db1c35  xmodem-0.4.7.tar.gz
+md5  859d3ef50394555f8157092341b34b25  xmodem-0.5.0.tar.gz
+sha256  a1a818f31c29412f1cab0cd69deccd7be77bc1feb516723af990d00161f6fb6a  xmodem-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e317b0ce19724327a41e09def456579b80a7b82f9bceb2ba6933eba406f78d88  LICENSE
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
index 1ef5f53bec..b9e48d2c39 100644
--- a/package/python-xmodem/python-xmodem.mk
+++ b/package/python-xmodem/python-xmodem.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMODEM_VERSION = 0.4.7
+PYTHON_XMODEM_VERSION = 0.5.0
 PYTHON_XMODEM_SOURCE = xmodem-$(PYTHON_XMODEM_VERSION).tar.gz
-PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/3d/17/fd6668a09afdc46c22990172b6f65e07dfb5bcf38960d063a7a887ca926d
+PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/c7/03/a18c2b571266787aebb7cadc5d4c90af15ae7e949ae0ee99ed23b5ba4f3c
 PYTHON_XMODEM_SETUP_TYPE = setuptools
 PYTHON_XMODEM_LICENSE = MIT
 PYTHON_XMODEM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
