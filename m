Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB42CCFA13
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DADBD40580;
	Mon, 10 Nov 2025 19:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzL2ajDeJM1S; Mon, 10 Nov 2025 19:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 097F340588
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 097F340588;
	Mon, 10 Nov 2025 19:08:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4783B2CD
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4437C81498
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffD_K1AmOqG1 for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B423814C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B423814C4
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69CA5843A9; Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Nov 2025 19:34:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 561c2e8fdcd04d35e609abe4852ba22cacaa0e81
X-Git-Newrev: 53a302c6ed2a8f83a5bc9e4ecb1a280ee3e1bc92
X-Patchwork-Hint: ignore
Message-Id: <20251110190753.69CA5843A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: Add an option to
 enable/disable CBCP support.
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

commit: https://git.buildroot.net/buildroot/commit/?id=53a302c6ed2a8f83a5bc9e4ecb1a280ee3e1bc92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds BR2_PACKAGE_PPPD_CBCP option.
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: move blocks in Config.in an .mk to keep options sorted]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pppd/Config.in | 7 +++++++
 package/pppd/pppd.mk   | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 88c2180a9b..64bf2d12f2 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -11,6 +11,13 @@ config BR2_PACKAGE_PPPD
 
 if BR2_PACKAGE_PPPD
 
+config BR2_PACKAGE_PPPD_CBCP
+	bool "CBCP (Callback Control Protocol)"
+	default n
+	help
+	  Enable Callback Control Protocol (CBCP) support in pppd.
+	  https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.
+
 config BR2_PACKAGE_PPPD_FILTER
 	bool "filtering"
 	select BR2_PACKAGE_LIBPCAP
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 8d80675d15..24dcb85387 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -39,6 +39,12 @@ PPPD_CONF_OPTS += \
 	--without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PPPD_CBCP),y)
+PPPD_CONF_OPTS += --enable-cbcp
+else
+PPPD_CONF_OPTS += --disable-cbcp
+endif
+
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
 PPPD_CONF_OPTS += --with-pcap=$(STAGING_DIR)/usr
 PPPD_DEPENDENCIES += libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
