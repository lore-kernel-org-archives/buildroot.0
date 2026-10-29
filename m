Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253C606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l1xuBiT7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9148940B1A;
	Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0mKqX4QofAL; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5DDF440B2E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369167;
	b=E16OpSgpUXPrwubcGjY2m6aawxOw7ZEYaCUJo8R7o7NLWC0YPDDzLKPk1BnuGlj567bO
	 LaGCUXdxx19mMx5n8PdfCmasfHzz/ReXeqNu0vj15e6Q5pAz64uL4rLa5jOJMdG37ZVNE
	 xA27QlDk7NBHR9RQn0IcY32wzgmlYaRRV9p7600fc7qPk2Kz/yKWGkbCtMJ6LiTZDDLP0
	 lrqGQAX1MglUlmFDvLcSroYoq7If2UYCTJ6fkmDOHD28zX/kvGeQf2rVDgE2BhGM+8Dzy
	 zEaKPkMIfkvYzKNVT1fUtgp1wtOSsdLofDgFt0mJpvUo2Rvl6R5bY6pjlO5kkQNFlRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=O1k8YfpBQcCff8Tts0n+jelupOa+5/DgoFmjfwQ/Vz4=;
	b=rFNLcPYy9f9KF7qXeaY0DmQBXa/ZUR/CadIQ69v1A3+on5sw3H3zTMiXh6D4SmO7uwV6
	 W84wRrpU848ZOSNskDwR3xzbPolJJbKajQlJmizpI8WtTCXyTXN3dIbexLXProl+QI65d
	 Qq+vmR+m4rAFbATS/70ov8CRx4Y9yj2VPP/Nro8I47PZCtuJA1opmPUd0YPCoSJaTQ6Dg
	 lzt2ekvdmQ4TuWJnaZcbCE8S09p4xNnu+qTSZNKWkes7zEWQCmI9SlQS0ERM8nTGnN39a
	 QaKqrnCqgNUuEGKwsFxmkyEiNA81jty9RZ5FptAwzo1ylBQf3W/Uj7r2UM4hWt3KICg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369167;
	bh=O1k8YfpBQcCff8Tts0n+jelupOa+5/DgoFmjfwQ/Vz4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l1xuBiT7C3f2EhQZovf1evFEYtmzcYyV9Za5Wgk4oIBLoLHTj7OWHHQ764B921u7H
	 GB1ZGkTyyitQ6M0jtl3yYBLyxOkopBX1cLK2+IF9IImM6n16dUN+4By9al2few3Y/h
	 ggVIyHkhMyd08Rm4eELYCjlYseGvNLCyyz++4ZIKDe1u0V4d+78W54ry9+ej0RaEjE
	 sAPC8sjKotmyOlruyeVpokWEGbFTfRI4GWTqsB6OHemE2pBeqZ0orjSmad7ZGgDpCA
	 ghnxPJQhAEbxQQcodmT8YmXEMHZQpN7wmIMLAgyPpkD96WVak6tpvta+bAPo5J/Vrb
	 5fDgPU2LlLpqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DDF440B2E;
	Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F41AE362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6A260AD3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpVW65a_AmPo for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1116A607AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=C1ZSfgkFj/YeWC/ebP/poN8EotHI+d04oNiQTWsBg45c5qlKycrWKBp5iI16M0YP7zQ9
 hf0Jk58/flLO/T9Kby/cqzwvV5SXsRho3I9OnjuLXgu1qg+gb28tMhTjiUECUNYuRVb8S
 x0FNrCtNTHylZ85KSBA4kFLBYdeoj7a9Xh/MeRgKYogWdXbjXE9EztDwZori0b5r4NQIU
 kKCd5AFn8Sy/gXP2PfkixHYivSP64GNtL63IPuMlVTc0Du0k4IwrhhG/qnWU0NmAh/shp
 rKmGzEEIwdoK99KMLBoV2mtD7ebZQYdsZP7mgEalKbJ9gwwOd+XG8li3JL/J08sRKZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=isczXskiC8pxkUJDqUr6eYr3tIIfdj73tI/J9CJ4HPY=;
 b=CEr1dECQQLtOPL/L8j4KL7qg8eBGqR6LUby12ToxL6q9ThyTFYKfO4rHfZpXzh2/7a9l
 Gedg20qaDBcO3aEGfhfH8pjgsWV///lcqnCgNtbnzgXsmy4S+wGwS2D4B8yTwjJNE4n7z
 cyXqYIbiNjoWyHAoxC/LU3fDUJy49NAp9qFZbeglhqFFyZVSqxlxCkFZxtI11W3raLdpB
 Re4tlse21lCzLjSQZepdD9up8zK9pA4hi/NzfpSIYTzKk8Q896GCmoQjw+JXfxzv1tdN3
 PRmDSPcbD+UjCTNKKTxJprd7YA9BzQHl6Rpg620l9PFKzw1qfyms5MSug7vP1/J0sxg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1116A607AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E39B9D38A; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f118b1d4459b60cca4ee5b5ccf18845ab37dc477
X-Git-Newrev: 0c598e3e8124fec52ab9f8c8438f85e277dc6924
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.2E39B9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: use host
 entropy for ARMv7 emulation
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
Content-Type: multipart/mixed; boundary="===============0507128937281504084=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0507128937281504084==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c598e3e8124fec52ab9f8c8438f85e277dc6924
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When running tests depending on entropy pool being ready on armv7 (eg:
test_openscap.py, which runs the 'oscap' binary, which tries to get
random bytes, even with simple commands), the test may fail on timeout
due to the entropy pool not being ready; this is confirmed by the test
being blocked until "crng init done" line appears in the kernel logs.

A solution could be to just increase the test timeout to a value large
enough to make sure that the entropy pool will be ready in most cases,
but it may be hard to find a value that fits all use cases, and all
tests depending on entropy being ready would deserve the same fix.

Another solution is to replicate what commit 7acb32dabb80
("support/testing: add builtin armv5 kernel 4.19 with entropy") did: it
added the virtio-rng-pci argument to allow the guest machine to use host
entropy. The armv7 kernel used for testing seems to be built with the
relevant virtio configuration to allow a similar pass-through, so pass
virtio-rng-device to armv7 kernel when running tests.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b53c724eb25c32ba73e68e61219fc53f601b18f4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/infra/emulator.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 3702ee2d48..d690949120 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -98,6 +98,7 @@ class Emulator(object):
                                          "vexpress-v2p-ca9-5.10.202.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "vexpress-a9"]
+                    qemu_cmd += ["-device", "virtio-rng-device"]
                 elif arch == "armv5":
                     kernel = infra.download(self.downloaddir,
                                             "kernel-versatile-5.10.202")

--===============0507128937281504084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0507128937281504084==--
