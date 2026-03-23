Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8FFF483FB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0372408F4;
	Mon, 23 Mar 2026 20:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZRqukfL-ztr; Mon, 23 Mar 2026 20:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0315A408FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774298331;
	bh=BqGnEw1zDoBWQTFR0pfdQMIgtuMAmwbTvHh11ljOG8w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gRGdC/h8ipAoktGfozlZKhswZepbTjyT55hwZGn+tsVMjOV3aoRKa6nTkh7RyrqTE
	 h6sa/i8YEZ1rO5vEhzKmYpAc/6bdHboB3DUpWBnKG00JEAXDxwXj/zcpuv9QQlnA6q
	 7O/GDZncX4X4ixcsUUY2ZRR45RZbQO1dmChj6Y01MH0HkJCIFkfcko+UYFG3C6wCEi
	 /MNDVl7yQohjmewHZuzNvzjSG48xvTahTxqalEbmlZLhtjKf+1jjZTCQgg4q0QPZ2O
	 rVzbBKh5unUFlSDxjQWxPLwtyPFMqUtG0cbubahwpScK2+RPsOMEYf0xpigB/dJBJm
	 Z3j4hD4hiRNFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0315A408FE;
	Mon, 23 Mar 2026 20:38:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4537A1D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AE0E408F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-9M_7XYP_FU for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68427408EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68427408EB
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 971F584C78; Mon, 23 Mar 2026 20:38:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 21:34:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8a567043d8a7e9eb996582a3177e077f23b11ae
X-Git-Newrev: 1332aaade40f30ef39022cc5da3b1e5b80e2844e
X-Patchwork-Hint: ignore
Message-Id: <20260323203848.971F584C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smmap2: bump to version
 5.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1332aaade40f30ef39022cc5da3b1e5b80e2844e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/gitpython-developers/smmap/releases/tag/v5.0.3

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-smmap2/python-smmap2.hash | 4 ++--
 package/python-smmap2/python-smmap2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
index 6b040519ae..366a121c0a 100644
--- a/package/python-smmap2/python-smmap2.hash
+++ b/package/python-smmap2/python-smmap2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smmap/json
-md5  1b691646da8ef92e9e178bd9b23c2540  smmap-5.0.2.tar.gz
-sha256  26ea65a03958fa0c8a1c7e8c7a58fdc77221b8910f6be2131affade476898ad5  smmap-5.0.2.tar.gz
+md5  3f2bb4ecf6ec521559d9c6038697e89b  smmap-5.0.3.tar.gz
+sha256  4d9debb8b99007ae47165abc08670bd74cb74b5227dda7f643eccc4e9eb5642c  smmap-5.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
index 23517c3958..e7af384789 100644
--- a/package/python-smmap2/python-smmap2.mk
+++ b/package/python-smmap2/python-smmap2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMMAP2_VERSION = 5.0.2
+PYTHON_SMMAP2_VERSION = 5.0.3
 PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
-PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/44/cd/a040c4b3119bbe532e5b0732286f805445375489fceaec1f48306068ee3b
+PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/1f/ea/49c993d6dfdd7338c9b1000a0f36817ed7ec84577ae2e52f890d1a4ff909
 PYTHON_SMMAP2_SETUP_TYPE = setuptools
 PYTHON_SMMAP2_LICENSE = BSD-3-Clause
 PYTHON_SMMAP2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
