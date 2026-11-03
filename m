Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84120606A324
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 04:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bhzOgelD;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=ixXGIflI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C3E80DC5;
	Tue,  3 Nov 2026 04:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d202keEKwkB6; Tue,  3 Nov 2026 04:10:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AEF9280DA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793679016;
	b=J/hzGn3LnVdGgfhotTtM5a/H1ckV/pRMkAIsc+xN6ZSEeyZiDJTuRc6gIVe4OwQQbI3k
	 ZpPsb3jFIhSEq3O/4W1hncRLeZxih0cW3s36YGrfuikRONWZwzZhsmZ1J8jBRxMa4cHjj
	 G1J2/hZxSSfR2Je+kUn5mcdb5giZTCVfOsX39iDAnZhewuBNPypiN0If3CSU3N90Alqug
	 1t7lkpvNxdGnxulagapKHQLerj+hmn6xHyGOdKDWMJQIGdbVWI+9vry+JAoc/+Ol2oQNH
	 bAzZEXZdmbhhDrKNjDCnh+5tDm9Z213dvUhCsWvkKc2yocO8QyFOqQqT7GoASzHf7IQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793679016;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Virus-Scanned:X-Virus-Status:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jD8ZNwpOtvccHaa4a4iAEsonhs1CdR/H2I+kjMoPFKY=;
	b=QfvOTA1upWL0cx8Tl5TESuNf4ExBV1yWbnvZnjiisCb1nc0drqY8xOUHfyNjjBZEHFXt
	 CLLlm3ct1TIMLjD7FlPp/QXqZIh5W47yr+JOutDtHnqocuZsRj2NDAQYvJV4ceZ+/t6NV
	 JkiNIR5pAs+5vXekOtfGWsrmdr3GiYv5Uj1iBnuPIKnm1RdzN2tvHkT48S1fqcPNoERpE
	 4PXAaSNnpbV1QZIrkKx8KU5RpQqpK7NwCvDSOrzFDVih7xxD/mEqWwBJP1EKQW9CLWRD5
	 kxwb2TAWTv4Qkgrt5JmK9yUIBYVc8sVEc+pl5zULzgJV3waqWDr0sFP8T9LWQTROuSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793679016;
	bh=jD8ZNwpOtvccHaa4a4iAEsonhs1CdR/H2I+kjMoPFKY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bhzOgelDiAkNCiMLEu6e2jvp5zbJO/gqsO89kxb8n+7wxOTHq5oZ/81DMPwXKakae
	 gZuNogzAsFLUVllfvJ/FSyU4vN+FriAklCrzkZVIokhFOycQtLM0MgshLa5tJRb436
	 daB5Y+K8z3C4AOWPcgJxLD2adTsvSgdCzyTTLU3/bUzCzZYl08Bq66JfZRXFMT/NQt
	 fjakxB1P48o8u3I4ZTBpRFUXskH8Ql5UvFvO1Wr60E0FwztmKQ7W1Ji/YGS6xcq0Ec
	 GhGf7px0mOLoFD6+QBHLt2vZ9fT8Je0hFTXLvvjdqTCZ10wYQNJGtJa9AaS+jbTO7z
	 HclY26sf+gu4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF9280DA2;
	Tue,  3 Nov 2026 04:10:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F4083B00
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 04:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5890606B6
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 04:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fWHBNq0gcC9 for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 04:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D9767606A8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793679014;
 b=PLCROCMxLjb+fcKp7roDRoejz6le1lS9aEWgMA0CwLK4xJuXsKqY1IRAN0Bonp+fb2eB
 lqt2xbAHR/FxKMogaYa2DWtwfSSaKUk4p5Js6d+hXxzoRTqEAzk9tzxoXSD9T8/9tk3On
 kCOoIBhew/glAD55QfZdXNr+7jKEEY+egVWazlAIBaJcmpnkMHBloAAt93D4EypzdZs5w
 Ryba32EuDoLSAO5eV+q2urkVGGTV+VCnAEpoNwrOkefZ2Usl+I0AP/Ok7+vZW6f9PK140
 9+lFF8LHVlfTt9gNIlROpH4MoszcoE/Tf3ojvhBn8yoW/2b1O82bWWWCVF1xktkRyJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793679014;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Virus-Scanned:X-Virus-Status;
 bh=W9Ll3ecjubfj8Cb/l6/67o7TTqCserQjgM/2YvVuOAE=;
 b=dtpEAD8cNyV6W045krXpo27P7IV3rW9U0nJWVBppwIWBK6LPdBFhik6PzmgxVa+oXQAe
 m1x1t72XqLRWznY1mjMCQPqHN7Y7kbojgftllvLoDc1XabhZ66mDpXf20IBGtuiWU/RJH
 MrB84PlYdjGnkiEJPFNepyk3OVVmD0d+KawSUBGLne8ubfgoeZAQ9v/uIy6kFvEkrELQ7
 jn5YfvNSXxn0PqTKUq5e2c+oDca+ochgiIV7TIoZixPi1dgeGAD7OCkl8EXOCYqqG2WrT
 8/m/8ny8IVFeZu8gEC6vQMcGVIel5dzbKsMB5hjdeiTyPFBGymvV+d7T01/zIwbPYEg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=umbiko.net;
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ixXGIflI; 
 arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ixXGIflI
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9767606A8
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 04:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1793679007; bh=FGX/My5iQsH2T1H7rWsjqK1FnIdlXm9hkryMkRvaVf0=;
 h=From:To:Cc:Subject:Date;
 b=ixXGIflItp300jSdfse0zI0DbBB1FMvkCRi9+fHNczoZPgQ1p6riUaYeg5PjJ3TXs
 iBKvm8zn6NKYbXNkaNokrOX1c7E91AB+BL/eQ2VvgNR1vVgmjX7z/ODi0FmPWEPYeM
 sHtXM/Z1wklQJoxI/Cms7kglrUnv7nV0jD3ys3v8=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 7FFBBBDE3543;
 Tue, 03 Nov 2026 05:10:06 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Tue,  3 Nov 2026 05:09:46 +0100
Message-ID: <20261103040947.211239-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.24.18
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
