Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B9DC44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 820B4608A8;
	Tue, 14 Jul 2026 09:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J17-XfRLtW5C; Tue, 14 Jul 2026 09:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8B6608C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784022285;
	bh=63fg+Z82wYfdlemFteoD/qKCjpwqCletCMXKWdrePBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IAwBmvGrY6g0pSIr6mZuEiNXheMn0TlXzZgztxZvhW3jo+65G1ThbnmoXGvRfRnM2
	 34vNN3or2PaP3irb79bNn0GXpaG9Dz1wiUjgQICsQVmMxrMdFsg74YX4mQQfCL3C6i
	 WKcejiKhdwFK0EAugev20m3aOmxZdEPIoUUbhyuyKbuRvZ+MUzCEJXM+bJtEQuYhro
	 PstNl+6MtTO8mJaUNeY1/6zFRrc9lxOKfOQh3C6bPY7m1MvAm5ZrxylCPR6tzkvBhF
	 P7eQe6gupRX/wWJ8dKbzu3T38kjyWY7rbjuCNRyscyfP2XFBdnUpupeg8vSu5ATd81
	 lG11z+jn1i0aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A8B6608C5;
	Tue, 14 Jul 2026 09:44:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 023D396C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC86040740
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMxlNszpgXka for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99BBE40730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99BBE40730
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:44:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E28E288840; Tue, 14 Jul 2026 09:44:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:43:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7266597bc179db6b258368519afe1eedeada5da
X-Git-Newrev: 9f7c484b4ab0190765dc81fb79083ae8e2be211b
X-Patchwork-Hint: ignore
Message-Id: <20260714094407.E28E288840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: update download site
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f7c484b4ab0190765dc81fb79083ae8e2be211b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix the download site, which seems to be changed after
a new release. Use the more permanent /archive.

Fixes:
 - https://autobuild.buildroot.net/results/a1a/a1a88bea6fdf5ae28d813f0a12d08e504b2fad06/
 - https://autobuild.buildroot.net/results/b3d/b3d0588fbc02ede6d5f82fb5d2fefcf610a69299/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/stunnel/stunnel.hash | 2 +-
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index dc61f6d5b9..572f226861 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,4 +1,4 @@
-# From https://www.stunnel.org/downloads/stunnel-5.78.tar.gz.sha256
+# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
 sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 8bd680af32..adae204148 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION = 5.78
-STUNNEL_SITE = https://www.stunnel.org/downloads
+STUNNEL_SITE = https://www.stunnel.org/archive/5.x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
