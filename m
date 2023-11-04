Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ECAC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4296260DFE;
	Sat,  4 Nov 2023 21:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4296260DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8y5iQtCw8yz; Sat,  4 Nov 2023 21:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A4D60E2F;
	Sat,  4 Nov 2023 21:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A4D60E2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF891BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC981821CB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC981821CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtCErDV9nKXr for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:37:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 239EA821BF
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 239EA821BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06CCF8673E; Sat,  4 Nov 2023 21:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:35:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6
X-Git-Newrev: 8e934b72044e8a08d777d0691d1321b65645ee73
X-Patchwork-Hint: ignore
Message-Id: <20231104213705.06CCF8673E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libstrophe: add c-ares optional
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e934b72044e8a08d777d0691d1321b65645ee73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

c-ares is an optional dependency since version 0.10.0 and
https://github.com/strophe/libstrophe/commit/a13847d9949f05920f94768495872807ae49c773

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libstrophe/libstrophe.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index de9012e67f..ad0860ad30 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -13,6 +13,13 @@ LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
 LIBSTROPHE_CONF_OPTS = --disable-examples
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+LIBSTROPHE_CONF_OPTS += --enable-cares
+LIBSTROPHE_DEPENDENCIES += c-ares
+else
+LIBSTROPHE_CONF_OPTS += --disable-cares
+endif
+
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 LIBSTROPHE_CONF_OPTS += --without-libxml2
 LIBSTROPHE_DEPENDENCIES += expat
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
