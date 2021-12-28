Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DECDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2678840258;
	Tue, 28 Dec 2021 21:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkoXdnuSk0ya; Tue, 28 Dec 2021 21:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FF44025C;
	Tue, 28 Dec 2021 21:08:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D80221BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C457381390
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RMNcH-ZXPwI for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:07:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED8068131C
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:07:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CDF9182A9A; Tue, 28 Dec 2021 21:02:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 22:07:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a6a2ce15d771ce32c282868a0504759a942cddd
X-Git-Newrev: f877c668114c3dab465127a307b3268f1f34db5b
X-Patchwork-Hint: ignore
Message-Id: <20211228210210.CDF9182A9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: add missing comment for
 mysql dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=f877c668114c3dab465127a307b3268f1f34db5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
