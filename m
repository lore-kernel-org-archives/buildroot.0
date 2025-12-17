Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9613DD64086
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 07:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6757182341;
	Wed, 17 Dec 2025 07:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuW6V4Akwg1U; Wed, 17 Dec 2025 07:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 823458235B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765956202;
	bh=tgOqeDfQVTsWKr8KmRBar4mc+cLq8riGNoESCOrV2wY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=owf8b37b8toBwfQvLOgIx+mGWfPuSIH054s2A1SE7prc88iUKr/eoiL1As0juWoeg
	 HxchtM2WHBAzdqf6UxkcP61Ae0cBGfN6D6gXY2ETsAR4inJ1sU3B9TMUxFfwuPyLsa
	 xhdWuijdBnvfR7ZVIOMmxU6ZmVTOkFHyNBxpYtIRtrUTGiOzbM78CLXLriBOSCHVPn
	 NSLGdBPuWiyNl3B0fiSPIYbC0hyGtaRKswWuE8N5R2m4+ucYcbrtzndHrPHfPAOLOR
	 1wfUSxUTuNnhFQ8S38l0SiE/+zZFZAiBVhxMZ2IQJce3WD8INozWe51KyySHUINXx9
	 jjpUfV/zGLaxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 823458235B;
	Wed, 17 Dec 2025 07:23:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC60D35B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 926A360656
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JREJVrmGH39 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 07:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D9B60649
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D9B60649
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:23:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D07CC87076; Wed, 17 Dec 2025 07:23:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 08:20:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dc61b52e8aa81104ad58e2fdb129da4c11c3327
X-Git-Newrev: 17d83926032bfa69293b994473e599159a0fc8cb
X-Patchwork-Hint: ignore
Message-Id: <20251217072319.D07CC87076@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmocka: disable documentation
 building
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17d83926032bfa69293b994473e599159a0fc8cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmocka tries to find the Doxygen binary by default and if successful,
it tries to download style sheets and breaks with the following message:

CMake Error at
doxygen-awesome-css-subbuild/doxygen-awesome-css-populate-prefix/src/doxygen-awesome-css-populate-stamp/download-doxygen-awesome-css-populate.cmake:163
(message):
  Each download failed!

    error: downloading
'https://github.com/jothepro/doxygen-awesome-css/archive/refs/tags/v2.4.1.tar.gz'
failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported

closing connection #-1

Disable the Doxygen package search entirely.

Fixes:
https://autobuild.buildroot.org/results/e6a04cee8bc3028bd8a1a535c2852e60f362c4ba/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmocka/cmocka.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 0ee18e2931..b2d489b7f7 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -10,7 +10,7 @@ CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
 CMOCKA_LICENSE_FILES = LICENSE
 CMOCKA_INSTALL_STAGING = YES
-CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
+CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=TRUE
 
 # cmocka only supports out of source builds
 CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
