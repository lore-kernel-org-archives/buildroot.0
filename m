Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849BBCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6F26125D;
	Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0T-kEc1Sh-Tj; Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A33AE6126E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819827;
	bh=GLbYH3wtUApWQkVC8+drrEDAYVnJoSEdOqU+TCxIsxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LrzbPblBm+O3oxqb0XAno4Jbc0RO7e4Rum6Ks65RpgmtlwhB73bhxkgAG8u8Y12U9
	 J9lWjfR4r/fllFzjav79aY3hxb9YCLG28UYcw3KzF7wZ8eOLE11FmNb4UonhMfa0pH
	 FgsVln5JbahsA/MHfHjU6docHg3HARtRtT13e5xYpIKEK7X/ficVn1CUCvwLNZdUWN
	 EuHSbrpSZH0S1Oyi/qVjo3VNHRLuza8nYe7+jC75lymNx94ZkiL51Ga5wWNMn1qKWN
	 Kh3YWAuGp6r3d3S0GqPfWT7N37WGjRZUbz5yG1ufLryB35Y5Xsg8PnDONORKAyJN9F
	 09oHCY/LVOmew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A33AE6126E;
	Sun,  3 May 2026 14:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1384127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F7178409F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0Vfk3_Jw_2j for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC78F8422E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC78F8422E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DCA83FC0; Sun,  3 May 2026 14:50:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab7bd853fadae29593504d75144f88ceea189244
X-Git-Newrev: 68cdf123d48f574241b1c23a4f8bf8755b7d02b4
X-Patchwork-Hint: ignore
Message-Id: <20260503145024.82DCA83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump version to
 1.43.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/68cdf123d48f574241b1c23a4f8bf8755b7d02b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/boto/boto3/blob/1.43.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index a7e3ba6476..0a620aff21 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8e39cbbb73c8eb861e2d2d7a5107c3d2  boto3-1.42.68.tar.gz
-sha256  3f349f967ab38c23425626d130962bcb363e75f042734fe856ea8c5a00eef03c  boto3-1.42.68.tar.gz
+md5  8f6916a7e50632593cdf56b5fcdbd365  boto3-1.43.1.tar.gz
+sha256  9e4f85a7884797ff0f52c257094730ed228aaa07fa8134775ff8f86909cf4f2a  boto3-1.43.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 7901c671a3..4a88e115cf 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.68
+PYTHON_BOTO3_VERSION = 1.43.1
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/06/ae/60c642aa5413e560b671da825329f510b29a77274ed0f580bde77562294d
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/98/36/028c12ed6ed85009a21b5472eb76c27f9b0341c6986f06f83475b40aaf51
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
