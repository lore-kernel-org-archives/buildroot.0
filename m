Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B441C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 328E4405EC;
	Tue,  7 Jun 2022 19:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obZROBeNrAry; Tue,  7 Jun 2022 19:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4227C40640;
	Tue,  7 Jun 2022 19:19:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 184C71BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EEB083F05
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCaP50nyxlR0 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B510683E62
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A46E186E21; Tue,  7 Jun 2022 19:04:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22db16694406d6b2156acd74d3a49fafae6d015c
X-Git-Newrev: 9b00be972a50fa71835e3c976af421ac7e92cb51
X-Patchwork-Hint: ignore
Message-Id: <20220607190456.A46E186E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-p1-xmpp: bump version to
 1.5.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b00be972a50fa71835e3c976af421ac7e92cb51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-xmpp/Config.in           | 1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash | 2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index 6e40fed10a..c67dc832b7 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -4,6 +4,7 @@ comment "erlang-p1-xmpp needs a toolchain w/ C++"
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp"
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
+	select BR2_PACKAGE_ERLANG_IDNA
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index d0a761fcac..fce23c09c6 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  65c73ffaf8faab5d6fc7d42ada0b5a380f20f3e46056ad98614d81922322d9a2  erlang-p1-xmpp-1.4.10.tar.gz
+sha256  bde03ad371aad3e171ebe94a5b3b84daa4b8dd7ee37e9979ff373cd65370e725  erlang-p1-xmpp-1.5.6.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index f903cb945d..fc63b5ffc2 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XMPP_VERSION = 1.4.10
+ERLANG_P1_XMPP_VERSION = 1.5.6
 ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
