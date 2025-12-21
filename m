Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADD4E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AAC480AC3;
	Sun, 21 Dec 2025 12:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJqF92I7BUqg; Sun, 21 Dec 2025 12:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E4580B19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766318476;
	bh=c9L9vawVAqqXwDZ/omL6utH3RpZiVQyQoyAnJumqFSs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LTsH+ztvK1wtBBd96kF/ILBtfbT3pp9AT10J8v0tkxBz8yQ1Ee/QhoFSVSQ3EduvT
	 sV2jUvO4sKPNr1CYVtsITN+alSwx+CTx6YgjBvkRSzCCgU7kTaVYHdiux1A1UsCTHA
	 /gTOt2C4S4Agr42KOjLp87bcq6leMQIaawz0YZCrvM2fABpKjD2aYCcXuqOs4+52DY
	 3oxDuyTwaXJCGOTocV2siCqTwRmjEMA95hbHitXvBMYs/4mLoQo1ZpUIjflnqMzZVx
	 yusNBLgl6RRPhp/ai1s+Weac6edSZyBgNNRw9GGI+nGXnjSRfD0n7eG5szR+PdLPmD
	 KaUmWrRbH/ykA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E4580B19;
	Sun, 21 Dec 2025 12:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AE1195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D563940523
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6qzprdQvh-O for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C1F404FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9C1F404FF
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A434A870B7; Sun, 21 Dec 2025 12:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 12:58:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dbe71dba6eb5a813b2685bc5136d78a132a1580
X-Git-Newrev: 12c45e812ded547662d936be2e8c45c83a3bfa65
X-Patchwork-Hint: ignore
Message-Id: <20251221120113.A434A870B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nanomsg: bump version to 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=12c45e812ded547662d936be2e8c45c83a3bfa65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/nanomsg/nanomsg/releases/tag/1.2.1
https://github.com/nanomsg/nanomsg/releases/tag/1.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nanomsg/nanomsg.hash | 2 +-
 package/nanomsg/nanomsg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index abf117a572..e49a42130e 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6ef7282e833df6a364f3617692ef21e59d5c4878acea4f2d7d36e21c8858de67  nanomsg-1.2.tar.gz
+sha256  3ffeafa9335245a23a99827e8d389bfce5100610f44ebbe4bfaf47e8192d5939  nanomsg-1.2.2.tar.gz
 
 # Hash for license file:
 sha256  4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
diff --git a/package/nanomsg/nanomsg.mk b/package/nanomsg/nanomsg.mk
index e5c576ef2c..25628a87ec 100644
--- a/package/nanomsg/nanomsg.mk
+++ b/package/nanomsg/nanomsg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANOMSG_VERSION = 1.2
+NANOMSG_VERSION = 1.2.2
 NANOMSG_SITE = $(call github,nanomsg,nanomsg,$(NANOMSG_VERSION))
 NANOMSG_INSTALL_STAGING = YES
 NANOMSG_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
