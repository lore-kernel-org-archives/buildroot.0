Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96104D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD4D81569;
	Sun, 14 Dec 2025 17:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlH2QfqQizv7; Sun, 14 Dec 2025 17:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C63815E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734484;
	bh=0IqzkZT9mxq1DLoMGc/Y6rkoOETfeIBv324zqc9KJ+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KEb0sG0SDRMtrcBqaX31hjt0TprP2uG5zcwckBht3o6NuztrE6gR30snmbPO3uaBo
	 m6SuDF8GArpoKTEKysN2SNso9nZSNHj5vs5zlC3JqNGqaTxVuPd+lwL18opWD1R0AU
	 pipbbnBzqvecDj7xirIw8fjZA89rykYN9AKNPiQibHTTUCtBqoYwa9T+wtZSsa31/P
	 vGG+23XPWR08gbNdukTNjBBAyvPRgpi4nofqFyM0tmzsg09k3nT6KQN4Gu1NrqH0xB
	 vC8rf50lZfrNT0jYql8QE3dsYtwUxSBNOEkWSzLt74E1fZDi6SPLk39cDLP6p9wR0I
	 XKcsdPBxxF9cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C63815E7;
	Sun, 14 Dec 2025 17:48:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DC65117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E32A40188
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szesgYAe6eZR for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD72140692
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD72140692
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC99B86E99; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 793c11630841a643255e26651b934a4ccd09c7ca
X-Git-Newrev: 976d69f6cdb306b88b64eeb883165c763c876a78
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.BC99B86E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-arrow: bump version to 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=976d69f6cdb306b88b64eeb883165c763c876a78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/arrow-py/arrow/blob/1.4.0/CHANGELOG.rst

Switched _SETUP_TYPE to flit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-arrow/python-arrow.hash | 4 ++--
 package/python-arrow/python-arrow.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 6120069abf..a28ab03863 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5  f03ecc3edbe2db99f366142f6e0f6d0b  arrow-1.3.0.tar.gz
-sha256  d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85  arrow-1.3.0.tar.gz
+md5  abbbe6bc2414c64ee56f0b59aa6ea25d  arrow-1.4.0.tar.gz
+sha256  ed0cc050e98001b8779e84d461b0098c4ac597e88704a655582b21d116e526d7  arrow-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b481f87296cb0abdb13fd8cbb94b14c328be880ec9e68547a61b84dacffd067a  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index 793cc2640f..c12867bf29 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 1.3.0
+PYTHON_ARROW_VERSION = 1.4.0
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/2e/00/0f6e8fcdb23ea632c866620cc872729ff43ed91d284c866b515c6342b173
-PYTHON_ARROW_SETUP_TYPE = setuptools
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/b9/33/032cdc44182491aa708d06a68b62434140d8c50820a087fac7af37703357
+PYTHON_ARROW_SETUP_TYPE = flit
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
