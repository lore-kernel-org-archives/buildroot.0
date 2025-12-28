Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2FED3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5BA4053D;
	Sun, 28 Dec 2025 21:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDz_eLpb0DwS; Sun, 28 Dec 2025 21:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B70B40540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959054;
	bh=HpsWul1SSBH7mloU4zROg5o9zCNkMUfzF13NMmQBHn8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=loPoXzZd/kU/jvC6dgkt9ffEMj+INPZYX6ip8m5zqW3u8DecfD//TVC9xAzKTh4ND
	 qwN+Ds7ob1BLBeUxUAZ3+/yq9Gp6lhP17VtYtNDt3IyYrmoulFYlAx6KWERraKaW6f
	 NLVALBpbWCg3ime+KD3IQhg3DebPqwQ1izSWK7QJqWn4FzzDbw73/e/zLfiUwwlLVu
	 vJ1Ch70A3PHeJHd3Ocpo1AFek+EUmUorVvnm0uFK03GgrCc9YsY01woz291ynyIU/i
	 8FF2gqZQLYtdpFARbFBGpsi/SRnh+Gjmm+Wqm09Jry2nB38jGEYbPT8SegVYj1Vynw
	 LzxHXTjOJUbjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B70B40540;
	Sun, 28 Dec 2025 21:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2840D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B399560A59
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFPtzFUsa1Fx for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF6A160905
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF6A160905
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE0198775F; Sun, 28 Dec 2025 21:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:56:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a40d54cc330e2f10b3fb7d5f7dfdf66e0083d00
X-Git-Newrev: 8adea9f9f9409fc9b5d408a2cfdde48718e54814
X-Patchwork-Hint: ignore
Message-Id: <20251228215731.CE0198775F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tio: bump version to 3.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8adea9f9f9409fc9b5d408a2cfdde48718e54814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 3.5, see:
https://github.com/tio/tio/releases

This commit updates the license hash, after a year update:
https://github.com/tio/tio/commit/f5740dbf3150bf292d77a450b9945d7870489192

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tio/tio.hash | 6 +++---
 package/tio/tio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index d1caeeebc6..0d9acae9d6 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tio/tio/releases/download/v3.5/tio-3.5.tar.xz.sha256sum:
-sha256  efd3e9a406f827ac22d4157e345079dde15ee5a948b24156561d6c97a54e6ec0  tio-3.5.tar.xz
+# From https://github.com/tio/tio/releases/download/v3.9/tio-3.9.tar.xz.sha256sum:
+sha256  06fe0c22e3e75274643c017928fbc85e86589bc1acd515d92f98eecd4bbab11b  tio-3.9.tar.xz
 
 # Hash for license files:
-sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
+sha256  4c336df2e6334540d713e302281bcd35df3e03b05e4d4d62ef84bde8ae00eea9  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 637a7bdd83..b5711d10ff 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIO_VERSION = 3.5
+TIO_VERSION = 3.9
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
