Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A382DD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 21:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E470C81F36;
	Mon,  8 Dec 2025 21:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dUcsVeAHpOu; Mon,  8 Dec 2025 21:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9CD81E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765227943;
	bh=XfnTLCkwdL1uSexhhJNaE13nhNrcDGAoO8KPm9ldw6c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DUeL1Ws6JGAC1DTBTYqtWl9kFGJnCYvTYP32XvnaUkZTcUWmAxddgdCOxE6ABQiQD
	 E8gZncN5fAFgX9IYoVdTHucSe06ku9H54kXNVdd4jfa82/E+pwXuSVk4M6oohjnRk7
	 vlcoUffFE2DdMl0YRYC2XGi0G1SDHTDWWVfKtgRZCdFiZhCulpKGajDY521UzrmWjh
	 0MWWHXTE/qFsx8URY34kONmRars7sF3yYin5a9xfVsyksrkbpfkz2iK7C1tMe40llk
	 tIoJXkk768GTH65RoJzhhLY8esGvuP5vmejCcIc4u81NSCYIIb9WVpyHvlh7iFMo+/
	 qRYsh73a9zgRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9CD81E50;
	Mon,  8 Dec 2025 21:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5263E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FDDF40058
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htEUCzc8Sf8g for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 21:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A07FF40042
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A07FF40042
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:05:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B18086801; Mon,  8 Dec 2025 21:05:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 21:56:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d98d9ba28ffa5b468fa243ae1a359aadef3ed0a0
X-Git-Newrev: 52f83ccfbca8497d58eb624ac7b59d5195565f3d
X-Patchwork-Hint: ignore
Message-Id: <20251208210539.9B18086801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: security bump version to
 1.6.53
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

commit: https://git.buildroot.net/buildroot/commit/?id=52f83ccfbca8497d58eb624ac7b59d5195565f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.53/ANNOUNCE
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.52/ANNOUNCE

Version 1.6.52 fixed CVE-2025-66293 (high severity).

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-66293

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index fc4aeba85a..1e57e1dc33 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.51/
-sha1  8fd6ff93769fac269ab9197c106d4e0808521b04  libpng-1.6.51.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.53/
+sha1  90672f16e545e4931abd50d372edef50596a1d46  libpng-1.6.53.tar.xz
 # Locally computed:
-sha256  a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2  libpng-1.6.51.tar.xz
+sha256  1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4  libpng-1.6.53.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e78115146b..7b66f17bbf 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.51
+LIBPNG_VERSION = 1.6.53
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
