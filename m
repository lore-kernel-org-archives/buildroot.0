Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28894C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7D8440A1B;
	Wed, 10 Aug 2022 15:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7D8440A1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hvoD0Adn3rn; Wed, 10 Aug 2022 15:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82DF5409D5;
	Wed, 10 Aug 2022 15:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82DF5409D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F00B71BF344
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB8F56104D
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB8F56104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsMpSAa4E6qF for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AD8260B9C
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD8260B9C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C93EC87089; Wed, 10 Aug 2022 15:17:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 17:28:39 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5e55b592fd22c6c413b9e2e3cd22e1e7f43e55e6
X-Git-Newrev: c6701cf5438e7afd8b0672df9eb8673d5a1edfcb
X-Patchwork-Hint: ignore
Message-Id: <20220810151725.C93EC87089@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/mstpd: fix
 install path of binaries
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6701cf5438e7afd8b0672df9eb8673d5a1edfcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

As reported by Colin Foster at
https://lore.kernel.org/buildroot/YsiEyscz0S5b9zj9@colin-ia-desktop/,
the Linux kernel expects the bridge-stp binary to be installed as
/sbin/bridge-stp. See
https://elixir.bootlin.com/linux/v5.18/source/net/bridge/br_private.h#L53.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Tested-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 09874785c06747470915fc12befd45307ccd2bbd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mstpd/mstpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index 907d094242..07c41af8df 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -10,4 +10,8 @@ MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
 MSTPD_LICENSE_FILES = LICENSE hmac_md5.c
 
+# The Linux kernel requires mstp binaries to be installed into /sbin,
+# not /usr/sbin.
+MSTPD_CONF_OPTS = --sbindir=/sbin
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
