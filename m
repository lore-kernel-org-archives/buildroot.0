Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC86D78770
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F21E612F2;
	Fri, 19 Dec 2025 17:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEoPbK07ziab; Fri, 19 Dec 2025 17:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6DAC612CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766166937;
	bh=0ZK3XlSujhhqZDhByoHYqunnReyKu2h3WYmx1aSlyd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ml0zBH/udXmqfFbnISl01UNxIDYQETRGPoHNMZUNBKtLYNGy3evxuv0KY9HDYwXjm
	 zEkvc3m931O1ZP4KC1GwDI7x6GwHyrokXNQb9gYvvO6RpH9io7p6cpVUfmbI5dCaDs
	 iF47CsOY5VsUUgQS2UXJsgYxHYyeDG8BMuRXkNnYWuYzsDrmp+noNomR7JQsUICDFd
	 GEdHDpMkxGgEPKM59+2EGlKVYoxX/W4aX+AXQs8IWwqruWz/+XEqzoE+Ca/wxjpXTJ
	 vsNE9FWyR7qTVPF08c6RlkjX9dRsY75YgD+ZaEFr+JEDsvzziut7xHKja3D7NaPcLr
	 8Y8K/gmaH6ebQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6DAC612CF;
	Fri, 19 Dec 2025 17:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B03D5119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD10883B88
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFK_Q50TUNsO for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A169883B85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A169883B85
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DC59870F3; Fri, 19 Dec 2025 17:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 18:53:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ebe3024be47cc853e64fb4f9ce274bafdc410dd
X-Git-Newrev: 2ce452ed71127070f64a0834086d81b1e2eda907
X-Patchwork-Hint: ignore
Message-Id: <20251219175535.8DC59870F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmidecode: bump to version 3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ce452ed71127070f64a0834086d81b1e2eda907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.nongnu.org/archive/html/dmidecode-devel/2025-12/msg00039.html

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dmidecode/dmidecode.hash | 4 ++--
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index ab1f62be65..f145f216ed 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature from:
-# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.6.tar.xz.sig
-sha256  e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae  dmidecode-3.6.tar.xz
+# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.7.tar.xz.sig
+sha256  2c3aed12c85a1e6a9410d406d5e417c455466dc1bc7c89278bb32cf7cad91e8a  dmidecode-3.7.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 550e29d624..da19e1e1c9 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.6
+DMIDECODE_VERSION = 3.7
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
