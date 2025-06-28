Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7012C83013
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C7C80F0F;
	Sat, 28 Jun 2025 21:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqVrV7ZojSNU; Sat, 28 Jun 2025 21:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8319A80DAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8319A80DAC;
	Sat, 28 Jun 2025 21:08:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B3D41D79
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 522CB40B6D
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuN5gHtbdBhR for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 21:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968DA40A47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968DA40A47
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83CBA848BF; Sat, 28 Jun 2025 21:08:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 22:57:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f2a83fdc49de38148066ab1689411ce6e760bff
X-Git-Newrev: 585ee147dd125b617f036acbb3e9668c30dab47b
X-Patchwork-Hint: ignore
Message-Id: <20250628210819.83CBA848BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmpeg2: add CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=585ee147dd125b617f036acbb3e9668c30dab47b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the moment, package stats indicates that libmpeg2 is affected by
https://nvd.nist.gov/vuln/detail/CVE-2022-37416

However, this CVE applies to a completely different piece of software,
that has the same name "libmpeg2" [1].

To avoid the confusion, let's add a proper CPE vendor to Buildroot's libmpeg2.
The library itself does not clearly identify any vendor name, and there isn't
any existing CPE on the NVD website. Since this library is not updated for
many years (maybe even before the introduction of the CPE system), but the
code is somehow related to the Videolan project, let's add this as the
vendor, which sould solve the matched CVE issue.

[1] https://github.com/ittiam-systems/libmpeg2

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: fix typo in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmpeg2/libmpeg2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index cab800162c..ec23dff57b 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -16,6 +16,8 @@ LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPTS = --without-x --disable-directx
 
+LIBMPEG2_CPE_ID_VENDOR = videolan
+
 ifeq ($(BR2_PACKAGE_SDL),y)
 LIBMPEG2_CONF_ENV += ac_cv_prog_SDLCONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 LIBMPEG2_CONF_OPTS += --enable-sdl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
