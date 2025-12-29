Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CC8E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AB180E94;
	Mon, 29 Dec 2025 10:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-rQqXkIf7dj; Mon, 29 Dec 2025 10:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F399880EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767004315;
	bh=SnT0vqLMFWj9bPhfhJ8ffDWOts3Izv6GraWrtC9nGhQ=;
	h=Date:To:Cc:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nHA3sLsWRoINvytJ3fXwFtC1T8gcHwP+aT0tjXf5etCsBQ3M9FAzyXv2RCP6+Jepy
	 w0ohaUyVQ6nPiC7TfnVMkw+RiiP2dZruLFp3qz0PhHtsPfHs0/+SqvU0RffY2TSJ/J
	 e6xdmFzYwkQujogZ0aXr/RW5tb+2YlI+1e4QGlwiKQNNTp5ZQRYN7Mb7vUBJhfIJKK
	 78w13M3bsipG/ZwM/praOKlA/31vfBzmHNJRVCdKRq/TVepluYLw3ULQ9PDf6kMJDk
	 hOro98T1VlB+Ws6Q47tnNgn5IlnHDyk60Lqmx5DdGswDOSXwfcdKzAqSRMHt5HuJbL
	 s8iY8wdMo/dng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F399880EBA;
	Mon, 29 Dec 2025 10:31:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3870CD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AAA980EBA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LG2tzH1bufrd for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:31:52 +0000 (UTC)
X-Greylist: delayed 378 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Dec 2025 10:31:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BB3580E94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BB3580E94
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=uuidxx@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BB3580E94
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:31:50 +0000 (UTC)
Received: from [IPV6:240e:3bb:a70:df50:5449:c28a:442c:d0c7] (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wBHr3cQV1JpGqLPCw--.3387S2; 
 Mon, 29 Dec 2025 18:25:21 +0800 (CST)
Message-ID: <824933a6-3d08-46cd-8ab4-add609401a60@163.com>
Date: Mon, 29 Dec 2025 18:25:20 +0800
MIME-Version: 1.0
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: Frank Chung <uuidxx@163.com>
X-CM-TRANSID: _____wBHr3cQV1JpGqLPCw--.3387S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4rWFWUZr45WF47CFWfKrg_yoW5Wryxpr
 srJr15Gw4Ig3WfJrZ8GFyUZr4furs7ur1UJwnrJw1UtryUCFyxJ3yDJa1rArW7Jr1ay345
 Xw1rGr43XryDtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UUwIkUUUUU=
X-Originating-IP: [240e:3bb:a70:df50:5449:c28a:442c:d0c7]
X-CM-SenderInfo: hxxlv5r06rljoofrz/xtbC4BHIpGlSVxHAMAAA3Q
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Message-ID:Date:MIME-Version:To:From:Subject:
 Content-Type; bh=zAseZ5laMDGYXK9EIE9dOsMn8mjJeN6ncYie3W+zSQ8=;
 b=QXfUW8yxtsZx1Pc9Oanyqjze4HmCnwT9jcey85Sg9dEMVEWlHjbabgVmaFZP5C
 5jMjr5cETzibdVpVeV3KcHSmjr9c9XQfwfcUX9vX/l9sJf1PAuJBmgGo8/UD79qg
 NNE41MRP0Nj5WUzvaJCP2Kb7BkiBR2B/0ldkFCJOSBytI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=QXfUW8yx
Subject: [Buildroot] [PATCH 1/1] package/rund: add new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 From 0166d724f0d1309ff6615c087d90d822e8f95fb0 Mon Sep 17 00:00:00 2001
From: Frank Chung <uuidxx@163.com>
Date: Mon, 29 Dec 2025 18:23:14 +0800
Subject: [PATCH 1/1] package/rund: add new package

Signed-off-by: Frank Chung <uuidxx@163.com>
---
  DEVELOPERS             |  3 +++
  package/Config.in      |  1 +
  package/rund/Config.in |  6 ++++++
  package/rund/rund.hash |  3 +++
  package/rund/rund.mk   | 12 ++++++++++++
  5 files changed, 25 insertions(+)
  create mode 100644 package/rund/Config.in
  create mode 100644 package/rund/rund.hash
  create mode 100644 package/rund/rund.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4c9b6e618..f10f0e1354 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1208,6 +1208,9 @@ F:	support/testing/tests/package/test_lua*
  F:	support/testing/tests/package/test_lynis.py
  F:	utils/scancpan

+N:	Frank Chung <uuidxx@163.com>
+F:	package/rund/
+
  N:	Frank Hunleth <fhunleth@troodon-software.com>
  F:	package/am335x-pru-package/
  F:	package/libconfuse/
diff --git a/package/Config.in b/package/Config.in
index cd8765bbcf..8942231e35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2903,6 +2903,7 @@ menu "System tools"
  	source "package/rauc-hawkbit-updater/Config.in"
  	source "package/rsyslog/Config.in"
  	source "package/runc/Config.in"
+	source "package/rund/Config.in"
  	source "package/s390-tools/Config.in"
  	source "package/s6/Config.in"
  	source "package/s6-linux-init/Config.in"
diff --git a/package/rund/Config.in b/package/rund/Config.in
new file mode 100644
index 0000000000..f21bd7a11a
--- /dev/null
+++ b/package/rund/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RUND
+	bool "rund"
+	help
+		A lightweight daemonizer and process supervisor.
+
+		https://github.com/cyberxnomad/rund
diff --git a/package/rund/rund.hash b/package/rund/rund.hash
new file mode 100644
index 0000000000..214774661e
--- /dev/null
+++ b/package/rund/rund.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 
701127ac5b90e02ba4a670ab7534db9f2a6678e8f0f9ff13efbfbbe1414fb066 
rund-0.1.0.tar.gz
+sha256 
81100abfee87ff6bf6ba4b49ede1f81ee04cda31000b143cb75ab98e2845d8e0  LICENSE
diff --git a/package/rund/rund.mk b/package/rund/rund.mk
new file mode 100644
index 0000000000..8459bc61c3
--- /dev/null
+++ b/package/rund/rund.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# rund
+#
+################################################################################
+
+RUND_VERSION = 0.1.0
+RUND_SITE = $(call github,cyberxnomad,rund,v$(RUND_VERSION))
+RUND_LICENSE = GPL-3.0
+RUND_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
