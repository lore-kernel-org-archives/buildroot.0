Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E3DFEE4E8
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 10:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359B460EC1;
	Sat, 28 Feb 2026 10:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4RjATBnKmc0; Sat, 28 Feb 2026 10:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F001660B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772273355;
	bh=w3M73g/ecBoh8SD7TDP9fygTuQxAEZTxsPnPAX/ElbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m2o2qxiTS+QjgAeAY/zxxdNgaUYB/AcIsoPxrG3GsnFnBCbmnDM+TPAoxtXXVRg8i
	 C+HGWW1LXB+waw6ZT3cqYGdkauUWphqjb2o8QvWDTr4HnaK0uBGvqk6VdZArUk9pjD
	 3btgIvA0Px7Yo97ULsiDXgIECzrNOXwTIO4hf6t9RB9ogqiYl9CZi3wDkseDa8yfIU
	 bYsjs9ihfHdcd7PPURyNreQjHPE1RJgjoSvuESzs86/EjVxDaJlvH9hmI6+AmPiTK0
	 UXvoJhSbS98q/eCrdSP09bvaDKhtZ/CbLYIHMvSuPyq9yerv8Vc0+Yur2fKNQXRbrf
	 fKOsMEMK/AbQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F001660B15;
	Sat, 28 Feb 2026 10:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F20918D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8E5960B15
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4PRrPEtVrbE for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 10:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83C5600CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D83C5600CB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B10968555C; Sat, 28 Feb 2026 10:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 11:06:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9702cf6ca3d55ba385f315b46def79ac2ffaece0
X-Git-Newrev: f54e7d710c6dd7d46702304ec8d7ea9e7a8252ec
X-Patchwork-Hint: ignore
Message-Id: <20260228100911.B10968555C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: Security bump to 0.11.4
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
Content-Type: multipart/mixed; boundary="===============4284547412050311857=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4284547412050311857==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f54e7d710c6dd7d46702304ec8d7ea9e7a8252ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Change summary:
https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.11.4

Fixes:
CVE-2025-14821: libssh loads configuration files from the C:\etc directory
on Windows
CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
CVE-2026-0965: Possible Denial of Service when parsing unexpected
configuration files
CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
CVE-2026-0967: Specially crafted patterns could cause DoS
CVE-2026-0968: OOB Read in sftp_parse_longname()
libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
extensions

Signed-off-by: Mattias Walström <lazzer@gmail.com>
[Julien:
 - add link to upstream change summary
 - fix signature link in hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 1c15d77a45..5a103eb593 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.3.tar.xz.asc
+# https://www.libssh.org/files/0.11/libssh-0.11.4.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  7d8a1361bb094ec3f511964e78a5a4dba689b5986e112afabe4f4d0d6c6125c3  libssh-0.11.3.tar.xz
+sha256  002ac320e3d66c9e100ec6576e3e84aa0c48949efde3bf5b40a2802992297701  libssh-0.11.4.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 3c7e77a206..56de66d6ea 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1

--===============4284547412050311857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4284547412050311857==--
