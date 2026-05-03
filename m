Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61240CD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 384DD6153E;
	Sun,  3 May 2026 14:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OKMkunVqg19; Sun,  3 May 2026 14:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02B261547
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819882;
	bh=amQz6eWFcT6oNsqegJA384GuL47fA9KyrDzvFaMoc0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dcKbJDWYVnA6IM+5xKrxY1O7ldssqNUN6mTkEgs9ZmLFrXfDU1dp87jTRA4L7UvZt
	 OPKNiClgOt5A7Wjt1pl451T/qUyAticVMq9DHFWamKOXqx8fX1Fsy7PqmhCFvBSl01
	 xS8/bT7BNxf9YtbLPQsEmYMTm0m0p1eqWIospyC680OVyFmobi/I+dTw0yFu4fnHj4
	 A6YohyUNfRxFEl1bmTQK3PmUZjVFpfI6WFSsbyqvC3QDG7hcybDJukH/oq0H+Go86L
	 064iyHTI9koFciDEMOiGy7XNRuYQXSo4S+QSZQCGhwZzRIq5HaUhQziD37q7EbhiDw
	 AN0VYi3/QQbrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02B261547;
	Sun,  3 May 2026 14:51:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E20D190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE5858409F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEUIWUhz5qIm for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23F4584260
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23F4584260
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1A7783FAE; Sun,  3 May 2026 14:50:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1158746eaf35fce6e9560cc8331f82b772e5fdb4
X-Git-Newrev: b595f48fd9c4077cc0ae2847c2a9d3c00a13603c
X-Patchwork-Hint: ignore
Message-Id: <20260503145043.E1A7783FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-requests: security bump
 version to 2.33.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b595f48fd9c4077cc0ae2847c2a9d3c00a13603c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/psf/requests/releases/tag/v2.33.1

https://github.com/psf/requests/releases/tag/v2.33.0
Fixes CVE-2026-25645.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 1bc440667b..4fda8ea71e 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  cb3d3c58f07cf23f12c345f2c96a6f12  requests-2.32.5.tar.gz
-sha256  dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf  requests-2.32.5.tar.gz
+md5  ebc3b42b51c6245524345d170e5d4c50  requests-2.33.1.tar.gz
+sha256  18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517  requests-2.33.1.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index e5aa7006ee..3af00a7b9b 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.32.5
+PYTHON_REQUESTS_VERSION = 2.33.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/5f/a4/98b9c7c6428a668bf7e42ebb7c79d576a1c3c1e3ae2d47e674b468388871
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
