Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4DFE74919
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 20:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 711B7401BF;
	Mon,  2 Oct 2023 20:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 711B7401BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dosuh0zoPCki; Mon,  2 Oct 2023 20:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBE64023E;
	Mon,  2 Oct 2023 20:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBE64023E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34CE21BF271
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DE5560ABF
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE5560ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbQYTBEsZBnw for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 20:04:54 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE4D3608D8
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 20:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE4D3608D8
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B08C1A4C031A;
 Mon,  2 Oct 2023 22:04:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58098)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qnP9v-0000KU-1Z;
 Mon, 02 Oct 2023 22:04:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 22:04:51 +0200
Message-Id: <20231002200451.3445210-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696277091;
 bh=qZuJ3x7PofBZw0UtECYqxzxikPxCUyuq2Qb9NWl3v1E=;
 h=From:To:Cc:Subject:Date:From;
 b=dqBzlzpUiY0HtNYOYj+0bsocrN5K9Y35Q0pVztZhA44b8Knq5pQ9JNt5E1NBW7iD0
 PAWnPpeeMJe2D0keTSo9SbeORpK/xSBMiqZqoIOdiSwD8nkbc813q6aoVmkN+FuGZw
 KYpp6rNGFlmE8+SgR0FYGmV6ri6iJl9/TsMT0dHh8M5r8gl5Ru5QhonexJmG3oHm/t
 wCkbgSH9/MbevrtxcR9Fp6xyQpfSp4ZrAz5LYU9HAw89ryVV54pN3mFflwPlwXevNP
 blOPEhE+5U+oTUv7DC3HFi2FooWV8H5oMgxYClZQkpD1M0CgJu6d+DW48xFUuS+qPo
 sGw7uW++YqdUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dqBzlzpU
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.11.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.python.org/downloads/release/python-3116/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 1a0fee3290..39a16c1f71 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3115/
-md5  393856f1b7713aa8bba4b642ab9985d3  Python-3.11.5.tar.xz
+# From https://www.python.org/downloads/release/python-3116/
+md5  d0c5a1a31efe879723e51addf56dd206  Python-3.11.6.tar.xz
 # Locally computed
-sha256  85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636defa3f  Python-3.11.5.tar.xz
+sha256  0fab78fa7f133f4f38210c6260d90d7c0d5c7198446419ce057ec7ac2e6f5f38  Python-3.11.6.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cfe5e1ee6e..b9c5054a21 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
