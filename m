Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D78FF885A
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84765407A9;
	Fri, 24 Apr 2026 21:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4C_JOYk_3Iu; Fri, 24 Apr 2026 21:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90CF1407AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777065976;
	bh=NNk5j/irO3Gep7dgPhkWCUqFX1487oOqEHXHnd31yzQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P7gF5KG/jyswodgj5m0vAe4q0iksF2AcA+DeOVgiT274x7N/E0ObK1WiA0xjMA2kW
	 MVDv1H+HOUmVlTjJ9Bes/ZfN8O+cKXi5UG2/+pGcSOCVDX+UlaQtOQ40M9eKgPeWHx
	 KMGgadBCUTEXdQwbuj31ZoYgBlasvTAciXAVlKiueG+Q9D57Cu1UQmg3feMySCzQYZ
	 MEcv5fbMBkUvlRce9TYPgkwyl1rN19pitDTACCT9dEqVD+SFWUkK3hRm6gjJALeOUt
	 brar8Ee8f328Ithw0CUbX/nq2r68YGfqJEGZCVo++g5xdHAx+Vk9CGWb5jTZD2Q7Ik
	 EXea6NPLAx62A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CF1407AD;
	Fri, 24 Apr 2026 21:26:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DE28194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60AF58125E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnfQcIYcnRHY for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970DC811FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 970DC811FE
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:26:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48EA882DED; Fri, 24 Apr 2026 21:26:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 23:24:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7312fcd4b62a68a6257c6ad1df2d7a331ba15479
X-Git-Newrev: 210fa8273657593e490357f0e6c20a416f895ba0
X-Patchwork-Hint: ignore
Message-Id: <20260424212614.48EA882DED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-deprecation: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/210fa8273657593e490357f0e6c20a416f895ba0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Alexandre Ondet <hellohacker.dev@gmail.com>
[Julien:
 - add a new line before homepage url in Config.in
 - add LICENSE hash
 - fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                  |  1 +
 package/python-deprecation/Config.in               |  6 ++++++
 package/python-deprecation/python-deprecation.hash |  3 +++
 package/python-deprecation/python-deprecation.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d0f148699b..7afdcb4a16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1079,6 +1079,7 @@ menu "External python modules"
 	source "package/python-decorator/Config.in"
 	source "package/python-decouple/Config.in"
 	source "package/python-defusedxml/Config.in"
+	source "package/python-deprecation/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dictdiffer/Config.in"
 	source "package/python-dicttoxml/Config.in"
diff --git a/package/python-deprecation/Config.in b/package/python-deprecation/Config.in
new file mode 100644
index 0000000000..e46bdf20e8
--- /dev/null
+++ b/package/python-deprecation/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DEPRECATION
+	bool "python-deprecation"
+	help
+	  A library to handle automated deprecations in Python.
+
+	  https://pypi.org/project/deprecation/
diff --git a/package/python-deprecation/python-deprecation.hash b/package/python-deprecation/python-deprecation.hash
new file mode 100644
index 0000000000..ae1435b675
--- /dev/null
+++ b/package/python-deprecation/python-deprecation.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/deprecation/2.1.0/json
+sha256  72b3bde64e5d778694b0cf68178aed03d15e15477116add3fb773e581f9518ff  deprecation-2.1.0.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-deprecation/python-deprecation.mk b/package/python-deprecation/python-deprecation.mk
new file mode 100644
index 0000000000..8a9b9b7c90
--- /dev/null
+++ b/package/python-deprecation/python-deprecation.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-deprecation
+#
+################################################################################
+
+PYTHON_DEPRECATION_VERSION = 2.1.0
+PYTHON_DEPRECATION_SOURCE = deprecation-$(PYTHON_DEPRECATION_VERSION).tar.gz
+PYTHON_DEPRECATION_SITE = https://files.pythonhosted.org/packages/source/d/deprecation
+PYTHON_DEPRECATION_SETUP_TYPE = setuptools
+PYTHON_DEPRECATION_LICENSE = Apache-2.0
+PYTHON_DEPRECATION_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
