Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C0BC3DA7A
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 07:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09AE46112F;
	Fri,  6 Jan 2023 07:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09AE46112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qRrL-qT6tcl; Fri,  6 Jan 2023 07:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EFE3610F1;
	Fri,  6 Jan 2023 07:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EFE3610F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0EE1BF973
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36143400B9
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36143400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5CQwEq7k8nw for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CC49404A3
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC49404A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65BED87693; Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:39:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4aca99f51cc97cfc3bcd3affa65f4694004dd444
X-Git-Newrev: 3b3dbd0183265c3f7da49b0b331688fb7573383f
X-Patchwork-Hint: ignore
Message-Id: <20230106074006.65BED87693@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ulogd: add libdbi support
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b3dbd0183265c3f7da49b0b331688fb7573383f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ulogd/ulogd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 65280a2ba6..561429599c 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -7,7 +7,6 @@
 ULOGD_VERSION = 2.0.8
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPTS = --disable-dbi
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
@@ -17,6 +16,12 @@ ULOGD_SELINUX_MODULES = ulogd
 
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_PACKAGE_LIBDBI),y)
+ULOGD_CONF_OPTS += --enable-dbi
+ULOGD_DEPENDENCIES += libdbi
+else
+ULOGD_CONF_OPTS += --disable-dbi
+endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 ULOGD_CONF_OPTS += --enable-mysql
 ULOGD_DEPENDENCIES += mysql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
