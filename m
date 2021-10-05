Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865BCC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5351061371
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5351061371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB7283E00;
	Tue,  5 Oct 2021 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceKJ0s_OAIT3; Tue,  5 Oct 2021 19:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADB883E0D;
	Tue,  5 Oct 2021 19:38:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18AC61BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08636408CA
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSdXoVq8HbPk for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36A3C408C1
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E866991223; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d112444d288811b92ad0ccb35b5381d960c74fd0
X-Git-Newrev: f2ed01a417e86b8e7b0ce2e7e251a50b73271468
X-Patchwork-Hint: ignore
Message-Id: <20211005193450.E866991223@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-colorlog: bump to versio
 6.4.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2ed01a417e86b8e7b0ce2e7e251a50b73271468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Hence, python-simplelogging now depends on python3.
* License was updated with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-colorlog/Config.in            | 1 +
 package/python-colorlog/python-colorlog.hash | 6 +++---
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 package/python-simplelogging/Config.in       | 1 +
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-colorlog/Config.in b/package/python-colorlog/Config.in
index 673f97aad2..e191ae82ac 100644
--- a/package/python-colorlog/Config.in
+++ b/package/python-colorlog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_COLORLOG
 	bool "python-colorlog"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Log formatting with colors.
 
diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 7c6fb73be7..f324c1f290 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  2111508f7c512976a34b107c17586f79  colorlog-4.8.0.tar.gz
-sha256  59b53160c60902c405cdec28d38356e09d40686659048893e026ecbd589516b1  colorlog-4.8.0.tar.gz
+md5  f1b92c1cac428b2e3c9ac7edf2988440  colorlog-6.4.1.tar.gz
+sha256  af99440154a01f27c09256760ea3477982bf782721feaa345904e806879df4d8  colorlog-6.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  915d2c0c578d5015fb561f69ce2970a0d0ed566f0b99bdb6a4ebb439e9c81b0d  LICENSE
+sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index eb4074d464..801b30be89 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 4.8.0
+PYTHON_COLORLOG_VERSION = 6.4.1
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/75/32/cdfba08674d72fe7895a8ec7be8f171e8502274999cae9497e4545404873
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/d6/4a/840f6cb7e922a717c765a3cdc6988aff22a6ef211d88c8d16701dfbd664f
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
diff --git a/package/python-simplelogging/Config.in b/package/python-simplelogging/Config.in
index db95efa25f..7f58791836 100644
--- a/package/python-simplelogging/Config.in
+++ b/package/python-simplelogging/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SIMPLELOGGING
 	bool "python-simplelogging"
+	depends on BR2_PACKAGE_PYTHON3 # python-colorlog
 	select BR2_PACKAGE_PYTHON_COLORLOG # runtime
 	help
 	  Logging made simple, no excuse for any debug print call.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
