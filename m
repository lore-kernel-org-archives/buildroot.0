Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187B7D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E034240AE5;
	Mon, 15 Dec 2025 21:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JbEWnyPWk7h; Mon, 15 Dec 2025 21:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1383540AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834743;
	bh=QUButnbrVvzukzWzos9gifl2OEdJcY6TJOGfJmDADKQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kkrPBsly7ZdUQXVFmok7MrdC29GARRygAp5rxKqDxiPQKGk0XZPtgvFTSeIA9pvul
	 8c2dXiQ7ez9AFqLDod1xqKUhO9bs0L66gLqgmVDbYPBaTNk6v4ppOL8UqoBQvEZM1B
	 0bQV71h1ZyU9J5Um0z1sf7VVznSlcxjxyZs+iS/imc8xKY+I/IeXm/aUWUXsDbDL2Y
	 IgVfBOJhp1Xl8Hc3y15NugiSbYiPk9NnMYSJ7UkndAiCVrG0bgzJNX/9wo3QQjn5XM
	 69Y9lDPWn1kFaNREGQOtxqZDeimJgQJFVgG4rZtoN/nJi4rDZ3NIw7vZJREOjDirI9
	 kpcKWElSKc8Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1383540AEF;
	Mon, 15 Dec 2025 21:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03ED7151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24D624021B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jm4gyxRjKV8 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 785CE40323
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 785CE40323
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74CDE86FC1; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48237a54fbc5a3163a954aa861cb850139143175
X-Git-Newrev: 8ef2649936766c1db160f037d5a57f00f6fbe20b
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.74CDE86FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump version to
 3.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ef2649936766c1db160f037d5a57f00f6fbe20b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pymodbus-dev/pymodbus/blob/v3.11.4/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7fbcfb0e13..8d990d0d5f 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  18a9929a065d545205ee62d8300884a7  pymodbus-3.11.3.tar.gz
-sha256  10c2902838ad5a233baefb64b1c1fb064fa762b22b221bf35191bf39f01449a8  pymodbus-3.11.3.tar.gz
+md5  7485a0f834aafb48273c6adb297dff93  pymodbus-3.11.4.tar.gz
+sha256  6910e385cb6b2f983cd457e9ecee2ff580dbb23cf3d84aefec0845e71edd606a  pymodbus-3.11.4.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 16e8323c97..1e7df6892a 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.11.3
+PYTHON_PYMODBUS_VERSION = 3.11.4
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/2e/3b/599f812b03147f1eee357f0eb62f1753ff5bfc099da9aced63ecf6f32560
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/2a/af/bbb716301ab9c60f0702c3cdf72cc0e373286a5648fe16bc4431400489dc
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
