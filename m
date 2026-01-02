Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF0FFA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AA4C408B2;
	Fri,  2 Jan 2026 22:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJTwNve8axe9; Fri,  2 Jan 2026 22:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ADC940865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393786;
	bh=gJYNqgW9Eg/tQgIAGeAB1m6fnD13Jvgc3x40aZcdtaU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=etfHe36qi/daXgRPh3n82tByrPGONQcyhekswMgW0NQslBkGigrXwagOwJzSr/lKD
	 nyIHFbuIC1vzHiS353uW+Je+dct10cI3beIvJJUcLNcwdrSZi5Qrxqe3ScDOpUOkpF
	 Xa0GQyPanGMCRqWJ/kP3iOLOqZd4zgGcFd0BunAvDca638lnQVt/cvneX+tEqg613H
	 W6ql6iS51HA/Vjma9rbu0qnHnKgv3jJlptIU5/QfrqMYp1lXGTdwqIVHDRMgdfO9PC
	 kFAC3RyMhfSgcDrfCw54MMMaS9Y4+6sinR7SGRLrzG47hSs5jONyN/NLEO6grWH3UC
	 iKEazdzZO97hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ADC940865;
	Fri,  2 Jan 2026 22:43:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74637351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6454760A48
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNh3lzQTbWgo for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BF20608FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BF20608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 665AE880A5; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:40:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 088bec09fb4d24086004cad6259d43aebd511cd5
X-Git-Newrev: 294783d757745c56227ab49329dde8351f5a3991
X-Patchwork-Hint: ignore
Message-Id: <20260102224304.665AE880A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lark: bump to version 1.3.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=294783d757745c56227ab49329dde8351f5a3991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lark/python-lark.hash | 4 ++--
 package/python-lark/python-lark.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 4536f24e62..fedc6c7189 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  06c2015b9996beafc714cba8b7ae62dc  lark-1.3.0.tar.gz
-sha256  9a3839d0ca5e1faf7cfa3460e420e859b66bcbde05b634e73c369c8244c5fa48  lark-1.3.0.tar.gz
+md5  4cd79a5ca06dfc57c984a89a87ef938e  lark-1.3.1.tar.gz
+sha256  b426a7a6d6d53189d318f2b6236ab5d6429eaf09259f1ca33eb716eed10d2905  lark-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2eee60f52d4e11357bf89e72b034d050e285e47fda1361e5662fb322ee27d771  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index b5f195eff4..a52fe73fed 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.3.0
+PYTHON_LARK_VERSION = 1.3.1
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/1d/37/a13baf0135f348af608c667633cbe5d13aa2c5c15a56ae9ad3e6cba45ae3
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/da/34/28fff3ab31ccff1fd4f6c7c7b0ceb2b6968d8ea4950663eadcb5720591a0
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
+PYTHON_LARK_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
