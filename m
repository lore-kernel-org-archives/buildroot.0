Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162D3C3DA50
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36CB414E0;
	Sat, 13 Jul 2024 14:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qumr1eAsVHsp; Sat, 13 Jul 2024 14:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E06E4154E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E06E4154E;
	Sat, 13 Jul 2024 14:12:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9D081BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0C63400A4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk9LGABEtzmB for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5CB640096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5CB640096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE0E68649A; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:11:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62c7857dfa5036e26d5b921c199e66621a4bc508
X-Git-Newrev: 6a4ad23a07236348034a54997dd09e79166f2d11
X-Patchwork-Hint: ignore
Message-Id: <20240713141159.BE0E68649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a4ad23a07236348034a54997dd09e79166f2d11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgpgme is needed by skopeo (to come in a followup patch).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpgme/libgpgme.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index dd39b37aa2..7e224e1962 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -47,4 +47,23 @@ ifeq ($(BR2_MIPS_NABI64)x$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10),yx)
 LIBGPGME_CONF_OPTS += --disable-linux-getdents
 endif
 
+HOST_LIBGPGME_DEPENDENCIES = host-libassuan host-libgpg-error
+HOST_LIBGPGME_CONFIG_SCRIPTS = gpgme-config
+
+# C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
+# Let's assume the host toolchain always has C++
+HOST_LIBGPGME_LANGUAGE_BINDINGS = \
+	cl \
+	$(if $(BR2_HOST_GCC_AT_LEAST_5),cpp)
+
+HOST_LIBGPGME_CONF_OPTS = \
+	--with-gpg-error-prefix=$(HOST_DIR) \
+	--with-libassuan-prefix=$(HOST_DIR) \
+	--disable-gpgsm-test \
+	--disable-gpgconf-test \
+	--disable-g13-test \
+	--disable-gpg-test \
+	--enable-languages=$(subst $(space),$(comma),$(HOST_LIBGPGME_LANGUAGE_BINDINGS))
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
