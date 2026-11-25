Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ABB606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CwcJwapA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=kNmuxQPw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D36AF60878;
	Wed, 25 Nov 2026 05:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s7r1ADI1lSy; Wed, 25 Nov 2026 05:37:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87788606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795585059;
	b=tQHf1nmY/uvsfX79lR4oAf48q4LliOv7N9UU5m6/dtAFMia3aYIvMwoii82ooB2/xrnZ
	 GVgYoljK4RLpCTWAhXmwFogrW3QSMb5XzOcEL9sJVBbCK9D8mlSiDdLsDxHgh2/bW9IS9
	 qT0CGZVe9QQqK+SJxmw+Ea1TDyU7N5R0eMAkyUQjg5gG9e8Fg4YJNdpvgPMggFVGUERYh
	 SZb8L/iEPELqFJ7XQxEpbOAgnOBnVj/75DIByTBbLTmCXWo5mbboUoJfsonG87/aQTJK4
	 qMkTIDunrhVb2qTqySsPcIRIuUIlTKqWDUUIL0AnWag/ZOYr9p78i7rJRhrNkrkhTJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795585059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Virus-Scanned:X-Virus-Status:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bqytsxuvxlfcqmCFESQihQlkLBouSdcDn4302r7TOcQ=;
	b=dR4q+YYnsCpzfqGXFqViTcdWTiM2ZY++i/YvqbiOoxvhVnMdFBVnN6lhYBKA/grKB4X1
	 S2Ulvv3ZX7sCcgsFaO1ioIHb1hWtkN8KTzovgdtCSvtQuO6vV68gwoPtuGh/FMfOXtEVv
	 J9REDzWpVAlpJfdQ6zP2WVQLwUPiCKSoIICsN3pVxOESdliqL9S0gHdE/2kN+d9lvwzjy
	 ycrWR3F38WUO2GT8pQM58RoK82sx1jUr5y8t3ADUYu0xwSPzpAqKT1mkxl3An8ZcxkI+G
	 cj/wqjn7uppKZG1ItN73R5ymsUt4gCs3QgW9QC82prD25uGz2qPY89kdHw6ysoU9fvQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795585059;
	bh=bqytsxuvxlfcqmCFESQihQlkLBouSdcDn4302r7TOcQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CwcJwapAFK4vv5wvaHhPASOG6lhj/NmSkZ0YglN+ZK1es13BEHTKR+CjMyijisOI4
	 XF0+Xvc5ZTT8g9gsfrHBO4Jp7FZW6xKt/ko2zgvq/a06eaIYQJG+fH5/gztD9fVR39
	 lfbGo3XcE9dni4CePgc06ciY3M9C0CkJHkIW30/55eKVTWyw4tqyiNlYL669Yfrj9V
	 1IfYGeFuBz2Le1NVCO8LIjL5oK/HNTxnBFUGJVIdX2AZhuPctxdpfrI9KZ2LL/yKtc
	 um8Vd7uoKvwsMnx2uodD1Z57k0r+wSd1n4kI/dgkZOhC500XKt162OgaZBT3iRAjfd
	 ggpM1y68UMAgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87788606A3;
	Wed, 25 Nov 2026 05:37:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B84F02F5
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 05:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5C1D400DB
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 05:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xj5Chwj0SPYl for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 05:37:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 024DB400AF
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=kNmuxQPw
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 024DB400AF
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 05:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1795585051; bh=TK+SlsxjyiNDoRTOHT11ksD8H3UaDV/HLzVo86GkC9M=;
 h=From:To:Cc:Subject:Date;
 b=kNmuxQPwD4rPhVmd++NQ8Tt5sLi9P+Cr0XJt3Zs9SsVQECsSKTqi4a1g56c/sTUZw
 6e+PM6i14FbQaKYKRm8Jp1c8h4BQVBFeFUfAiOWCqOuoo+2b5kpAqEfDHa8kRojgyX
 mMxvRu1Q1FyUUIdDPwFhlHcXSMrDv3P3FEplQAQ4=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 767BEBDE4A17;
 Wed, 25 Nov 2026 06:37:31 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Wed, 25 Nov 2026 06:37:07 +0100
Message-ID: <20261125053708.1396093-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: Update version to 0.24.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_NONE,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Contains two bug fix releases; .19 was predominantly Windows and OSX,
.20 is mostly Linux related and contains fixes for a lot of corner cases.

Change log:
https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.20/NEWS

Consolidated changes 0.24.18 -> 0.24.20:

* configuration
  - fix crash if "audio_buffer_size" is too large
* protocol
  - "max_command_list_size" limits the real memory usage of command lists
* input
  - fix hang after a failed seek
  - curl, ffmpeg: disable the Gopher protocol
  - ffmpeg, mms: fix data corruption
  - ffmpeg, mms: fix broken stream after seeking a non-seekable stream
  - ffmpeg: don't block other threads while connecting
  - ffmpeg: fix error and lost data at the end of the stream
  - ffmpeg: fix bogus size of non-seekable streams
* input
  - nfs: fix buffer overflow if the server sends more data than requested
  - nfs: fix hang if the file is shorter than the reported size
* decoder
  - mikmod: fix crash when scanning a module during playback
  - mad: fix crash when the channel count changes
  - dsdiff: fix uninitialized sample rate and channel count
  - opus, vorbis: fix crash when seeking past the end
  - sidplay: don't block MPD while seeking
  - sidplay: work around deprecation warning with libsidplayfp 2.14
* output
  - fix data race in the ring buffer on ARM and other architectures
  - osx: fix noise when playing DSD with DoP disabled
  - osx: fix buffer size overflow with many channels at high sample rates
  - osx: don't cut off the end of the last song
  - sles: request audio focus, fixes silence with Android Auto
  - wasapi: fix crash with DoP
  - wasapi: fix rare hang while disabling the output
  - wasapi: fix crash with "enumerate"
  - wasapi: fix crash after the device has been removed
  - wasapi: fix device names beginning with a digit
  - wasapi: fail if no supported format was found in exclusive mode
  - wasapi: fix format negotiation in shared mode
  - wasapi: fix crash after device error
  - wasapi: fix output failure after pausing or stopping while draining
* mixer
  - alsa: fix crash after the mixer control was removed
* database
  - proxy: fix memory leak after receiving a malformed song URI
  - proxy: reject RealUri with Windows drive path
  - upnp: reject song URLs with newlines and null bytes
* tags
  - id3: fix excessive CPU usage with many frames of the same type
* playlist
  - ignore the URI fragment when detecting the file type
* Linux
  - fix "chmod failed: Invalid argument" on kernels older than 6.6
* Android
  - fix crash after setting the volume fails
* macOS
  - fix empty pid file in daemon mode
* Windows
  - fix service stop and system shutdown
  - fix service timeout error if startup or shutdown is slow
  - fix race crash bug during shutdown
  - fix service hang after startup failure
  - fix encoding of WASAPI error messages on non-English systems
  - playlist: reject Windows reserved device names followed by a colon
  - archive: reject ".." in archive entry names

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index b4b4b6e2b9..1be7c575e1 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  afe8fddbdbefc7b3e7ee721fd0dd4e2276f29e40fe7e3c573daf5123b444578f  mpd-0.24.18.tar.xz
+sha256  a1e12f22f1938bd9241aff6e2a925917357a494d143acc32f8dae5373e43c2b9  mpd-0.24.20.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a017fe236a..c01771198f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).18
+MPD_VERSION = $(MPD_VERSION_MAJOR).20
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
