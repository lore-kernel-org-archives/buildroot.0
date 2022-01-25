Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B217C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C738C401A3;
	Tue, 25 Jan 2022 18:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rG9JT1u7jbxw; Tue, 25 Jan 2022 18:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C46494013B;
	Tue, 25 Jan 2022 18:10:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2E731BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF50181A16
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4wY4QdQeHnu for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BD388142A
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 372AA825DF; Tue, 25 Jan 2022 18:03:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:09:25 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b30309847e307dee233d7cd8c57586f1ff50cad5
X-Git-Newrev: 2f517fae03e547d6c9e6c4fe373b17b61469afa1
X-Patchwork-Hint: ignore
Message-Id: <20220125180307.372AA825DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/collectd: add
 missing comment for mysql dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f517fae03e547d6c9e6c4fe373b17b61469afa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f877c668114c3dab465127a307b3268f1f34db5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index d44d4e4913..9c38d87bcb 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -384,6 +384,10 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	  Connects to a MySQL database and issues a "show status"
 	  command.
 
+comment "mysql needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_COLLECTD_NETLINK
 	bool "netlink"
 	select BR2_PACKAGE_LIBMNL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
