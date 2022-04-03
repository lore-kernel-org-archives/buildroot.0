Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A68C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C3160C24;
	Sun,  3 Apr 2022 09:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmLeVevS-yTX; Sun,  3 Apr 2022 09:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B3260C20;
	Sun,  3 Apr 2022 09:44:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 960881BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 845C7403AC
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDhJWnv0looX for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:43:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3D5640145
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:43:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E05685F3F; Sun,  3 Apr 2022 09:34:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 09:02:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6ab6120d694c63f2b422d11c25ed0b4d14c7a377
X-Git-Newrev: 99cf9381a0f114994dd068e084108d1d5335a8fe
X-Patchwork-Hint: ignore
Message-Id: <20220403093412.3E05685F3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-treq: bump
 to version 22.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99cf9381a0f114994dd068e084108d1d5335a8fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- hyperlink is a dependency since version 20.4.0 and
  https://github.com/twisted/treq/commit/5475def96f3ec93075ff95709fec4acd154e6fed
- six is not a dependency since version 21.5.0 and
  https://github.com/twisted/treq/commit/22bdb399a03b0eebaa93023b80d348f584f567d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 933447c27c41ebcdb5eb9fa2a374456699ae33f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-treq/Config.in        | 2 +-
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 7c02a35638..5d76a5cdd6 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_PYTHON_TREQ
 	# twisted TLS -> python-{pyopenssl,service-identity}
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
 	help
diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index 288279cbd8..aecf71aad8 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  b75f6c89fd481989a9cfdec8d61a6d84  treq-20.3.0.tar.gz
-sha256  a72d7587d6f81c7a32620b00175825b4334bafbde73d37098d139ac7b11dca98  treq-20.3.0.tar.gz
+md5  43892086d556e7596392134f1e10bdef  treq-22.2.0.tar.gz
+sha256  df757e3f141fc782ede076a604521194ffcb40fa2645cf48e5a37060307f52ec  treq-22.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 320f57b6f2..57dc50ee74 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 20.3.0
+PYTHON_TREQ_VERSION = 22.2.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/98/09/25064d7224efde9fd51e8865353d516c53306e476eab27ab21fb258cf7d4
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
