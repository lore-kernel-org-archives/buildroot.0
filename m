Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987C7C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AF9680A95;
	Mon,  5 Aug 2024 20:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTOC2lSBKkSB; Mon,  5 Aug 2024 20:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BEA180ACB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BEA180ACB;
	Mon,  5 Aug 2024 20:40:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A01281BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B31C80A95
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHQOfVRNNCbj for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E3880897
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1E3880897
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:40:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6CE684527; Mon,  5 Aug 2024 20:40:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Aug 2024 15:49:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ef47358431814d752f1005f99415f3f3e205fe6
X-Git-Newrev: f6a975f24e044ffdb717a96537395cc40c43aa70
X-Patchwork-Hint: ignore
Message-Id: <20240805204050.B6CE684527@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: fix SSP compile issues
 with uClibc-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6a975f24e044ffdb717a96537395cc40c43aa70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's disable Security flags for the Buildsystem and
let it handled by Buildroot itself.

Fixes:
 - http://autobuild.buildroot.net/results/c9e/c9ed27a51a68429b2ed2d8eebb1afc919ecbead1/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluent-bit/fluent-bit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 5463682e45..10e639a3d5 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -15,6 +15,7 @@ FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
 	-DFLB_RELEASE=Yes \
+	-DFLB_SECURITY=No \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_PREFER_SYSTEM_LIBS=Yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
