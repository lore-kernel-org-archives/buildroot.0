Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFBBC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D8D180DCA;
	Sun,  6 Sep 2026 09:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvoH1tD6AuZu; Sun,  6 Sep 2026 09:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2BB6E80D9C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788685797;
	b=gXbH+pd9cmaLRuLPCXP2dXdicS8nRofnseyy3Xjq0+mmje6rbHS0wv6g0q6LZZ8PTDOD
	 j1QcoH1rDIiNPA79c0S9+PMTWFhvCI14j6OGAx5AP0UaN/bdJTLkAgFDGOOPCKYUdAyhz
	 03I08tZFrBwRfBJQm9/vTYI4BEo8qw0bqIioBhY9n+FwfaTyfARWjrjw/FgCcpQ887PMR
	 1sKZ+BW9aq9AN9v0aP8dUMB6IIvcO2BlngGhgwDm4uiRv3VXDoegcEDYcbNHpcWMT66Pu
	 ThewyfEafKWRaoOSwMe5goysgUeTgZOan0xCcVd9pa1wH9nnVZYzk06syLwqI6YHbIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788685797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yc1eU9zdG/vWQfs5Je8qgQvuV8lBrZ3txD0BbqXkU5c=;
	b=etUw+1AYY5VIN+7U2C1i3XtjF5N4kgB7YNgcved9kg7AIOIIKXmceMCVnHx7PGASHf5v
	 2g18GBPclBuYUaZKQjw/7DvK8qjOQMXLEpip3Zd5faanqe9wPNhFy9Ee9B/d86EFgKnlE
	 yoF7whh/2XFyHXgE8WKa64Nn0pnqQInW3lAPp7Hgh2A7R3B8Pl94/7hDTQXgwOv1HSgV1
	 QQoakhc5/AxLxIklyTeCJPgzcXe71Jf0WAtDJ0ty9xxIsaVl11NrFN/riSqLtw7wvjyVT
	 LmNP8VdRIsIDMIaHLOLhzjDcgb7O9DMaLXVYPRpN3vSjmEMsxovQ6IIR0iIJZvUsBhw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788685797;
	bh=yc1eU9zdG/vWQfs5Je8qgQvuV8lBrZ3txD0BbqXkU5c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GuEsrJmZH9iWtblBi2HFKjsdgRww8DRXNuNgQw/JlVK6qs2NueJF/msTgh6IRAHkF
	 a9g4hZvRunM6xawr7RqfiMXOTspd42e6180EkyL670ZoGrTJBky+UdUhMdyR3myQVc
	 o2si6U176QfzCDG00LnQWIcDIHeFtcCEDG7IoURF/T1Olowv404Bek8jG/6FWbloyp
	 xGg0qguWy1fMsC3A6S7ZCkFZ2oFsEVaRP6e7BquZX4RAVJXOBfPDCB2O4+YpA55r2l
	 jXIee620BFjwiMx03ZPupTeDHhPMbkF1NoLDKswEqOdLFMF6IKaf61UarZ8ZdxR4Sb
	 BVSRjkV8XbPaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB6E80D9C;
	Sun,  6 Sep 2026 09:09:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40BA272C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26350605FF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4kvWm3Iwvfv for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A5577605E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788685793;
 b=PwR+FbSyX/LklIBbtH+uxCO2clsGuASSRsOxuJMZHpFQlg8zX4oPdLAuTbE0KD+PnK+O
 E8Zb+wMIRwARvTjPJWBRwsltbP0eIpF0stDZBYz1uk/kt8gRR6nTCpq/pUACDGBokv5qC
 qcsbxKIVpMyV+Fol9jnNEwt8KP46TXIHdhOrzXjPxZVehVu0hIkOKQbhW5Wn2OHt5oXbR
 RzhhyH7I5/+1ZtSQmmfRRMcW0Z1TOY7mqeA8q7QCB7K26Xzl0B4vPUlR++nbjhunO5Eai
 83qFxzZUSgBT1Gl0aZy2zd0jaEFHoZb6cIc0najOU1qWp/buz+hIQZPof1Q5lSJUK6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788685793;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=+KCUhYElY/OLsSZ72/Eve467KUL1eThE9Kugt+3a8eU=;
 b=BBh1Lj2FLNj7nhKvXBGQBXsYRf8T9GHXR4bQYi8V/TTLq4Lnlvkcu2MZ8ERy8o5ptMQb
 S3jkruFWYhD48cyWMZmyiug7AOYVz0IxCymkDg5+HpSeUgB+3jM9UUe3yUiOjGoO8xQVo
 spEnlDevbNi6FuymLE+Wh3nE267InjfY4aW0493rsZdKWDaQVW7l8cExoO/Ud2m2dFqsm
 TapJaWuiX9IwiAI5J38+Zt2D+pRTU5ZO7MkGH/pLcBYjtcpZzcoayu5GZSIGhrmPuCbdJ
 Z6V+FXpKldiTFzIK2GGzTEhl9YMrNvW8BazfpyuNN4SYxta0sDJo4mf4tsNZeaRcF6g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=byFK8H+w; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=byFK8H+w
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5577605E5
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788685789;
 bh=+KCUhYElY/OLsSZ72/Eve467KUL1eThE9Kugt+3a8eU=;
 h=From:To:Cc:Subject:Date:From;
 b=byFK8H+wheMjXMix+pVe5/FdUkfkIQ96/xvtrLMYhd+19og//7MKU574ZxuV6lRwV
 gHijS4nNnjcNyE3PASrb7aIZj8JhvgxEUqC2IUcjhPAz5eVzb8iLgfibaKO1qyu2lX
 WskY4cnTZxZFkBOXYawuWMh2e7R+fRCZTlnzGOP5lXba/qYpjGuhVpEH2z8/VtRu/S
 vY7oMBCZDWQpktQ+W4xl9XpNM9qP/bxzMdbzB5jM582IqgDn7vCOwiXueETwTs8dCl
 ngT7+2zpq+t0qoNw1Z3jnY1Tlkr5nbJ9gUaYHJFNyRN38LRNhRBOqrCASgfG619R8n
 VO7BwqXjSRm5A==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3521A4C2E17;
 Sun,  6 Sep 2026 11:09:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43010)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x38sm-000000000Xo-1wjq;
 Sun, 06 Sep 2026 09:09:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David Bender <codehero@gmail.com>
Date: Sun,  6 Sep 2026 11:09:48 +0200
Message-ID: <20260906090948.3583566-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.6.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/openldap/openldap/blob/OPENLDAP_REL_ENG_2_6_14/CHANGES
https://www.openldap.org/software/release/changes_lts.html

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5e6dcd65169998a1ad986e3912a9ab0501f63504

 package/openldap/0001-fix-bignum.patch | 4 ++--
 package/openldap/openldap.hash         | 4 ++--
 package/openldap/openldap.mk           | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openldap/0001-fix-bignum.patch b/package/openldap/0001-fix-bignum.patch
index 1c71cd3165..33224356b4 100644
--- a/package/openldap/0001-fix-bignum.patch
+++ b/package/openldap/0001-fix-bignum.patch
@@ -11,7 +11,7 @@ So, keep the check for the bignum header, but check against ol_link_tls
 which means that openssl is enabled when we find the bignum headers.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Bernd: rebased for 2.6.13]
+[Bernd: rebased for 2.6.14]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
@@ -28,7 +28,7 @@ diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
  printf "%s\n" "#define USE_MP_BIGNUM 1" >>confdefs.h
 --- openldap-2.5.15.orig/configure.ac	2023-10-23 11:03:46.292215101 +0200
 +++ openldap-2.5.16/configure.ac	2023-10-23 11:05:07.245355497 +0200
-@@ -2327,7 +2327,7 @@
+@@ -2328,7 +2328,7 @@
  	AC_CHECK_HEADERS(openssl/crypto.h)
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index de2fee536f..0ee1152a75 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,5 +1,5 @@
 # Verified by locally checking against the SHA3-512 hash available in
-# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.13.sha3-512
+# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.14.sha3-512
 # Locally computed
-sha256  d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656  openldap-2.6.13.tgz
+sha256  806dcd21d366428187fba3278da773d5930f774852c9e92517f950d585f19107  openldap-2.6.14.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 6d30a22f54..b29cd384ef 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.6.13
+OPENLDAP_VERSION = 2.6.14
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
