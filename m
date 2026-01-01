Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AF5EEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD2D407FA;
	Thu,  1 Jan 2026 09:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PMZ7CAXY8X0; Thu,  1 Jan 2026 09:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FFC40833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260569;
	bh=VNAM0uK6EVPIb0hcqiz/Oo91B5atYdc5lT2aLL7XvuI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=imOl76F+cKJnh0uo119YeQoWimBjnlrHFSh9YGTRL8JCiD71/HlsD0E+Cse7tggjG
	 nP9LO/DnP2fQbao1CY7KAACsuAFxXMRq3DSySXRo3DgK5A+5VvLuLCiBMajJ0UC6n7
	 0qibU8oUwhBu2s+ObdnpXubuMYLBSvohQxF5tZaa4NzWE9OxsziK1DcLv2/tgangaE
	 C58tlCUiKkZyOJXPAqZT2pogF7LKW6IH1FquMTMAJRliPM75YcGq8dSuZ/rO+v+scy
	 uCmxzI1QMP0fqPOd2Jrcux2397+3LSeo/yyN+N/vBAubmyMJhmhqf7jTxf5uygM2UG
	 l3vh88R0d3ciA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FFC40833;
	Thu,  1 Jan 2026 09:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C74B206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB8F81447
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCO1iruEI3sR for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A42AE814D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A42AE814D5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2BF887CDE; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af21a7ff2de585dc58a63363037563f0f1343fb4
X-Git-Newrev: 6cb0dd4026b23a2bfde20beb22f86cad8eed952d
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.A2BF887CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scapy: bump to version 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cb0dd4026b23a2bfde20beb22f86cad8eed952d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scapy/python-scapy.hash | 4 ++--
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 4f86177e9b..b4b7dd2850 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  b8951038f22c9ec447538be8b08ac503  scapy-2.6.1.tar.gz
-sha256  7600d7e2383c853e5c3a6e05d37e17643beebf2b3e10d7914dffcc3bc3c6e6c5  scapy-2.6.1.tar.gz
+md5  dc3b089110a1fc1ef1d3679c0076ea24  scapy-2.7.0.tar.gz
+sha256  bfc1ef1b93280aea1ddee53be7f74232aa28ac3d891244d41ee85200d24aa446  scapy-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index f1d6ff346b..9df4614b9c 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.6.1
+PYTHON_SCAPY_VERSION = 2.7.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/df/2f/035d3888f26d999e9680af8c7ddb7ce4ea0fd8d0e01c000de634c22dcf13
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/82/97/7caec64f05eae3d305d83e7cce1ef2f337710513b89efb334f7278202e79
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
