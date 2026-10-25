Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43781606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fS8Eab/6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=ZbPdtSEd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 081A7816F9;
	Sun, 25 Oct 2026 10:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKNS6GyRPGR7; Sun, 25 Oct 2026 10:51:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1FEC3816DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792925516;
	b=HN60CW5j7UGGbyYz/OxCbKhhXukJW25iDC1SbosAx7m+JtQ/gcUXq6sdR4SCjWELZsy6
	 BPv2aXGHePeuzU/MVtd4yyrv9YzgEQIqLaP0GZ7ZCLj03+g9ZFgRXg2VkWPl4sOqczIkU
	 5GdYpKfLDedEBMjncGWx4W1AP4LNLc1poWKNver2/NDpcNrrUePL6u5KthcaRWEAFVO9Q
	 8mp+ZJtFhFuUm1PBPKDuF62uPMQN8x8qH4BCYqOxTUumSFMJ0A2lYufpeztjpQWSWqjxF
	 /6PXek3xmDH0D5Ye/Mjqxu9fCviLx6OgHnl7fYPGydaCSYwNblOdD0i2+xUdGAwJjoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792925516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Virus-Scanned:X-Virus-Status:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5FyBHr9bbjzOD+hLOH/aKLXOnOstCWWlRpa2zv775mc=;
	b=eMTUYo4di4WGDXIGXp7nNpEnrK8Py5vOGuj62B+d49d1YqdjtHvxYKsz2pudw3F/+Mok
	 IKt/ruBLOCu34/LW5p4LLSqi/E6N7TmqlOEVQ3DZSsq0zCq62sugcTCQgo1FSTH2KxsDk
	 azeMIFpwEkX/a32HIpWiblZx8d4SDOgBDL4OZTj8+Y45Kx80kegf/tHppMu9YB1w0KGyp
	 5ONnHGlInyteACnkGz35k6i8DG20dQDZE7TZNQblPe8IX8Pg4bRJsq9XbIrd5UaXef9X7
	 V7tzXBxizHgjFnvABbuiF6vxxqNWXUCPeahgTfHchZBrHVIpiC0wvD2fny+qLmz8R4g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792925516;
	bh=5FyBHr9bbjzOD+hLOH/aKLXOnOstCWWlRpa2zv775mc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fS8Eab/6PwO3Q4TCJVLTCGQqogJ9HuUogsoG5CgA1UjRx2lzjkQzs+zd79QP9YqTA
	 pC4HrBNxZrZgmNasuLOhxoC+R9pMrvuINL9l5Z6ws6q85+DPWthx8XpvHF+eKQcc43
	 C4aroSwHdl3A0K7XomcRL7k2ZJroALnZVY7ODAV/K6BbeDSUa41Iu2pxIOgTrvuXhM
	 2Qfc2gIRNB5WWQtA7K+zwRXVy8Y5Gtvub0PNBM9wvWgmoj3WiyGBzIP6WRsSetAh6U
	 b7r28p1dzSTtaAVxyzmrZyd1qlqQnVqCHUArdiD7zA9Ma4TGP4I2m0zmPcp1Qv5nIm
	 suJ6wCCSsH0QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FEC3816DF;
	Sun, 25 Oct 2026 10:51:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A937F35F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AF1D406AB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jo8_cS2vxsxr for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EAE2E40619
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792925511;
 b=fWwh0pWiPSut1fAmu4uVSGXymBBfSvGft7C3sOXI5I00O3mzrbbNmaOOlEn5JGiFAjrW
 p6qYJbaSeW3QLydXfEDHPLHipVVdP1+MoTtl6GmdZrkz36Jig7qnbvhgp0DI4bLPNJY05
 cGxo3K96Lv1NLJ3UG5NcoKBBo2aCzdS5lly3X+rRQ6goo37Aip49JB+imBEAXVo/VJ/z7
 d3aDDyS8XvYXCo6qhFDkFO/yO8scrkSdMRQR4IOoY2TJRtzk7hmc2ov6DNqgfYDFvmodM
 FTDlmTefsmKWtyEo33+ss9WPinAecf8BAYCgxk+YpLn3DJa/8u1zxSUsu/mRiUdQzBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792925511;
 h=X-Greylist:Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=OiDSyuSgrayJVf1EouWAWp5YS68xBGQfWMSZNQVIfHs=;
 b=sKRvPfejjwybDz6/CWnYzXe/tnlZivrzAKko19Dbo6FtHrjo5dpfWbTuX2l1JPeJK6l+
 Z2C2LbVq0GmvNFO1YA1xDjBN9xKzZsliRLfUrHnii15oaFuJcUeH1IGw6GhoFnQmTCum5
 g6HjmMMkx/fda1ri8BgQVtiijCjZ3C5247UJiV5FqXLfVlwqBr31/bmUwRBc4l8qizjHL
 PBJ3KAw5kYIiAM4MNpnF4i7NdynsntStcsu+W72wBLMKk23OlSVUMZ/7AKbTTrt/a+laB
 U76dn7GdqIjRfpADakIR97y1UhkG9P98CeUhICi5hgkxv7bYTXBhsJSrLkxSmH5GYLA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=umbiko.net;
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ZbPdtSEd; 
 arc=none smtp.remote-ip=176.9.89.163
X-Greylist: delayed 581 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 25 Oct 2026 10:51:49 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ZbPdtSEd
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAE2E40619
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1792924918; bh=AjmHt8ViIq73Xawr4vOZSKql6V+Dye/jC1f7RyBUZ9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZbPdtSEdUxG0R/BJVFAPXWasy3HtQlTROyRK7olgbZxm8IkK9n1sWAma4v4RBWmLz
 AVqc7Bsxsxw4cm6mlPNHsNPe3XqhVwzVp2ImlwXufDda/qMwsZ6BpskzQVVGR8bx/5
 ZDCg5GOKNkA5jqUKnbQh9mlOz/e+CFJBJ8vQAxfU=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6171ABDE62E3;
 Sun, 25 Oct 2026 11:41:58 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sun, 25 Oct 2026 11:41:29 +0100
Message-ID: <20261025104130.1580635-2-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025104130.1580635-1-br025@umbiko.net>
References: <20261025104130.1580635-1-br025@umbiko.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 2/2] package/mpd: update version to 0.24.17
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

This is a bug-fix of a bug-fix release, so hopefully should be stable.

Change log:
	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.17/NEWS

Consolidated changes 0.24.15 -> 0.24.17: 

* protocol
  - fix underflow in relative range moves
  - reject empty ranges in "move"
  - reject song id 0
  - limit the effort of regular expression matches
  - reject out-of-range time stamps
  - reject "." and ".." as mount point
  - fix double-free crash bug with "getfingerprint"
  - sanitize tag values printed by "lsinfo" on stream URIs
  - validate the picture MIME type for "readpicture"
  - check local file access for "albumart"
  - validate URIs in "playlistadd" with position
  - fix crash on "getfingerprint" error
  - fix crash on "getfingerprint" + "close"
  - fix missing "Added" time stamp
* neighbor
  - smbclient: validate server names and comments
  - udisks: fix crash bug
  - upnp: accept only HTTP device description URLs
  - upnp: sanitize strings for the MPD protocol
  - smbclient: fix linker failure
  - udisks: accept ObjectManager signals only from udisks2
  - udisks: skip objects with strings unsafe for the MPD protocol
  - upnp: ignore devices whose description failed to parse
  - upnp: don't download known device descriptions again
  - upnp: limit downloads, devices and expiry
  - upnp: reject devices with malformed UDN or service type
  - upnp: ignore services with controlURL pointing to a different host
* storage
  - curl: skip invalid file names
  - curl: fix use-after-free crash bug
  - curl: use the CURL input plugin configuration
  - curl: implement a HTTP timeout
  - nfs: fix use-after-free bug
  - nfs: skip invalid file names
  - nfs: delete unused transient connections
  - smbclient: skip invalid file names
  - udisks: reject ".." in the relative volume path
  - udisks: don't unmount volumes which were already mounted
  - udisks: enable D-Bus timeouts
  - udisks: don't allow interactive polkit authorization
  - nfs: disable the libnfs directory cache
  - udisks: require admin permission for "listfiles udisks://"
* input
  - alsa: reject URIs whose query string has no format
  - alsa: reject dangerous ALSA device names
  - cache: fix use-after-free bug
  - cache: fix deadlock bug
  - cache: fix data race
  - cdio_paranoia: fix memory leak
  - cdio_paranoia: open only hardware drives
  - curl: fix the broken "connect_timeout" setting
  - curl: enable TLS verification on Android
  - ffmpeg: restrict nested protocols of "hls+" URIs
  - nfs: fix use-after-free bug
  - qobuz: limit the size of API responses
  - qobuz: accept only HTTP stream URLs
  - cache: fix data race
  - ffmpeg: faster close
  - ffmpeg, mms: fix stuck decoder if server stalls
  - nfs: fix use-after-free crash bug
  - nfs: fix assertion failure during startup
* playlist
  - cue: limit the number of tracks
* decoder
  - audiofile: fix division by zero
  - dsdiff: fix integer overflow
  - flac: fix crash on mid-stream channel change
  - ffmpeg: fix crash on mid-stream audio format change
  - mad: fix integer underflow
  - mpg123: fix crash bug
  - opus: fix integer overflow
  - opus, vorbis: don't return garbage after a gap in the stream
  - pcm: use the packed input frame size for audio/L24
  - ffmpeg: restrict nested protocols
  - flac, opus, vorbis: fix Ogg detection if a stream's first bytes arrive in pieces
  - gme: limit the number of subtunes in a container
  - mpg123: fix crash with empty TXXX frame
* encoder
  - flac: skip tag values rejected by libFLAC
  - shine: fix uninitialized memory access
  - lame: flush the encoder at end of song
  - twolame: fix crash bug
* tags
  - limit the number of tag items
  - limit the length of tag values
  - id3: fix crash on encrypted ID3 tags
* database
  - proxy: limit the directory nesting depth
  - proxy: validate directories
  - proxy: validate song URIs
  - proxy: skip sticker cleanup (would crash)
  - simple: limit archive entry path length
  - simple: limit the directory nesting depth
  - simple: don't log credentials in storage URLs
  - simple: reject unsafe playlist entries
  - simple: fix use-after-free crash bug
  - simple: reject truncated database files
  - upnp: limit size and duration of device description downloads
  - upnp: fix crash on discovery error
  - upnp: limit Browse and Search results
  - upnp: accept only HTTP resource URLs
  - upnp: ignore URLBase pointing to a different host
  - upnp: sanitize strings for the MPD protocol
  - simple: don't delete mount points during update
  - simple: limit the archive directory nesting depth
  - upnp: use only music items
  - upnp: allow returned URLs to be absolute
* queue
  - fix consuming the wrong song after reshuffle in random+repeat mode
  - don't reshuffle on "next" in single+repeat mode
* resampler
  - fallback: implement more than two channels
  - reject extreme resampling ratios
* output
  - httpd: fix stream corruption with large tags
  - httpd: fix out-of-bounds read
  - httpd: add missing mutex lock
  - pipewire: limit the ring buffer size
  - pipewire: validate the DSD interleave
  - snapcast: fix integer overflow
  - snapcast: limit the client wait time
  - snapcast: limit the chunk queue size
  - osx: increase the buffer to 500 ms to fix dropouts above 48 kHz
  - fifo: don't follow symlinks
  - oss: fix buffer overflow with DoP
  - pipewire: fix race crash bug
  - pulse: fix race crash bug
  - sles: fix hang due to integer underflow
  - fix crash after filter initialization error
* mixer
  - fix use-after-free bug
  - alsa: list available controls in the "no such mixer control" error
  - software: fix race crash bug
* player
  - don't cross-fade DSD
* avahi: fix use-after-free bug
* state file: make the state file readable only by the owner
* log: don't follow symlinks when opening the log file
* validate the pid in "mpd --kill"
* Linux
  - discard inherited supplementary groups with "group"
* Windows
  - fix crash bug during charset conversion
  - playlist: reject Windows reserved device names
  - protocol: reject backslashes in relative URIs
  - recorder: sanitize Windows reserved device names

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 7d0c2072d8..a1ecb908bd 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  524c70bce3fcd268016156bdc97abcf5be1904f0c6fd622688999123e3c4c457  mpd-0.24.15.tar.xz
+sha256  06d606da69112cbc999f23c72e8eadcb6bac0107abea6e658e3d01f66ad8a086  mpd-0.24.17.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 84a0f389e2..6023578236 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).15
+MPD_VERSION = $(MPD_VERSION_MAJOR).17
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
