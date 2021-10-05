Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467DAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B829361354
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B829361354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5390C40811;
	Tue,  5 Oct 2021 19:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VDiTJsl_58Z; Tue,  5 Oct 2021 19:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCC4406E7;
	Tue,  5 Oct 2021 19:09:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97C1A1BF983
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8302F4019A
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxA9Gz-yMesJ for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:09:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 008FA40167
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633460969;
 bh=wXYZiAKRxlJVfNmd4NoQ5mSb/cDcEIzqXSZ3L0b8Ems=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=PXKd9ep2XNYgI2cfzaKugBeaoG4Z/jDtOvz/+JXsLv8v0qiSnmt7TX32di2wzFrXO
 FNgvOHZSc9uwnWm9KIitM0694tHMJZ3BC0+aSo1OxhX7lFDIPmCcjcR+wcrEM+IInn
 O+1qIQbLrqONuEKLFxiJatV4+s+ic9HgUyM4tPSU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MeCpb-1n6cfe2oz9-00bNgG; Tue, 05 Oct 2021 21:09:29 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 21:09:27 +0200
Message-Id: <20211005190928.17057-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+wMw50k1d/ZsL1BCLG0L+KeSc7XStn8MR7LOjfqXk2bTshAtrwE
 5b3/3pDisB6EXgAhftuA1fafBFQPjfeXOeaEcFlHmG9LN2OI6bNdsXt08reXbGeAnlTFVi+
 RJXrX3zhlwCUFV1KOvjfS8VmOqu5AOQkjrqJqvyla0TlIYEJX259IcVhLTZAL8MDvuC5AUs
 tCxwB5TxAlQ0FWsNTGG8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t23SLhRoMJg=:DGnjREqkEiuoFQvUKNXxWg
 6nCvNSHs47R0mZvtJpVoYJ9XtvZ1NAyCX5BlDb5wQq6mXwgG+uTD7x2WFoO9/qEfUjhSlw3E0
 /qVUXZUdyDxGyoeIocqIr0qiPTDuB4DR/DC7fGQEDT9wLxWbvaUBK/niHMIMGtBtVa/10DK/j
 SsLXxlbHebTyf+MD0LKfHmzC9psInepxkzweW1vh9XktzL7O4pydYQboEiLkbtnt7d4aS5+5o
 ZdfJO8ojW7bTdQy+aE5i64tQRBhLSX/JELvPuMLk73qyr5TfqrW1gtikT1/a4zw1u9aOqSkpY
 /pRF/J9hin5YhjsnfCFOqMCYRSzdzt8UhoBDG9SZqyzzRgNZ10vb9QJEK7HydYI4t1aCjHp4g
 5yk6IbGXEpKoRma7Vu587bmBoYnPQqryudOISE1t2l3VWLMZBXnZ7jdVQqttreyitp8dmz9xs
 JcUh/GWfAGoDLocXsbU9TGJ90NA8DwDM+kJNVI8RcHteFX/Y3SH44afwy9KaPQTnb+k8SbzMo
 vss/xELuJEf5AgWms5NSnf/HsBF2W8b/7eK/RLmebmhesU2ha2FQ856Tf9pDuN9x5KQGdlrTY
 qZIWTBZzHqRxj52V9+sMJ3RqVzsOZEoXjU1UAUEbdwPoB+ixqImNBD6lfcnYVbrqlkQFh5xur
 SooK8/AkXDcfv5nq4HUuT4ZBhWL0McQE/uFDhIf5mlKMzD/uI+Q2aOV8hgxk1uPo6HUBUOscp
 4AqrMJQHOHa8YD955EKBQzvKcXY/sTIY/pKnusT2llGLzpGucuxGEXLMso9Cr01eaWu/vqSgl
 IEefO6k4jz2ZLhRWEthPqMALui/xw+sM6rS2FcJ3cI8moyr2Vhcj+lWgHJDMemPL1w/HhG309
 OekAGkZHjPQOtwA5MnS0i4kwEUM32i94uZQi0Jw33/X4Zt8HF6rWOseLUxI62HVHg4nXfi+vm
 mvl/pT/qPLVrzDC+gG3fVkkME4ghJmlw3cnCvY/4P5R+EqbBxeKr2NZGUnTfRsyIyRFp3y8jU
 kTpQ4YCB1uL8QWOnN7DOW8a9B/SjjXOFLM2kT+m52r7EjZAB7sSegzJ4Es0OLAGtX53wIuqCu
 P0D6zIxEBj5ERc=
Subject: [Buildroot] [PATCH v1 1/2] package/apache: security bump to version
 2.4.50
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2021-41524 and CVE-2021-41773, for details see [1] and [2].

[1] https://downloads.apache.org/httpd/CHANGES_2.4.50
[2] https://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 49efefebb9..abcb79f14d 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.49.tar.bz2.{sha256,sha512}
-sha256  65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b  httpd-2.4.49.tar.bz2
-sha512  418e277232cf30a81d02b8554e31aaae6433bbea842bdb81e47a609469395cc4891183fb6ee02bd669edb2392c2007869b19da29f5998b8fd5c7d3142db310dd  httpd-2.4.49.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.50.tar.bz2.{sha256,sha512}
+sha256  6a2817c070c606682eb53ed963511407d3c3d7a379cdf855971467b00fb3890f  httpd-2.4.50.tar.bz2
+sha512  b1afbaf44e503b822ff2b443881dcb44a93aa55d496f88ae399a2e7def05f78590f266a16da1f2c0aac88e463b76fba20843b1e20a102e76c8269de6fae3e158  httpd-2.4.50.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index ae2fb70535..e355ff71bf 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.49
+APACHE_VERSION = 2.4.50
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
