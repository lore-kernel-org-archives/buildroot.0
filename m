Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D3EC61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB3B605ED;
	Sat, 29 Aug 2026 21:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7MYiLfi3VrM; Sat, 29 Aug 2026 21:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788037558;
	bh=BYzg6qgsHJ4lA5PIG5r4ovfM08VpDbLmkLUhKQ8Md30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H4lX1xtiXaYcKzwd9XnEOuLtJ+Ya6IhRpiCAuzT6gZvhA82fvYdIkc7DBE23XyMV/
	 NqqYNC1EAmB8J+u1It4OywOMRvEKlgW3NoGGZUCtJ3tfAPlJeCoAMRwjsaJ6aQe1Sg
	 aQTzalzQoJ3Wh1uf1u0hAw5ldtdxiEL0pVpU7O5zwDJP1isdMnfVEjKVMR/EXlV8Uw
	 rlnBj0ZZIBVFCw+TlBPkHlO+Sn7qT56a++vJpbxSg3pKF4uuyOkzGTLdoeo5adj8dM
	 5YBl3+jT2smtzypuDT4gx6iFFaDORs4swzi2ZplADB2SeOTxV1iD1y8WG0w+cjht/I
	 QEclOXwKc5wuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E350605EE;
	Sat, 29 Aug 2026 21:05:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50CD9118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A1F780DF9
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IB0KdciyglI3 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 992D380DF6
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:05:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB9138E4A4; Sat, 29 Aug 2026 21:04:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:05:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f48ae8880554fbd433b27dd3c585ad9585eddbfb
X-Git-Newrev: 2c36fe80fe2fc3352b0ade2fa9c19fd190bea9b9
X-Patchwork-Hint: ignore
Message-Id: <20260829210457.EB9138E4A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5: relax openssl
 constraint to allow compatible implementations
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6359321956283889702=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6359321956283889702==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2c36fe80fe2fc3352b0ade2fa9c19fd190bea9b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Qt5 can be built with or without openssl support. Following some build
failures, commit a94d39d693d8 ("package/qt5: fix build failure due to
libressl use") enforced libopenssl as the only valid implementation for
Qt5 openssl support.

While this solution is fine to filter between the two openssl variants
officially supported by Buildroot, it prevents users bringing their own
OpenSSL implementations (through the virtual package mechanism) from
building Qt5 with openssl support, even if the custom implementation
matches the expected OpenSSL API.

Allow compatible external implementations to be provided for Qt5 openssl
support. Relax the constraint by partially reverting a94d39d693d8 and
checking that the selected openssl implementation isn't libressl. It
then becomes up to users to ensure that the implementation they are
providing is fully compatible with libopenssl's. Some qt5
sub-packages enforce BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, they don't
need any update as it does not really strictly select libopenssl, it
rather prevents libressl, so it still allows custom providers.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 159d411de8..3e54465ed7 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -230,8 +230,16 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBOPENSSL),-openssl,-no-openssl)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBOPENSSL),openssl)
+# Qt5 officially only supports OpenSSL. Users can also provide their own
+# OpenSSL variant through the virtual package mechanism, but it is then up
+# to them to ensure that the provided API is exactly compatible with the
+# libopenssl one
+ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_PACKAGE_LIBRESSL),y:)
+QT5BASE_CONFIGURE_OPTS += -openssl
+QT5BASE_DEPENDENCIES   += openssl
+else
+QT5BASE_CONFIGURE_OPTS += -no-openssl
+endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)

--===============6359321956283889702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6359321956283889702==--
