Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875ABE77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F7682035;
	Fri,  6 Dec 2024 09:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFuTXooRtyCR; Fri,  6 Dec 2024 09:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3A898200D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A898200D;
	Fri,  6 Dec 2024 09:28:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77EA6ED0
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71080611AD
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIaW7ZkyrEla for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3952611D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3952611D6
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 901D286A36; Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 10:19:24 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 47811443fdb8d21e5adf7886a42ec07e24754312
X-Git-Newrev: c1a393045f6ca9b89a66c88c173ef23f1084aba2
X-Patchwork-Hint: ignore
Message-Id: <20241206092844.901D286A36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-sip:
 disable parallel install
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1a393045f6ca9b89a66c88c173ef23f1084aba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

{host-}python-sip may fail to install on fast machine, so disable
parallel install.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8350440972 (TestPythonPyQt5)
http://autobuild.buildroot.org/results/8f2/8f24656f3a66d21f2d3c6d6b1adc6bb5f1c0c801 (2024-10-15)
http://autobuild.buildroot.org/results/6e6/6e6bbee714b10e0f04c9d17b7e0ecce057d21d2a (2022-07-15)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b271906a74ab773ff276cf5d6d90209c4d32cab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sip/python-sip.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 3e015fa16c..f942eb6c74 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -21,8 +21,10 @@ define HOST_PYTHON_SIP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
+# Race condition on fast machine between sipconfig.py install and
+# {sipdistutils.py,mk_distinfo.py} scripts.
 define HOST_PYTHON_SIP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE1) install -C $(@D)
 endef
 
 define PYTHON_SIP_CONFIGURE_CMDS
@@ -42,8 +44,10 @@ define PYTHON_SIP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
+# Race condition on fast machine between sipconfig.py install and
+# {sipdistutils.py,mk_distinfo.py} scripts.
 define PYTHON_SIP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) install -C $(@D)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
