Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06011C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:28:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5A461139
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D5A461139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F5B640132;
	Thu,  7 Oct 2021 21:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aI9wION4bh9r; Thu,  7 Oct 2021 21:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BA1E401AD;
	Thu,  7 Oct 2021 21:28:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68E061BF866
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578A8401AD
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijYVQrmp5Gtk for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 21:28:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E53AC40132
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 21:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633642123;
 bh=THpqbZzUE8eXcHD6eij9LWENKogBmWl3SEpZZZhssPg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NUtsfQmLk7FDIOVon0mOqILjiet6MOocfUacBABpW2V5HjR5cPjH9/CwuYTyA7nxL
 9FT40y1d8hFgiiRFLfJtg7vCyOy+jQuzXsBupqFU7djm3uyYjheOCVOccdU8m382MH
 ZGOVfmvQpIR1o2qDbVLTWTUmAE6DYzzIWSx0FhvQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.41]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt757-1mnnTW1o09-00tSaN; Thu, 07
 Oct 2021 23:28:43 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 23:28:42 +0200
Message-Id: <20211007212842.11468-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:/F3novUDPE1CAxbljVwNQv1f4kgTqmF35Srn3kM4Z2eemRRpTLW
 kO/2A+5tggUEmQEd/xjX6C33d/Jhrs7HbRJfTMUMt83VdKVTciLibR/QlN8467y0R7vQdJe
 Ru/36g1YhnIQQGDhxNffBXMsYzloGndyUaHRgdZ2K1ezQmysqcpL0DleYaqGOy+UXvNbpEM
 +4fOX+FU9BxMZMpXQZgMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t/YIjW6pWo0=:bE4J81KiQ9YKFRE4GVn6hD
 dvdwFuMBSvvbVrl9Yr8JlSF9F0CMA+kClX+NZdnfUJXL4meLDrDck5XqUwMuGAbxq6ztDAuxI
 ur5OG2LSbk/jKczvmmgzh3vkFH9DsxAsBPs3vAlZTYsV5VlFnWLZySoBcDNp0PSfRfqjBim7F
 ZhCfsrlfgl72e0NXyDTaeJ0750lxa4QsorDV59uNiUyT2VsoC5qlgz1JhfGL4WU27024aclK3
 GEZq+a6iqcaXA14FmrUwMlIfnuLif6jPKOxA4ghcq1MlvmS9JKrAQLbMGClBYnLWAG6LkSdZp
 lwnqUX/pjWwte+esdDbJuZF8k33PThvnN4derDbknMQBPJ/3O1Bcj9ZVULOiq5ygv/2Zij0D9
 Oe40I+/+EDQpFS6WJ6kUcBP4idkdPfbydD62C4eRYV981pofBFd6mqmvlw3aBsKHAx+0xIru0
 tMAWH8c7T03Gk528EbK5OPmfy4JFbjcGeqVoz3FwKeJRZ6vNA4iMeb0iZg5yBjNn+yEki00ND
 LTPFWgtf/xWyfOOYEElJuMvrNnFUoAaLxp5OkgyhAt6Va3YKKPUqag9Nn19t8iQwWXCbTH5uq
 CliaJSPYS0UyIPRoSjfV94gUzblUmKp0L5idGLMrSnU4fFvF7sRH5PuT0KmQa7BfjJcHfZI0f
 Q4VaTAf7YxHXclrqwOrypkKchQd5KIN1YoGfrKTkSi/l3X/Xjo7BtN3f3Zz7QnRQbZ6J77TBf
 qbiJXtsxIaZfgdHf1032C8IhVVbyD9ETezNz843reaTLou8AA0N3WrP758cifyJVMGlsRcj7W
 mdQXqtlxDBJ++kWXX02zxK0UjHUpQYF00CwmZ6tozdzDg1SmdN2FjpIIHqyFI7AyiBVDXOw1I
 GBvPZWVLXTzzzbNaZuOb2mN8YmRrVvBUiPw/JleQptEIgfmFOWGqnuU7jckWAZFK4QvWae6YH
 GyscYWO2eE3Z3YQ5ZinUFj5qiIDaFe/uf26/8aGNP9PXc4mwwikJhcWhFZSZrc28I1yaDH8rW
 ONG+tCa8e478mbPJx7krPJ8efpdutVe80a5ReRRFmx7oXVK2roNJmd9RFCLWomReQj5qn2R8c
 6LkWxMJZmBMAVw=
Subject: [Buildroot] [PATCH v1] package/apache: security bump to version
 2.4.51
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

Fixes CVE-2021-42013, for details see [1] and [2].

Change download URL from http://archive.apache.org/dist/httpd to
https://downloads.apache.org/httpd (seems more up to date).

[1] https://downloads.apache.org/httpd/CHANGES_2.4.51
[2] https://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index abcb79f14d..138717c336 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.50.tar.bz2.{sha256,sha512}
-sha256  6a2817c070c606682eb53ed963511407d3c3d7a379cdf855971467b00fb3890f  httpd-2.4.50.tar.bz2
-sha512  b1afbaf44e503b822ff2b443881dcb44a93aa55d496f88ae399a2e7def05f78590f266a16da1f2c0aac88e463b76fba20843b1e20a102e76c8269de6fae3e158  httpd-2.4.50.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.51.tar.bz2.{sha256,sha512}
+sha256  20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4  httpd-2.4.51.tar.bz2
+sha512  9fb07c4b176f5c0485a143e2b1bb1085345ca9120b959974f68c37a8911a57894d2cb488b1b42fdf3102860b99e890204f5e9fa7ae3828b481119c563812cc66  httpd-2.4.51.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e355ff71bf..ff01b25106 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.50
+APACHE_VERSION = 2.4.51
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
-APACHE_SITE = http://archive.apache.org/dist/httpd
+APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
