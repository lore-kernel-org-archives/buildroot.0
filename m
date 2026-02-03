Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EB2E8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 647FB608FD;
	Tue,  3 Feb 2026 21:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihH-KlRnd0my; Tue,  3 Feb 2026 21:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E5560901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770155784;
	bh=/VOCWgc1jIEkbku1R2auqlE8MWHqapUkAdu0vvwVu74=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EoQp4qH9AZn7QYHhqoCYe0D2jFoH59cnYEZgLkRhQ4+F4pGEUL8aUEHkZyhPzl2lF
	 NyKH9TFeorIqOn51r03PEApyNGXhlczre0BypoTKX/34t4okam2iRD96c856qMQF/M
	 np9SMcyIh5nigBTaFkOOXGmfnf4/JSoFl7FkEm/qAH1j78n7iA4eVYLswx69JjQu0I
	 oXDe/qGmf76wqeJPrXT/Luexznlt+OriDKd/1OWlz6J/exbaEl+1hxCy9197mx5Q+Z
	 wmpe1CKwfzt5it/iMdZ/q3rdlmNueDjsT9E2jDFaJw4ArurSIHD6huQfwDtoS/wjl5
	 VE3tXcJoA1qdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E5560901;
	Tue,  3 Feb 2026 21:56:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 913381A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7404340185
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMGZvshPiTg1 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E43E40081
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E43E40081
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:56:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 409BE86769; Tue,  3 Feb 2026 21:56:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 22:53:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 130b5a124cd992f9bedd190b3d3b0c6e1033454a
X-Git-Newrev: 7aa2c23f42d4a4ce5086a12f28f54c99aaa5701a
X-Patchwork-Hint: ignore
Message-Id: <20260203215621.409BE86769@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: make crypto
 library optional
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7aa2c23f42d4a4ce5086a12f28f54c99aaa5701a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The network-manager package currently pulls in either gnutls or libnss,
neither of which are very common and it might be the only reason why
they are present on a system.

However, most of NetworkManager works just fine without any cryptography
support, it only seems to be used in test cases and 802.1X support code.

Remove the dependency but use a library if it is present.

Note that this changes the default behavior. If network-manager was the
only package pulling in gnutls, it won't do this anymore and use the
"null" backend. Add a note about this to the manual.

Signed-off-by: Florian Larysch <fl@n621.de>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Marcus: Change buildroot version to 2026.02 in migrating.adoc]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 docs/manual/migrating.adoc                 | 5 +++++
 package/network-manager/Config.in          | 1 -
 package/network-manager/network-manager.mk | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index eabaaa80a7..d8d86d8945 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -242,3 +242,8 @@ If you want to provide such libraries either:
 - Serve it by adding the library to your overlay.
 - Install the libraries from your project with NPM and bundle with a JavaScript
   bundler.
+
+In 2026.02, the network-manager package stopped selecting the gnutls package as
+a cryptography backend automatically. Manually enable the gnutls or libnss
+package if you require features that depend on a cryptography backend, such as
+certificate-based authentication.
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index b388c573fe..c3d9f7b655 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNDP
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1bec053c54..faf162f6f3 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -80,9 +80,11 @@ endif
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 NETWORK_MANAGER_DEPENDENCIES += libnss
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
-else
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 NETWORK_MANAGER_DEPENDENCIES += gnutls
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
+else
+NETWORK_MANAGER_CONF_OPTS += -Dcrypto=null
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
