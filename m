Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B2ECD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6CFD84243;
	Sun,  3 May 2026 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4Ez6APuGz12; Sun,  3 May 2026 14:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F1684261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819847;
	bh=qmqmF0zPgKEGwJGzK8mguTcMV0y++pQ8j2yDMU6fbkU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M5+KXp7sF51e1nmZ9oxvOY8dUga9j5DDGHqf2GOnX+8CramZ9Jml3Rp43z1WR4Y8l
	 fqpXbdnTDNQmSf/MxWIr5AWc0qXchXGVrJSZrzMJYL0RD51TG8eSFfiLJuBZZBKtD8
	 9c0vYIG6NkOFcxuCsI4He2RI6V2AmafPRSqSDj5TJwA2Ebeqi+wLsXKWh5OnNfr9yd
	 A2IfwcHEpZS+jPh8l4YMAAwZBbqAJYUTZ1qjb0tQnnRHnwNdzdTwVkNDq3Sq8jz001
	 O2TgP7JkRFjyKcWKycTOAHp6d/BryPRC8Og0T/0TKtNkAKwmSkSKUpZjow0LMhjjVh
	 K7urnxEIXU/kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F1684261;
	Sun,  3 May 2026 14:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45DBF190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37CF084230
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIuCDHbTMIKo for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5721984235
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5721984235
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13C177FDF8; Sun,  3 May 2026 14:50:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2286c4a02cc0a22d1c902ed8e4cb997faefd72d1
X-Git-Newrev: 5aca3c0433834e6bddb3ef2ad8f7cb02b7726a3e
X-Patchwork-Hint: ignore
Message-Id: <20260503145029.13C177FDF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: bump version to 1.3.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5aca3c0433834e6bddb3ef2ad8f7cb02b7726a3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/sqlalchemy/mako/releases/tag/rel_1_3_11
https://github.com/sqlalchemy/mako/releases/tag/rel_1_3_12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-mako/python-mako.hash | 4 ++--
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index b6706aa1ad..a6aa68ee34 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  c9dfb2bf42827459dd505c60f2262a7c  mako-1.3.10.tar.gz
-sha256  99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28  mako-1.3.10.tar.gz
+md5  92390c7e8897e69da67a593a96e88c71  mako-1.3.12.tar.gz
+sha256  9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a  mako-1.3.12.tar.gz
 # Locally computed sha256 checksums
 sha256  68d7064e53e3ffa8e9f420a9e604bd2e2059d9c330492fa6ebd4eb3d48111689  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 1dc59f002c..0f52fa2185 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.10
+PYTHON_MAKO_VERSION = 1.3.12
 PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/9e/38/bd5b78a920a64d708fe6bc8e0a2c075e1389d53bef8413725c63ba041535
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/00/62/791b31e69ae182791ec67f04850f2f062716bbd205483d63a215f3e062d3
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
