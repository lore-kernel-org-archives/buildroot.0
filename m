Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A2DFA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD9E607AC;
	Sat,  3 Jan 2026 11:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwRtU9cfdpuu; Sat,  3 Jan 2026 11:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9AC4607AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440462;
	bh=fnSLqXjbqyP1XdwuIQ1nzywb7EZzJanskuKhQl5uM+c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eQeJh3Yv7doE43X8z9LANUh0mSwjqCUtGigEQWad+bDv6hOKPeO/F5uPmR4EFcDpN
	 zTwuGZFOA2iBmiIYKIUh33XCafrWmPB+Axh3EN0+r9F1fC9ZWOEOCjt+6yCVlGrLb1
	 hr5ccex8SE2t0NKTqpL5xZ/3CntCcakexB57rQyniHxwMV28EhBRK3QPUgTgYE0BhD
	 m7LzI4KlSQh5maOHfHeGfRVYtBpB5PDFaTQU7Cmck6vvgY1tTYvakW1ZgRF+Pc9Jpo
	 vFd/amAX1Oh6wHNxWJ9T2J1YzwID6ktA42LGGc5MNn99/GaIRTdFTg6nMXbo7s5isR
	 Kl3enUSFJ2MAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9AC4607AF;
	Sat,  3 Jan 2026 11:41:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72326440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F2F400D6
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbXmht1geNFT for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC54B40059
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC54B40059
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B67C8227C; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:31:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e92513e25ced434a3e5b3e4a6215bb794c4958d
X-Git-Newrev: 7d61b71af5d8c5f5cc235ea537bcd3de748512ec
X-Patchwork-Hint: ignore
Message-Id: <20260103114057.9B67C8227C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: bump to version 5.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d61b71af5d8c5f5cc235ea537bcd3de748512ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 54c297bdb4..2c72626637 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  9f5b82e0ca69926b4eb9dc145b82c524  cbor2-5.7.1.tar.gz
-sha256  7a405a1d7c8230ee9acf240aad48ae947ef584e8af05f169f3c1bde8f01f8b71  cbor2-5.7.1.tar.gz
+md5  43d53d2eedc711252f5f66b1e05389a5  cbor2-5.8.0.tar.gz
+sha256  b19c35fcae9688ac01ef75bad5db27300c2537eb4ee00ed07e05d8456a0d4931  cbor2-5.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 65873d77ca..6f8bc31996 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.7.1
+PYTHON_CBOR2_VERSION = 5.8.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/a2/b8/c0f6a7d46f816cb18b1fda61a2fe648abe16039f1ff93ea720a6e9fb3cee
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/8e/8b4fdde28e42ffcd741a37f4ffa9fb59cd4fe01625b544dfcfd9ccb54f01
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
