Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF93C55196
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AF0F606B4;
	Mon,  3 Aug 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5SL49S1kKqj; Mon,  3 Aug 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 788666069D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785728;
	bh=im1GjCpV4VuWDfcJwuO7Hzo7ZKWRizJpeX9TUmE7MRQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U454GEUmx4MUliwEk2ceq6dudX+EWKzOJbEqzg/1niaRUbYnOMMV3wKEshYERcWCr
	 8kNjezrnpa0EDtTnQEMlc66A+rPTer0QAhdHyRz4tTmIqORmQnmmNyeRoGKt9TIOco
	 RzAmBFm8fzMU91eVM1Rcib8dtU5GbZoXq9KIke6JxOhr2JZjf+hX2TgCHrvE2lHA3f
	 6fhO1XvsMoCOqVuoepvXvzAplVQD0ZWDHIXpXufYlEW+P53xbo1vbb1bPgDhpvXv9f
	 4MS+S7tBLztAnKo5LHZVkbhaQuURjU3P0fE64ByK73vXBIW1B1mq9/3QznJXRrefVn
	 n0JitNlDDjQFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 788666069D;
	Mon,  3 Aug 2026 19:35:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 393C62DE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D94C405D3
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcxSsMMfZDvj for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A3A40558
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A3A40558
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 896A88B858; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfba7bc570a02f4a27f1589532fdcc6b44cf7c98
X-Git-Newrev: 287454a4e2b525dd76b16f3c6ed60a5dedd17dab
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.896A88B858@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harec: new host package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/287454a4e2b525dd76b16f3c6ed60a5dedd17dab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS               |  1 +
 package/harec/harec.hash |  3 +++
 package/harec/harec.mk   | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d9b2715f22..e7e01f3c7f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1185,6 +1185,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/harec/
 F:	package/janet/
 F:	package/qbe/
 F:	package/libtomcrypt/
diff --git a/package/harec/harec.hash b/package/harec/harec.hash
new file mode 100644
index 0000000000..0c3679bfcc
--- /dev/null
+++ b/package/harec/harec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5581bc16dcf22969c7d33b0f2a9535ba37d4cf1bb39dec252e98ff2781175629  0.26.0.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/harec/harec.mk b/package/harec/harec.mk
new file mode 100644
index 0000000000..d439eb3f54
--- /dev/null
+++ b/package/harec/harec.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# harec
+#
+################################################################################
+
+HAREC_VERSION = 0.26.0
+HAREC_SITE = https://git.sr.ht/~sircmpwn/harec/archive
+HAREC_SOURCE = $(HAREC_VERSION).tar.gz
+HAREC_LICENSE = GPL-3.0
+HAREC_LICENSE_FILES = COPYING
+
+define HOST_HAREC_CONFIGURE_CMDS
+	cp $(@D)/configs/linux.mk $(@D)/config.mk
+endef
+
+define HOST_HAREC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) ARCH=$(HOSTARCH) all
+endef
+
+define HOST_HAREC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
