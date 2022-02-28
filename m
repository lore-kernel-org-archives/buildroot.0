Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC678C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 18:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62C24405E9;
	Mon, 28 Feb 2022 18:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWpU21cRlPsb; Mon, 28 Feb 2022 18:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 356E1405DF;
	Mon, 28 Feb 2022 18:55:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4A551BF2CE
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFC1E405DF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4Sz0hPsj4vr for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 18:55:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22B3400CD
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:55:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 27E4283488; Mon, 28 Feb 2022 18:47:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 19:55:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 212b020bb43f13121d6cde464f871d5d1cf6cfbe
X-Git-Newrev: 9597d5ec8e9a021f674ccd97828c843977934e51
X-Patchwork-Hint: ignore
Message-Id: <20220228184738.27E4283488@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump to version
 8.9p1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=9597d5ec8e9a021f674ccd97828c843977934e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security Near Miss
==================

 * sshd(8): fix an integer overflow in the user authentication path
   that, in conjunction with other logic errors, could have yielded
   unauthenticated access under difficult to exploit conditions.

   This situation is not exploitable because of independent checks in
   the privilege separation monitor. Privilege separation has been
   enabled by default in since openssh-3.2.2 (released in 2002) and
   has been mandatory since openssh-7.5 (released in 2017). Moreover,
   portable OpenSSH has used toolchain features available in most
   modern compilers to abort on signed integer overflow since
   openssh-6.5 (released in 2014).

Update license (md5crypt removed, bcrypt relicensed to BSD-3-Clause:
https://github.com/openssh/openssh-portable/commit/a5ab4882348d26addc9830a44e053238dfa2cb58
https://github.com/openssh/openssh-portable/commit/158bf854e2a22cf09064305f4a4e442670562685
https://github.com/openssh/openssh-portable/commit/c0459588b8d00b73e506c6095958ecfe62a4a7ba)

https://www.openssh.com/txt/release-8.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 6 +++---
 package/openssh/openssh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index aab3dba09c..dd123c1bb6 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.8 (base64 encoded)
-sha256  4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9  openssh-8.8p1.tar.gz
+# From https://www.openssh.com/txt/release-8.9 (base64 encoded)
+sha256  fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7  openssh-8.9p1.tar.gz
 # Locally calculated
-sha256  432abf7480fb31473a6706627212913fc70032e3fb71b90fecb28ae26a2d741d  LICENCE
+sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4145bfd8dc..0e0d59e6ab 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 8.8
+OPENSSH_VERSION_MAJOR = 8.9
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_LICENSE = BSD-4-Clause, BSD-3-Clause, BSD-2-Clause, Public Domain
+OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
