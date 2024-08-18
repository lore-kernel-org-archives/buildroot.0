Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37664C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 05:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBEDF60608;
	Sun, 18 Aug 2024 05:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glHerMh5Sii5; Sun, 18 Aug 2024 05:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DBB96061A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DBB96061A;
	Sun, 18 Aug 2024 05:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CFA31BF47E
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 05:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A6CB402BE
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 05:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9K0PVuzOfJm for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 05:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B087402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B087402BC
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B087402BC
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 05:18:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A2DC135211C6; Sun, 18 Aug 2024 07:18:13 +0200 (CEST)
Date: Sun, 18 Aug 2024 07:18:13 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsGEFY9tBojly+uA@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723958293; bh=lM5iF1eDdhfy5nsh0UD3OZuhnGboBeOD9PfL0CEisPg=;
 h=Date:From:To:Subject:From;
 b=Azfw+gitg1wWTI6Vbfb6XDvkNrLHUChto52Q/5AkzFILUvTWa16fy+Ri63Wxs1+v1
 hkHzKbwRLAZY2VFgPBrs1XditUjfsyf4cGe3PyK3yB7IaZdgU2eVGwsFQWB81Xf7jc
 tkOn2T3jmWGMwz7p9L4Pgr5VZDEcfGaxnhFhm7IwQYL2q2zoDCQwO1bCnAKnhJOlK5
 1ORwp0oqvu/A16MiYUUuVCVNiHw9K/ALEuSQz54ccjg9s+3WpmXUTh17YNoWsdShg7
 clzRQpwK2jPX9q/MQGErDAFoev80KHMetGSHq/muYckRxSnlO9jlEjW8g3WuZ/mRfW
 iTBMDPjEuAEog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=Azfw+git
Subject: [Buildroot] [PATCH next] package/nftables: update to 1.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no changelog available, but you can browse the
git log here:
https://git.netfilter.org/nftables/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/nftables/nftables.hash | 4 ++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index c5ede1130a..ef635cd3c3 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,8 +1,8 @@
 # From https://netfilter.org/projects/nftables/downloads.html
 # Checked pgp signature:
-# https://netfilter.org/projects/nftables/files/nftables-1.0.8.tar.xz.sig
+# https://netfilter.org/projects/nftables/files/nftables-1.1.0.tar.xz.sig
 # with key:
 # https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-sha256  9373740de41a82dbc98818e0a46a073faeb8a8d0689fa4fa1a74399c32bf3d50  nftables-1.0.8.tar.xz
+sha256  ef3373294886c5b607ee7be82c56a25bc04e75f802f8e8adcd55aac91eb0aa24  nftables-1.1.0.tar.xz
 # Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9cba243372..c958f0eb26 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.8
+NFTABLES_VERSION = 1.1.0
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
