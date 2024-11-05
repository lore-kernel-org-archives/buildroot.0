Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA80D3E779
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 22:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EC880EA0;
	Tue,  5 Nov 2024 22:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNNPN_oqVCZ6; Tue,  5 Nov 2024 22:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C6B180EA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C6B180EA3;
	Tue,  5 Nov 2024 22:37:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A1A33B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27B84405F6
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jj4bilhpUOi0 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 22:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BEA405C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39BEA405C5
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:37:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BC8C85D61; Tue,  5 Nov 2024 22:37:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 5 Nov 2024 23:33:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4131c0b17e56bc33399ddc6005ac7c13fb577648
X-Git-Newrev: 49ad3a62fd0af279bf2c659889e132957bc865d9
X-Patchwork-Hint: ignore
Message-Id: <20241105223752.1BC8C85D61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: Support spdm_context in
 the HAL
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49ad3a62fd0af279bf2c659889e132957bc865d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows us to build libspdm with support for `spdm-context` in the
HAL functions. This is required by `spdm-utils`, this macro will be
dissolved in libspdm 4.x, with this feature being defaulted on.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[Julien: rebased on libspdm 3.5.0 recipe]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libspdm/libspdm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 03ac9a70f8..9d8da2a3c6 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -22,7 +22,8 @@ LIBSPDM_CFLAGS = \
 	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
-	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0
+	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0 \
+	-DLIBSPDM_HAL_PASS_SPDM_CONTEXT=1
 
 LIBSPDM_CONF_OPTS = \
 	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
