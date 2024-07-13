Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E40EC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0906F410B0;
	Sat, 13 Jul 2024 14:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrtKbQsrwGjQ; Sat, 13 Jul 2024 14:12:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C486413E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C486413E8;
	Sat, 13 Jul 2024 14:12:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B570C1BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE9DF4018D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMLZET46zMj1 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7570400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7570400A4
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B223C86499; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:11:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2df2ee019779fcb2edd192de2a58ca3c1e689e6
X-Git-Newrev: 62c7857dfa5036e26d5b921c199e66621a4bc508
X-Patchwork-Hint: ignore
Message-Id: <20240713141159.B223C86499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libassuan: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=62c7857dfa5036e26d5b921c199e66621a4bc508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libassuan is needed by libgpgme, which is needed for skopeo
(to come in a followup patch);

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 9553c630a2..8e827bdb80 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -15,8 +15,14 @@ LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 
+HOST_LIBASSUAN_DEPENDENCIES = host-libgpg-error
+HOST_LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
+HOST_LIBASSUAN_CONF_OPTS = --with-gpg-error-prefix=$(HOST_DIR)
+
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
 LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+HOST_LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(HOST_DIR)/bin/gpgrt-config
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
