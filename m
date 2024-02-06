Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0031C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 479BA41E91;
	Tue,  6 Feb 2024 21:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwE95I6Y2cHU; Tue,  6 Feb 2024 21:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668CB41E94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 668CB41E94;
	Tue,  6 Feb 2024 21:41:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E28DC1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF05E833FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiC1KNrfxgW9 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6D1833DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB6D1833DB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2C84873FA; Tue,  6 Feb 2024 21:41:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 22:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 506073c3edff7fcb913924c1dd06c50fafe9665b
X-Git-Newrev: 81fab735aee5d052e02a1304fb537b001c7d69c4
X-Patchwork-Hint: ignore
Message-Id: <20240206214130.D2C84873FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=81fab735aee5d052e02a1304fb537b001c7d69c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:espressif:esptool is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/AC284820-5731-4100-91BC-F50FE078848E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-esptool/python-esptool.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index f5aaface74..648748237d 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -10,5 +10,7 @@ PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/1b/8b/f0d1e75879de
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
+PYTHON_ESPTOOL_CPE_ID_VENDOR = espressif
+PYTHON_ESPTOOL_CPE_ID_PRODUCT = esptool
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
