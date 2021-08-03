Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F5AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:53:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6740060FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6740060FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39705606AF;
	Tue,  3 Aug 2021 15:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgS8Dunk2cpj; Tue,  3 Aug 2021 15:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B82F60794;
	Tue,  3 Aug 2021 15:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015631BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F155A402CB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cde-JUpA0xVJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E3CF40290
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:52:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4ECC8AC5A; Tue,  3 Aug 2021 15:52:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:51:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f87b7411764b113044821235fb0596047bca0292
X-Git-Newrev: 61f50fdc7d1cee35838b74105746fb8cfac75a44
X-Patchwork-Hint: ignore
Message-Id: <20210803155230.D4ECC8AC5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-totp: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=61f50fdc7d1cee35838b74105746fb8cfac75a44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for tpm2-totp is added by the services/tpm2 module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tpm2-totp/tpm2-totp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index 250a016a50..42607c0b73 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -8,6 +8,7 @@ TPM2_TOTP_VERSION = 0.2.1
 TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
+TPM2_TOTP_SELINUX_MODULES = tpm2
 TPM2_TOTP_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
 TPM2_TOTP_CONF_OPTS = \
 	--disable-defaultflags \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
