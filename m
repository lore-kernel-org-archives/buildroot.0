Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D420DCD37B1
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C82D607C1;
	Tue,  3 Sep 2024 22:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acJXE4E9DnD5; Tue,  3 Sep 2024 22:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9579D607C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9579D607C3;
	Tue,  3 Sep 2024 22:09:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B76E1BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 522DF80E8F
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9GYyjnAkjBE for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77ADF80E8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77ADF80E8B
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:09:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21BA686D75; Tue,  3 Sep 2024 22:09:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:08:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 248c2d045e780b23e6ed19fec1f242460ac464e3
X-Git-Newrev: efd5f1aae45e841bf1a40c977253f1cb5e229396
X-Patchwork-Hint: ignore
Message-Id: <20240903220925.21BA686D75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: needs libopenssl engine
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=efd5f1aae45e841bf1a40c977253f1cb5e229396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334889
http://autobuild.buildroot.org/results/818/818f8c156311010d03d2f64b42231f486b543837

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 4831548f76..c9b9d0b757 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MENDER
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
