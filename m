Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D5BC001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 09:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C28409FD;
	Sun, 23 Jul 2023 09:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C28409FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOvuzgXY1DCE; Sun, 23 Jul 2023 09:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8329240A01;
	Sun, 23 Jul 2023 09:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8329240A01
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C15F71BF20B
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A8F6409F8
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A8F6409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5mnStrz8fMH for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 09:59:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E98A40A01
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 09:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E98A40A01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7033C8262D; Sun, 23 Jul 2023 09:59:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 11:59:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 249efb46fcf35058505d23ae65ba395c5c51545e
X-Git-Newrev: 72520986963140a314097c5a7d68dc4b2c55358c
X-Patchwork-Hint: ignore
Message-Id: <20230723095932.7033C8262D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: drop cxx handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=72520986963140a314097c5a7d68dc4b2c55358c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fluent-bit is written in pure c, so drop any cxx handling. Only the wasm
part needs c++, but that one doesn't need the fixes which are now dropped.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluent-bit/fluent-bit.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index b26ec2b0b6..cd8f347768 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -13,7 +13,6 @@ FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
 FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
-FLUENT_BIT_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
@@ -49,13 +48,11 @@ FLUENT_BIT_CONF_OPTS += \
 # Fix multiple definition of `mk_tls_*'.
 # https://github.com/fluent/fluent-bit/issues/5537
 FLUENT_BIT_CFLAGS += -fcommon
-FLUENT_BIT_CXXFLAGS += -fcommon
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # https://bugzilla.redhat.com/show_bug.cgi?id=574992
 FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
-FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 FLUENT_BIT_DEPENDENCIES += libexecinfo
@@ -74,8 +71,7 @@ endif
 
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
-	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)" \
-	-DCMAKE_CXX_FLAGS="$(FLUENT_BIT_CXXFLAGS)"
+	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
