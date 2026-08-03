Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30ECC55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724D440558;
	Mon,  3 Aug 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CF3IhhmrbYba; Mon,  3 Aug 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99F93405D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785726;
	bh=b7wp55eWumLoCkzJhKWEE5bSE3na1Q8LT+t88R+Gt+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FpxINmy41ouEdf/6ReSFxgbrKgQeFYBqf6MJ+aqFkaKPnJuL8nscWY2yo7OhKSaLu
	 Xi+Vk0r18iaDwuXup+lHLFVtU+pJ3rELnuSgrprYyL81X3ymG3Fi7KkQ5kLnzKgO/g
	 Ekm3x5SiH767WKeYCVU/7DflV2G0Opgh08Ddbw+dXJurAR/yP+iuzlJTzqhK3Wt/FC
	 xNWTMIq6e01H79EuyEABmbe9m7iu3zclXqf7yEpb8fMVd+3RPyxgKdF526XjwH8pxw
	 a7dUy+iTWQLCWr8fccCfD5Ah5bbh5rk5g9QuweIfEo0cXS2h9k2qeq/qnL9NmXUcQC
	 YOIJBv7zgKcAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F93405D3;
	Mon,  3 Aug 2026 19:35:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1828E2DE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B1580BAA
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ilf93dt5s0l for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4D180B5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C4D180B5C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73C908B856; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3ff7a6f0204a2ec92a0666485c9f4f5d0d066bf
X-Git-Newrev: ce991648466d4de2704ea02286a01f9d5aed4f64
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.73C908B856@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbe: new host package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce991648466d4de2704ea02286a01f9d5aed4f64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS           |  1 +
 package/qbe/qbe.hash |  5 +++++
 package/qbe/qbe.mk   | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d78e08bdb4..f2d999bbd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1186,6 +1186,7 @@ F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
 F:	package/janet/
+F:	package/qbe/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/linenoise/
diff --git a/package/qbe/qbe.hash b/package/qbe/qbe.hash
new file mode 100644
index 0000000000..2250c493af
--- /dev/null
+++ b/package/qbe/qbe.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://c9x.me/compile/releases.html
+sha256  a6d50eb952525a234bf76ba151861f73b7a382ac952d985f2b9af1df5368225d  qbe-1.2.tar.xz
+
+# Locally computed
+sha256  2b026a9038be00b1102da922775ffea4857ea755f63694efc36dcbcbdebf23d6  LICENSE
diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
new file mode 100644
index 0000000000..04391d739b
--- /dev/null
+++ b/package/qbe/qbe.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qbe
+#
+################################################################################
+
+QBE_VERSION = 1.2
+QBE_SITE = https://c9x.me/compile/release
+QBE_SOURCE = qbe-$(QBE_VERSION).tar.xz
+QBE_LICENSE = MIT
+QBE_LICENSE_FILES = LICENSE
+
+define HOST_QBE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_QBE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
