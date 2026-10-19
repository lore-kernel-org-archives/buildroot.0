Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267E606A327
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O3FA2J43
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FB1580F67;
	Mon, 19 Oct 2026 21:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOvv39_pbBNT; Mon, 19 Oct 2026 21:47:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1EC1380F92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446428;
	b=mKXTYysXaD5HPpNd6SvcyzPdfnRLZ5+uMfo7w5WTb+ZrQCeqdaaCbF3s9ZH1K+TV03J8
	 yiEiVHp1N7ecphkLu1L+J6q0V7HW0ARmbeFh9219FiwThox+p0loVUBVarFKEYR3tC3ag
	 zVzgbjGCzFhCbQMSISccbaF4q7g/Tk8xzy6N8TwpSDk0Yz3aUikvhVEAhlJITaaIoG/mp
	 uCGRgQqUFNa9yI7ofiUvOpBhuZG5jWu8bmAc0qyODFqxDmH3Gepj8Vr6YwaPc6GTy2X3O
	 /oh4gsoy9cZlqjeFSZluGJIIgjTBhvPM43F0Jcd02A8fBC39i/wBfAol6poUU0JcqrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446428;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GS06XMU0QhFSYzUXX8pz7PqcXyMHmvyRDhjtgXLJbJk=;
	b=plkqHKqi/1flKIpiKFO87zJCmoKvealoZq2CJYpnlBEfd3S7ivsYUzcRcUfsT+bUNluM
	 XSmURjz99t3GDR4GWVwUqx6kIb1cuVNbCsKfZG61XhLV/3j6PNC/fDkDUGtFdvnT378Sc
	 YuQazH4sJmh9cOev79udw7RF8BwY35Dq316myBrhT+Wmq4z8488bskcxQZX/7skaRC6Fm
	 RuvRECs5wFRvC+y8UkreTcN1JiFqZhDiE/9bH+v+x73I4lpX9juD+5h7RoWRo9nwowis5
	 icr1qkVQ1IpuX/OUj2tEm3oD8kO2jjxGC94CAI219LmIVSbqE/si7qkJrNaMfiDcVyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446428;
	bh=GS06XMU0QhFSYzUXX8pz7PqcXyMHmvyRDhjtgXLJbJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O3FA2J43WtE9PWOZ4af5FeXs/tjqFtnlfp6yYKp2HQvWN4aEg6NsxpzXYaEfZcEIj
	 xZ2TBuU4YhsyOSb99+oLU25rxNSTTHd8Ow4NfKY79AdOwNZ/JFdPjRja5k7UfFGD2Q
	 36h37KyLmXBOmMqLSptuH3LDrwbXK9qHjMg8JpJge+CErO5fE50kE1eyILHRV4H14W
	 EPrEOuP/T0+99drLRnZAjfJKiv4bsdJEVbDnmFrfJyzDaOP+6y/yuEY7FzCg+35vPV
	 KT31Z/oIdM3nWaOrbCBrueN9+0vIo+WqV88GGVJwwAwmWPCcc5BOrnecmpxt8xhZta
	 cK1b7ZNew1NKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EC1380F92;
	Mon, 19 Oct 2026 21:47:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCFF211CA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C890B401D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqdwA0xc3jpZ for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 28276402B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=gIPCoQlYOyX/zfr0gVQayTtnIXwbOShp3pRh9LwueAQinJe6MfRIYe5dTWJ8J+Ufybkb
 vWadK5spus7i0HcPuleRqmyhpR1SnIjcWBVR5ba7kixZdUWPWcBusuCaTX7AvT/yaHWYI
 G/lvy7QMRPdVkm6qVunzG7ppSCJGCZvuhWdhnL04AsUye1P8DtI/u7PKvUhiIs78V3HFF
 n23ay2xEO+OjVgPJ6G3Fk8V9nXhiVj4Whj2hooVeZm0W8YAHaG6YfRl9Dx03t1jBQF28F
 RF7v++bZ+0fa71s7GpCCLY+RW0DazxR45YIEFyG0W45rif3TxqWr/Tcg0pM2k7+3ExA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dd4g/yi5F9mctMOWMSPPsgyLvZgD+uS5SwKOi+hyTxQ=;
 b=VlVJZQgby+E/XthuzqsRiUkCIuOQSevH2cIKyllOT21YU0EgwQ9pe28r/uPbVnNoUHtE
 VWxXTkw5yLOG2ADx4OtUUjaP9lWaQVW7Db2igeKFGdB8VcAZMtn61dWHdbZKzi5VmfRYJ
 dObWdAimqkskgaiMwSXlc5ObqhzahrZTpKNVZ0Iy3QNwTveCLVbNFp78FDXLDHGjTGNtX
 yDOK3Qgk8g8GI5RiclhEuu4/hauPWO45ReHXLfXWvCooVjwDgNoiDkGFwvyE85cbAjDWA
 rCugegFkAfyGZwk95/MdtMWhXxU5r2SXSxk5MXMBdpHfH88o/qZ0II9D4y6wRq0a/VA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28276402B7
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B2FA99626; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:18:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 396e388f83af8c54bd27ac59e584fd6daafbc2d4
X-Git-Newrev: 145d360b9ba62cb918563c034eb1218956db61d5
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.6B2FA99626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_image: fail if dependencies
 are not found
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/145d360b9ba62cb918563c034eb1218956db61d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that all optional image formats that are enabled by default are
handled explicitly, we can set SDLIMAGE_STRICT=ON to request
sdl3_image's CMake logic to fail if a dependency isn't found instead
of silently skipping them.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_image/sdl3_image.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index 405533b1a1..954bc3e67a 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -19,7 +19,8 @@ SDL3_IMAGE_CONF_OPTS = \
 	-DSDLIMAGE_DEPS_SHARED=OFF \
 	-DSDLIMAGE_SAMPLES=OFF \
 	-DSDLIMAGE_TESTS=OFF \
-	-DSDLIMAGE_INSTALL_MAN=OFF
+	-DSDLIMAGE_INSTALL_MAN=OFF \
+	-DSDLIMAGE_STRICT=ON
 
 # Without jpeg, JPEG support falls back to the bundled stb_image
 # decoder rather than being dropped.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
