Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95E606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B3tQIm0k
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860AD608AB;
	Fri,  6 Nov 2026 15:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZJjkErWmxmh; Fri,  6 Nov 2026 15:59:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AF6AE608B1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980760;
	b=O2dh1K0sjLSMz7T0FgfFU6ixP4iX+nGV/TLsbsIwezqRuGZ2kAxib45fQQuMA8Fmt+3F
	 5yswPbIznz+TPOrCnwgwk0RXPKZWFHIDFj/QFMEILBK4jxuWSAXsQog6YbWQZjXKh7fsR
	 xEGpdKTMjOZu78nlplPRwMBD7EkapYz09VpgTqp41kjCB7/s3BnWdFMnuyZX2JhL7y9w7
	 5HVUa/aZyOksVn+HT166TFSLYDzVWSZ0U3o7vGi/d2NHumIQ6hCtTP+TDCRfsQwT1zY4g
	 3MaCZLcrhV/Vsozd6TA/CxeCUeTkCS9ToNwjifJfGt+DYBJEPczWm1OYcVEiTzgPDlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=GXvGp+SD59VMiinVIz1DZEQctnMa0aXAafgYS+//y4s=;
	b=F3QTbOQTrZoErA/lTK+85htE3zoyx69Jz+RZDEn/g/QtmjebsqcTDVJm8wO1DsKTe3Z6
	 kfvfBjJ7Cn2g4m5bqpDf4tdG7eaDHkmgyAxVgvhok3JgiY6PzUO/ylbseDJoNNUmrkyuU
	 N6r33Y2CDRo3XPX89t1f/6a1uH3WrR00yBiRY5OdJ6Pwh0FGJIrexxicqU2bdxEtEgUfG
	 GhK4YOTX9ojdSk2NpVBTIchbwEn/LikfuiNE/XcWeYahInwyrJ9dSvY4Ev+8D+j5W8GNQ
	 xo4B8kLAHztwlra2oGSxw83aMWZZY3Shd4HDuOsOY0LEpBCVQz3sp5iqXtEuGz2QS6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980760;
	bh=GXvGp+SD59VMiinVIz1DZEQctnMa0aXAafgYS+//y4s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B3tQIm0khh+T9DHllOVBY29phVS4SGA1fmPiCkQLJL9TXXVe4YgslbH4ihF+yAw3h
	 bxl78YdHixEdMg91izScb80sDQ13/H+KNQPAK27JT92JuplOLlfnHsw6WjZ0O1aeWj
	 vqazT4Vt31eVSZHxUSEsesqIRn2671K5jCsfjYHpp7PzfX+avha/Ly23xJFIidZs6h
	 YJPUKPIJVL1I3CT4cqXBLkId8Y4Ya1GYF417No/h7vgpoxQgqowH82Tw9rorXqjM2o
	 NCPurGC4Jg4mSJ3pc5KuQBHdbU8GFhzkLRs0AungtAHs69Imz8pOD9mb3ARbA8pL7D
	 YU3MMUO2NEdvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF6AE608B1;
	Fri,  6 Nov 2026 15:59:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDED4D3A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB43D6085F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7H-ZbpMcPBu for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 57CE8606BB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57CE8606BB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82A739E0A8; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 13:10:22 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 559f363bc3de4c1e92c36d1ca5da180138162225
X-Git-Newrev: f9dc1fa6419d5a8d0fef2c49d04545561b78dcc9
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.82A739E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: security
 bump version to 0.4.9.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1971910955964931440=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1971910955964931440==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9dc1fa6419d5a8d0fef2c49d04545561b78dcc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.15/ReleaseNotes?ref_type=tags

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fc7d8b6b899ed85fa7c4ee04653e390751bd3711)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 37dd1e6000..dc7d35fa67 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
-sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
+sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 49b9524c26..3f07cc356c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.14
+TOR_VERSION = 0.4.9.15
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

--===============1971910955964931440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1971910955964931440==--
