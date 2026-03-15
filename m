Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6962F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC981612CA;
	Sun, 15 Mar 2026 22:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CguuffJiaK6B; Sun, 15 Mar 2026 22:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3DA9612C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613129;
	bh=u5QAtQGUJpTb5ZPRrs+ZSZqIRSj+PjzO4fYp/wglsQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kUZvqe3FvwltP5TIZLddhiukFkvEWusx6+rVlJ0nUZ42drw76FwJ+Yvo22AI8175j
	 Y+PLwhCTWfNnaAm1Fhg/FYIZAq1Jx8YnqCYlKZLbidT90auwEAGAou4vhUHCAkEZTn
	 bx5zo+/8/RUmMUBfp5o1y8pketNP/mgVU7VIkeWeCVPiT9PX9VJ1fO4Fp9E20yqB8W
	 p6ZflPd8lWmHVSNLkRLH73AoJiVCU5yxquKe3oPZq1iqumL3VxjTE2FXfxpxf+ad3r
	 h7UQh1EgWCDAs+VPv81qsKk5VMk3Elq6gHmGfRqSqjghonvCKOi4OFjc0Zr+EBXvUJ
	 KZ4p323ZlpmJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3DA9612C5;
	Sun, 15 Mar 2026 22:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1651E357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B996108E
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faBjvhr9pFs5 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6467661092
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6467661092
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A76D185AD6; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:33:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 582c6272394cf79d534fcae5e2677dd4d87ee49c
X-Git-Newrev: cb1410862a002f823da11f1929714f19e1995505
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.A76D185AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 bump version to 1.73.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb1410862a002f823da11f1929714f19e1995505
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/googleapis/google-cloud-python/blob/main/packages/googleapis-common-protos/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-googleapis-common-protos.hash                              | 4 ++--
 .../python-googleapis-common-protos.mk                                | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index 682ea22690..682b995bd6 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  58ddbf8920c529b542af9be18101fe61  googleapis_common_protos-1.72.0.tar.gz
-sha256  e55a601c1b32b52d7a3e65f43563e2aa61bcd737998ee672ac9b951cd49319f5  googleapis_common_protos-1.72.0.tar.gz
+md5  8af6ac195972be9e561438dff863170e  googleapis_common_protos-1.73.0.tar.gz
+sha256  778d07cd4fbeff84c6f7c72102f0daf98fa2bfd3fa8bea426edc545588da0b5a  googleapis_common_protos-1.73.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index e72a7b45de..3bc384efa5 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.72.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.73.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/e5/7b/adfd75544c415c487b33061fe7ae526165241c1ea133f9a9125a56b39fd8
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/99/96/a0205167fa0154f4a542fd6925bdc63d039d88dab3588b875078107e6f06
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
