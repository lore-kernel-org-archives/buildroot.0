Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3E5606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GCQydgtB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271B6403C8;
	Sun,  1 Nov 2026 21:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_cD2gEX0v1H; Sun,  1 Nov 2026 21:29:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2BA44403FC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793568540;
	b=p5AdUfG5IWKzboBp4WRsI8Lw+eiP0QECpvupSNiKSTXgO7oZSRHwy7XepsGOPSBeRMik
	 khhqAU/QETjmPnL+Ibw/lLa+jba4N5zUmvg/eedE4lhQCRv0PFfJq/luUNvGDViTDgOpG
	 dRm3DebluPOb49Yn3Tqy3gL1O3iU64GnEIcekz/ECRm0ZvelraanTjWueQHdrvgLvdsFo
	 Yc8lpsCHG09lPbxRODIbReA5xs5wQ8RK/msCuR0R/im6C+8PnPAGLQ8EkgMjL2IdcurHx
	 q1FxMXK5yzHgxhV02WAzrG2Ql1y0M5WAPwkadOAfQClOWAbIelhkhqAK9GCts/zYKhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793568540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QA9dzqiqpfeDSpRs+GNQB+zeJh2qJ4VBkg0drroeLGc=;
	b=rCJZ7odyvd4DZDni1Pma+N/MdiMA4s3zNv8P5IWp+PGZIW+q5TmS8ongYMmvgm0l16Dh
	 EyuZbpDH4hkM2Y8exsDbDCMWpRe4c6yr2lMwivQ5mMBDnjcdGuEkqToyB9ahiCvW9Hrh+
	 Iqev+ncX4dirSNRf5NKK+ZMY/RZ4H17Ae+xE4Q674Zp2d5g8sBYeZwmuVoq9/fzsZFg8q
	 EFU6ouXH3kLYOZHSvtpWk3/L4bZRuqeM3SOOPYXHIZVrpc7/WK7pKmXIOKhRAF5pkw2X1
	 cPamT1qnIIPX3ddW+vqBAgmiwNaj2U+pl9bRRpgLRlr/tAmZJMXtgvqrSGIB7WczRJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793568540;
	bh=QA9dzqiqpfeDSpRs+GNQB+zeJh2qJ4VBkg0drroeLGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GCQydgtBiPtbQsGDlojkwyIUPyvPZ7Wh22qjLNWUwyfra9P/YE0fmk7cFwUqbbexQ
	 rmy149J0rNfT/onrpzWNKbAi/a7OoWcHFiVYkV9BOUWLVKWQPnN8Li6Il+Ia+sWTiC
	 +xDQWpJ0HXHuDX5NBZXDlu/V5ojS8wlvNClm/R1N81DTnmxBlWJfbBrcOmuFZs/z79
	 /2WDz1yLQFDe23S3ZgovHPBG/pQKRBNch73GTRq+vmkytoodNPa/VUAhhzrlnKpWwB
	 wtVhF+KfQTrLZuOpPO/V6b2AnwV3HjPWaQ7f8D3heuQg1Z1HGy+fV9hRfVw+uj6pBX
	 DZ5yHsi58mLlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BA44403FC;
	Sun,  1 Nov 2026 21:29:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE93356
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 595FF40079
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RD23guNMV-TZ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A546040042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793568537;
 b=f++XKTa7G3ggRYPJSqjqcSzwPl/MdSTGRkKyzIqUFXIcBQLDkkck/3S60W/ZP896hrpa
 zgSJw21HvxNyHgJfr1zIYkX8SnNdSTHo40JP9ffx86sf7QJHchzTXVoaTbbN2qIdRY1gA
 ROzkOQX6XuZRgY8Ytp/sn9igGe7tufB+1/MSnRryytVtZi32MZHbhhnYqdiDKrlO/qUrx
 XyWPEKTuRLT/sRIvGpDB7wYIkPb61oB5m22/kfA8VpRwndBD9/y9B0Pa83Nfvo/YJNrvt
 N0d+cx8QTypaSdQ40asR2TyDbcWvnIsLF8lRZ60K0SCr76BrS9MwDUJj7Irf0QHq7nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793568537;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oi3vaq6dahHUaRbTNzlLDO/KzrL5+sWMvqqXZDf1BFI=;
 b=ec+ixtKsJqJYGgSo0YWLDTH8UV70Hm+P64JSJ3rCWRkj+MqqOG551mmUDurYVbuLuny5
 CeYtQM5bNpMF9Ek9FLVzni9ObUvE50MtU9QOchXYV9aeTHGbhAhk/P5F1amjDf1W8kA2s
 SdsXSgz+rBZt1yagg/7XhVxfCpeTxV/alHJOzwHZ771/cnHiQ4Eb3OO5N3bgk906Xbq0k
 p33t1PLjRP3dTzmEBPWBAOwq7RoqHgcgrlo7lcaynJRm5Pqtx58eoQlCx21B/jn0oWv2d
 ADb32WtxZjXSdO5w4+UiG0OhEYCT5zOkIo8iIDXkCVUXQX20OGYLz2q9UwVokzZh8yA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A546040042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47F2D9D597; Sun,  1 Nov 2026 21:27:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 22:24:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cdba015059d215158b2d9a37078f78a4bd19381
X-Git-Newrev: 16f3674cc7b29c1a24e89ad74aa4a95ca7991335
X-Patchwork-Hint: ignore
Message-Id: <20261101212728.47F2D9D597@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uthash: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16f3674cc7b29c1a24e89ad74aa4a95ca7991335
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

uthash is a set of C macros implementing hash tables, linked lists,
dynamic arrays and other data structures, provided as headers only.

It is needed by falcosecurity-libs, which otherwise downloads uthash.h
at build time.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/uthash/Config.in   |  8 ++++++++
 package/uthash/uthash.hash |  3 +++
 package/uthash/uthash.mk   | 19 +++++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 02834f1438..1b9dd41f01 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -261,6 +261,7 @@ F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
+F:	package/uthash/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/package/Config.in b/package/Config.in
index 933b072ae0..32fc1496c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2323,6 +2323,7 @@ endif
 	source "package/tllist/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/uthash/Config.in"
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
diff --git a/package/uthash/Config.in b/package/uthash/Config.in
new file mode 100644
index 0000000000..e19c277abd
--- /dev/null
+++ b/package/uthash/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UTHASH
+	bool "uthash"
+	help
+	  uthash is a set of C macros implementing hash tables, linked
+	  lists, dynamic arrays and other data structures, provided as
+	  headers only.
+
+	  https://troydhanson.github.io/uthash/
diff --git a/package/uthash/uthash.hash b/package/uthash/uthash.hash
new file mode 100644
index 0000000000..37a5a66aba
--- /dev/null
+++ b/package/uthash/uthash.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  387ba027946d7c64e9aa19cc53b2edcd714f8f9dca9fa8e3aaef17e0e8e3d736  uthash-2.4.0.tar.gz
+sha256  40f48f89e1d0095bf1c5fb4d00affd74959c3ff77463b672cf7fac547d1d6465  LICENSE
diff --git a/package/uthash/uthash.mk b/package/uthash/uthash.mk
new file mode 100644
index 0000000000..2107a90d56
--- /dev/null
+++ b/package/uthash/uthash.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# uthash
+#
+################################################################################
+
+UTHASH_VERSION = 2.4.0
+UTHASH_SITE = $(call github,troydhanson,uthash,v$(UTHASH_VERSION))
+UTHASH_LICENSE = BSD-1-Clause
+UTHASH_LICENSE_FILES = LICENSE
+UTHASH_INSTALL_STAGING = YES
+UTHASH_INSTALL_TARGET = NO
+
+define UTHASH_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 $(@D)/src/*.h $(STAGING_DIR)/usr/include
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
