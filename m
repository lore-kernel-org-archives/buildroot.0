Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4063CE6ADEA
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 09:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E109042D29;
	Sat, 23 Nov 2024 09:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFtm8dbl0Ih7; Sat, 23 Nov 2024 09:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9175340605
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9175340605;
	Sat, 23 Nov 2024 09:48:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9904B1D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 931CE40605
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61ymRmHhWobN for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 09:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A25AA40604
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A25AA40604
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9974A8611C; Sat, 23 Nov 2024 09:48:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 10:46:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbb019db73d8d78466c04b1847f501317a7aa214
X-Git-Newrev: 4b271906a74ab773ff276cf5d6d90209c4d32cab
X-Patchwork-Hint: ignore
Message-Id: <20241123094839.9974A8611C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sip: disable parallel
 install
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b271906a74ab773ff276cf5d6d90209c4d32cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

{host-}python-sip may fail to install on fast machine, so disable
parallel install.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8350440972 (TestPythonPyQt5)
http://autobuild.buildroot.org/results/8f2/8f24656f3a66d21f2d3c6d6b1adc6bb5f1c0c801 (2024-10-15)
http://autobuild.buildroot.org/results/6e6/6e6bbee714b10e0f04c9d17b7e0ecce057d21d2a (2022-07-15)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sip/python-sip.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 392928f01e..f71724f68a 100644
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
