Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916EAD5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7F726076C;
	Sat, 13 Dec 2025 17:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQu3UN7hMAIH; Sat, 13 Dec 2025 17:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4268E60727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765648092;
	bh=RPhu0cSASH8ZWSPecSHoVQj+dVuUx3czBw3wP+5O4Uk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V2BKt6JWLiet7w0faBnZq1H2EEhOmhE9DOrqUZfO3MQp9uGO6gvawZkcTje/xjv1x
	 lvil6dHvlWPlrRBrWlbKLLsXYjy8NiEqxo+ajr9xCUrgJykFa7xkaXkKhMlEc+3HQl
	 JLw5eF2vDTIMXzvPoTOiXM5eTq6gyFjZuScO37lZsXdjDJdUqbvlisTA4n9xzumYpa
	 ISE6hZ756OreWijxOPBrMuP3kwlGLzAWwRyCn+5U6w26DUmL3GihQbLIdpko6roCKI
	 w6q1YPN6bZoyBpUtiSVt+qPoBPRy56+c9II7/yeQVhIdVrE1jPqjAJ4oCMm0KqkpoK
	 w7HEYrtMCoCeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4268E60727;
	Sat, 13 Dec 2025 17:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A6FA13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E557481453
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LR4AOcZ8Z0y for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D058143B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21D058143B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:48:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11E1786D89; Sat, 13 Dec 2025 17:48:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 18:45:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13bbd4ff47b294fc03f4e966eb595718e9a87d23
X-Git-Newrev: 1bd758209ee909b62ac448b570d8944b0057e518
X-Patchwork-Hint: ignore
Message-Id: <20251213174810.11E1786D89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: bump to version
 2025-12-09
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1bd758209ee909b62ac448b570d8944b0057e518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Kernel >= 6.18 introduced in [1] rtl8723ds fails at build
time with error:

    core/rtw_security.c:2183:13: error: conflicting types for 'sha256_init'; have 'void(struct rtl_sha256_state *)'

Fixes:
https://autobuild.buildroot.org/results/52081e3a500dd2566af145e8c6d793df7f72d025/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index c2691402bd..580f5d09f6 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  338f0fe08acdd1352428d86f88366935e1b967b134f252ac9a3e50cc8922fe14  rtl8723ds-546ffb2cb735e0c33e765936721bd66dd58e6893.tar.gz
+sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 14938daaf6..d8072f14bc 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 546ffb2cb735e0c33e765936721bd66dd58e6893
+RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
