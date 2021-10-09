Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42131C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D9A60EE3
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3D9A60EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FAAD83A05;
	Sat,  9 Oct 2021 10:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9n-h9QE8OEWY; Sat,  9 Oct 2021 10:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8EB81C21;
	Sat,  9 Oct 2021 10:08:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60F4D1BF956
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A4F460B9C
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7v1L4s0qcjO for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 10:08:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CCEB60B88
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 10:08:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BFAE08A63E; Sat,  9 Oct 2021 10:05:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 12:07:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cb815189227bb2619d7400420351451868d52c6
X-Git-Newrev: d64975da2005fbda1882d820ad87fbfef8e568c4
X-Patchwork-Hint: ignore
Message-Id: <20211009100541.BFAE08A63E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/net-tools: add
 NET_TOOLS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=d64975da2005fbda1882d820ad87fbfef8e568c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:net-tools_project:net-tools is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anet-tools_project%3Anet-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/net-tools/net-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 985fe2e35e..eb268a6e14 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -9,6 +9,7 @@ NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
 NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
+NET_TOOLS_CPE_ID_VENDOR = net-tools_project
 
 define NET_TOOLS_CONFIGURE_CMDS
 	(cd $(@D); yes "" | ./configure.sh config.in )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
