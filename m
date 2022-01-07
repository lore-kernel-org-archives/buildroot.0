Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C642C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A6DA4287E;
	Fri,  7 Jan 2022 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktjhmeEdgzb0; Fri,  7 Jan 2022 21:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B257442877;
	Fri,  7 Jan 2022 21:03:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B285F1C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C053818E6
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRc2uP71MB9L for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:03:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB0C081839
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:03:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2F4F2834C5; Fri,  7 Jan 2022 20:56:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:02:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a636b55f873bdd00c5aa405f00d887a3a6a0eedd
X-Git-Newrev: 10b8d6e512de293f60ccda989d593683b6ccc263
X-Patchwork-Hint: ignore
Message-Id: <20220107205655.2F4F2834C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: bump to version 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=10b8d6e512de293f60ccda989d593683b6ccc263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set --with-cli=readline to avoid a build failure since
https://git.netfilter.org/nftables/commit/?id=b4dded0ca78df2a67245a3db1448a51207577ff1

https://www.netfilter.org/projects/nftables/files/changes-nftables-1.0.1.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index bbf7e5a2b1..53878abba9 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  58bf547daf967a2b88ecb4f425f126006ebde22711db806b25c1d6cf84fe45f4  nftables-1.0.0.tar.bz2
+sha256  3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423  nftables-1.0.1.tar.bz2
 sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 2409eb0571..d5c16ac2be 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.0
+NFTABLES_VERSION = 1.0.1
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
@@ -21,6 +21,7 @@ NFTABLES_CONF_OPTS += --with-mini-gmp
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
+NFTABLES_CONF_OPTS += --with-cli=readline
 NFTABLES_DEPENDENCIES += readline
 NFTABLES_LIBS += -lncurses
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
