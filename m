Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAC4C2BA1A
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 447B541594;
	Wed, 19 Jun 2024 20:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDbneqK5GOtH; Wed, 19 Jun 2024 20:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E31FB404FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E31FB404FD;
	Wed, 19 Jun 2024 20:10:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93E731BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D0D8813E7
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYPcQYfn0Y7G for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E2F813CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87E2F813CB
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E97888024; Wed, 19 Jun 2024 20:09:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 22:07:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a559a684284f52542a6c921a011710a4f85ba036
X-Git-Newrev: f3fb7426413e6e479f32288f9bb3c10a058d99c1
X-Patchwork-Hint: ignore
Message-Id: <20240619200958.7E97888024@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: select
 BR2_PACKAGE_HOST_GO
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3fb7426413e6e479f32288f9bb3c10a058d99c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Every golang package must select the host-go package. This will allow
the user to select the Go compiler variant (build from source or
pre-built).

The same pattern is used for Rust packages.

This was done for all golang packages in commit
58a291470acf458239202bd81bfc642b9cadd298, but qbee-agent was missed.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/qbee-agent/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qbee-agent/Config.in b/package/qbee-agent/Config.in
index e75adf5805..4fbe6d404d 100644
--- a/package/qbee-agent/Config.in
+++ b/package/qbee-agent/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QBEE_AGENT
 	depends on BR2_USE_MMU # bash
 	depends on !BR2_STATIC_LIBS # shadow
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # shadow
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_SHADOW # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
