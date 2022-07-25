Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F809C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 09:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E7FB610FC;
	Mon, 25 Jul 2022 09:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E7FB610FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rk3ml-_tjdPw; Mon, 25 Jul 2022 09:03:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AD5F6110A;
	Mon, 25 Jul 2022 09:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD5F6110A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B98291BF2F6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9415340907
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9415340907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nD_x_si1UmWK for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 09:03:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90787408D1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90787408D1
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7C4CE81DBA; Mon, 25 Jul 2022 08:49:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 11:03:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94d8764ef938936aa5432f1f13bd1b2d8b62a159
X-Git-Newrev: 8382574d589ecab2a6c3877a9eadf486eb20fd10
X-Patchwork-Hint: ignore
Message-Id: <20220725084942.7C4CE81DBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: fix typo: OCP to OCI
 specification
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

commit: https://git.buildroot.net/buildroot/commit/?id=8382574d589ecab2a6c3877a9eadf486eb20fd10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Config.in has a typo: "OCP specification"

It should be OCI for Open Container Initiative.

https://opencontainers.org/

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/runc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index 66203896a8..fe527b1954 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_RUNC
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	help
 	  runC is a CLI tool for spawning and running containers
-	  according to the OCP specification.
+	  according to the OCI specification.
 
 	  https://github.com/opencontainers/runc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
