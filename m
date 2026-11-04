Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AB60877E7
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GVTMk/ED
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A3140917;
	Wed,  4 Nov 2026 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWEf-k56Ggi2; Wed,  4 Nov 2026 21:18:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 382C840939
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827108;
	b=gE5hRie5i9B/INSDpOSD47LH+sjspEJiRt78apKPqMbvmp03XuHvb/4YKxhPQE7Ph54w
	 GhmZHqEgM4WRFqPO8b3UXGOwv3qfAl8vUtFQd3kxougwwz3/JIxBUQ1uz4yAqTG7u8EoV
	 c8U+dHor+EHTKQdTa5HfaJ0DmXjgv61yKJF/9CK/Zpxe9nZ83IUmZZLOAl3ulqUUamg3/
	 tqQnmk2WtOu5FRt/fX5Se6OfkBfTiyhHC5GqU4OpY1x6FZKQbWvPU/JgwCwMfCtp2SO8s
	 bhRPh3yCyEz5Ozug98dL9ZBQj1ynODJlcn3eABPfoZ22gzktJoaiS3MJ8KrMkQPLqmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sLUhi2x5pVDVxkYjSGINKg4pCammJnEbgyBl4crMDD8=;
	b=IfaU0jJ268D4zSdkJigLk7E3l2yH6bJGT4KR0FuHi3jdtuoXfoNybVEnGKYcZmENTzZt
	 6H8xkKM4IlUB7e2mGRXR+FHRUDfsEAnSM2h3UlBSMgJFiEhsEEDs7jpnxkPs27m7fhD3b
	 PekYjNgoBuv8JffHuIUTTdcFnJAcQCGaZKiJRtyMOWeiFHCiYltUmBBh8l0KdkqNHF90r
	 o0VIAWlTW9sGWqLYtHrcIERWoTzZEvG6aevYoUcXrzubljB30am1yc/mrK7qkjuHWatRN
	 GLDp6CFiVdQi+XsIa8RWKfTfKNOd2q0i83ETiSBpxupjZahhMIbWphxxNr2ZrtoYxzA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827108;
	bh=sLUhi2x5pVDVxkYjSGINKg4pCammJnEbgyBl4crMDD8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GVTMk/EDiX5qsrlDr8sTJmv4pqmWtd1+eh661LImcQWZV5fvNMS8i0ZsUfLO4llO2
	 X5yCNphNiohTcO1/Q7zvoMctE7aX8yOK3dGCdlhJpJYpATTr9sBQq4Z1I+FQPkTubL
	 IL8SzWzXEUkRf3Jav/1u1ppNCgCNtpEjMgS8Bm6QFyg4eFBmn4Tv2DLZcBpdu37+cF
	 cIRL5gI0kHpWmbRasUzdlqOy8Eqk306+avuSgI3z4JPAsOObvI19G1DqJz0njDpjtk
	 +HlkxJDBJ9gRdmpttd++L7fVVgOkdr9dmWX96R6zEQoUKEpK4xSzkFmo/UN/6XelzC
	 VUEH/vcVXsrtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382C840939;
	Wed,  4 Nov 2026 21:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D977BAFC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF4A96061C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbzLn2i-3FaP for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:18:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EEE69605C9
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEE69605C9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F35D29DEA7; Wed,  4 Nov 2026 21:16:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:18:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eec6313a54ae24e463dd6cbc058e00c981047e24
X-Git-Newrev: 20bb0aff7db09d0f5286391cbc5be7aa8a08df46
X-Patchwork-Hint: ignore
Message-Id: <20261104211654.F35D29DEA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.24.18
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20bb0aff7db09d0f5286391cbc5be7aa8a08df46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bug fixes plus libupnp version adaption - Buildroot uses 1.14.25,
which is usable.

Version 0.24.18 change log:

* protocol
  - "albumart": don't climb above the music directory for CUE tracks
* database
  - proxy: fix playback of CUE tracks
  - simple: reject playlist entries which climb above the music directory
  - simple: improve symlink checks
  - upnp: support libupnp 1.18 (and 1.14.26 to 1.14.29)
* storage
  - nfs: fix use-after-free crash bug after disconnect
  - nfs: fix crash after directory listing cancellation
* archive
  - iso9660: limit nesting depth and detect directory loops
* decoder
  - mpg123: fix "cannot seek!" error
* output
  - osx: follow the default device after it has changed
  - wasapi: fix race crash bug
* mixer
  - alsa: fix data race which could set the wrong volume
  - sndio: fix data race
  - software: fix use-after-free crash bug
  - wasapi: fix crash bug
* Android
  - fix crash bug

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index a1ecb908bd..b4b4b6e2b9 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  06d606da69112cbc999f23c72e8eadcb6bac0107abea6e658e3d01f66ad8a086  mpd-0.24.17.tar.xz
+sha256  afe8fddbdbefc7b3e7ee721fd0dd4e2276f29e40fe7e3c573daf5123b444578f  mpd-0.24.18.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6023578236..a017fe236a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).17
+MPD_VERSION = $(MPD_VERSION_MAJOR).18
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
