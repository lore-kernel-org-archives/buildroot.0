Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EA1606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QL99Yo+0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0AF40587;
	Sun,  1 Nov 2026 17:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99TmjJ1YobNY; Sun,  1 Nov 2026 17:36:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 632DC40574
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554580;
	b=Tna8yjKMVR1eDY3//kvCzFxR1BjW2QL67EE5LVRWBJMbvEL76KMdiBEeO5oCDBG6Ve2x
	 p9fjz/X7mHMpVMvJpA4j3zzRkjihu9sLeBX8Lj3ARryTUzJKkNSkgfAywE8PQ7lpSBdGy
	 jvwxMi9T8FtCtYaqLpNgZdgv9TNpdT+qZcLI3QvMiDh7rEOi4e0XHxnOJzmJroyKyxh+m
	 3KHIq5K0vomlVkvV5G5i/AzwVXlBP6vTnObc59zlRu3wwtES6xAcJnibfF4z9XDsgDKTu
	 nPpAd2vCGb+GleFS42H8j2877E2FH4nNCPrwPARA4+Zhl6NPeJof3bju9HmpvMXowHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4igaNNocan3i585V8V1xXIN6R/8U2/fjS0HyVdlHceQ=;
	b=EdNGu3ezNjKPEnhhNTiqeVVHkKVjK3nCjdck5D2GOv9LpdzAUc4t8meTKXQW3YR2Mhzs
	 i+w8qrruUjFMJEBjEgt3SwnZ9fk+lJJPccRa017OhbOngEGz2w6EQDYBpWI2VYpP84FY2
	 mKLGDEn5OSNQ3KOp2F8ioBjnP8uqgWS9pYSbGEh1WgKnYLbPzYy49+wFvobzYlTIVNk4y
	 Z3t4oRZPDkimbOVUWF/0fsTmMqz+TxGhVvomJUx7L5QNIjONLESps6HLZ1RI/NXFkaO1f
	 CkdkM1Yx9zldcKsBeKaCdx2hfM/kAxDarfmRZxB14f5Ibmt1i/k90IgLTTt7GJzbF9w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554580;
	bh=4igaNNocan3i585V8V1xXIN6R/8U2/fjS0HyVdlHceQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QL99Yo+05Jc7kmAXLJ72E4QfH8TEN9fSkc8fNEBIBKTdQtLy3EJmUARzR7jlWMpd1
	 BJgHkX7zq0eU2bklpTcmRD6wC4sIEdvAvvSTK+MLZHt7EJB3IHpaw/jRXKMZqz6uSM
	 yLOY0n3MDAD7nIQMQ5yiZm+VdkvbG1WAimtdC0yW37CatjERZxd7J5xdRTkZ2vcGMG
	 mQ3OlyvZl10eRzjaBk9ZWvaz6ioA04xnZv1+jZlC+SvXf3xMhTYRlrfRjsYw5zY35z
	 o+WQnmSQi2n1LAxuB3Ay28xIUZEAZHe8w0uUlU4sqsSkCO8pZU7HgUfoCfgEdkrD6S
	 RvHHDxrTGhp3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 632DC40574;
	Sun,  1 Nov 2026 17:36:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19BC2EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B83C6060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6397ogWmhsHK for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 570B660612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554577;
 b=fP4jUrYkCxSD2r0N/VhhI7vZ+YRJovTpJtRgeVdoR4m6qOkHhl9/tfNIU18nlTWn3KDx
 n5w40sCOiTkxSPjdo82+H4Xl7G238w/bXYhLJu/ofm/oUNmg7qZ62rff7rqS6yj1G5UF1
 3zDARbOcyJoEJiARhiXeNS9dfAucDg21BdwZKxCnuyQa5KwIKmPvfC5Y+BwPYrUnC5Ile
 GYiOybEZqcj8TkVZDiKSNiETJh1ZToN286hSnmM3ippyZABzMQ7RAk9FuSevI5ixcO5Le
 /l1ize3NHjlYLo1ZKvuaY1WqM2G0uO8kz7U4swjJ6IbYMMtoPvp4um62Y5LKIUdAriw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554577;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3GRKBwWyvpjfxsy6HpCyx+OebgLRQxfeAeUAeLWCS6Q=;
 b=lnF4ziXX5aTYcFHRrOoO+wn/PCMPUZ9IeWxXE8lNA3zqFG7jgkkzTibgYKWb89PByYiY
 9jFDR5m/6hL/ej1AYRvSPrLN41nM9WpMNSx9SQOzrqkKNIXbVKiGpx17uQR3LWdFJRGsR
 jZRYKzygb4GJXGM0pIb+k63pEYwjzvhfsowhsf86/X75Y7Ctno/CXtXlzruaL82cW2oQG
 K2gp/OcFEdMskaI4xaFZQ9VBJawhAQqGwRZub3U0piPHN1v7F+ML1nDxDNEPMR1yszKa8
 0amr1h8aln5D17sm4lIq6Qy+nl7KQgEcIPQQ1yZsGcCrhQCzClMZdovmThRosxxuc6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 570B660612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 114839D4C6; Sun,  1 Nov 2026 17:34:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:16:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 567947a0c04a9ae03c04b32d74ec472c906de677
X-Git-Newrev: d1cdd617b124514f68e26e6ce926d1522410e6cd
X-Patchwork-Hint: ignore
Message-Id: <20261101173448.114839D4C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,BITCOIN_SPAM_04,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,PDS_BTC_ID,
	SPF_HELO_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1cdd617b124514f68e26e6ce926d1522410e6cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the host-python-hatch-fancy-pypi-readme build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 00df59252a..d24358f7f1 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  1aa877c1879a998b938452a55215b5f8  filelock-4.2.4.tar.gz
-sha256  c6d8663535e1650ee430507b4ffbac7b464dd64b7647ea0112a9f406499d163d  filelock-4.2.4.tar.gz
+md5  932426b5d85aa53ea727cae7238102ae  filelock-4.2.6.tar.gz
+sha256  ee7af8ede36dcaf12e1016d9f7c3a63ecd5497d46f85dab21b8c779b8f944e97  filelock-4.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index b95201a391..69032ceb83 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.4
+PYTHON_FILELOCK_VERSION = 4.2.6
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d8/28/3893324bcadf8f89b1616637468d766af3f625008c0735bf704fdfa86617
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/6c/730b340182f1fd74d4ef8d3f35431ce84f8f97b1a1f2afd145174b7bb047
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
+PYTHON_FILELOCK_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
