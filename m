Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EA2D3F080
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 15:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE14760738;
	Wed, 28 Jan 2026 15:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6TUxCF5ETHK; Wed, 28 Jan 2026 15:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC73660750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769614929;
	bh=dMEjlB56SigGNnVQlRH+iCdCzfDu4oYYiwuBWhQvi6o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m491qqS1PNC8qermZS8qjQIRvu5aSzcivUy7OTjZDRBr+4Ig4wENI6v65gTURhgni
	 JEXXtHATbAlTusIHiL9qovycr5l1dXLC+dapxqo7i1qN+ZtIEoVaTp06IsW+a2g8Rr
	 j3fT/aUcUfQXCtupvxVIjJCJvib+E/3FCRZH+hlLimQW9vZDlBq/xIWb8+wapcl9DM
	 ec/IZoDK1Y/cTw9SJzFEojcj7zK3tDzjmGe1s90rFqZkrg0wUgox8ZMQ9qt6TW2DY5
	 97qV2BKhmSKjZZJUhYay9oa0pQM7bNLdkXTh7mBsYvljzPi49v/HItMOSW+OpZh6g6
	 umZRUqx2bQtdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC73660750;
	Wed, 28 Jan 2026 15:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B31ADD3
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 15:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACED560751
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 15:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxLiOBqquTDw for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 15:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF26E60750
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF26E60750
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 15:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C51E085F6C; Wed, 28 Jan 2026 15:42:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jan 2026 16:40:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69b623e4a9aff9e1f68105af1170e1d9a546b906
X-Git-Newrev: deb650f221b8083d8fabca43db17c7ab79b8ef35
X-Patchwork-Hint: ignore
Message-Id: <20260128154205.C51E085F6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: security bump to version
 2.5.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=deb650f221b8083d8fabca43db17c7ab79b8ef35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announce, see:
https://lists.gnupg.org/pipermail/gnupg-announce/2026q1/000501.html

gnupg2 version from 2.5.13 to 2.5.16 (inclusive) are affected by
the following issue:

A crafted CMS (S/MIME) EnvelopedData message carrying an oversized
wrapped session key can cause a stack buffer overflow in gpg-agent
during the PKDECRYPT--kem=CMS handling.  This can easily be used for a
DoS but, worse, the memory corruption can very likely also be used to
mount a remote code execution attack.  The bug was introduced while
changing an internal API to the FIPS required KEM API.

Fixes:
https://dev.gnupg.org/T8044

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index feafbb328b..07eb84a8ee 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  3acefeef08c82a4d4a8ba36f95c2986fb925d359  gnupg-2.5.16.tar.bz2
-sha256  05144040fedb828ced2a6bafa2c4a0479ee4cceacf3b6d68ccc75b175ac13b7e  gnupg-2.5.16.tar.bz2
+sha1  ee0bc59eadf258b6d92131911b5dca6cabc89419  gnupg-2.5.17.tar.bz2
+sha256  2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d  gnupg-2.5.17.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index fafc383ec8..dd2fd0b0f0 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.16
+GNUPG2_VERSION = 2.5.17
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
