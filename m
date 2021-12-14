Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5979C605DB;
	Tue, 14 Dec 2021 19:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgkSX6sV4M04; Tue, 14 Dec 2021 19:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F9B60BF5;
	Tue, 14 Dec 2021 19:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13F701BF5DD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9184405F4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9UH1CVRPIFg for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4120405F9
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E509C81E71; Tue, 14 Dec 2021 19:48:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0b1250f188e0bd2763279050a740bfc2c071d0c
X-Git-Newrev: cde3151534e702f34dd359fdd48a7de6da57ec9e
X-Patchwork-Hint: ignore
Message-Id: <20211214194841.E509C81E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dosfstools: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=cde3151534e702f34dd359fdd48a7de6da57ec9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for dosfstools is added by the system/fstools module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dosfstools/dosfstools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 77b560ee9b..26a28670c0 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -9,6 +9,7 @@ DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(
 DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_CPE_ID_VENDOR = dosfstools_project
+DOSFSTOOLS_SELINUX_MODULES = fstools
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
