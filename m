Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BD606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pxbdVRoA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB94D40785;
	Sat,  7 Nov 2026 11:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uvn9nfpvGqw5; Sat,  7 Nov 2026 11:26:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E9942405DD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794050794;
	b=nxzYKOHpD4sHSaJg8MbT83e0OOGfrI6IWOF++c/jLbimIfo+JaoID6BxSYdD09S7KSBJ
	 QD3guaBjnSiEYgHDGZYbkem/VH2GK+pvXuVFEVNVIrA1S/Cx3wQ8zW5xbAndNM9TX7REa
	 Rp9tMw0sx+y2wJnggreQfKPj9IAgUU5HxsuT4WP4euZYja6yXqY43rPVUn49u4JeNY28K
	 EU8kwp9J1ND+JOogX3OBw8q0950NGdhrVTs7gs0kSxM3z61t1jKn0B07st43ueK6An9DN
	 MQf/XoL8dop3fVwjWs4gYGvOwEfJSk/xFNiDhKW0e9jq/MRTKLtpZAcum76/gKfGZsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050794;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nUcJpgCq/lUUYNh4DF4jO6e25XpOCABW8QUG+tGQUX4=;
	b=pVmIc8/5guwEHJQPybKv738UiTPO2wnabPQ5S/LmPlNvP2XNWVU46WAvD09QZnrIzZGM
	 EMBtikuFf9IUDbMdDBzHIVspSx9IVF4NztkZ4Z5hjnGyUWEm1baI/Vjhkrg6o2XYflSNz
	 dxdAFD1JxrAotwTcuu7AWTdTtcivNmILE7TiMZKymK5PLAZD3dc2EIBGIx7RqSl1VDwwt
	 V2SAUqTzPuhZYC+YXGXLpfI3/7zrX3DS03ZQp7GPsMAPskmKE8ftuQgq3Chz5AHi03UWM
	 jRPzb7RPVcY0iLaN2obHJk6JC+2unokvisy1h49Of+QoivFejqplo7JQsQRk0aJHchw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794050794;
	bh=nUcJpgCq/lUUYNh4DF4jO6e25XpOCABW8QUG+tGQUX4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pxbdVRoAJ6iRoSqa7lBKrogJpSr7/JlUTNTB2xUP6hZalg10A1A+ABmAsInIOO4CU
	 rFgBV/dzBkLajx5iVw3CezQFWAisIn/E8YBlIPAJplJlk7Cai4pln/0rEcYPzbXE7Z
	 EA79um2LljKW/K4VWrTiXMogzonYua755yANzktO+bUAQuskUx8LLSx+OkyshqBgn9
	 o+Bbi2GGXT3aMrePbTAOtSMGMnjL1r3x+3wz9EYbFuo2XlKn+KZM2eaH/srmVFag7b
	 m+iBide8HDA3U8Qix06/eBqIdtpo5bEZJMkbMOqx9WLhVyBqzFu5FPwL8gGrvIk1Bk
	 Xf+x3oX3kh1oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9942405DD;
	Sat,  7 Nov 2026 11:26:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 067B637D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECE4C60719
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ztj0wiR3YAHu for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 05C53606CF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05C53606CF
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9C4F8133F; Sat,  7 Nov 2026 11:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 12:16:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74448922f154ae43e70dc0ba400c9082bf24cf63
X-Git-Newrev: b922ae919859f69319302dea49685d63f1576f2a
X-Patchwork-Hint: ignore
Message-Id: <20261107112456.B9C4F8133F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix build with uclibc-ng <
 1.0.42
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b922ae919859f69319302dea49685d63f1576f2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Build error was detected by the Gitlab pipelines:

  Compiler lacks support for C11 static assertions

while testing the defconfig br-arm-basic.

The build error is caused by upstream commit
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/0d43adcbef9a061c95db60eb351937c27e2a0609
which was first released in version 7.0 and included in buildroot since
commit b68bde564339e96397929b45c04d137bb65df43e.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6eb3afe277..47cf560b16 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -586,6 +586,9 @@ endif
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
 FFMPEG_LDFLAGS = $(TARGET_LDFLAGS)
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+FFMPEG_CFLAGS += -Dstatic_assert=_Static_assert
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 FFMPEG_CONF_OPTS += --disable-optimizations
 FFMPEG_CFLAGS += -O0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
