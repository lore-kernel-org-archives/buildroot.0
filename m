Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD6B606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qYFrON2P
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF21160600;
	Mon, 19 Oct 2026 21:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1Rnr_eLVdsz; Mon, 19 Oct 2026 21:47:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CEAAC6077A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446426;
	b=RyNiA5DRkRp5moN/+lQDLw8jRb61pnluwdTl3gtjljzyFV4AV1hBs4dHvWE/IONMzxuv
	 UlSeyiuUPafZpHf2vRePv/VIhsS83PKjE6Cv+Kk22NIDA83KJQpvPpF7twr4Zc/l/4BAb
	 tnKecvo1OHZdPTWanVRXUMUCLbzQsi3Adhp0gfH2eQkctxm2QmFpWQTOxmBKYq67Iwp0u
	 3q8NpK4z7hy5U2eMz5rBnlfDDSSP5p3wD8uUfCWy+jGCRcPoBKDtBnpyMk3onfVfOrZXo
	 PocAONb9iVjfxTt3Io6s1G4j18F2kOi6zcifzyuJpBNV3IWxFFh+eFwmLiBTKvzSFxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446426;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cNY7az2xXnPJGUPJDGHt28qvQqtdiN02GjCEiwb1KeA=;
	b=GnILconPKIbeNnthnDIsPqABiXFYczC6wk9pml7UdVQ+MB8lZdfO/tlLN1VaoG1c9c7s
	 Je7eDuDkmoQU6dS4/QBT9gmMry5OOQ5bOi0puth0zrkNIVDu3CN43XUA6B/luA4GXoyXQ
	 4sB+XHwKyzqKAdxg5l/H0rOkvgLMiVYlOcgXqPidyrR26faSyeXB6XpD2Ekl2vpA4gnmu
	 PBULOvKUI2f/DWqKZQaOC8meeyu4Q9lW7EZnCIDnsRUoXeJmQaC3lyV8pt+/JWAohe7Yi
	 HQIqNtBoh6bI2W7omPixC0v4FS4M1Y1TJvP8nt5/zse3zAmsFoRAwxATQ3jgDJClK8w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446426;
	bh=cNY7az2xXnPJGUPJDGHt28qvQqtdiN02GjCEiwb1KeA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qYFrON2P1hJwB2QLOGwLLaViHK5EC/POSObpsF/Rq9VmF2AT+qiHnexg6/mUen1dO
	 UqlnoRxodB73fA8MEjHKtfdfBPHRuPpHjRMHkS58O/5rjwralnOiifEVDoVuJm4H6f
	 rpDGuMiOz10DhKyV3WY1d9ZB5rd7iv2Wo8aOJWSpW3ciC2bPVHRVRo1HVG7bArC8Uo
	 jZi0PL+MjcDDf0AoFwkG5kiKrWb3KXdr45PeUgbz0Nf2yydh7veGXYKxkUVLJIJSnZ
	 dGFbUUUGqXxy4n3osEy9pVSJFULM9iRwaXBU5ClaJeTmNc3KlhWX+PUS5hh/uAz5NB
	 JPg4al766C8eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEAAC6077A;
	Mon, 19 Oct 2026 21:47:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA3112F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B04AA80E9C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_gBRUnq03Cl for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1A56480F67
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=g1dSt2xrRLTsN48DSWoWuT+Z577gwGrnLVqacz05vCtlQT8RdOYJvciUHJFAmP9+R1YT
 QKmKCCu5EMdhuvD1jVVGOdfki2yPIcHY2ziI/FlSnndV9TfC+vd9abtJpnQZG1YnCYKr9
 9mVbHhkAAoMr1upPR/wvHQ5uH5smBuincaHHJ0dvocr5Ontk/PhCbH2JxXA0gqNcCqYVH
 ltZQXFAmlVScJHXAhnNxfL4a7h32AfhBALUSvneJMgSB8XCocXLmdHeSk4qTZn3u+/rw3
 rPKe/0z6s2q9Ab6eCH/vzz19r6LizXLteA7C1JO1sGR6VNc2sfD/ecIjHBXkWJNaKTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8R0aAbGFFRGPDxLsbBx8azN9+Lw25aIp/2O3bd2jo/s=;
 b=Z4eUp0AZUdSzQSvsMvzqf1Ixtm1b9MfP7kw56Kogu+cFwvpehgzZd6lRBgRUotb/XlZV
 xpcKZGnvkogqdYFJv3x98EcNROScx9JZduoJEhWo1m3GC8h2c5MreYr9+UbWMn/QUdgbk
 /qpgJXqXlGl4N1TtU3HwZpvc2NOPzhhcrY/MK0vlDJGiluUSs0X0+pGmpT1mOdfR6WPpP
 A5j3BVDDFk74m8OIUj/lzH5xSDr5LWYtmRXMZz5vSsOTBChto8WCttYRbogwz49h0iNqV
 x7YGh3pAv93RswqUdx2YHKoICzqGw+dsCBHBK23IacbTucb7QiEw34bMRJ0/PDKvDQQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A56480F67
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43D9E9964F; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:02:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc8a47c1ef07eabd14789bf11a41eee97d887466
X-Git-Newrev: 1f02444f51c07b9cf7d9d4a644a2709bca8fad7c
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.43D9E9964F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_image: disable examples, tests,
 man pages
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f02444f51c07b9cf7d9d4a644a2709bca8fad7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_image/sdl3_image.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index 8f0718abbf..a2b9f62fa9 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -16,7 +16,10 @@ SDL3_IMAGE_DEPENDENCIES = sdl3
 # Request dynamic linking to dependencies instead of dlopen()
 SDL3_IMAGE_CONF_OPTS = \
 	-DSDLIMAGE_VENDORED=OFF \
-	-DSDLIMAGE_DEPS_SHARED=OFF
+	-DSDLIMAGE_DEPS_SHARED=OFF \
+	-DSDLIMAGE_SAMPLES=OFF \
+	-DSDLIMAGE_TESTS=OFF \
+	-DSDLIMAGE_INSTALL_MAN=OFF
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
