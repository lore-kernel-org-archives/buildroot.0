Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81D0CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CB9414F4;
	Mon, 17 Nov 2025 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAiUt2WleL5J; Mon, 17 Nov 2025 20:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDB35414BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDB35414BA;
	Mon, 17 Nov 2025 20:08:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6BFE1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3E7C83DA4
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isNUJrCw_vxW for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3054A83DA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3054A83DA7
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E91C81E81; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 17:00:03 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 8ced625be696d3f81ddc81983366e435eb5918c3
X-Git-Newrev: 04a9e0d8a903f4068c667e6c874c910f1f2fd08a
X-Patchwork-Hint: ignore
Message-Id: <20251117200753.2E91C81E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/crun: link with
 libatomic if needed
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=04a9e0d8a903f4068c667e6c874c910f1f2fd08a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/f4f/f4fb970f8d4f2f7966fcbd542768a607ea7ababf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c560bb3181a56a174d05b0f8486ce1a27f92b064)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/crun/crun.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index b4db276602..02d0b3d62f 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -15,6 +15,10 @@ CRUN_CPE_ID_VALID = YES
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CRUN_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CRUN_DEPENDENCIES += argp-standalone
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
