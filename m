Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC37CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE5580D2C;
	Mon, 12 Oct 2026 10:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skFQnaALDqpi; Mon, 12 Oct 2026 10:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E645A80D29
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791800544;
	b=gxTlhsZNaKMzlN149Eu+vgy+jcDlnhtCxJrBlcytekWqwCBRpm1XDT2IHI4inm4mHhPm
	 rnh2RFeT/zS0vLQUXyB2mng26PkT0zIT59FKFww67FPJThHkleUGsSTg7OZZoMGbu/GKm
	 juctBvmWwZ6P3nO8Z1vYR5DhTydoiGXm182WZrYaEhjLEFCVULPhiknG4rojZxAyo1Woh
	 vIJfAq6BRG9BEY66/FrQ/2SHz4XXcb2VFQBbuinV32b9VW7N5/nM9acpVvYmyMyNAAjmH
	 nAC8hBAOIbV37mYyT4KL2UyvjXENW0h/tGOfTqrySNYHNQv4DU9XkQqP5dcFxRtOj+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791800544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DwCZzxpDpSwepzSEGX4ObIwpk7v1ZRj/4Uxh1CHIO/M=;
	b=BShzBU621PkkAP9lGfbkwMXg85AJtIZ02bZdXSm1vhlF+MzsE4F2HfNU7TyFCMq+BfIo
	 oSXxvGNvwTFYU3Jy749zRra/Gg9OO0YumwviDd19FHVoK/sh30K8BRy1Zh+ctxz8EoenZ
	 P9brv+zXmX69SPJqSnEXbvdrqiR6qWkuwnSx2439H9KJSykDndofQTEAsRYbSmWftIQMh
	 08KhCraaax8YmXdQLuza4yPaMmG6V8XVKcgg44b1n84L+tLCHDEIZjAAaY/78+LHqt0xS
	 8S82GqPbFF15zDhyRS5TWRyP0COb0UJMe0CG/hLciCqzAv8PeX9vyCr3EJfgcvAMd1w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791800544;
	bh=DwCZzxpDpSwepzSEGX4ObIwpk7v1ZRj/4Uxh1CHIO/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vg6C/Z3lxLPWLt6wroVsLk3Mn+AiS6QwIGjuOxjQzuhw8YKzj/8ykCV1dDdIFZ2kC
	 4NYycJ5g9fijuiFHYY2XoGfNAN0qwynl5SYEQxVwprQ0785xK6cIboiVnRqVLANBDI
	 T9XZF0RnX2BLmepm3NOJfejq0RvI81WJPFq2JCpS7c2GeCjAw51YtQWsM2atTJv1nx
	 WwUxR0BoqeZ9KsiEGR6KMicRMwuotlBxRuKxLQ1hTtY6DcVHTEAbw0bbVP7I4smJ9r
	 qnPX9goFI9V/kItKPqWFZnHWxS4bvuTbjF71AHNczO/jWZgH/DuLu0gRALGsTb78pO
	 ik++ZebNdZ3dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E645A80D29;
	Mon, 12 Oct 2026 10:22:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 482E975
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E644605F7
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQc-Nu_nspJE for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 36C73605E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791800534;
 b=VbJ6LrBWdXwy3ydvF+Ud+Zw08sn/e3Jt8wlv62EJf6C1+VjG78ATAQflM5Sq8W2y3MKE
 8W9qpJfssVfvgxvXuT3g97Nf1AO5oXoWWg1dt71xxpCANfPbo9PqJ0koZz5VpS7S2ropV
 mY05eH/98p+KZuV+a3n8MknUlex1KHjhc5sZaRa2FF8UFnGiG3H0vIudzvTgmUmOI36KY
 ZkwgPe9XWrjEqG7zT2QC7Yp87jAcaaYga3MxybRghMLEqDF+pHhk/ci0bFjoH0oC9fXyC
 6ya6D4qlLh8CUG8sa5L7cPSvSKqPmAyPz40h2x1lP0PwYRrh3AnV10Cgwfr3lp5y5tQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791800534;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2X+o7J731ueI86VuSkS8sejxB3ZdBSbOE8NNnT6J5Rg=;
 b=PXchgACQ4IgBdLcMmUXKggbKRwKVZkUytW6HJS3YLbu1sFnFjAU3Cj5Fn+9ExWEvZ8ED
 txOITd0g/9zQqxE30sPT7eHfI2Qy1UOw9xnnyY0jcVACXE0cOTJhtJQaQgtT/pTnDS2j1
 P/pQpOo3kMzoQHYRiAa41OohLqZd2JLeZ+BAfN9LwZB9eZgOe00dJJvRzaz6p0ZmzJMH6
 GMS4EnO1bOGxz3dNP0mK2L2ciRf3Fma7cddZ95oiU//prZd/P213RoGrDoODdDxSfXR28
 F9e4XCgYNL7fhBZl95A/I5q750QXqdG/fJmCqW5sFqKBmvTA0da9ltVjmKRUdpnyEdQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36C73605E4
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21FC69348F; Mon, 12 Oct 2026 10:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Oct 2026 12:18:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f975c3f20b1f4bcab5c3e3c836b8dd38cf036a2
X-Git-Newrev: d759d9cd485c9983f8fd9a33ce34b16f9b392950
X-Patchwork-Hint: ignore
Message-Id: <20261012102055.21FC69348F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-qmake: support Qt6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d759d9cd485c9983f8fd9a33ce34b16f9b392950
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The qmake infrastructure hardcodes qt5base as the Qt provider. Select
the Qt major version from BR2_PACKAGE_QT5, which is mutually exclusive
with BR2_PACKAGE_QT6, and use it to pick the qt<N>base dependency, the
QT<N>_QMAKE command and the QT<N>_QT_CONF_FIXUP hook.

The header sync hook now takes the version from QT<N>_VERSION_MAJOR and
QT<N>_VERSION instead of hardcoding 5.15.

Document in the manual which Qt base package is added to the dependencies.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Arnout: write pkg-qmake with explicitly QT_XXX helper variables]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/manual/adding-packages-qmake.adoc |  4 ++++
 package/pkg-qmake.mk                   | 25 ++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-qmake.adoc b/docs/manual/adding-packages-qmake.adoc
index e09da166b9..1d97556abe 100644
--- a/docs/manual/adding-packages-qmake.adoc
+++ b/docs/manual/adding-packages-qmake.adoc
@@ -55,6 +55,10 @@ All the package metadata information variables that exist in the
 xref:generic-package-reference[generic package infrastructure] also
 exist in the QMake infrastructure.
 
+The Qt base package the package is built against, +qt5base+ or
++qt6base+, is automatically added to its dependencies, depending on
+whether +BR2_PACKAGE_QT5+ or +BR2_PACKAGE_QT6+ is enabled.
+
 A few additional variables, specific to the QMake infrastructure, can
 also be defined.
 
diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index ccf78692e8..eda9e6c1fe 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -20,11 +20,26 @@
 #
 ################################################################################
 
+# Qt5 and Qt6 are mutually exclusive
+ifeq ($(BR2_PACKAGE_QT5),y)
+QT_VERSION_MAJOR = $(QT5_VERSION_MAJOR)
+QT_VERSION = $(QT5_VERSION)
+QT_BASE = qt5base
+QT_QMAKE = $(QT5_QMAKE)
+QT_CONF_FIXUP = QT5_QT_CONF_FIXUP
+else
+QT_VERSION_MAJOR = $(QT6_VERSION_MAJOR)
+QT_VERSION = $(QT6_VERSION)
+QT_BASE = qt6base
+QT_QMAKE = $(QT6_QMAKE)
+QT_CONF_FIXUP = QT6_QT_CONF_FIXUP
+endif
+
 #
 # Hook to sync Qt headers
 #
 define QT_HEADERS_SYNC_HOOK
-	sed -e '/^MODULE_VERSION/s/5\.15\.[3456789]/$(QT5_VERSION)/' -i \
+	sed -e '/^MODULE_VERSION/s/$(subst .,\.,$(QT_VERSION_MAJOR))\.[0-9]*/$(QT_VERSION)/' -i \
 		$($(PKG)_BUILDDIR)/.qmake.conf
 	touch $($(PKG)_BUILDDIR)/.git
 endef
@@ -45,15 +60,15 @@ define inner-qmake-package
 $(2)_INSTALL_STAGING_OPTS	?= install
 $(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
 
-ifneq ($(1),qt5base)
-$(2)_DEPENDENCIES 		+= qt5base
+ifneq ($(1),$(QT_BASE))
+$(2)_DEPENDENCIES 		+= $(QT_BASE)
 endif
 
 ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
 $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
 endif
 
-$(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
+$(2)_POST_PREPARE_HOOKS += $(QT_CONF_FIXUP)
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -62,7 +77,7 @@ $(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
 	cd $$($(2)_BUILDDIR) && \
-	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
+	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT_QMAKE) $$($(2)_CONF_OPTS)
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
