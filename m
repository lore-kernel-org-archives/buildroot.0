Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF75CEC112B
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 20:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836F760A9F;
	Mon, 23 Feb 2026 20:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghkLgHsDdh44; Mon, 23 Feb 2026 20:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A94C860AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771879314;
	bh=y70oTPigpZ6EAUMywUX5MHcwkA3lPH+aWOHqSKWWJGU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DT0iNxsTd0gtqb7iLsEv6m4uUplZyriFA0wzOFTeJs/k4zznCBVMQRLOA8rFN8udI
	 mdG227Eg/VNLipaVhk9Cj9lauUxMdlQDzC1Sy2KIV9SJy1bPn6jzJhku5qLzyoq11H
	 KTqvikgluDU+6Zn4WqIRUtF6s03ZFS8w1hUtZt4aUQkm0KWJ48Ltg5uyNVbER1rXA4
	 KUo9Mo1rWSyHIVUwvI0E64VTNdIjtgT7zwrF+aeJhsw7GPKTqNWZT35HhcDrGSgjpf
	 9NHIzZfW9Wd6eiYKfwo3GBbn94FjjOpD8QfHzkp0T5wK6qUHXeZYgMdpOE9YviIQLB
	 KvbLnV/eeGH5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A94C860AB3;
	Mon, 23 Feb 2026 20:41:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1108B249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3F7260AB3
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUsHAEuXA1nU for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 20:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3524560A9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3524560A9F
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:41:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04ED887139; Mon, 23 Feb 2026 20:23:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 21:03:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 603b0350b67201cd9e21f45be00dc04fece26d2d
X-Git-Newrev: 347fd878d3071b373e90c194d6b394f08bcd4bda
X-Patchwork-Hint: ignore
Message-Id: <20260223202354.04ED887139@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gawk: bump to version
 5.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/347fd878d3071b373e90c194d6b394f08bcd4bda
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

release notes:
https://cgit.git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.4.0

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index b658359257..35524c7742 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.3.2.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.4.0.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  f8c3486509de705192138b00ef2c00bbbdd0e84c30d5c07d23fc73a9dc4cc9cc  gawk-5.3.2.tar.xz
+sha256  3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1  gawk-5.4.0.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 40b0672da2..10ca336844 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.3.2
+GAWK_VERSION = 5.4.0
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
