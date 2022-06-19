Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B61CCA47A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B845823C6;
	Sun, 19 Jun 2022 13:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B845823C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5UvhP-sxy-z; Sun, 19 Jun 2022 13:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CC5D81D11;
	Sun, 19 Jun 2022 13:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC5D81D11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF201BF852
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36BF5408AE
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36BF5408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQ7nLBPf6KJw for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:37:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ABAA4074E
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ABAA4074E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65BED872FB; Sun, 19 Jun 2022 13:25:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:31:53 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ec65b1060a04cbfc48c510b8f8bcd04ecd0cc753
X-Git-Newrev: 0352cceac284c434ed8286d0f9accce022a0a317
X-Patchwork-Hint: ignore
Message-Id: <20220619132538.65BED872FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libnetconf2:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0352cceac284c434ed8286d0f9accce022a0a317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
index 11a1995ea1..00d2c08f63 100644
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
