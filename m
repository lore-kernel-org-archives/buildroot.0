Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F4C606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IktOK6oN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C35780E10;
	Fri, 30 Oct 2026 21:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0t4LToM6Mcn; Fri, 30 Oct 2026 21:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E2EE8116C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793394158;
	b=gTtXPX3UQ2A+tc3o3kVjzY0kLxV8p0rqkaFclVdbBX00vcQhRYceQAfkGFC+6rFrTc+G
	 WpalWXIPGjRzTVlFcymdZ28YEZ7vU5eQvFU/6Yi6dqkkW5udLikbqjCam91tqQEg6kDOr
	 ha6Vaz2DWQQQJPdkZ0rfCvrQu6LZprqZkrieIMk2/snupYCFvT9mmA/NAFolEOUGYZ/Yq
	 ZoPwGfeLUiue7WoQh4D+3g4TPPQ/oR2+JC2NAozoRRGk3yh4tPJx24xRkQeovj1iXFkpd
	 So9eQy5I8Gx3E8bMZ3t/CpPhz47CsXL0ycx4wQlwCtf2rexoggyb4giJT2G9nRuyCSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793394158;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yQk88lxVyZwq3xvVyvc+SuTZcMcfpwlOIetOzGpLqyI=;
	b=S1a1CzrFNX+0+eDoCDuatvL8cySsKXDIIGP6sBexrBfGb4cyJXn8kt5ClIXqu2l0+wpg
	 XxgBgDV3ebFtPS4rjgxksT2urn/epUhJEjcVPFSeXu6jZUuLm8hQmAjJgW8JG+GobdUEY
	 orcUifnAaIJf7OBqhG9sIu9dBNQAqfzb6RN+Ihwia07WSfyoBJw6889FRbiImTKE4DxCv
	 fDbrR3OFZQQW4Xsos2cacBIhPz/fdyqckSMxJHYWKC0oxsRz9LQuTEZLKvcGbMDjTsgfC
	 bqfQWmhSa9qThz721LKWbjNmN7gLqXJjxKq4oTYD5kipOVjk2PO/IXT3B9f18MIzEqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793394158;
	bh=yQk88lxVyZwq3xvVyvc+SuTZcMcfpwlOIetOzGpLqyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IktOK6oN9RNdIgpFw1Dy6YDzAt7PUUlqlUoYRw1CketKrP7yy+/LkIScDogzsF7oy
	 sMFac/HyZnghLu1FWP+PoZ++UpJwhzfU2bQTNIh2lvP3aMCgqSiPeHhm9uXoJrYAoT
	 qCxz1ufESS2+Tem1K12514/In5UTP/Hs3xNWLK8CxClW0Q2rzqBkVOGrdgO5ggYinz
	 tpDamWdNv1eBzb59IxBaDS21miSi+2d8ripME844aSkJ4NjPG5HcvX7g+xrWqEafHp
	 Y0OFrRJnufb0MAihJtL9EJihnOCzdrWr7xkjpX2DN/vRKXNYBdI+g+hYXTgqYxj0bb
	 FtNQ8KosBGvqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2EE8116C;
	Fri, 30 Oct 2026 21:02:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C16235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F173540541
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 21:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grknuAtvWy7m for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 21:02:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 098754052D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793394156;
 b=YFnY706tj2pS85dsR0C9IXGqG/XzlRxTmziBhjXGbdoscJp4pbK9isTuTJpjQpWK4grA
 UU2OcqQpHj21aWXQTJbyENBn+yQehEmOq1x2Iy1acTQwRRfqeG34xdIZDn7ZwizHm4dPi
 tSVxB3mEdIIuUaHe0BpqEmSUqF2YXdrN+eoKTpGRvhg0jGEv/XL9sn9/HoYiy6F/w2h7H
 uQNRnksIzIVyGyjRNWzjtAa3nDXTgukFplCEX0gaESk6xawWXPJ7R6BbU692k7qH5gMer
 RCrS3XtLbEQPxFmW1IOz3krGMRsqwDnTql8OYLf92PtGuXFwO8Lo31JgreUIIISGAwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793394156;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RFnNZH1QWZy7QA/PDvTD24oPpYM9UFBGdGCsEtLFjAg=;
 b=CXhIT27r8vJVqWD4L3Tr5CbSDxiOVNxi3Tm2om2xTcKmxHd4lbZ2dAFEDf4CQrEVPTl3
 Z/pBsE3fazrbYvYz/8SoHwHIPc+nj80MoSksY/szfIICuhlVENfXwFSa2asQ3sA0Y/bRm
 ZVEGU0QBVw0tSahJn0zQ1I3eWbdL5lgx+Zt5wAmGHher10Df2aflr2LU1czkt1Yn6XdcI
 o5bpFQZVzVx7uN4A1mwWwoJd/curMWP2wAYexmScpsiJemRhMVxxHO/fAdXSuyPsbzaRI
 67sxVZWcV5gUUxI1cCuPMChD9fJcFTP4fkTBy5hI+4/WAJ0XiHoRz0/cWKU0Ebqt6eA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 098754052D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 21:02:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92AE59D3D4; Fri, 30 Oct 2026 21:01:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 21:49:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dab6840c8cf2bb6ddad96c39977a10564d45e47
X-Git-Newrev: 15b0457158bbe24264ab241cbe87c52b4d659f4e
X-Patchwork-Hint: ignore
Message-Id: <20261030210105.92AE59D3D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunwait: bump to version 0.9.1
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
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15b0457158bbe24264ab241cbe87c52b4d659f4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream switched from C++ to C, so drop the C++ toolchain dependency
and use the C compiler.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Julien: use 0.9.1 tag instead of commit id]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sunwait/Config.in    | 4 ----
 package/sunwait/sunwait.hash | 2 +-
 package/sunwait/sunwait.mk   | 3 +--
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/sunwait/Config.in b/package/sunwait/Config.in
index e141c778a3..ea0ec171cb 100644
--- a/package/sunwait/Config.in
+++ b/package/sunwait/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_SUNWAIT
 	bool "sunwait"
-	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Sunwait calculates sunrise or sunset times with civil,
 	  nautical, astronomical and custom twilights.
 
 	  https://github.com/risacher/sunwait
-
-comment "sunwait needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sunwait/sunwait.hash b/package/sunwait/sunwait.hash
index 8396fa27dd..6357958811 100644
--- a/package/sunwait/sunwait.hash
+++ b/package/sunwait/sunwait.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  ef26ed05882d5286a64a37c4044f99b877cc54f58a46f0e37ca60c93398df910  sunwait-7326b53e5406c7ebd552ae6dc0fc659252a18e7f.tar.gz
+sha256  02fe8165a60ede67f1d0dc98acf4dfbe40865a215d9bd039f57806f1e100b406  sunwait-0.9.1.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/sunwait/sunwait.mk b/package/sunwait/sunwait.mk
index 4b27e8267a..eb8adfdf7c 100644
--- a/package/sunwait/sunwait.mk
+++ b/package/sunwait/sunwait.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-SUNWAIT_VERSION = 7326b53e5406c7ebd552ae6dc0fc659252a18e7f
+SUNWAIT_VERSION = 0.9.1
 SUNWAIT_SITE = $(call github,risacher,sunwait,$(SUNWAIT_VERSION))
 SUNWAIT_LICENSE = GPL-3.0
 SUNWAIT_LICENSE_FILES = LICENSE
 
 SUNWAIT_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-	C=$(TARGET_CXX) \
 	CFLAGS="$(TARGET_CFLAGS) -c" \
 	LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
