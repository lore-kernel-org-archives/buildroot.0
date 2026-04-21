Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FAF94CB6
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 23:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 566B160B44;
	Tue, 21 Apr 2026 23:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbnEun6XIzeM; Tue, 21 Apr 2026 23:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6737A6158A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776813177;
	bh=atamfvbvqzMEqQgNru/YfPCiDNpitNy4F45BIXUm54o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H+K8joUwNo7wjv8UEbNV9MUTNoK92Z7mbgZrefJVacwGCAe9QGvKf48bDlDLBEJfG
	 Gbqqozf6B9jjJOehq4BvjmENUjF6WgKXNoPUjj544kB3CPmYQFiv6ZtC9R50fiwjRX
	 XaAas09cbOp1YO97njPCtuIifWiGOeZJ/dglE1kU8gg2M7HWN8fgVJdKf3qEJn60u5
	 F6j8XaLtGhSrzZIQOe0qCsqSJ3ZUIUQJ22DAOq+xg6Oy/Msxdf+z5AoV0ba6xdNmsg
	 oobgQAnGriHnpfC1bsihMw8fYyZRQgUk0lP2m4TChL6H80qegDaEpNq8EBeI40sCWt
	 FOFqYcrVT9GUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6737A6158A;
	Tue, 21 Apr 2026 23:12:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3146224D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17F1441FDC
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IZiniDIGhgm for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BC3B41FE4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BC3B41FE4
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 210F382205; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 00:49:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8de4776c609ec8afe1e603aa1b115d63bd377dbd
X-Git-Newrev: ebf313424c32fe70042d52b0578219c47d1f4c44
X-Patchwork-Hint: ignore
Message-Id: <20260421231251.210F382205@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-magic-wormhole-mailbox-server: bump to version 0.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ebf313424c32fe70042d52b0578219c47d1f4c44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See NEWS:
https://github.com/magic-wormhole/magic-wormhole-mailbox-server/blob/0.6.0/NEWS.md

The upstream source archive name changed (dash '-' changed to
underscore '_'). This commit updates _SOURCE to reflect that change.

This commit also updates _SITE to use a stable URL which will redirect
to the package archive, to reduce future maintenance.

This package has been broken at runtime since Buildroot commit [1]
"package/python-setuptools: bump to version 82.0.0", which removed
the python module 'pkg_resources' which was deprecated. This new
version removes those usage and fixes this issue. Setupuptools is still
erroneously listed as a dependency in the upstream setup.py[2] but is not
actually used anymore at runtime.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13904071794

Note: this commit fixes only the runtime invocation of
wormhole-mailbox, the complete fix for the test_python_magic_wormhole
runtime test also requires the update of
python-magic-wormhole-transit-relay.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/51365ff06379aaf6fcc9a751e8ff32ac694f3e92
[2] https://github.com/magic-wormhole/magic-wormhole-mailbox-server/blob/0.6.0/setup.py#L37

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Marcus: remove python-setuptools select from Config.in]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-magic-wormhole-mailbox-server/Config.in              | 1 -
 .../python-magic-wormhole-mailbox-server.hash                       | 4 ++--
 .../python-magic-wormhole-mailbox-server.mk                         | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index d3b81a46ac..1ebcdb85a4 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	help
 	  This package is the main server that Magic-Wormhole clients
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
index fd02bcc758..d701edfc72 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-mailbox-server/json
-md5  bb9f84e7ecddc43413b4287b7b20d285  magic-wormhole-mailbox-server-0.5.1.tar.gz
-sha256  a007a03672293204657681dbf502045d6d5817c57f9aae2f2226e6ea1a008ca1  magic-wormhole-mailbox-server-0.5.1.tar.gz
+md5  29a3ab90583e6858a74f11c3f485a77c  magic_wormhole_mailbox_server-0.6.0.tar.gz
+sha256  b1bf145f3a26d905ebff6820407976d57614f1ad8b9806210e9c4e36579a1f79  magic_wormhole_mailbox_server-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
index 7525054167..616d72dfbf 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.5.1
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic-wormhole-mailbox-server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/9d/5c/71566147af3f28017035ebe69ce7253ea26917225ae7c39b964578541bff
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.6.0
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic_wormhole_mailbox_server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_mailbox_server
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
