Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C7EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:07:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8802D61216
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8802D61216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C69A407B7;
	Fri, 17 Sep 2021 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-gvdwOXx6n2; Fri, 17 Sep 2021 20:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 469264047E;
	Fri, 17 Sep 2021 20:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF1801BF48D
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D65861BEA
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5YOCDBlLQJOa for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 20:07:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEB6B60B91
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 20:07:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5ABA88B522; Fri, 17 Sep 2021 20:05:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 21:52:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e772166ff22ef232726df05baaeef0c6f7601e12
X-Git-Newrev: 3f71ff5257d63cf306ce3177a89bbaa79984ba10
X-Patchwork-Hint: ignore
Message-Id: <20210917200531.5ABA88B522@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xorriso: build host variant with
 zlib support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f71ff5257d63cf306ce3177a89bbaa79984ba10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will soon use xorriso in the ISO9660 image generation support, and
this requires having zlib support in host-xorriso.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xorriso/xorriso.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 7b38f268bb..ff3414fd8a 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -12,14 +12,16 @@ XORRISO_LICENSE_FILES = COPYING COPYRIGHT
 # Disable everything until we actually need those features, and add the correct
 # host libraries
 HOST_XORRISO_CONF_OPTS = \
+	--enable-zlib \
 	--disable-xattr-h-pref-attr \
-	--disable-zlib \
 	--disable-libbz2 \
 	--disable-libcdio \
 	--disable-libreadline \
 	--disable-libedit \
 	--disable-libacl
 
+HOST_XORRISO_DEPENDENCIES = host-zlib
+
 # libcdio doesn't make sense for Linux
 # http://lists.gnu.org/archive/html/bug-xorriso/2017-04/msg00004.html
 XORRISO_CONF_OPTS = --disable-libcdio
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
