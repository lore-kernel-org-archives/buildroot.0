Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F1BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D0D60525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4D0D60525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95DD3404F6;
	Tue,  3 Aug 2021 22:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7F5WtlNYX6J0; Tue,  3 Aug 2021 22:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6984404F1;
	Tue,  3 Aug 2021 22:53:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12D3F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D69874058E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BHGkQl4Lob6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47A15405A1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9E539864A8; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 3 Jun 2021 09:31:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8a313b019c7d7e898186a8b08f9c25ae0194fa16
X-Git-Newrev: a7186cd1ea0f26e44dda06d31cf010091cd13535
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.9E539864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: remove endif
 that prevents Buildroot to use Makefiles at all
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7186cd1ea0f26e44dda06d31cf010091cd13535
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit [1] breaks Buildroot Makefile since a Makefile endif has been left
with no sense giving following error:
package/lvm2/lvm2.mk:61: *** extraneous 'endif'.  Stop.

So let's remove that forgotten endif.

[1]: https://git.buildroot.net/buildroot/commit/?id=8a313b019c7d7e898186a8b08f9c25ae0194fa16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lvm2/lvm2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 70787fe91b..5ce79768b6 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -58,8 +58,6 @@ LVM2_INSTALL_STAGING_OPTS += install_device-mapper
 LVM2_INSTALL_TARGET_OPTS += install_device-mapper
 endif
 
-endif
-
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
