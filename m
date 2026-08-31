Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE87C61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66EE54051D;
	Mon, 31 Aug 2026 19:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqE9ooiTL0Gi; Mon, 31 Aug 2026 19:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788203486;
	bh=Q7gQ+/FVgdi2FXm1hxcW/8Y3T2yqWBzUNrN8hXYnD3Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QPAIy9L8tjZImoY6QcJGUOVvRg9r78I6uHm4qjJpsVaoqY5ewCRh3PWm6MVaNXxL2
	 5bqlIlSHppJNJAyysSaVC1bFEDTVJpGtfeO0n4rNU5qk09Nm1AB0phEXavJ0LjSCmK
	 lChgeIyUa9lQ6qD0f8h9xLJYB9kWRelHkBu+Tted3kUA57YDERv7Z5RSGqWwRcZzWD
	 TIjeok4Qsv2Hc/qm16ifqTNttZSOmCM4eHpqfcr81+dC4u+mhkxj+vY2ydDb5RQqEH
	 SnHS/pxuxAAwM5n8+u+lxjYiYf6QZtwPwJg/s1bE/455bl9fObhyXGwo5wDKrbE5qD
	 /Gpp9tyQgvUvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D214051F;
	Mon, 31 Aug 2026 19:11:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D3C127
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A40AD4051D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zi_fpjUvEv-K for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E81B74051F
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:11:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3466B93471; Mon, 31 Aug 2026 19:10:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 21:10:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c504ef75df4caf58acd20c02c9b2993708b1390
X-Git-Newrev: 913512e3028159aefb4b26062ee11b960e6e24a2
X-Patchwork-Hint: ignore
Message-Id: <20260831191025.3466B93471@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: ensure libxcrypt is
 enabled to provide a crypt() implementation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/913512e3028159aefb4b26062ee11b960e6e24a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When OpenSSL is enabled, if DES support is enabled, OpenSSH uses
DES_crypt. However, without OpenSSL or its DES support, there is no
available crypt() implementation for OpenSSH libopenbsd-compat xcrypt()
function, resulting in the following error:

.../host/bin/i686-buildroot-linux-gnu-gcc -o sshd-auth sshd-auth.o
  auth2-methods.o auth-rhosts.o auth-passwd.o sshpty.o sshlogin.o
  servconf.o serverloop.o auth.o auth2.o auth-options.o session.o
  auth2-chall.o groupaccess.o auth-bsdauth.o auth2-hostbased.o
  auth2-kbdint.o auth2-none.o auth2-passwd.o auth2-pubkey.o
  auth2-pubkeyfile.o auth2-gss.o gss-serv.o gss-serv-krb5.o
  monitor_wrap.o auth-krb5.o audit.o audit-bsm.o audit-linux.o
  platform.o loginrec.o auth-pam.o auth-shadow.o auth-sia.o
  sandbox-null.o sandbox-rlimit.o sandbox-darwin.o
  sandbox-seccomp-filter.o sandbox-capsicum.o sandbox-solaris.o
  sftp-server.o sftp-common.o uidswap.o ssh-pkcs11-client.o
  ssh-sk-client.o -L. -Lopenbsd-compat/ -D_LARGEFILE_SOURCE
  -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0
  -D_FORTIFY_SOURCE=1 -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack
  -fstack-protector-strong -pie -lssh -lopenbsd-compat
  -L.../host/bin/../i686-buildroot-linux-gnu/sysroot/usr/lib
  -lssl -lcrypto -lcrypto -lz
.../host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../
  i686-buildroot-linux-gnu/bin/ld:
  openbsd-compat//libopenbsd-compat.a(xcrypt.o): in function `xcrypt':
xcrypt.c:(.text+0x51): undefined reference to `crypt'
.../host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../
  i686-buildroot-linux-gnu/bin/ld:
openbsd-compat//libopenbsd-compat.a(xcrypt.o): in function `xcrypt':
xcrypt.c:(.text+0x51): undefined reference to `crypt' collect2: error:
ld returned 1 exit status make[2]: *** [Makefile:233: sshd-auth] Error
1 make[2]: *** Waiting for unfinished jobs....  collect2: error: ld
returned 1 exit status make[2]: *** [Makefile:230: sshd-session] Error
1 make[1]: *** [package/pkg-generic.mk:273:
.../build/openssh-10.4p1/.stamp_built]
Error 2 make: *** [Makefile:83: _all] Error 2

This commit enables BR2_PACKAGE_LIBXCRYPT with OpenSSH as long as
glibc is used. Since "sshd-auth" is compiled regardless of
BR2_PACKAGE_OPENSSH_SERVER, we need to enable it with BR2_PACKAGE_OPENSSH.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/Config.in  | 2 +-
 package/openssh/openssh.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 25843447a7..3b0adad63d 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPENSSH
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A free version of the SSH protocol suite of network
 	  connectivity tools. The standard 'ssh', 'sshd', 'scp', and
@@ -22,7 +23,6 @@ config BR2_PACKAGE_OPENSSH_CLIENT
 config BR2_PACKAGE_OPENSSH_SERVER
 	bool "server"
 	default y
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Server programs: sshd, sftp-server
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index dd0a6e023e..f2e1f235c0 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -51,7 +51,7 @@ endif
 OPENSSH_DEPENDENCIES = host-pkgconf zlib openssl
 
 # crypt() in libcrypt only required for sshd.
-ifeq ($(BR2_PACKAGE_OPENSSH_SERVER)$(BR2_PACKAGE_LIBXCRYPT),yy)
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 OPENSSH_DEPENDENCIES += libxcrypt
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
