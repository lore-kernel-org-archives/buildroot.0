Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DAAD42BBF
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 19:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03F24034D;
	Tue, 12 Nov 2024 19:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DRFXesZHwpV; Tue, 12 Nov 2024 19:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95488402EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95488402EA;
	Tue, 12 Nov 2024 19:55:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D261E0D
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ABB140296
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtTxOwyFPUhc for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 19:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47958402B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47958402B7
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30AC486176; Tue, 12 Nov 2024 19:55:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 20:52:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 012bbb70c2a27847475618a132cfd578177da2cf
X-Git-Newrev: a97a592a7308991f660b0004fa9757390888e23f
X-Patchwork-Hint: ignore
Message-Id: <20241112195548.30AC486176@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: fix webp
 DependencyException
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a97a592a7308991f660b0004fa9757390888e23f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c webp mux/demux are no
longer optional for webp support in python-pillow. The
-Cwebpmux=enable/disable option no longer exists.

Fixes:
DependencyException:
The headers or library files could not be found for webp,
which was requested by the option flag --enable-webp

Fixes: baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pillow/python-pillow.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index e87c817c68..ed2668f03c 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -58,16 +58,11 @@ else
 PYTHON_PILLOW_BUILD_OPTS += -Ctiff=disable
 endif
 
-ifeq ($(BR2_PACKAGE_WEBP),y)
+ifeq ($(BR2_PACKAGE_WEBP)$(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yyy)
 PYTHON_PILLOW_DEPENDENCIES += webp
 PYTHON_PILLOW_BUILD_OPTS += -Cwebp=enable
-ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=disable
-endif
-else
-PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable -Cwebpmux=disable
+PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable
 endif
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
