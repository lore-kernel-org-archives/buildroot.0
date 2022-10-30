Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9FAECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2009740320;
	Sun, 30 Oct 2022 21:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2009740320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urCHxMCoXNnl; Sun, 30 Oct 2022 21:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D5F4031E;
	Sun, 30 Oct 2022 21:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D5F4031E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 782CA1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60BF7400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BF7400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFYv5RUyDGRL for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B15400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B15400CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C9DA876B2; Sun, 30 Oct 2022 21:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:31:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09779d0f6918377e77f108f27695b16c48cfd1a8
X-Git-Newrev: fada6de8b0798f896626723c3cc6a7aea4521d48
X-Patchwork-Hint: ignore
Message-Id: <20221030213223.8C9DA876B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: add config option to
 enable debug output
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

commit: https://git.buildroot.net/buildroot/commit/?id=fada6de8b0798f896626723c3cc6a7aea4521d48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolftpm/Config.in  | 5 +++++
 package/wolftpm/wolftpm.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 7ebb253857..4e712d0afb 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_WOLFTPM_NUVOTON
 	  Enable support of TPM 2.0 extra functionality offered by the
 	  Nuvoton NPCT750 chip.
 
+config BR2_PACKAGE_WOLFTPM_DEBUG
+	bool "Debug output"
+	help
+	  Enable debug messages in wolfTPM.
+
 comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index f217322545..398fa668af 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -47,4 +47,10 @@ else
 WOLFTPM_CONF_OPTS += --disable-nuvoton
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_DEBUG),y)
+WOLFTPM_CONF_OPTS += --enable-debug
+else
+WOLFTPM_CONF_OPTS += --disable-debug
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
