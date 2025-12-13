Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45162D5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6E081EB5;
	Sat, 13 Dec 2025 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbucPe6Cio81; Sat, 13 Dec 2025 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 317CC81EB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765648871;
	bh=wCurpwkK5SL4BPzA23+MrxSywUd2QdXrGJUHIPOj9Ts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DXnZYmf92ZGLpwyxIvDz4eEaM4OLxULXF29ZeY0sn5p8SMeMabXcdtBhLdh4pEkBq
	 Uc914MdytgrgfDOfs82/ocTTdrfa3I+kUmwlIWRHJ6KZ3kgR2ZD/Fl2vsRGSYos5bz
	 pJ6uTa8LlOkeSL0DD1w/aUjGYRV3C+eC1RC88jnu7Kw7/wRJ1ogCRs8yDZyl02ey4O
	 W/kTXfVP+WDwpSeRtt7pe7b3/OQiozCwdJC04keNpwSxSTR5LmhG+Zx/e6ZVvHLP/d
	 WeNHYHHEjqIbr907fUuSyveNyKxjMRsf1ximo6XvyKo/TpXFVLRG1dRP0/N5VzEHr/
	 kzpckwgRSr/OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 317CC81EB7;
	Sat, 13 Dec 2025 18:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1363A117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11FA6402E5
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixwIxOZQjY9C for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB3240291
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB3240291
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B31286DA9; Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 18:51:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bd758209ee909b62ac448b570d8944b0057e518
X-Git-Newrev: 70a689f9dc4a50b2bf909f891a1c9220cb5da920
X-Patchwork-Hint: ignore
Message-Id: <20251213180108.0B31286DA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: add an option to build
 and install drill
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
Content-Type: multipart/mixed; boundary="===============1801431263741244639=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1801431263741244639==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=70a689f9dc4a50b2bf909f891a1c9220cb5da920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libldns library also comes with a CLI tool named drill, allowing to
perform DNS requests. Drill build is currently disabled by default.

Add a KConfig option to allow building and installing drill tool. Set
the default value to n to preserve the current behavior. Similarly to
linktest (see the comment in the .mk), drill fails to build correctly as
a static binary, so make the new option depend on non-static build.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libldns/Config.in  | 13 +++++++++++++
 package/libldns/libldns.mk |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/libldns/Config.in b/package/libldns/Config.in
index 696fec97b5..60b149e201 100644
--- a/package/libldns/Config.in
+++ b/package/libldns/Config.in
@@ -8,3 +8,16 @@ config BR2_PACKAGE_LIBLDNS
 	  experimental software for current Internet Drafts.
 
 	  http://www.nlnetlabs.nl/projects/ldns
+
+if BR2_PACKAGE_LIBLDNS
+
+config BR2_PACKAGE_LIBLDNS_DRILL
+	bool "drill binary"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Install the drill binary
+
+comment "drill needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif # BR2_PACKAGE_LIBLDNS
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 0740d09fab..6ced75a44f 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -45,4 +45,11 @@ endif
 # interested in the lib target anyway
 LIBLDNS_MAKE_OPTS = lib
 
+ifeq ($(BR2_PACKAGE_LIBLDNS_DRILL),y)
+LIBLDNS_CONF_OPTS += --with-drill
+LIBLDNS_MAKE_OPTS += drill
+else
+LIBLDNS_CONF_OPTS += --without-drill
+endif
+
 $(eval $(autotools-package))

--===============1801431263741244639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1801431263741244639==--
