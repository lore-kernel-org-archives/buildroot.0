Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0E4C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A9A483DCC;
	Fri,  4 Jul 2025 06:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWT5EpC8ka24; Fri,  4 Jul 2025 06:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A7483D7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A7483D7B;
	Fri,  4 Jul 2025 06:24:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 017671EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 981EC60B13
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xJNWG_80jbf for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D54FA60B65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D54FA60B65
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D37DE85E0B; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:57:30 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 67463373b8bce9a8b49b5bccf8a26cc4e5651176
X-Git-Newrev: fdd08f7308d4e94bb6fa99841d8f5eed90307b2d
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.D37DE85E0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gumbo-parser:
 update upstream repository
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6673389951442274325=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6673389951442274325==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fdd08f7308d4e94bb6fa99841d8f5eed90307b2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Development on Google's GitHub repository has stopped a long time ago.
A fork exists on Codeberg, and multiple distributions (Fedora, Arch
Linux, ...) are already using it (see [1]).

Update the source URL to use the new upstream location.

The new upstream has a different hash for the 0.10.1 tarball, so
update it as well.

[1]: https://repology.org/project/gumbo-parser/versions

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1e106d8412e35b26a7cfa5c76a264cd8ef9cb325)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gumbo-parser/Config.in         | 2 +-
 package/gumbo-parser/gumbo-parser.hash | 2 +-
 package/gumbo-parser/gumbo-parser.mk   | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gumbo-parser/Config.in b/package/gumbo-parser/Config.in
index 04bb2294bb..7ebc439413 100644
--- a/package/gumbo-parser/Config.in
+++ b/package/gumbo-parser/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_GUMBO_PARSER
 	  other tools and libraries such as linters, validators,
 	  templating languages, and refactoring and analysis tools.
 
-	  https://github.com/google/gumbo-parser
+	  https://codeberg.org/gumbo-parser/gumbo-parser/
diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
index c4af33072c..ee41f167a7 100644
--- a/package/gumbo-parser/gumbo-parser.hash
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  28463053d44a5dfbc4b77bcf49c8cee119338ffa636cc17fc3378421d714efad  gumbo-parser-0.10.1.tar.gz
+sha256  d4fd158d998ab8302fa23bb01119b434bbfaf7139b59f9c74530a703176cb213  v0.10.1.tar.gz
 
 # Hash for license files:
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index 8c9330ae70..76fcc876c5 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GUMBO_PARSER_VERSION = 0.10.1
-GUMBO_PARSER_SITE = $(call github,google,gumbo-parser,v$(GUMBO_PARSER_VERSION))
+GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser/archive
+GUMBO_PARSER_SOURCE = v$(GUMBO_PARSER_VERSION).tar.gz
 GUMBO_PARSER_LICENSE = Apache-2.0
 GUMBO_PARSER_LICENSE_FILES = COPYING
 GUMBO_PARSER_INSTALL_STAGING = YES

--===============6673389951442274325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6673389951442274325==--
