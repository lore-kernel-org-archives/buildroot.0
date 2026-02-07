Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC2AEE0AE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 21:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7AD60702;
	Sat,  7 Feb 2026 21:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W28tLdIeJfaW; Sat,  7 Feb 2026 21:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7557360718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770500750;
	bh=SJua0wr3SpzXE5a4fKRTVEql5ZR99bOqVO8enMp1iLU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TDlH8ERXrSTOEGpvwr+k4tI0utbpoV8on/UZgi8cX1+eO91QPyuHT5Bgc4ikex7fH
	 gE0ZC/nouF9t56WIedqUBojuENrEs5Po3M4O9b+RZx0d/zHPgnib9du+MczdPx/aBs
	 ndBtYXMT/AF059hRQoACgOglQ4/Pg30Hmg9fz1fR+KjyzZ/SB2rleJaq2N0sRrT/xA
	 K0RGoMuRgWtlev/rf4/xfSbFBfQ6qbnOA50bNqXF9Xb/7efLurf6H+07PV/n5QWKi0
	 3bzrtuB0z2JsZg8tchPaG35/L5s6Vm7AuUci6Xn7Z5cO6xQIauxi+dAQnXYIz27K5K
	 feRKjroR+sQYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7557360718;
	Sat,  7 Feb 2026 21:45:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57F5F219
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B9D7403A6
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9NZd11qorwp for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70F2440265
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70F2440265
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20474837DF; Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 22:33:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e72901eefeab51c7f718d4c8ce0d10d08f1c657
X-Git-Newrev: 830726905accf698fb8621fa07d962a7ab97ce40
X-Patchwork-Hint: ignore
Message-Id: <20260207214546.20474837DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/blake3: explicitly disable
 threading & examples
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/830726905accf698fb8621fa07d962a7ab97ce40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use of threading requires a C++20 compiler, and the oneTBB
implementation. oneTBB is missing from Buildroot, but a system
one may be used if found.

Even if the default for threading is disabled, explicitly state so,
in case the default changes in the future.

Also disable examples, we don't and won't need them.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/blake3/blake3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 9d1323192c..1055a2c073 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -10,6 +10,10 @@ BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
 BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
 
+HOST_BLAKE3_CONF_OPTS = \
+	-DBLAKE3_USE_TBB=OFF \
+	-DBLAKE3_EXAMPLES=OFF
+
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
