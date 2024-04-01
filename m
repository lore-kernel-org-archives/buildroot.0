Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBE6CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D61A81F12;
	Mon,  1 Apr 2024 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDFZ8wRxwIpx; Mon,  1 Apr 2024 20:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79C2D81F1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C2D81F1E;
	Mon,  1 Apr 2024 20:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14FBD1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E227581E75
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsQH_kNwMLol for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C496A81E7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C496A81E7B
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0F27845A9; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 22:12:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e938f2c0d7bb4b3745dc9ce7c4370c8492b7f94
X-Git-Newrev: d082c8ad4bfe5d24ddf6f7e606fe2e57ba9863e7
X-Patchwork-Hint: ignore
Message-Id: <20240401201822.C0F27845A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sip: add missing setuptools
 dependency
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d082c8ad4bfe5d24ddf6f7e606fe2e57ba9863e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-sip package requires distutils which is no longer included
with python but is now part of setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-sip/python-sip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 3e015fa16c..392928f01e 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -9,8 +9,8 @@ PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = https://www.riverbankcomputing.com/static/Downloads/sip/$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
-PYTHON_SIP_DEPENDENCIES = python3 qt5base
-HOST_PYTHON_SIP_DEPENDENCIES = host-python3
+PYTHON_SIP_DEPENDENCIES = host-python-setuptools python3 qt5base
+HOST_PYTHON_SIP_DEPENDENCIES = host-python3 host-python-setuptools
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
