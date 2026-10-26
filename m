Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2635606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=migPi6f7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C24A6809C0;
	Mon, 26 Oct 2026 21:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go260tG60jVh; Mon, 26 Oct 2026 21:33:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C92148097A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793050424;
	b=Ez7LgUtQbTIsSMggRtbBv6dhvhDdvZej1qVArChfpBZ+OWhQiGGovVoxq8KpG5Bd81K+
	 u9AAPcFZSko21nnJIFDdI6bKpU7gbUj8yJnsPn2xS5S/jH58NkdnLiiB+oRnRDYGD8ROY
	 c51Y//LYMV6KyrmJI2C/XQrELDdr6MEvD69afhmtl6yTygFUA3vrL59ruFEWbCDLvwMy9
	 33iMULHB0tCqNqvuiZpZ66r82guY7TdbeK2DfDzq9qzqaCeCFn4eTsYpR0Y/AM7R8b+8F
	 ZvN/K6OEAawLbs/rBDL83j0DZwMnUpF3bjYFUmZpCMD7r7AyV9eI5tqkDoie/kkPwIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793050424;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ve3RirlizZlatmqdhX2nmkY+qNtj25V5OmxxE2P/U+E=;
	b=UvN4R3U5SXbHzD1+d+RnkfU2JfL/mEhUBOtW0oiasWxX2CamnxHyVRAvrOxFiAbbTvFy
	 hHmcHQHwaJqHTf/TqtiniVUKFQnJSYJILeiJUCZzC5jcZr7C9bW+Hv/dM1Xi5M+5rvCnF
	 DgtQlWOZuQfr6D4CZGqEgzgmOqK3oiBfdt9c9SWjzEmiuLV67QZzI4pRMYVAbsgGsOaQq
	 3PZiDKdeFnyrPUVlfuyTirNyOAkSf9woLnuDkQvT6gAsqaSh7ILeLmuIhLnOTE82D9dAs
	 yF/smg89/+xFCW7eK2pTiYSt/PXknRwNx64U70AQZXISS7l3e+AA79DXp1IbZRvhAdw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793050424;
	bh=Ve3RirlizZlatmqdhX2nmkY+qNtj25V5OmxxE2P/U+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=migPi6f7Lw84zjrOeC0SGoVeSK3F6rmkN5hy2eSqIuVZnFU80KZHOBoScbUYaaWW+
	 rBLXFqCBuLbLpk8tDNAeoI6aac3kn+Egn646mPVVvWg8N/6HtXRtHTF8tkD50C9QSS
	 hD/Sd5duTujDrAWHj+06z39QQsOGWhl2ima03zTdscYowrI4Tu4fze4laszqZ88OAv
	 JaNiZIW5oNL29sjeheD/iMJwLM4qj2vucMHmG3D7UG/H5sVuHpCYYvYQeniiEAd9eu
	 GpTUTq17Blxm9s86xjyOS0ef0RgHu62bsQovyKZelckGYt678sjNMwkaDz22qKaQIp
	 iQkc+9nXmJ+sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92148097A;
	Mon, 26 Oct 2026 21:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA31D3421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C01DC40603
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mr2rQ1EA-Wm2 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 11C8E40604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793050422;
 b=OYJIPCMYsY4RLKvHHjx+v9DBP5KPQsWSggtzi6D0iloQLyhjMuMdGSRZRBU3yw4OdazO
 1X8VRpVXZ2uET8Hn1yaCHii171GLMfwJAimPFF9vf8L0Ir2SQJ9HxNg6uQnUHSjRGrGUu
 bRcFFJbg5rZDlYlV7ZnLngeBrWT/+8MMdzV4nJHBReNi4udyuEeG8e1zWee1YLsgAHLC1
 bTmu0F5QV7Tw+MnCRE9ilVN3hSQvSL+Gk4LAUh+3H0UbKOX+RyrUAKzFDFS5x9rGJZuO4
 QMtIXWgiLUihNs1evNPqh7iOAQbh4I8RJkzTG4djpfcGERN8uafMcJSD57PA7IN9zKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793050422;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7VaoFuzDHUcdIqCxCRJfLVzgCgE+KTEauIqRuNZZhBg=;
 b=HMRE0Xerrcp4swpnlO76QbSMR99NBE4CinFKosDT/zmG1ToWyo8Sh7SzsqjsopukqQ/5
 /Jf3wh171G7WPuVflGsbqRpODEnObgcpHxyfVI9l00mJg0GQX8dngZ2j+/qWwHAUIS2Lt
 BluNAfK3KKo40iKLxbSTim7zRFiJ30Kj5CTkXG3mL+epv/kXtR3xLhCCzX4wuR7tTiiGM
 flukBf0iPlPz49cFCMHTn4XLvOxwcyve1Ly7yekFGmL3OHqFTUkiAdzzUIaov4H8GMHtu
 LBAs1306TFc5COR3xTsfM/ydbBpTPSvSn1CXJS9XWEPyXkwM3jhXUagA5c3kbpeQtjQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C8E40604
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E437D9D010; Mon, 26 Oct 2026 21:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 22:33:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 562171bf85606c6f9bc552073695fa7ed910aabe
X-Git-Newrev: ffa18619fb2ed5820c1e89828fb5eac41cbe114f
X-Patchwork-Hint: ignore
Message-Id: <20261026213215.E437D9D010@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: make binman dependency on
 host-python-pkg-resources optional
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffa18619fb2ed5820c1e89828fb5eac41cbe114f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Binman needs pkg_resources only in U-Boot versions before 2025.10,
otherwise the dependency is unnecessary and best avoided.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 13 +++++++++++++
 boot/uboot/uboot.mk  |  4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 381a12197d..ad3efaf4be 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -379,6 +379,19 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 
 	  https://docs.u-boot.org/en/v2026.10/develop/package/binman.html
 
+if BR2_TARGET_UBOOT_USE_BINMAN
+
+config BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES
+	bool "binman needs host-python-pkg-resources"
+	help
+	  In U-Boot versions before 2025.10 binman uses the Python
+	  module pkg_resources, which used to be provided by
+	  python-setuptools before version 82.0.0. Select this option
+	  to use backported pkg_resources when building old U-Boot
+	  versions.
+
+endif
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a7e831f6c3..ba6f608751 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -312,10 +312,12 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+ifeq ($(BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES),y)
+UBOOT_DEPENDENCIES += host-python-pkg-resources
+endif
 endif
 
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
