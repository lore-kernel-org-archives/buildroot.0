Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FFE606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qcdng109
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B22BD81021;
	Thu, 29 Oct 2026 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgqJcU3BKfrl; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 13BC081004
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305406;
	b=oQWb60zdPUuSTG1HVb7KHhONiXNN3oLOApNiZ2xhS4JRFqfD4CH1L8KFHlE47T9TJ6iZ
	 4afaV/cMEDKlEkRdBdfkrF6OggyNtx0GvejmOuIvUCS0bz663uk/lxRtZwuH0CzEgEcHm
	 Xrc+couDGuKYFA86wawhvhs6cJby1fnJMWdmzy8Ng7Ct/kfr8JdBpg+L1q+qaq7TzkVad
	 12oAtIOZUWMAZVwi81b9KEFqFO6Bo81HEve+IgOL9l6esZBBgmq7atA90paHA03Hi81bg
	 TPt7Q1dI94z0amTR3y2S3cyv9Gve6RTY3nDoyiyDIEhbVtzSUI6YPIIFyIf6yJkN6Bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305406;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LkhBZaIC9RxFqeYOdKoWs8MPmZs20BZvraqA6wEJBEI=;
	b=S6s7rDwZKWXONO1XWKvWL7rSc7EIPTS0g18OpJnx4FjT7a3jnaS73itWo79MqPRv8xF2
	 /KsdALW/Ci79DB+2ZN0xzwo8Jy0S9U1/oNmxYs1Nui2Xamaw34sIo25u/7xL8nOhm0hqj
	 wGc1hn2gIVD8qQni8zBz9DjYUJUkFx+4XW9BvIAKuw4H2FzlUEJFu9pRZXm+XoA9pd5ka
	 eLlIFuFX8mYMD77I40kDNxPPRz9WtzF4mwV4OZp3N0jq7ZJ4gUDx/v5/KjcV5iAfzK7tY
	 M+bdKM+mxUtNKUzxFqf8eoNGVXv9Ba93z9MygHAI2jrduxhadKY9a063bC87vM1BCWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305406;
	bh=LkhBZaIC9RxFqeYOdKoWs8MPmZs20BZvraqA6wEJBEI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qcdng109bKkSTYZdJZfrSFTT0Fs4n/WG4F8ro5zN0ErdIRFCsUOQI5yLBiLMThbz/
	 vCFjZtuRE0TBjyqTdYx0qsJivqbi2gLExNlKmrEsyZ75G4kKGduHiexMRwJObJQXlT
	 Zhk+235SiNOx688grkZPUXpqWF/4H3yNlnei5mY1Yoy641Hy4TDM2SS1bBOTAp0vO1
	 ITf0Go3SlaUInVitGvg1aJzuzDCWKgs1pGznH/+lz/aC2aicizpjB5gMFiZsp6Q4o8
	 Nmu2ohp3XQnqbVvYSaLIu4AO5VK/glzkrykgQ8xhUsyW959oapcNsxPQAfBuxEkT6e
	 1QL3p5SSU1fWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BC081004;
	Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76ABD972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D0DF80DAB
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWwp7CWsXzNn for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 465E781004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=ceH/SBqt1iAMhM+unuk45cMWQqmOmJWkD0lOI3x7ofxD4SXrOPapK2U936sb2s7yxX11
 uFCTP7HqLu2u0yqOax+TdZJC6JURTKRmzNnAss5KMfUacQf+JyfHsW4dIx9rOCx4fBdUT
 3x5dSRTBcfXn7wfkuLzl3jN0GJ9GNbMLDPhj3EcKUx8H46AvGwxH3+sTReC+pRyMLSAW5
 epeOXglDTL0pATEn+OsrI5dXiG1L8fU0Vd6KSpqyF0Z8P0zOQZcgDLLbGeiGFMD+lt0KD
 ffmMBbmfF7B7GGtKxGG435gpbjlTL13HhgE8kgux4zw6zdp+vyEKySYTDtgj9wmjvBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AfhssDE/Ebkzsep7bQ4LMfXzNmzKjx3jv2mukdijddg=;
 b=XEdRUcLdjIrkyGfDGdnk+SD4gS5KmlhW4/UB+TSyeWiwtNygruh4FYWDBIZjrXu/bwZr
 mYyWlM9gTYBSBOx0kxpm9SsDHLL0KbIiTrP4IcbEEnEle7NUiDSQBHJrChO7bUL/hB2hJ
 MljN1mo28+sTvUWYpA7ndLr1I/bHpoiw0YOiJcouL+Ifq9mlWijDTgxm+enM+qTTfQS2m
 pzr6FJkQblQov4aFN9gsgOIHANn0tZaXKLfDALpDfSPbdUx96+kCyF5lddAv68yxyEEoc
 5nhvPrp4jp+yrgQQqtc9s/kptp/Erh92TCBFUQhW3yeUKr6MP9deaku8B4xBzybQERw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 465E781004
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9AB29D2EE; Thu, 29 Oct 2026 20:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf07cc26b0b4e3d858654dcd966dda3ae2bae580
X-Git-Newrev: ea3448a675f622cf5511d2d2051d4a601d99f2bd
X-Patchwork-Hint: ignore
Message-Id: <20261029202152.B9AB29D2EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: bump to 22.0rc1-Piers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea3448a675f622cf5511d2d2051d4a601d99f2bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch from kodi-texturepacker which is included in this release.

Removed patches 0002-0015 which are included in this release.

Added patches 0002-0004 to fix build with ffmpeg 7.0.3.

Added dependency to exiv2:
https://github.com/xbmc/xbmc/commit/197a3e6d2e80878f5f3f827b3a9073118b59bd51

Replaced dependency rapidjson with nlohmann-json:
https://github.com/xbmc/xbmc/commit/d6d2cac380ea127c2a64a998a31622debe149d3b

The mandatory dependency to libcdio was moved to optional optical drives
support:
https://github.com/xbmc/xbmc/commit/11289a597a88d809f39d3c23aa7eae6325a5263c

Remove -DCMAKE_MODULE_PATH from host-kodi-texturepacker, which was used
to find FindLzo2.cmake, after upstream commit
https://github.com/xbmc/xbmc/commit/3eb5196bf79759682aa0eb20b0b4830c083f81a5
added a version of FindLzo2.cmake specifically for the host build of
texturepacker.

Bumped versions of libdvd libraries following upstream commit:
https://github.com/xbmc/xbmc/commit/8550a0079481de6de1a1e9eb55cc6aec822e3ffe

Upstream commit
https://github.com/xbmc/xbmc/commit/4719e45848e3aeda84f07247fcad03b0744d6833
switched to the generation of Python bindings directly with SWIG and
dropped the usage of Java/Groovy.

Removed configure option PYTHON_EXECUTABLE due to upstream commit
https://github.com/xbmc/xbmc/commit/45c6459b6ea6d2ecb6a1ae7d4056ca4fb96535cf

Removed wayland-scanner options due to upstream commits
https://github.com/xbmc/xbmc/commit/8611aef2a092c0027d7bb22a93721cc11bfcc76b
https://github.com/xbmc/xbmc/commit/34e7dd3d166eaa8d0d57c4552129b05281e27142

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../kodi-jsonschemabuilder.mk                      |   2 +-
 ...TexturePacker-allow-build-with-giflib-6.x.patch |  71 ---
 package/kodi-texturepacker/kodi-texturepacker.mk   |   3 +-
 ...TexturePacker-allow-build-with-giflib-6.x.patch |  71 ---
 .../0002-VAAPI-fix-build-with-ffmpeg-7.1.5.patch   | 117 +++++
 ...EncoderFFmpeg-fix-build-with-ffmpeg-7.0.3.patch |  67 +++
 .../kodi/0003-RegExp-remove-unused-methods.patch   | 127 ------
 ...utStreamAddon-fix-build-with-ffmpeg-7.0.3.patch |  49 +++
 package/kodi/0004-Introduce-PCRE2-dependency.patch | 192 --------
 ...hreadImplLinux-uClibc-ng-provides-gettid.patch} |   0
 ...005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch | 486 ---------------------
 .../0006-cmake-Set-ARCH-to-CPU-by-default.patch    |  41 --
 package/kodi/0007-Update-to-7.0.patch              | 338 --------------
 ...deprecated-use-of-FF_API_INTERLACED_FRAME.patch |  98 -----
 ...09-Remove-deprecated-use-of-avcodec_close.patch |  30 --
 ...ve-deprecated-use-av_stream_get_side_data.patch | 113 -----
 ...-Remove-CrystalHD-hw-acceleration-strings.patch |  47 --
 ...ideoPlayerignoredtsinwav-advanced-setting.patch |  51 ---
 ...0013-Use-new-audio-DTS-and-ATMOS-profiles.patch |  98 -----
 package/kodi/0014-Update-to-7.0.patch              |  47 --
 ...bject-Use-sysconf-_SC_PAGESIZE-to-retriev.patch |  42 --
 package/kodi/Config.in                             |   8 +-
 package/kodi/kodi.hash                             |  15 +-
 package/kodi/kodi.mk                               |  52 +--
 24 files changed, 262 insertions(+), 1903 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
