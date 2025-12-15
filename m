Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFA6D5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A0760F07;
	Mon, 15 Dec 2025 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbkDhgyfP7FU; Mon, 15 Dec 2025 21:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C4A060F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833013;
	bh=ZmNG4SRinsJ/ksKMtZEdOmZ0jJJ7nauy2FHlhEX3afQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mNPkDaSWaudDB320P7GJ7Ri84yiaerDgAfzOBF8ARGoHK/wGO2LYgkEhBhZdlA4Qb
	 upK9V7V/J/PYdt5kJmw3++29bk41MDnwupUlVRYxpz7w+A+4yIA/aEZfemVZb8HvLa
	 OfXXQCL8pFwQ2VM+wOJ+xab8OcuWeta20WBgYW2DL7jeWk+SodDdzMM2PwP4FZSMZp
	 viDD+EuChILhD4tXBJMBdVmzvfrME38VZ7/z92N91pn87x2ixA4gYxO56c7rMBnTN2
	 ICaY+Sq7JzoCAKlekxwq10ztyCwud+8wgRlFGJLop3Tu6EYAquDvbgEezEbeudi/Fz
	 RkgV5oyC+DoUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4A060F28;
	Mon, 15 Dec 2025 21:10:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01AC1255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B30D60F06
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zUKMMnEdUxH for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84AA5607EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84AA5607EC
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7642D86FB2; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:33:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41f18ab2211c6a4481d94bc1ce7b1469e3f2c53b
X-Git-Newrev: 9f0dc5401ba1a4738581d35f50dcf49db1b6df46
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.7642D86FB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema: bump version to
 4.25.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f0dc5401ba1a4738581d35f50dcf49db1b6df46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-jsonschema/jsonschema/blob/v4.25.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index 79d64f4846..d35f8c383c 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  a2cb5fee4da011118708ab275b34f30b  jsonschema-4.23.0.tar.gz
-sha256  d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4  jsonschema-4.23.0.tar.gz
+md5  e33f133a5b56b9f9756b38065849c86f  jsonschema-4.25.1.tar.gz
+sha256  e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85  jsonschema-4.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 9f99628b5d..1407a414e0 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.23.0
+PYTHON_JSONSCHEMA_VERSION = 4.25.1
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/74/69/f7185de793a29082a9f3c7728268ffb31cb5095131a9c139a74078e27336
 PYTHON_JSONSCHEMA_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
