Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB4CFA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43F4760AA5;
	Sat,  3 Jan 2026 12:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Grl5PBvOe4Mx; Sat,  3 Jan 2026 12:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 494E660801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767442728;
	bh=Qt/se8nCoEvV97vne2eO9BILAyCnghgpmWuB3fqYD94=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tz2M6Q+5BbODhvB7cNcNYPaVAJqFxCGnRmM3Vj5PQUvEoA9Dv7MK/uUNb9cp7pJm2
	 LuNUcG0NYgMbb+SRCPZR66RDLc7W2+2/vi1ka823GJUTk7OSnty3dia8ACqbM5qKx3
	 wqQ85VeTWaxJIS1dZ+z3HdG7KDofP4u5X25dz8aFMMxfCjX23uXOrcEW5jdcmSpdVb
	 AVm2mkmdC3+T/GcbeN6SFxu+77ptaI0ouHqOWlxv/lupAWCdGoVpZyenhqkjccnprp
	 U3w/6tH47XWCY65r1bYv/3je/zjy7qAvkpiKNjQiPbCNKqkUlx89UzPijarkbU0kGQ
	 3NRva9UTmrEsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 494E660801;
	Sat,  3 Jan 2026 12:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93294440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 852D060801
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzEeCeKkP5td for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC95F60768
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC95F60768
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD42D8813D; Sat,  3 Jan 2026 12:18:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 13:12:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01cd953a3eb1a97977c19d312fa27f033da2f80d
X-Git-Newrev: 0580b9051a1a4fb388a202a4a0eae85c4b119463
X-Patchwork-Hint: ignore
Message-Id: <20260103121846.BD42D8813D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-humanize: bump to version
 4.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0580b9051a1a4fb388a202a4a0eae85c4b119463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 86dfd80b78..f1ed743cc4 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  acac6b2378dd0d9b1d9d1ffefb08e00b  humanize-4.14.0.tar.gz
-sha256  2fa092705ea640d605c435b1ca82b2866a1b601cdf96f076d70b79a855eba90d  humanize-4.14.0.tar.gz
+md5  65cf3c77127d6ef9159e56c4ca728c07  humanize-4.15.0.tar.gz
+sha256  1dd098483eb1c7ee8e32eb2e99ad1910baefa4b75c3aff3a82f4d78688993b10  humanize-4.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index df2e99043a..e314fa5f78 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.14.0
+PYTHON_HUMANIZE_VERSION = 4.15.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/b6/43/50033d25ad96a7f3845f40999b4778f753c3901a11808a584fed7c00d9f5
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/ba/66/a3921783d54be8a6870ac4ccffcd15c4dc0dd7fcce51c6d63b8c63935276
 PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
