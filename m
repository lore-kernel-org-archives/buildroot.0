Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3CB606A335
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UkN8Efo9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DECF81422;
	Thu, 19 Nov 2026 16:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVEBvrebXG1Y; Thu, 19 Nov 2026 16:18:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4FFC5813ED
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795105080;
	b=UlZlNoYHfjsvw76idtTmUcHrjT2EHX+DC0xaef7A8BNFwmEnQOOGsWQVSDdR27UnaGc+
	 Yfwo2HLk9BiOROz+Gg7OAHk3QwOzqUYD/JLobNM2Rf4qhxiXAuyYF2DEzCKiNchoH8cBD
	 VNJGDPk1aV3K9PqLerU0J+LfhjC2JbsbiDpZEvv00zZeYVAMnyry+DOLs2AsRIX0B+pFQ
	 l0DjWE6xE3KPDuH2Vmp2a7tgihWrPbm5PzKnJ3rAOV0aLTt/FH8RkS63GC3aAVem4MLBm
	 8S666zIpq6JH4NVC2EQXoGWcX6cWd6zO6sQSugWFVdI+TloarWk7V3/2hULYHzyC48A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795105080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eNOs8LRGmyILikLeKfHETZfcblCo9FeXGpgWKqQONbM=;
	b=edlMaodjkmbEgc0oWPeOfGqVZWwN/fDbu98QRorf7rfDf6xLnacHVJyj3dSTRKW5tGRW
	 /o92KWBrgaiWfYTkgFmCGcAc9tRr3IM4rVk7Y0RsJV8RlwcQ/d44te3G66uh6NTKhNrAR
	 FDKqMWKViIP9JAZ/HBWQqto0i3LDGstH9WeduY85/tGZ67mFtm0WwjxyWG0dfaOVdV2ke
	 lzXHa/q5tJATccZRdm5/8+bc50+uzze77QmCR+mnLTYNCJ0y5fy9XuvOlN1osCUes+KYX
	 JIGNsgyz93vIoouTNyhY88jYNSInIixXyIrRJMvrKW9TQ5cbstgwTXTwcQJn7fmSZMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795105080;
	bh=eNOs8LRGmyILikLeKfHETZfcblCo9FeXGpgWKqQONbM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UkN8Efo9Y43iD99h9dG1rDpVrZ13VyPObwd0rfpVG6tQLmIO1HzOisPHl1UL3SzaT
	 wOj/+Ujbw6bm3HsPaVv3EPqNo1j/YBGPrvfFd5hrHRZDU4oJc5E5G7K2fWftljTXia
	 YKG/ouIzJ5q7DDo0j5hjAQc6mxN32Tykwc76peMxk7D1ZlwBR+Qfn20rEIJQ9f0lwb
	 lKC1b6FSbl3stuBZ3Wtz8CeBbAzMpxSXb9kLRwm+5ezO81qurO7i7Xeo9DabrxRBSI
	 sSI0zhQgy6fUmHuLm2tAumi73D7gT2Xfj1DhAnIMqQG4dLsXgG+FkEgCHrHXw2AZkv
	 6+SBq47c3pTRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FFC5813ED;
	Thu, 19 Nov 2026 16:18:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 429F22FB
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 289FD40ADA
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5owXT19DyGi for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 16:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C68AB40AD9
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C68AB40AD9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:17:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-491846221ffso1995924f8f.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795105074; x=1795709874;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LV4jpsrVJjnBF7WA6h/hz+aH4L6YNf3kgq+5mJ6rpxM=;
 b=jIAN8zDgjC7QzC2sUAHRePc4G/xsGQ2BK8NYu55LVFfphF+PqeulMEnqkWYR7faLKM
 KG4cdFGt8oICpfwWBRSKg/3FXJrpk2QWq+1j2Z78dFX3uYuslGC3Owuelc3VnjBhabyS
 d3W2Uq9Hvg027Hbffg9yPI+mc0DXr/eXsvhJ769lb8VQctkmJdWCT1wqdfPUnU3KLgc7
 jprebOUiKgac73qOZh2sXQOtFBfVj7S0BRnifPYd/+CbFl8AEJX0zjMRGwxbNKk1fg2q
 fxoWECv9kXqjU43WQWXUedWduOjc0amncwmghdNpMPujPhBOn0A2C4X/sdh4MR9TubhR
 JVig==
X-Gm-Message-State: APuU4Z9kd17a3xWhEPXJjW3HAYRJgNyqr13LZgypfp17BpX63mvRSl4w
 bKhObJvzXHZpu+Q6VSHO51xsGV3ERmkEzVzrZ6worHCmfr6wKWoaRBAEyJsSfAi7YvIyY5KiLe9
 h0Wch
X-Gm-Gg: AZFdTZfbUNSMCqX4ByZ0w708n3sUNlIE0j0VBxT6iOsjP04i6TmrSwGIrOaalIM99lt
 JlYmHrXrhxDOVYLNuwuiIrZmrMR2dzyQzS8vCKm0dtNUtqueLsNQMS3KfkFyb8pi/i/XX9b5u0o
 35x9BzXI+kFVWhRYDIvzphou6TsYx9xlXyA0sC403o8vnIYZkyGbhzXvAkkFkTHYgGmxSEw0vN3
 jOqfsZmrJczY4lNvpvRutQCtl+/EpJkPtrmBMQs4ZMVFOKlMzSA+yWqJoQ7BdmimgpD43tQh6AG
 PZYe60Mxbvoswsb2Xt/h5wsG1Iz6TyqyHyLrpSbM/eeqGdo4rottp1yFqYkG74RzEXZk+USti0I
 nUBqA/8GIKZjrfpI8iGKAMG+kyiHRsP0pBt5lGqOkLZJQ/5i/5rPh0xltHIqr+znlsyx+8kze5V
 J9GZaZrzM3AS4mfWgF0U2RADiELKnoyoH3HKXcFoFi8czaDOSVd4dkurtphDfvk8oeY4SFUsCrM
 yMRJcOk4QL2K0aXD/V/8LPA3eRDWnGDOQFmWWmnxY0kjYylpRdktLHcsKgG/SHkcOzwWwwxCsWJ
 HegTT5fOmmW+dg6kEnMBuQ==
X-Received: by 2002:a05:6000:2f85:b0:491:92e5:b5c2 with SMTP id
 ffacd0b85a97d-4a63947578dmr14556703f8f.15.1795105074037; 
 Thu, 19 Nov 2026 08:17:54 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3c4dsm339536f8f.46.2026.11.19.08.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 08:17:53 -0800 (PST)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2026 17:17:52 +0100
Message-ID: <20261119161753.490766-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nodejs: security bump to v22.23.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHJlbGVhc2UsIHNlZToKIC0gaHR0cHM6Ly9n
aXRodWIuY29tL25vZGVqcy9ub2RlL3JlbGVhc2VzL3RhZy92MjIuMjMuNQogLSBodHRwczovL25v
ZGVqcy5vcmcvZW4vYmxvZy92dWxuZXJhYmlsaXR5L25vdmVtYmVyLTIwMjYtc2VjdXJpdHktcmVs
ZWFzZXMKCkl0IGZpeGVzIHRoZSBmb2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgoKLSBDVkUtMjAy
Ni0xMjM4NjM6IGh0dHAyOiByZWxlYXNlIGhlYWRlcnMgd2hlbiBhIHN0cmVhbSBpcyByZW1vdmVk
IChNYXR0ZW8gQ29sbGluYSkg4oCTIEhpZ2gKLSBDVkUtMjAyNi0xMjM4NjQ6IHRscyxodHRwOiBw
cmV2ZW50IG5lc3RlZCBwYXJzZXIgZXhlY3V0aW9uIGZyb20gZW1wdHkgd3JpdGVzIChNYXR0ZW8g
Q29sbGluYSkg4oCTIEhpZ2gKLSBDVkUtMjAyNi0xMjM4NjU6IGh0dHAyOiBkZXRlY3Qgc3RyZWFt
cyBhYmFuZG9uZWQgYnkgbmdodHRwMiAoTWF0dGVvIENvbGxpbmEpIOKAkyBIaWdoCi0gQ1ZFLTIw
MjYtMTIzODY2OiBodHRwMjogcmV0YWluIGJ1ZmZlcnMgdW50aWwgc29ja2V0IHdyaXRlcyBmaW5p
c2ggKE1hdHRlbyBDb2xsaW5hKSDigJMgSGlnaAotIENWRS0yMDI2LTEyMzg3MjogdGxzOiBkaXNh
YmxlIHJlc3VtcHRpb24gZm9yIG1UTFMgd2l0aCBubyBzZXNzaW9uIGlkIGNvbnRleHQgKFRpbSBQ
ZXJyeSkg4oCTIEhpZ2gKLSBDVkUtMjAyNi0xMjM4NzI6IHRsczogZG9uJ3QgYWxsb3cgcmVuZWdv
dGlhdGlvbiBvciBIUlIgdG8gY2hhbmdlIFNOSSAoVGltIFBlcnJ5KSDigJMgSGlnaAotIENWRS0y
MDI2LTEyMzg3MjogdGxzOiBkb24ndCBhbGxvdyBUTFMgcmVzdW1wdGlvbiB0byBjaGFuZ2UgU05J
IChUaW0gUGVycnkpIOKAkyBIaWdoCi0gQ1ZFLTIwMjYtMTIzODc0OiBodHRwMjogcmV0YWluIHN0
cmVhbXMgZHVyaW5nIHBlbmRpbmcgd3JpdGVzIChNYXR0ZW8gQ29sbGluYSkg4oCTIEhpZ2gKLSBD
VkUtMjAyNi0xMjM4Mjg6IGh0dHAyOiBhdm9pZCBvdmVyZmxvd2luZyBBTFRTVkMgYnVmZmVycyAo
TWF0dGVvIENvbGxpbmEpIOKAkyBNZWRpdW0KLSBDVkUtMjAyNi0xMjM4Njc6IHRsczogYXBwbHkg
dGhlIENBIG9mIFNOSSBjb250ZXh0cyB3aXRob3V0IGEgY2VydGlmaWNhdGUgKE1hdHRlbyBDb2xs
aW5hKSDigJMgTWVkaXVtCi0gQ1ZFLTIwMjYtMTIzODY4OiBodHRwMjogY2hhcmdlIGluYm91bmQg
REFUQSByZXRhaW5lZCBieSBzdHJlYW1zIHRvIG1heFNlc3Npb25NZW1vcnkgKE1hdHRlbyBDb2xs
aW5hKSDigJMgTWVkaXVtCi0gQ1ZFLTIwMjYtMTIzODcxOiBodHRwOiByZWRhY3QgcHJveHkgY3Jl
ZGVudGlhbHMgaW4gaW52YWxpZCBwcm94eSBVUkwgZXJyb3JzIChNYXR0ZW8gQ29sbGluYSkg4oCT
IE1lZGl1bQotIENWRS0yMDI2LTEyMzg3NTogaHR0cDI6IGd1YXJkIGFnYWluc3QgbnVsbCB3cml0
ZSByZXF1ZXN0IG9uIGNhbmNlbGxlZCBzdHJlYW0gKE1hdHRlbyBDb2xsaW5hKSDigJMgTWVkaXVt
Ci0gQ1ZFLTIwMjYtMTIzODc3OiBodHRwczogaXNvbGF0ZSBBZ2VudCBUTFMgcG9saWN5IGtleXMg
KE1hdHRlbyBDb2xsaW5hKSDigJMgTWVkaXVtCi0gQ1ZFLTIwMjYtMTIzODI5OiBwZXJtaXNzaW9u
OiBkbyBub3QgbGVhayBkZW5pZWQgZGVzY2VuZGFudHMgaW4gcmVjdXJzaXZlIGZzLndhdGNoIChS
YWZhZWxHU1MpIOKAkyBMb3cKLSBDVkUtMjAyNi0xMjM4NjI6IHpsaWI6IGhhbmRsZSBwYXJhbXMg
Y2FsbGJhY2sgYWZ0ZXIgZGVzdHJveSAoTWF0dGVvIENvbGxpbmEpIOKAkyBMb3cKLSBDVkUtMjAy
Ni0xMjM4NzM6IHBlcm1pc3Npb246IGNoZWNrIGhlYXAgc25hcHNob3QgZGVzdGluYXRpb24gKFJh
ZmFlbEdTUykg4oCTIExvdwoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBl
cmFsZUBtaW5kLmJlPgotLS0KIHBhY2thZ2Uvbm9kZWpzL25vZGVqcy5oYXNoIHwgMTIgKysrKysr
LS0tLS0tCiBwYWNrYWdlL25vZGVqcy9ub2RlanMubWsgICB8ICAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L25vZGVqcy9ub2RlanMuaGFzaCBiL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5oYXNoCmluZGV4IDVh
OTI0MGQ0ZTguLjhmNzZiOGFkOTUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5o
YXNoCisrKyBiL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5oYXNoCkBAIC0xLDkgKzEsOSBAQAotIyBG
cm9tIGh0dHBzOi8vbm9kZWpzLm9yZy9kaXN0L3YyMi4yMy40L1NIQVNVTVMyNTYudHh0LmFzYwot
c2hhMjU2ICA2Mjg3YWE0NmI2YzM3NWQ4MTZlNjNhZTY2ZDAyNGZiYmZkNzA0MDQ4MjVhYWJkZmRm
ODk4YTk3MDg3MWQyZjRiICBub2RlLXYyMi4yMy40LWxpbnV4LWFybTY0LnRhci54egotc2hhMjU2
ICBjOTA1N2M2YTNiOGZiYjk2NTFlZDExNWMxZTk2ZDRhNzI4MWI3YjljOWNhODlmYTA1ODY1Yzk4
ZWQ3ZmZkNDM3ICBub2RlLXYyMi4yMy40LWxpbnV4LWFybXY3bC50YXIueHoKLXNoYTI1NiAgZTQ3
MzJmNDVlMGNhZDc4N2Q2YmE3MGM0ZWI2ZGI0NWRiZGIzZjI4NmY2N2RlZTQyOWRiYzZiNGZmMzZl
YWM0MyAgbm9kZS12MjIuMjMuNC1saW51eC1wcGM2NGxlLnRhci54egotc2hhMjU2ICAxODA1YmNk
MzVlNjgxNTU1OWJkMmViOTdkYjQzOGQzZmRiMGViM2E1ZTZhOTc3YjdjMWJhZGNhNzYzMzdlOWNl
ICBub2RlLXYyMi4yMy40LWxpbnV4LXg2NC50YXIueHoKLXNoYTI1NiAgN2I5YWRjODJkNjEyZDBh
MmE4NjNkOTZjNDZkZTIyOTI1NTJlMjUwY2VlNTE5NTZlYmJlMDE0NmM0MmFhY2FlOSAgbm9kZS12
MjIuMjMuNC50YXIueHoKKyMgRnJvbSBodHRwczovL25vZGVqcy5vcmcvZGlzdC92MjIuMjMuNS9T
SEFTVU1TMjU2LnR4dC5hc2MKK3NoYTI1NiAgMmJhYmI5ZWI1MjY0ODYwZDU0MDg0OWY0YjA2NGE2
ZmJkZWJjZGMzMjM2NTdkOWQzODJjZTIzZDMxM2ZkNWUwOSAgbm9kZS12MjIuMjMuNS1saW51eC1h
cm02NC50YXIueHoKK3NoYTI1NiAgMWMzZTE1ZDM4ZTRjYWZiYmY3NDM3N2FjMDcwY2Q5ZDdlMDQx
OGM2NzNlMWY2MzMyZjM4ZjFkNDc2MmE2OTlmOSAgbm9kZS12MjIuMjMuNS1saW51eC1hcm12N2wu
dGFyLnh6CitzaGEyNTYgIDU3OGJjNjk2YWRlNTRmODU0MzlmNmZkZDViZDc2OTVjMmRlYTQwZDMw
NzU2NWY1NzNiOWVhNmFkN2IxZTU2MTUgIG5vZGUtdjIyLjIzLjUtbGludXgtcHBjNjRsZS50YXIu
eHoKK3NoYTI1NiAgY2RlYjg2NzBhMGM4MWY1MWI0ZGM0YWM2MTkxOWY5YjFhZDkxN2IzMDRiZjgy
MjFlYjkzOTU3MDY2M2QyNDBmOCAgbm9kZS12MjIuMjMuNS1saW51eC14NjQudGFyLnh6CitzaGEy
NTYgIDZjY2U3YzU4YmYwNTg3MDBjNjQzOTQ0OTAzZDYwYTMyNWU4YzljZWVkZTFmNWMyYzA4OGI0
MzVmMmFkYTA5MWEgIG5vZGUtdjIyLjIzLjUudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVk
CiBzaGEyNTYgIGM3MzhhZTQxM2NmNTYxZjE3NGUzNGY2OTYxZjhjYTQ1OGFhZTIzNjlhNzM2NDBk
ZGE2MjM0YzYyOWI5OGJjYzQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm9kZWpzL25v
ZGVqcy5tayBiL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5tawppbmRleCBkOGVjNzBhZjQzLi5jNjE3
ZjkxYjUzIDEwMDY0NAotLS0gYS9wYWNrYWdlL25vZGVqcy9ub2RlanMubWsKKysrIGIvcGFja2Fn
ZS9ub2RlanMvbm9kZWpzLm1rCkBAIC01LDcgKzUsNyBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBfVkVSU0lPTiwgX1NPVVJDRSBhbmQgX1NJVEUgbXVzdCBiZSBrZXB0IGVtcHR5IHRv
IGF2b2lkIGRvd25sb2FkaW5nIGFueXRoaW5nCi1OT0RFSlNfQ09NTU9OX1ZFUlNJT04gPSAyMi4y
My40CitOT0RFSlNfQ09NTU9OX1ZFUlNJT04gPSAyMi4yMy41CiBOT0RFSlNfQ09NTU9OX1NPVVJD
RSA9IG5vZGUtdiQoTk9ERUpTX0NPTU1PTl9WRVJTSU9OKS50YXIueHoKIE5PREVKU19DT01NT05f
U0lURSA9IGh0dHBzOi8vbm9kZWpzLm9yZy9kaXN0L3YkKE5PREVKU19DT01NT05fVkVSU0lPTikK
IAotLSAKMi41Ni4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
