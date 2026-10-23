Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6903606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a1GwdLK1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07AAC6065A;
	Fri, 23 Oct 2026 19:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSEgXtYoSpRQ; Fri, 23 Oct 2026 19:23:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8667260A47
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792783382;
	b=BwzgZkuxl0pg8RmSugBfZ9qi4wlnkk7Ny4l+YUFnl0J5vyBfTdO6TgMl73sYdUUO67VB
	 fHALn2SkhQOEpfCUO2k781Srqmjt9XUVVo6YWADrkFaC0MGDuSESbsHH84Ar53RFCVpJb
	 lhrS06lorknCzRBnRMoQfyVrWKJlLPjNj+JBB5yXD6TChl/KsakYBjNka//+o4UEF3Qge
	 ZDGsBrROH2nYu3RheaEIZUbkEr7lGQa74cd2WNPzB/dYoLwb5EBEu/V7jHPxq+083abpg
	 b0zNab4/qs+EVYc2j2vDmlKnUTU5oNZtekh/ixuOJA79sc1xXfwrUBwKucdJaTTAnPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792783382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=I+V9sL2DqF7IWpicRoNW/ZDjvJ/Jm8C8hAhxqsJqO+4=;
	b=TGKD7CzjmC0x/hcm7feNCPPnq5tBy2u46R5Bs51/r4wDjTkXYL5GjwYf6/lyXMMOgQAJ
	 z4jxWr/2Odh5fB2qIO4n7Lk20tuiGT3CnKrPX1pdRga67i6DxbkYQvdHgDXgzzXHMbPve
	 Wl/rK081Bm3hBcm/12acnFhR9sq7APsFym2OQlTIESKvOlfjzy+QAkS7JeRLRAhoTalwz
	 UgxcTtyTzNWp5v91Rno3SsQSM+bEkM4VD9WmQAUP7UOjx+mDo8moOaXY+YhqBd/JkJI/o
	 5hfdRQnoDXetzC2KMaCuuGPpyy4UyukeBxk97r/ZTG6ZBC5K/kpqMLogv3eMHrd3SvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792783382;
	bh=I+V9sL2DqF7IWpicRoNW/ZDjvJ/Jm8C8hAhxqsJqO+4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a1GwdLK1eJ1lLlmZhGYqnmAEEYEsTTBo4JxAGy44pVdt7Xai12mXWAvJA9rOWPTDr
	 YveKAX8XdRu4u6ZbuZDFzpgwTaiC8k2/Fn+WBEBoXipcy77DVU3wRFzzu/8hIvqNut
	 J6se1QNmGqkzIt63OGVZzt2nEJDyC8PuOfcyKdsjbUN/OxBj/XBsrL1af7UQ+0ddwc
	 8sVdbEhKdhZqKKoHGPj2Q0ra1C8Ba4qUOC5avtPGi7k0/XBsQujOKZs8BhUFUIcXhC
	 +YcP5aaXPyEaxKsMHHcQ3z8QK6EZrnCAVk8hmbehR0EwcdAmR0QaFiHZxyCG4xNDP6
	 Hwheut/1iI3CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8667260A47;
	Fri, 23 Oct 2026 19:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 900C679F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7637D60A3D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLLCPNNb5r-w for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:22:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7157460A41
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792783378;
 b=SdkO6HgOkKu9vao61vy/BOJNQJ+Rj2IumW4zMFSt/QoQMp/H7EO+6axM3YH59+E2Kq8V
 DDzmE3DENFvLIKutz2m2ECNwnsVt/UGyQbSjRycQE/q/R/TE2W07ERZ/IHsrpv2kGbU85
 QQxpdSTLNBpCGMYjfg/HDQBUUv0Pk3A+iBAu8oGotK2coLB4SmsZnXhcr4Eo1Uqg1x4Ci
 vdIF2iYm++IP+1qn6/YncSGeAEZ5I3SP5ihPKqSsQIbVdMaku+3mUDLaU1EWK58H9l3jX
 IQqjSuFuKroVblRFm6qAkfoNSECRVvlDONyYcOpsn6FVgjGt83H5agMUbm5WJVUURow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792783378;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1SNFCzkmnpSCBJQQqo//36cll4fx6mimiVCF20OXk4M=;
 b=po7YW0pdQKRLyVaVrlaOMltsdaBEtxmqFv/cLXfAGxRlkWI2kR0AZkEaA9islOJnDXMj
 UVR8DttyTi7U7U4jrp9fZlcO5ddKB/V/JC5y7xcXj9fue+jt18N3JpgQ89CwYAjOclupZ
 FccmYRNzF04TAH1NvLnxWFhYIVIG4svSn7eAyujN9eQ64L08PWniBhJd7AtTzLUdbH6kX
 mXEqvkrwbcme8itLFmOrW79h6o66WiED0I/u3PYu5LaorXCrtyLLS0LEQrgU71hF2EBZE
 6ZJjg1qJGNqm4W51Y1MRtDZ2FxFwhzc34psuhDkUr686qwaR28ZH6Orhu4BYWP2UAvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7157460A41
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:22:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8BEA9C688; Fri, 23 Oct 2026 19:21:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce9729d7ead802f8afd487f01982e2cae5ba9121
X-Git-Newrev: 410b9c87c26d5d5eaf44b2b2362452febf887b06
X-Patchwork-Hint: ignore
Message-Id: <20261023192133.B8BEA9C688@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libical: bump to version 4.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/410b9c87c26d5d5eaf44b2b2362452febf887b06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libical 4 is a new major version that is neither source nor binary
compatible with 3.x, see the migration guide:
https://github.com/libical/libical/blob/v4.0.7/docs/MigrationGuide_to_4.md

The in-tree users have been checked:
- asterisk builds fine as is (including res_calendar_icalendar);
- bluez5_utils needs version 5.87 for libical 4 support, as
  libical.pc no longer links libicalvcal.

Build system changes:
- most CMake options got a LIBICAL_ prefix, the old names being
  deprecated: switch to the new names;
- SHARED_ONLY has been removed: use LIBICAL_STATIC=OFF instead;
- the new LIBICAL_JAVA_BINDINGS option defaults to ON and makes the
  configure step fail when JNI is not found: disable it.

The license files have moved to the LICENSES/ directory (the LGPL-2.1
text only changed in formatting). Also list the BSD-3-Clause license
of the new icaldate code and the MIT-like license of libicalvcal, which
was already used in 3.x but not declared.

Release notes:
https://github.com/libical/libical/blob/v4.0.7/CHANGELOG.md

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libical/libical.hash |  9 ++++++---
 package/libical/libical.mk   | 26 +++++++++++++++-----------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 4c47c9347b..40063dece3 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,4 +1,7 @@
 # Locally computed:
-sha256  e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca0a2c9d5c3510b4c2  libical-3.0.20.tar.gz
-sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE.MPL2.txt
-sha256  051753f11d7bb731d178eb3a972560f65a1dbc8f207b166a1c7c090e5d85f582  LICENSE.LGPL21.txt
+sha256  47c05bc96e41416578cf1803bb2ba3f8d292cb17d5ac2fca539dee922bae8a94  libical-4.0.7.tar.gz
+sha256  fe5ebb1ff742efb28112295d0f021c7b0171dbb3cbe27cd1dd1a628fefd3b4bd  LICENSE.txt
+sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSES/MPL-2.0.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
+sha256  3cf06aba3588c41c514f6946bb2d757b413ff6491647d474800f55edca75dcb4  LICENSES/BSD-3-Clause.txt
+sha256  87e24cc49b33d9d5e2819cdb390cfb7dcaa1fdf8d320782fdd5d6cdd0ee5585a  LICENSES/LicenseRef-APPLEMIT.txt
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index 56489b4e98..a8e6418352 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -4,25 +4,29 @@
 #
 ################################################################################
 
-LIBICAL_VERSION = 3.0.20
+LIBICAL_VERSION = 4.0.7
 LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
-LIBICAL_LICENSE = MPL-2.0 or LGPL-2.1
-LIBICAL_LICENSE_FILES = LICENSE.MPL2.txt LICENSE.LGPL21.txt
+LIBICAL_LICENSE = MPL-2.0 or LGPL-2.1, BSD-3-Clause (icaldate), MIT-like (libicalvcal)
+LIBICAL_LICENSE_FILES = \
+	LICENSE.txt \
+	LICENSES/MPL-2.0.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/LicenseRef-APPLEMIT.txt
 LIBICAL_CPE_ID_VALID = YES
 LIBICAL_DEPENDENCIES = host-perl
 
 LIBICAL_CONF_OPTS = \
-	-DGOBJECT_INTROSPECTION=OFF \
-	-DICAL_BUILD_DOCS=OFF \
-	-DICAL_GLIB=OFF \
+	-DLIBICAL_BUILD_DOCS=OFF \
 	-DLIBICAL_BUILD_EXAMPLES=OFF \
 	-DLIBICAL_BUILD_TESTING=OFF \
-	-DWITH_CXX_BINDINGS=OFF
-# building without this option is broken, it is used by
-# Gentoo/alpinelinux as well
-LIBICAL_CONF_OPTS += -DSHARED_ONLY=ON
+	-DLIBICAL_CXX_BINDINGS=OFF \
+	-DLIBICAL_GLIB=OFF \
+	-DLIBICAL_GOBJECT_INTROSPECTION=OFF \
+	-DLIBICAL_JAVA_BINDINGS=OFF \
+	-DLIBICAL_STATIC=OFF
 # never build time zone info, always use system's tzinfo
-LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=OFF
+LIBICAL_CONF_OPTS += -DLIBICAL_ENABLE_BUILTIN_TZDATA=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
