Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52799C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:40:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107B561252
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 107B561252
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE78E404A4;
	Fri,  5 Nov 2021 16:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KD2G4JGOr7xo; Fri,  5 Nov 2021 16:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC71E401DE;
	Fri,  5 Nov 2021 16:40:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEAEE1BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E73A606B9
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ka5cnRiUZOat for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:40:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC2E360626
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:40:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1CADF8B2D8; Fri,  5 Nov 2021 16:36:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:39:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f3e5f15029f76eafa46d5a48b0239aa522fc324
X-Git-Newrev: 3c5658cb37ad72f6eeac8826fa9d791b494aa402
X-Patchwork-Hint: ignore
Message-Id: <20211105163656.1CADF8B2D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyndiff: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c5658cb37ad72f6eeac8826fa9d791b494aa402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is needed since the addition of the package in commit
1665e0a79b617b4e6315ac5989e9ffa66eb0310f to avoid the following build
failure:

error:   File "/usr/lib/python2.7/site-packages/pyndiff/core.py", line 48
    nmap_service_name = f"{service_name} {service_product} {service_version} {service_extrainfo}".replace(
                                                                                                ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/9f283774ca2c89540753bbd62fdbddb1f9d4e392

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyndiff/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyndiff/Config.in b/package/python-pyndiff/Config.in
index 58ca35ba97..cd13056d79 100644
--- a/package/python-pyndiff/Config.in
+++ b/package/python-pyndiff/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYNDIFF
 	bool "python-pyndiff"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_XMLJSON # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
