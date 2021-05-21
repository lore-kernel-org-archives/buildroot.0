Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9353C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:33:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DFF60240
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69DFF60240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E63A608D8;
	Tue,  3 Aug 2021 22:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9LSa6hd3xb7; Tue,  3 Aug 2021 22:33:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B63608D0;
	Tue,  3 Aug 2021 22:33:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 585E81BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 443E6404BD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMI6UehGkp8S for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC22404FA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1F6DB810E2; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 21 May 2021 11:12:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8bdc5e7c4d975193b1e18999ed840507cea63bd6
X-Git-Newrev: e2bcf6605a540ff370479dffe94cd26ee6df2c6e
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.1F6DB810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-bluezero: add
 recursive dependencies
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e2bcf6605a540ff370479dffe94cd26ee6df2c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

python-bluezero selects python-gobject but fails to include its arch and
toolchain dependencies. Add them now, as well as the corresponding
comment.

dbus-python also has some dependencies, but all of them are covered by
the python3 dependency, so don't bother with those.

Fixes: 8bdc5e7c4d975193b1e18999ed840507cea63bd6

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-bluezero/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index 3a9e5df6b7..7126b3ca50 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_DBUS_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_GOBJECT # runtime
@@ -7,3 +10,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 	  Python library for Bluetooth Low Energy (BLE) on Linux.
 
 	  https://github.com/ukBaz/python-bluezero
+
+comment "python-bluezero needs a glibc toolchain, gcc >= 4.9"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
