Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942C606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d1nWM4e+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6974060A;
	Mon, 19 Oct 2026 17:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lB9WClKGdYto; Mon, 19 Oct 2026 17:45:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C3C040620
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431949;
	b=NzxgxhAeG34m1tV+8DReC0db3kD+vo/3Jnt2S1XOW0HqYMbEr5GgyXV4N7href4HjkEO
	 GXh7oWEwa6lkwJ4X9X3zoShoA4G23xnKYb5ioQvn5V0zp8S80TTJsO5b1lFF4pv25aJSC
	 AwFiCmw5aenRM4D2gXqwRVbe5xtlKY01UJGXNtB3HK8IufK61AWu2EnKb4JZJipaL4cAc
	 8vh1ugmb9PlNqBmk/pV+ueHLHsOPXKD4dl8bWwMa+va9hIDCBKoomCJSpl5wCyb8CjGVY
	 sa6sXEc/sXTlo+O6NbaJd/lRMKDDEa/H8oMf3u4joWn3l0mcif2Mr0VowmwJTcwIhIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A6e+4x7N+h0p0oj+j+9e33j1eLl5xKs4X0mvJ9or8Q0=;
	b=oiVOHVTtM1ftlLxspKqJ7U4p70BXZTvYoxLbIBtY+PKH3HTk3dy50FOPiyNN2JCPqYs2
	 wzWYbdNTdsjaof3JE4mAYrUnnPzkjONgPerWPdPpNoH5zGV3wZ/Pa+YfkoEJUUgARDnBN
	 ZvchcFbhKSrwZ14G3I/xED+MuezUoNX57bQYWOiHlOQH/JtsFfOpoFIpcH9t+HNkZegQC
	 FPkXZSWCf9rvrzYS7vq2keukAbdOgvEZ5m0dCrnZmTMYI7UO/Xh/MyawMEeCCTPj1nzA7
	 8PE7T7yYxmXC8dtxdZazz6ci0k6MMnX2ewbJ13MCL+BrPG/6E8xpDXc+WRtVFMurrzA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431949;
	bh=A6e+4x7N+h0p0oj+j+9e33j1eLl5xKs4X0mvJ9or8Q0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d1nWM4e+HLvt6cDVIZs2TIr7b10ZBZoCw0qmzIH7TVTRb7qW3pl+LwAr7a221VmFH
	 3kYfVd7Kw8quMtaJSkpLJcwnC9PlcYDNHuF68xUVy6RsPBjMVZXoi//teJxiuiXYLd
	 DXd0dZ3FAij4qkFd0XfbjH7ST/JVa67ZVAYSF9Ho5Yvqoo85obnhpFg/g8SD5TNrEq
	 0sPzkjJ2EifOvsTzwfeRARBpsPwJkXmIgk66zoPqGEM9KCc2vX3ffWu7aKQmz+qazk
	 /Td18ZVldaGDgx6KC2bX2mnIvGriQ5LsNHdS3Sj0Nd3RhZQENJDncBQOfok5hreqhf
	 gitnfBebuuitA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C3C040620;
	Mon, 19 Oct 2026 17:45:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0A631E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E05EF80AA0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVGmPdxJjc54 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2117780AB5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431946;
 b=QmmqhmkGEuhlpKjrR+8faEsM1n79hRqRz4d9ekLU+OOj7VTkUn0fkpQMxCISJwG5ov6P
 BF1h1AdmJFB1jy/7ZJzS0omh7zqaySwo3zWz2GJEkg2uhZ6PPYN2u5R9aM6NCB8WtnhRe
 Dtc2AiPCf5COmKcABbR9z/Pqsib4H9Ee1rmx7QONUohFvN5Ph0GPr2W2ntFsINHNFBlYk
 TRSvrL1RbYxeneRx6U6TT12+JAKX2YyaZg3ROTjY/26Y7zUYBR6xmOs/x26YZ+3ezslrK
 PIo+d+Z4ZPGWLiwodFY310PEJPGLCQIGgDmJfE1hqw1WkzYyyrfog3SEAOvp6lFKhRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431946;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Px1MTj4cvScVBlRnZIDhYIn3SDgJPwGSjiqELfv8ihg=;
 b=JrkQbI+4fWCMKvQEnYTexD1K2ByS/DTvEpkj3cM7E8Zh//MU7lzJO4eV1WjjQ/+cZXEl
 MLXCxxxV8OSAGIqGn80Pid7h/8G5DaneUjtxUQC8y9vZiMpzpvAwqHYAxptXkFac69YTj
 kTYSHuuBTUnBqNbElvULyud+uglEYLqXE6xxT395F/Bx81g1msltev3rOVw7OyK5/urju
 aIgmvdupv+ZTW8P1due1s6ttVf6FFaNsyXNOJFBQuFGE7VJ75uWaZ/D2qRwaJYIlH38EJ
 CI2IxP+7SyvuAi+tYzs2XpvXhyrZRg/jJ1VEgoByFUz/694vePf2GxIp0d0Q+ls5gVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2117780AB5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ED1398CAE; Mon, 19 Oct 2026 17:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:34:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3057e90598e166dca597fa75b9fdb3ed03b5bb9d
X-Git-Newrev: 1332f3f4589b0764b850ff2d0546b2c47b6e4604
X-Patchwork-Hint: ignore
Message-Id: <20261019174423.6ED1398CAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typer: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1332f3f4589b0764b850ff2d0546b2c47b6e4604
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                      |  1 +
 package/python-typer/Config.in         |  9 +++++++++
 package/python-typer/python-typer.hash |  6 ++++++
 package/python-typer/python-typer.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1d20359c8c..fd7ec64333 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1499,6 +1499,7 @@ menu "External python modules"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
+	source "package/python-typer/Config.in"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
diff --git a/package/python-typer/Config.in b/package/python-typer/Config.in
new file mode 100644
index 0000000000..e78557d95d
--- /dev/null
+++ b/package/python-typer/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TYPER
+	bool "python-typer"
+	select BR2_PACKAGE_PYTHON_ANNOTATED_DOC # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	select BR2_PACKAGE_PYTHON_SHELLINGHAM # runtime
+	help
+	  Build command-line interfaces using Python type hints.
+
+	  https://github.com/fastapi/typer
diff --git a/package/python-typer/python-typer.hash b/package/python-typer/python-typer.hash
new file mode 100644
index 0000000000..aac74ce2bb
--- /dev/null
+++ b/package/python-typer/python-typer.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/typer/0.27.2/json
+md5  2d81e72fd4c60a94c9d1b6ade7142f65  typer-0.27.2.tar.gz
+sha256  269b7eb9d3c202ca84b4bc9618cb04ebb43d3d4d1e567e4c768607232c05f945  typer-0.27.2.tar.gz
+# Locally computed sha256 checksums
+sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  typer/_click/LICENSE.txt
diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
new file mode 100644
index 0000000000..ca0d1c6ee7
--- /dev/null
+++ b/package/python-typer/python-typer.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-typer
+#
+################################################################################
+
+PYTHON_TYPER_VERSION = 0.27.2
+PYTHON_TYPER_SOURCE = typer-$(PYTHON_TYPER_VERSION).tar.gz
+PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/16/f7/57713ba479fd405eb76de31404b2c744c289e336b2d999511ebf51e496f7
+PYTHON_TYPER_SETUP_TYPE = pep517
+PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
+PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
+PYTHON_TYPER_DEPENDENCIES = host-python-pdm-backend
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
