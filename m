Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A1606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rBVEDTrS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E9A606AA;
	Sat,  7 Nov 2026 11:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fD2G9DMF2OnK; Sat,  7 Nov 2026 11:26:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 23836606CF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794050791;
	b=cgOdW2W5W5lVpxTPMXtQpWi7AYF/0XlUHncryAJZI6+pe5WM9lnbg2LMiDpP6gyVkJLS
	 fhVrZX9DWPJ1TNrlRsBkIVCGjZNRezjMrPjvr4IaeF5gnfNHa1EHhw/fNqsLk5lSm9z0K
	 EczlHu9HDKObh2Xgo6ICa5CXLGCXtrvoV0MSNgJRs9BB/j8f0WUQpGV6LfGZYM0nYxVAW
	 wtXic/KKYmGwI37f0TlwkI+PWtpFgZpa8SmY9flIyT30FIdW9wZ/rEfjde60rHI8Gs2JJ
	 a0NF4aNa3ZMp34HPabtsElIpAJWUDL+y9OOPVsz7JVQtUXcV4VtbUPerdtRDgVoFc2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cpAS94Iru72qUWwuG8/pqOqRDYxDopbLxPCLDroSvTw=;
	b=Sp0OdVsTAIxg7rrfamorou5F8DBkCN0T9C0B3CBsAHXdot4X4IMbrIWLz7LGKqnnEhIf
	 BbYPCgxOQnisrkXkoLrK0CewFnVSc5S0P/i3KtbZEG6SRvPoBiVUFfRVKHboj9pJjBl5O
	 LBkRCGmEMOS4M/ZQOLe2lUEW7zrKQwmAmg+Gc0pjM2WypZTAYtNVXtZ0wz+I8GD/5G/s+
	 LhQJeQ7zovWUtWmg8WE08feU2cTJu9/lDsskEAv6VnfYBvvcXrrOidoobX6/mGa3b0OMi
	 6QFUPJfnJ7bIjBEe8GxFMweEuBtOScNsrN3Rp8KGJ/sF7/dPYpuTAvWx8GgKoSvcrrg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794050791;
	bh=cpAS94Iru72qUWwuG8/pqOqRDYxDopbLxPCLDroSvTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rBVEDTrSyszXfJSJT3Cac6gxAjNqqFTgF9YjHPUvbPRgmo3SI0l4uNeUqOY/GdJ/j
	 PQDt6La3SPXWGwi2zrMf9aa/1ca4xK3h+2j1wvW5tTPsWfDjnZ++IplkMjpESoZut/
	 g/eicklnS34eWVg+tlHJ0C5h/C2gd+tvIKZsNzTXXVJojyzGvQ2WDgTdp/JE26GHDC
	 fpUZP4wOPpRHz+rsuryqpIx1/OFv4k9SPpEBc3likj9r7Gvh7yiDBkz1vG2LF7uMP8
	 zN11+rhFOxYjZhl58xSGdOp3OoNLVVsZpXABdPYVbGwpYWn4yzeSsLMoTq+fjQrDRf
	 ZjSV0h/JzbX4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23836606CF;
	Sat,  7 Nov 2026 11:26:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA6E532A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C038E405DD
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7KWuckUQpcn for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 095C3405CB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 095C3405CB
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA1907FBC6; Sat,  7 Nov 2026 11:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 12:16:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b922ae919859f69319302dea49685d63f1576f2a
X-Git-Newrev: aa1cdae7418e88022dc65dfe39e26d4bde14155e
X-Patchwork-Hint: ignore
Message-Id: <20261107112456.CA1907FBC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: remove patch 0004
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa1cdae7418e88022dc65dfe39e26d4bde14155e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit f30bd1eb69c44793485e9f013249d020e3e19fc3 added patch
0004 to "add -latomic to pkg-config files".

A patch addressing the same problem was committed to ffmpeg 5.1 several
months later:
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/2f0a214a6202516b4dda2bb22b6b3ac20e465d6d

so we can remove patch 0004.

Buildroot commit fa36a6375dbeae131c596070570cec66c7bd2456 bumped the
package from 4.4.4 to 6.1.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...-configure-add-extralibs-to-extralibs_xxx.patch | 47 ----------------------
 2 files changed, 48 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..cd21cce1f8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -322,7 +322,6 @@ package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch li
 package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.Upstream
 package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch lib_patch.Upstream
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
-package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
deleted file mode 100644
index 050b34fd89..0000000000
--- a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0c288853630b7b4e004774c39945d4a804afcfa8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 6 Aug 2021 09:17:20 +0200
-Subject: [PATCH] configure: add extralibs to extralibs_xxx
-
-Add extralibs to extralibs_xxx (e.g. extralibs_avformat) to allow
-applications such as motion to retrieve ffmpeg dependencies such as
--latomic through pkg-config
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 6.0]
----
- configure | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/configure b/configure
-index 0bb3a7cf2b..3bda99e415 100755
---- a/configure
-+++ b/configure
-@@ -7986,14 +7986,14 @@
- source_path=${source_path}
- LIBPREF=${LIBPREF}
- LIBSUF=${LIBSUF}
--extralibs_avutil="$avutil_extralibs"
--extralibs_avcodec="$avcodec_extralibs"
--extralibs_avformat="$avformat_extralibs"
--extralibs_avdevice="$avdevice_extralibs"
--extralibs_avfilter="$avfilter_extralibs"
--extralibs_postproc="$postproc_extralibs"
--extralibs_swscale="$swscale_extralibs"
--extralibs_swresample="$swresample_extralibs"
-+extralibs_avutil="$avutil_extralibs $extralibs"
-+extralibs_avcodec="$avcodec_extralibs $extralibs"
-+extralibs_avformat="$avformat_extralibs $extralibs"
-+extralibs_avdevice="$avdevice_extralibs $extralibs"
-+extralibs_avfilter="$avfilter_extralibs $extralibs"
-+extralibs_postproc="$postproc_extralibs $extralibs"
-+extralibs_swscale="$swscale_extralibs $extralibs"
-+extralibs_swresample="$swresample_extralibs $extralibs"
- EOF
- 
- for lib in $LIBRARY_LIST; do
--- 
-2.30.2
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
