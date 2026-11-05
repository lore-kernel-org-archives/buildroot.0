Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F331606BFAD
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kSSNljRa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589B781750;
	Fri,  6 Nov 2026 16:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZvPU5YHnDIs; Fri,  6 Nov 2026 16:09:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6D84C81703
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981356;
	b=QV3VzmrhH47kuU31LhAB7S1SwVhzoFi2AWOdwML7ilS+TcYjJtn2B3+qwiVCJp/fgyBA
	 NM+M2i9Bl2qyOkpB5VuLlGFE+2+hzhdMxynJ/iFjuOpsH0eYLSr/9hMx++2bhlnvUSlVn
	 Y1pON9eCkP8a+GDgShyaW03XPeegS+6JLMvtVorv18sGqasHEfd6MRTE6Su01MuG/kweK
	 HEEfk5cW5OwrqjJURV67wmv4KyykeJ7T98uZZg34zG2AIQjew99Za603o4Xn0F+ypNZoB
	 IHilTJIGUN55mK0N6rW/wsSqei1jxtGpF8DsTPkBC0sT2FcUT5xbUsDlfzKNWqZPrZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981356;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LkzQx7gTCg8teetyR5m407DoVI+w7O3hAAdjWs/dHuk=;
	b=Hjtv/wxCrlhQP6Su0nWDdqhzTtC16Cl/u1iwlTs4N5LYZ1uIujO27FqBh143kmKR8+K4
	 JMitBU7XM8dtz6rl0SmUtQPITgItAZdGvx6Oe2FYhtFGIYNgSJKoxrZYtuG18+ehBA9Le
	 C4Zuqgck+Pvvmg5h98Xo2AR+AqZFrHij8rx2E6l4KsM0SSuupkjUZK+ARF9LPWVO54p67
	 6kYMp1OGH0WPwZy6TZIeBn2WfNbn91iMjtp/wtHn6KOKt2qTwM0emfw/1gveYvk48NkVF
	 q1Gox2I4OijjjKxB+YVajJIhmi9KesUCMzS7INCVBhrLZNiz0edFwq8Z1oMPuVYCtCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981356;
	bh=LkzQx7gTCg8teetyR5m407DoVI+w7O3hAAdjWs/dHuk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kSSNljRaYj1AFlN6noFEc+RMZ0bEQ8aT28sB0NWY7ZsMOTdoQiq32ANs3fTzsy5Ml
	 aymmfwSxHTpeIEdFv5XHZX5sZ9oQ84icHLnmoKGbAMvXd6LPKrwNH2umWwGCkCzX/H
	 ebOyIVxtdTKjBcL3PDVw6FBJL4bOBXjdH7TYI5DrxsCAjKMu/yJa2a1EE00LlEzT9m
	 xDoplsB4UjBKYsvfmNt1g0kosKgreOQWNRHHLsHHbUfDFlxWd2OR8OPcJ2BPFuFnio
	 6+d3xLGxBhpe/9YQuuHQBw7ujEW0x2mwKzrxS0qgv6GdoSGH3/fvJgmDjTX3fvoCPp
	 wDuc5y6yKI5Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D84C81703;
	Fri,  6 Nov 2026 16:09:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A3F44B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50299608F5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSCCw4iB4WST for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95F79608FD
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95F79608FD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB7D99E0B1; Fri,  6 Nov 2026 16:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8470e451256151ddb3f16ff6de0f5a41dc91a055
X-Git-Newrev: a46cd58f6f953a9afc7eeb8a074d3483e7c75253
X-Patchwork-Hint: ignore
Message-Id: <20261106160709.CB7D99E0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mesa3d: fix
 dependency for i915 comment
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
Content-Type: multipart/mixed; boundary="===============3258478046085728332=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3258478046085728332==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a46cd58f6f953a9afc7eeb8a074d3483e7c75253
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit 52ae9f49b215 (package/mesa3d: i915 Gallium driver needs llvm)
forgot to add the architecture part of the dependencies from the i915
symbol when it added a comment when LLVM support was not enabled.

Fixes: 52ae9f49b215

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3ebe90bafdabf8c444d7a9a90bd592631614c58c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 98364563a4..5b73007456 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -154,6 +154,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	  Support for i915-based Intel GPUs.
 
 comment "i915 driver needs llvm"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_MESA3D_LLVM
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS

--===============3258478046085728332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3258478046085728332==--
