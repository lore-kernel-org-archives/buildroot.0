Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE047D1BDED
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95A4181025;
	Mon,  4 Nov 2024 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxBGTewYOQdB; Mon,  4 Nov 2024 20:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 884FE81083
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 884FE81083;
	Mon,  4 Nov 2024 20:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E093B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C9514052F
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_XVx_3I5mvY for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF0440538
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BF0440538
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96E56828DA; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02e859b8d30fd98e366180f9ab2465ca141b0597
X-Git-Newrev: 2eb283098b40ed71cec9663ec2a07b61584c48be
X-Patchwork-Hint: ignore
Message-Id: <20241104204205.96E56828DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-weasyprint: bump to version
 63.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2eb283098b40ed71cec9663ec2a07b61584c48be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace python-html5lib dependency with python-tinyhtml5.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-weasyprint/Config.in              | 2 +-
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 65210fb1eb..5ed84e075e 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -5,11 +5,11 @@ config BR2_PACKAGE_PYTHON_WEASYPRINT
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
 	select BR2_PACKAGE_PYTHON_FONTTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_HTML5LIB # runtime
 	select BR2_PACKAGE_PYTHON_PILLOW # runtime
 	select BR2_PACKAGE_PYTHON_PYDYF # runtime
 	select BR2_PACKAGE_PYTHON_PYPHEN # runtime
 	select BR2_PACKAGE_PYTHON_TINYCSS2 # runtime
+	select BR2_PACKAGE_PYTHON_TINYHTML5 # runtime
 	select BR2_PACKAGE_PYTHON_ZOPFLI # runtime
 	help
 	  The Awesome Document Factory.
diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 01a3488739..3e27405846 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  4d3fd0b160d17d5cb36c2f2c1c231723  weasyprint-62.3.tar.gz
-sha256  8d8680d732f7fa0fcbc587692a5a5cb095c3525627066918d6e203cbf42b7fcd  weasyprint-62.3.tar.gz
+md5  3c9e76bdee0db8aaef391d658cbdcb7c  weasyprint-63.0.tar.gz
+sha256  ec24c64fdcc63e4168b2c24eb89b1ee8a711281a7d7fdb3eed3f54995489c9d1  weasyprint-63.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 06f41fcfb8..2619351cde 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 62.3
+PYTHON_WEASYPRINT_VERSION = 63.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/fd/22/2d76310cd2ea5bbf03c691a08d48626f49853b7261a51bbdc0f834d746ca
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/78/57/213cd566b7e14130d62babd91c5c5c2b94cbdbcdc0c7a0936a236bc88db0
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
