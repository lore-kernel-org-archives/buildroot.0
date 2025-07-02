Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA02C83038
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 19:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161B5612D7;
	Wed,  2 Jul 2025 19:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ab2fk8L7nlkc; Wed,  2 Jul 2025 19:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C02561011
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C02561011;
	Wed,  2 Jul 2025 19:08:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62EAD179
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E77EA80CF5
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_9YQqO64Cbc for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 19:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AEDF80CF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AEDF80CF3
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:08:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 864E385785; Wed,  2 Jul 2025 19:08:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Jul 2025 21:03:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee86844e632d5760355154ea4e928c9228f3dfd1
X-Git-Newrev: 23e6d91c69dc275c8fa5b3a172460976931fe1c1
X-Patchwork-Hint: ignore
Message-Id: <20250702190815.864E385785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jose: add CPE identifier
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23e6d91c69dc275c8fa5b3a172460976931fe1c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:latchset:jose:14:*:*:*:*:*:*:* is a valid CPE ID.

See:
https://nvd.nist.gov/products/cpe/detail/7E6A7E16-E8B0-47BA-B7C7-0D4102933031

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jose/jose.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 9fd9d1dcaa..88050be5ed 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -12,5 +12,6 @@ JOSE_LICENSE_FILES = COPYING
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
 JOSE_CONF_OPTS = -Ddocs=disabled
+JOSE_CPE_ID_VENDOR = latchset
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
