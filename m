Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709ADC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:08:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3462960187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3462960187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D59A40625;
	Tue,  3 Aug 2021 22:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADBnWd5GBCtR; Tue,  3 Aug 2021 22:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F4240632;
	Tue,  3 Aug 2021 22:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB381BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6C45608DA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYH7rUkGCqAo for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 203656085C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6AB078767D; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 24 Jun 2021 23:35:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d46a18555ad5c024b6d5fb28cf6f3cc0b2b0d5b
X-Git-Newrev: 150038166fafae5c596e1e8ca7572bf8b6793a6d
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.6AB078767D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gawk: create awk
 symlink for host-gawk
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

commit: https://git.buildroot.net/buildroot/commit/?id=150038166fafae5c596e1e8ca7572bf8b6793a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is to make sure that host packages that depend on `host-gawk` and that use
`awk` end up using `gawk`, instead of the `awk` symlink installed on the host
system.

On recent Debian-based distributions, `awk` is still symlinked to `mawk` [1].

[1] https://bugs.launchpad.net/ubuntu/+source/mawk/+bug/1841654

Signed-off-by: Hubert Lacote <hubert.lacote@youview.com>
Co-authored-by: Hubert Lacote <hubert.lacote@youview.com>
Co-authored-by: Vicente Olivert Riera <vincent.olivert.riera@youview.com>
[yann.morin.1998@free.fr: move after the target symlink hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gawk/gawk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 16906f6f93..ae2bbe5422 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -39,5 +39,11 @@ endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
 
+define HOST_GAWK_CREATE_SYMLINK
+	ln -sf gawk $(HOST_DIR)/usr/bin/awk
+endef
+
+HOST_GAWK_POST_INSTALL_HOOKS += HOST_GAWK_CREATE_SYMLINK
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
