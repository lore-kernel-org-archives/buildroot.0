Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE9606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E26GSN05
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D9D607B2;
	Mon, 19 Oct 2026 21:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iemRDYeZMTYT; Mon, 19 Oct 2026 21:47:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EBB12607A8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446442;
	b=ZQmMYAnaYYXfNvPV45Zhb1d04YAY6gP5iaWDL3trfrgM5yJSplDiP3GzPRpqevqUx5pc
	 Onm0Uy5Foq+N1PyTbcull+jKtHPKaW9sGpYJ4N80SL/RIWTWL5BghkKQ5VFxDT1OP2e2d
	 9c2EbCR4OZDBxA6sltmYJZvVsy4PQAtHp2pmTFgO84zeECgyWnfcdoCp+8KUJ4bNTrN3E
	 /MY7fi5YKagP2eVjFgJfn/i3yHtXiOXx1Nk10NOWY9KBgMmhzHU7VckgHQ+xOtsK2w0uV
	 WJkEVK/y86E376IZdYZ9x4cpO6vLglzLPJu1wJPE3y2kefIRURuH5D9eswqPFmEHhsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/M5ac5LR1df9EO/5ecl551NCjtPUvMl++Q1jjt+Qybo=;
	b=mBYGrebJail/b2zUZZ+Ymx4U1Xpj5IHnvbmvSj5TvhcwIC6Y3oo9bXGFfOE9L8L+GtcP
	 H3oA3c+FQUVtCIwvUjZ/ZlCiRrolvxCUOOswDGoc5hFL/237xIEWJE2aNC0ovqHz1GNPV
	 VK5ti+wdvcruXlBU6hEw9EX0B83q/KuQLtlzxDg+OsZNcEEe6eMKSIGyCJ98/fe1v1j7m
	 zMyrrt27IiEry/Mu/5MLPGaUw+f43ozhlIJwRSJc38cYnbKuRp53TodQGYdoyzUZWJwFS
	 8/xMjXYJH3tqpBuwm7A34vBst149IO4c41flAtBiY3oQqew0WER8DEJPRApFbuYjd6g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446442;
	bh=/M5ac5LR1df9EO/5ecl551NCjtPUvMl++Q1jjt+Qybo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E26GSN05+tN8+gmmFUTyrEFUp+Lp2lqNFg0l8fSFo5aeBnEivBGp1NtWlKaLvKNlV
	 wqiyiKNJ0AyX4YlAFbUi5A5wlVAUMl95C2WBbcGECjNW9EWePjQOREz74z3ek6gB7W
	 QVloSlclHPIqkedTdoiFd6ORAXlcF/LtzX5D5El4EF9VrPIO+jWe9UvN0Lq6llHT+N
	 RqrKu6wcV2iKCdeoBFbgPpi/EfO2VzofcnR5+CWo9K8n1YQJvs3Y4+WY0E9d3IdKK2
	 TMDh0nEpNsB0kZsPgBmTa3TBBQ/4foE729H6aukybNCQZYZOWQP/DqUs7Ry/0jPbzr
	 eDZZ7C54EYs5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBB12607A8;
	Mon, 19 Oct 2026 21:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C63523F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E35A80E9C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmiDffRH3AxG for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5951A80FB4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=hxK7NvrkilV61Ix6ZvO2tQmRjreqFZrZfVobpHCj+izxDsVQB9p7WVZockBT5XH0yivi
 g2lV+TahrEyWSmjfCnraXITfyTyYB/uKLFjhMRHhGici/PqVbE+SqU99aAvu6G+YHyZ2e
 Y9D1oMzpz6RkHUiKnvYeBDErd2+Q/QsRDwWcIwA3YrTQs7GLHKPH2Gx6ay2iS2VUtt6+O
 MVgjnzlvByNInTyDMOWfmR0JItNuimpsqQuXDoiSXLwnKLzRxqp34EjnSt76XvCodSn1i
 Ui9dwC+Sb2zrySw1Pk1jlSFMFAMyFLlDn7WjPWkC2dXG25b6tbqGvLpK/SzGkfcQsBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lieVIR4QaTSFeAwDkt8o/5iA85LASekVISeDuQlo9uA=;
 b=XlHfaLyRiJci3BpvxYoxMVL8FwkHv6ZB/cYcdB7hfr90w/muWyo8UUmLzY3EDL75+AVi
 75JN9iuLj4a921ILj4k6kAcKWaEDhmxN4Zy3CSi0k7EQVPYSTLF1AZW9JIj+PlF2O7B+E
 r+LtBFUO+FPTPbUV0Syw5+BnxUJmFpjLGvFMjSIw9CDqJPP9Hn0ST5kQVYqoN0qW9r5sf
 J6n40z7/j0tOOiGCm3OvHhQnKMplzm0dHp7XONbC2LBlKgImvTkgHgfL9jXhFBBORDUHH
 EjlkSRureWsY+F7pnH+AX7vDFHNpq4Rzdn5AvHWA4jnSo06UznTtS1/STx2dygO1Dmw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5951A80FB4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0C0699661; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:43:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db985afe7988e1170b817a43740c0dbb3998777
X-Git-Newrev: 6588d61513f8eccf8c9a1eae6185a286d47ece42
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.A0C0699661@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_ttf: be strict about
 dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6588d61513f8eccf8c9a1eae6185a286d47ece42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Instead of silently ignoring missing dependencies, bail out with an
error.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-6-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_ttf/sdl3_ttf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index 6bcaccfaa1..a4ab8f3e90 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -17,7 +17,8 @@ SDL3_TTF_CONF_OPTS = \
 	-DSDLTTF_VENDORED=OFF \
 	-DSDLTTF_SAMPLES=OFF \
 	-DSDLTTF_INSTALL_MAN=OFF \
-	-DSDLTTF_PLUTOSVG=OFF
+	-DSDLTTF_PLUTOSVG=OFF \
+	-DSDLTTF_STRICT=ON
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
