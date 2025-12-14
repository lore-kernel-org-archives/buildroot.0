Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC12D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10EA60DAD;
	Sun, 14 Dec 2025 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXXIrNlK28le; Sun, 14 Dec 2025 17:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF19960DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734473;
	bh=PN74ZvMBEiIZN1MC9DnwE9ILqAlFbq8pJ2O65s+edJ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CMSSjHj56NxEkjGI+MQm/oM1f8CBBRn06ZYIWy1rI8e6n+PtaafTn16hmm8u53kI8
	 +K+JaZvd7uHMsiG5hoqgzfjMVeWQiAuZcn/IH3N2eWuK+30Pd3F7HJuRsL7v7XUqAc
	 D0vQTjSawV/evtV3Oiu7MxgVWESYP90mHbZeTZSofZ3QITXpgpxX+BkKaQ/tfhUhqy
	 Au8m1Daetvr3LTRwhO+9BWHIR95Zw8aNOqp7DBZ8QWqZrJL+2HZDzMhyQOCKo48n0j
	 KoW1pG0LQCrCjr4gPz7rhVl619hdGnwGe6UTCfMlAfI7x0ks2I9CoW4/ai1mVGVPJs
	 Zg1PwhREgs6/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF19960DC4;
	Sun, 14 Dec 2025 17:47:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD42117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88FF5403B8
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NrGmqFuW9rz for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9ED340690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9ED340690
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99B3186E8E; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 023423b4a0939ee7912397e1916e68f6f24873af
X-Git-Newrev: 22b0d124f26dab9d1a09366e3973f1dc0e213830
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.99B3186E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump version to
 1.17.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=22b0d124f26dab9d1a09366e3973f1dc0e213830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://alembic.sqlalchemy.org/en/latest/changelog.html#change-1.17.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index a8ed0dc92e..7729f97a64 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  5499d3918aec406a1903aed530f7e2a4  alembic-1.16.4.tar.gz
-sha256  efab6ada0dd0fae2c92060800e0bf5c1dc26af15a10e02fb4babff164b4725e2  alembic-1.16.4.tar.gz
+md5  747400a534b73635c91d3b4bb71445c8  alembic-1.17.2.tar.gz
+sha256  bbe9751705c5e0f14877f02d46c53d10885e377e3d90eda810a016f9baa19e8e  alembic-1.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  35ea9c3419b261faf1be448c4f47d9255281bf6b36b5ffea55052227d4ba54de  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 8dbbd0c7d8..530b31246f 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.16.4
+PYTHON_ALEMBIC_VERSION = 1.17.2
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/83/52/72e791b75c6b1efa803e491f7cbab78e963695e76d4ada05385252927e76
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/02/a6/74c8cadc2882977d80ad756a13857857dbcf9bd405bc80b662eb10651282
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
