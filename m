Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5FC606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n9snUxgW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 676FB6060E;
	Sun, 25 Oct 2026 18:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zF2reXPuVmp; Sun, 25 Oct 2026 18:00:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5BFE3605FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792951205;
	b=Yir3Ub4jtJAAtk+JTOja1lWZCZAWDVwjR5eYby1Vof8O2EXbKY6P0xJrJaA8XeEw+EVD
	 Ak+55Ee72jhYp7916fAQLJvSRnxot/inTYNiajmBF6pxEUNgoDYwraS0I0mrAnVScsqQ2
	 EfDJ9LYHzIeK7eUwrqyuBdPYC95gIRl7fLN2AU8ZMsgTJ7FE1J/1dXMLwb942R3Yb8UME
	 2EXNNh/gI8HcZ1d4u3YQGYHY/1+Ldo2QXwAdDMPzuZMToesIkRMNGloQVBWSccN86p9Kh
	 k14k9vFjiyXOVNXy5x3YZqEHAKvEDfUyr8uPFGoR7WWYqmdKW7IXtMlZepnq85SuZ5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792951205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fbQbUB0QjTfkORbqa79nMouxOKPE1b/bRJ4m06ea/xg=;
	b=cp4tWMK6ZZkLJNiEJG7dbvMOLv8pmT+DvjSeSM+WJipZAEHkyZ+ClIgF19m6Sg5lB5Xh
	 UDoy8buLg8yAwoN8rXPJuB5+SzGxLci7Vo+9qBZY4H0iItY4n8BtPUn3iGXOqs+poz9TU
	 rpVmjaIQrjFD14fQlM0RW2KFuAyG2TBb7gPBUIn201i9KU8UvmVAJQCEutkp9/0kGXSbM
	 erzY0nmhF9uCdJsHxoaX+K/lJXLZKcZDXU8fgnxtZufhLfI4Ntvv81z2h6rxZS5lO3Ih+
	 aMx4Mbj3ZGtuqBiluNc5nB+N81w2iTLgZboboZaKWX31Fl5hZW85bfT83UTU/IHqzWQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792951205;
	bh=fbQbUB0QjTfkORbqa79nMouxOKPE1b/bRJ4m06ea/xg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n9snUxgWc5BCxOI4a5lE3S//BkmL96NjDVSmfDslmxTIXY+a1RfOF/IARrRL8ioLY
	 4HgP3VefWi632oyE2M9uFUh428bnZIE0/7qPV7BWXBUuxVlnftKCyYumIoXULXuACg
	 D8KSm24Ue7QUGKGCbNoxmpUQWNnQ3W/zyOvwHoD/TEVapiXfdG60AWC13s4bE0j8b7
	 Fu+INVocaXpCIJ1cHTjCT0YdQgvzIL8VgEhSW4cz/Ue4mj4j19p7i4aaIMfKuHMbQ8
	 yPYMgBgOCdWYFg4rfBDBGaJohd3kiG+oZCc6ciQaMQyoRXQqO2z+BYo53lU3TobL5l
	 kzcIlIB4AU20g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BFE3605FD;
	Sun, 25 Oct 2026 18:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5CF779F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D788F4008E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhARyRfWhBaO for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 18:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BA7E640057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792951201;
 b=pbuZAATr+kEmeo9KWhxD7kA7VHARlY72ubRwsnb0NDcjsVYo5pEthwIoV/Q9bKDHZCG4
 hstpRJ/QM658i2znxzH/49e2f1nTrOg7Wd0p7BHhba6EVxB8QZGIRP8F8C21RTOH4JEgf
 /Rbl3z/MFRyKWEw6xQKRLMeJVupombIOT3dyO7xzEg/1wYgOcD3jKBN5yF6AuoNbJi/jR
 Oand+mUV8bc1OhOPR05dGu5ct4FyO7+c3eKtTLpsEdRc0SYFL8Uq6ceSkQ1ifrfdlTYlu
 0A/AyrZrW1iS8Bu60lMmkYS7TnKXZRN3q7498lo72zam3jh3iwW7fKdpUI7+Dpzi7Xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792951201;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QKv8ITV+hrE3W5PgpzJZVfBNdwdqfw3CH0WkXCbBZFQ=;
 b=OePmGljgkbCcqmClzhfPYcBcdpWp4zUKshcuDHh2umDDe04m5lyH+umcy7sSNHPbwLN8
 FQNhlhNuna71/lme/WoSytS8yIfcq91dBPV5CXYeXlcUbi2uajAPMVUJy11j1QIWla8SK
 iG79CnqJbHsKPIdqG47Fybrm1Y/VcZq+Qv0Cq0u8MV803G8hod+/2oFsQZMqWrOBq0BFi
 uJk2fYEYkuw7n1QG9cu9rbstGn9S9V4QmktXwS7INiOERMLGxUG2Jxr4Kcp+UWhVLy7ws
 pTV1YOnCN5vcAgGpPJUr0+DJsv0934KHpyGP2lria9r1wA68anFiH0Gm+NQH5ph271A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA7E640057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EC6C9ABB8; Sun, 25 Oct 2026 17:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:58:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ec2d5b49b36036dc8cd9007f3a3d05104e51e25
X-Git-Newrev: d6c8b409ed4c6bf7abb2b3b99dcbb9397bf037b6
X-Patchwork-Hint: ignore
Message-Id: <20261025175836.2EC6C9ABB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update version to 0.24.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6c8b409ed4c6bf7abb2b3b99dcbb9397bf037b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
