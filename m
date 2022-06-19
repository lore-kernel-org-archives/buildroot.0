Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40857C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0BC9408CD;
	Sun, 19 Jun 2022 13:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0BC9408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsMePcdM0WCA; Sun, 19 Jun 2022 13:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5818408AE;
	Sun, 19 Jun 2022 13:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5818408AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39DDF1BF852
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14AD4414CB
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14AD4414CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfPBnXFFMpkx for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:37:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F01C410DB
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F01C410DB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0405C872F6; Sun, 19 Jun 2022 13:25:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:32:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9c51015379c7157742cc69f42346f2f5bcc0dfd2
X-Git-Newrev: 8f285e389046db9b264365c763f3aaa4bf0b5b03
X-Patchwork-Hint: ignore
Message-Id: <20220619132532.0405C872F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libnetconf2:
 doesn't build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f285e389046db9b264365c763f3aaa4bf0b5b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libnetconf2 doesn't build with libressl which doesn't provide
X509_STORE_CTX_get1_certs resulting in the following build failure with
netopeer2:

[100%] Linking C executable netopeer2-server
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-gnu/11.2.0/../../../../microblaze-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/lib/libnetconf2.so: undefined reference to `X509_STORE_CTX_get1_certs'

Fixes:
 - http://autobuild.buildroot.org/results/7f9a114a477e859dfbc62a53ab66c58eddb2318b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e6904fdd7e6d5d25e21ff78ed1636673b068fef4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetconf2/libnetconf2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index ddbb99b7ed..9adf256550 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -23,7 +23,7 @@ else
 LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL), y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
 LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
 LIBNETCONF2_DEPENDENCIES += openssl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
