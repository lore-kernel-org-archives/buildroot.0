Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D880D5B86E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2A4960F45;
	Mon, 15 Dec 2025 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 877avq_e_uJ7; Mon, 15 Dec 2025 21:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C40860F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833016;
	bh=NjKIiXv9aZQ+1HdfLZtulvjrFc7BetxSCJB7uhbBtNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s8pRB8fdsJdLHKdMmG/hLq2Sx8+Xhn5B/PwtZe2CPIMkI1DTQJAAYi4cFRL/ZRVXF
	 hJueCfDTz11MLxx/oY+S54+FjWURh2r3AV55MDL76pWkZFORylZ3pfNnUuxHyUdC4k
	 r8Rc4O/3709uIoJOIU8MnFqTF6mTuX2WRrskV6Vf91EajdWJEZVLnbqgH61C5mAZNl
	 pfYK/hia26oBqJyejAIGX6j/TfPogxkwsEExnb1nD68sypxoFE8YA0tK/XPvQca+6u
	 GzWs3f6uK31Pd0tsgT9jEtL84Jh+B/NSduEQ5PCgZWdT9uMeGDU+0JDeJl8t0GF5Y6
	 iLvi694InakGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C40860F3B;
	Mon, 15 Dec 2025 21:10:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F58E151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 013DC607EC
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnGm6ux2EH0Y for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9005560EF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9005560EF1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F1BE86FB3; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:33:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f0dc5401ba1a4738581d35f50dcf49db1b6df46
X-Git-Newrev: 85b7dbeeeeb8a5c4b2aede270be0b5c21e620442
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.7F1BE86FB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-legacy-cgi: bump version to
 2.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=85b7dbeeeeb8a5c4b2aede270be0b5c21e620442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jackrosenthal/legacy-cgi/releases

Switched build system to hatch:
https://github.com/jackrosenthal/legacy-cgi/commit/0ea10a20213fe89d77110dcaa3f4c932d4a70310

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-legacy-cgi/python-legacy-cgi.hash | 4 ++--
 package/python-legacy-cgi/python-legacy-cgi.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-legacy-cgi/python-legacy-cgi.hash b/package/python-legacy-cgi/python-legacy-cgi.hash
index 53af4ef691..74dd629c98 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.hash
+++ b/package/python-legacy-cgi/python-legacy-cgi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/legacy-cgi/json
-md5  5750721070ad829796ef830308e76907  legacy_cgi-2.6.2.tar.gz
-sha256  9952471ceb304043b104c22d00b4f333cac27a6abe446d8a528fc437cf13c85f  legacy_cgi-2.6.2.tar.gz
+md5  bbb85dff278de9bf03a3f4e941398ea1  legacy_cgi-2.6.4.tar.gz
+sha256  abb9dfc7835772f7c9317977c63253fd22a7484b5c9bbcdca60a29dcce97c577  legacy_cgi-2.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
index 457463d9dd..cd87024111 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.mk
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_LEGACY_CGI_VERSION = 2.6.2
+PYTHON_LEGACY_CGI_VERSION = 2.6.4
 PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
-PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/ad/2e/e1860989bc6cfdecba66db37f2f783636b97a1248ac25fbe864b6e931c22
-PYTHON_LEGACY_CGI_SETUP_TYPE = poetry
+PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/f4/9c/91c7d2c5ebbdf0a1a510bfa0ddeaa2fbb5b78677df5ac0a0aa51cf7125b0
+PYTHON_LEGACY_CGI_SETUP_TYPE = hatch
 PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
 PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
