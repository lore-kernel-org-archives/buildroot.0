Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF0CA5FC5
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 07:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3649B40CFD;
	Thu,  1 Oct 2026 07:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLbygvm_TSSo; Thu,  1 Oct 2026 07:27:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 09F0440CE7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790839623;
	b=Fj1RfkDipMey7ShByAYdPDLGd9OXw+1x5SA5sheCWl8043U3CVk9D8k2b4VgTdVmxCwX
	 TqNazCs1/W+sr6vJqS0vGn0Sx7M1EAonXEGzvSr9rKTTAahw80Lrh8iNeau76V5eI4q8R
	 FeljO2GlKSYRAADaLrVTq/qX8oHHKGlx8/vJGAHDrMfJ/6sSpuCjYscGoyT03ALCXXSC4
	 rbXhDgABDnEJrs2GH2dY483A2QBaDnEO1edntaMFs/x8y+bt1CzQYQuND2hkmOvG9wykl
	 C3LX3KNHldq/JhkhRBH7r24ftcJ4OC3HwUzIfquHUlkIPP5QYcSMZ4wLlQt2fCymkKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790839623;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Je1Tjt1iocqNILkNRLaT9W6mTJlZu0Lk1JTzyNwLDxE=;
	b=aE1BTwUF41C1D5um/2M5TYrL1+42oHCRmzGIPqK4YKkDiH+Aq6sXo6I919MQvxXA2MtL
	 UdZpj5/Ji2SXhesPFLiYO+bRcefB8nuSDTQcNljiQTlO/augcBvD/RTJH6Poi/3UY9RaW
	 hN9oBQoddftJoeRx4NUXBuVqD7kCxIr7uitSHJ3qLz0gZXil258WqOJXMSPj2T2faE3ew
	 1SFblVcQjbRu5q3u2AidfKGACekY5fRpU4+QGDb1I6CUt94bh2Gt3jQ25u3FvCOEJIC5t
	 UomM5ETDgX3eqM3VNcAFvRmy0ZyAkfzG5e+1XnlfjByequrkAzZwDXYmpu7uDQ58qvQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790839623;
	bh=Je1Tjt1iocqNILkNRLaT9W6mTJlZu0Lk1JTzyNwLDxE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=T0d0ajQ7hIidXR/k1NJdYK3DbOcHxnbD6lDfIztZngiZ2UJp7padfK2u0FjS2JRWx
	 AFTfj4rDWp2S4ABgEQo8iIxQy3ZpW++aMlOBPYOCE+AqZhZKVSxgbhLOdgyG75GVA5
	 F1e8nD8fA/RGejDaFlNWTZqwZ0Pxmirl2rBCPdfPjifV8XsJJGnvOJfqWNXFqbdR6R
	 IoWHhxETFrW0j9W038bBnmwFmBH4lGNFKCPfFKkrmxikzyUQF6QGZqk2Cp3qp/wz1p
	 WSyRoDNXgE44yDnR4E9b720/5vRh/Zce7te8Ge240AlH4BdhFbX2QIapePomvg11rT
	 fIiQmNYCkROAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F0440CE7;
	Thu,  1 Oct 2026 07:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D15734D
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EE2E404D8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glrz1b_iKqhI for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 07:27:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AAE8A400B5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790839621;
 b=bQAaHenWG6Y1ebS5BMUBOe4dye7DNN9TJw4Lw6y7DTWtvufkZKpnTNBm9ACzkBfMwK+h
 sp5WT2P5DQSDr+kxZuB00AuaLqc+yW1S98wCHlELKX5Uu7X1Wiy/qfpY0U9uKvSIjOGdh
 7EX/RVz5yY4XEhBl79ezxMZkAglhsjy/EvlvzOTV3TkuP1w6gLqz1T/UxwvpGOY46wn9b
 gyZr9XbEh2m1XpLxycGAXtDTzFhnFJG9CrwTN6DS3VuwSEcaisO6wYGn45bM9skOx82mM
 bVo4jZ3wpHa6KE/n7PzI8792OPywIhP5I7H9Ajz6d3j72U9sEy2GGS/Gz7RiFWJnlRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790839621;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=TeVfX3Q6x2LLVVPwPrf0VWLnvL3RaSOd1fZrQ04WfQE=;
 b=X0c+tZwI6SsT2/FZ11/ipXkXY2HF5Wx/vWNQ9gWYXrjKbmzQtT1xeigZu4EbzD1e8DEK
 rchYJCjCKqOBsMyz84JlCQJvUAdounvmdVwei0vJzADi1kG9VCgeXz/JRw6OAxzvq2C8t
 d5aMC6sUQ39NV6VwIC7Wrxv0xTnpzshjlK/4qaJg37tX+7neliME5xZSmEzIEbC860jfw
 fEc09v+Fq6ySaBLN92bxYhmSP+BuQCp2O7SaCMkJOlmzTrlXN2EIRgmX6y+rghuCkyF4D
 l2lDvWwwTPO/1dR8om4Kg9ZK7Yz/ndJj+tVGECp3DgcqpncDPJ1jXzsBPmxleGxUL9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EVJxUVR1; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAE8A400B5
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:26:59 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a00d8bec5aso17067745e9.2
 for <buildroot@buildroot.org>; Thu, 01 Oct 2026 00:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790839617; x=1791444417;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TeVfX3Q6x2LLVVPwPrf0VWLnvL3RaSOd1fZrQ04WfQE=;
 b=u91hfuviDKUgsK2RsX2k15kSLiDazTagxBmYN10gftaSfHq+vEYqQ/kkTLArOUiVhT
 51p5It56PS9tqpJa85PlzlcJ8U8x+Siz4o40/bKk0LKuI9AXFowepINM3FpdI4UgaEdh
 dPFUP2rw8Qh3QdHSTfHwyHR3uPf71H9sOkkPUGsWT2b6LdRGB97NmaYEVEhf8d7fXkOW
 tvvHsEv2E8Dukius5WgNq17NfO/ejgWPZbPV42GXWoHdCTgrM1oOibWrAwnukqganGZu
 MXpo0XOxNYwtp9EfhhB9/6pQOSkvweYM6zvZroyNDN7ybg5pW5o+nUbQHsrydAau30gD
 qrtw==
X-Gm-Message-State: AFuF++mpKLDtkIW91nuwYtAAkH6ckGPauFYhUy7yBSH5wlxoRVB+Byds
 la6ZGZ7M4LnvjRlL1atnimZOFvrR0FpXkO62stYDeX7PlP9y33q4C+Xqrkl+Nu17oMbaz92kB3C
 8iNh58MBMKg==
X-Gm-Gg: AYBFou0V4skh+LEByE9ZienSVPQDQml2nofT1MU+0o/+rndthDzCXA2AgG2DhHV4fqX
 DkkHth7N25bqy2iLfV5ZxEhR67GrysWgwLyqlnxQhmjlpf9C2uERe/h/JB4/IFOiN5/kwPGalB9
 ToMEyyzgK6htc0Op4B2RNzB+CZR7EQEjNkuCXG1+k+OCLhE5N2UjQon9mdp05PE0JiNC0zmieR4
 5R2VvneEYIeYbb31RRFvb2PH5iSrNeD5tyTCsW6w7KrdjAF6lGWBbcC7R07Zr/F3qe9sKXZZWBr
 Rb1CwaoHOvcFaZe/EL6ecCiVZrmXnpnFDWQFLWM6KSVw6LqkXegTtSeCE/6+pGjHQrk24RTlQ5x
 D45FkD2MB8AyBd6UALKdUSy0bnN5ENF9Zji6YA4+vbDHn83NuO0Cwjx9MVQKlOP7dYUCGWlj84O
 8uyfaNUjxvxlKVB7ZqvmqfgZUPRPzWgIxPy8E7zan+IOV/4YBsqSFKW63+MVDkuP4Wx75OQYYPY
 3SKwkc0JZkoiigZDFTPPLp2
X-Received: by 2002:a05:600c:1c20:b0:4a0:25c:8af2 with SMTP id
 5b1f17b1804b1-4a01afe073bmr68402835e9.17.1790839617570; 
 Thu, 01 Oct 2026 00:26:57 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01f913ecesm35092195e9.2.2026.10.01.00.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 00:26:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu,  1 Oct 2026 09:26:28 +0200
Message-ID: <20261001072630.546933-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions: fix
 newline in commit message
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnkgZGVmYXVsdCAoeHBnX2VjaG8gZGlzYWJsZWQpIGJhc2gncyBlY2hvIGRvZXNuJ3QgZXhwYW5k
IGVzY2FwZXMsCndoaWNoIHJlc3VsdHMgaW4gYSBsaXRlcmFsICdcbicgYmVpbmcgaW5zZXJ0ZWQg
aW4gdGhlIGNvbW1pdAptZXNzYWdlLiBGb3IgZXhhbXBsZToKVXBkYXRlIHRoZSBsYXRlc3Qga2Vy
bmVsIHJlbGVhc2VzIHRvOlxuIC0gNi4xOC41MyAtPiA2LjE4LjU0CgpDb21taXQgZGEwMWI3Mjcx
YSAoInV0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9uczogdXBkYXRlIGZvcgpzcGxpdCBo
YXNoIGZpbGUiKSBhZGRlZCB0aGUgJ1xuJyBsaW5lLCBidXQgYXQgdGhhdCBwb2ludCB0aGUgdmFy
aWFibGUKd2FzIG5ldmVyIHByaW50ZWQuCgpUaGUgYnVnIGJlY2FtZSB2aXNpYmxlIGluCmZhYjUw
ZWQzYjEgKCJ1dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnM6IGF1dG9tYXRpY2FsbHkg
Y29tbWl0CnJlc3VsdCIpLCB3aGVuIGVjaG8gIiR7dXBkYXRlZF92ZXJzaW9uc30iIHdhcyBpbnRy
b2R1Y2VkLgoKVG8gZml4IGl0LCB1c2UgYmFzaCdzIEFOU0ktQyBxdW90aW5nIHNvIHRoYXQgdGhl
IHVwZGF0ZWRfdmVyc2lvbnMKdmFyaWFibGUgY29udGFpbnMgYW4gYWN0dWFsIG5ld2xpbmUsIHNv
IHdlIGRvbid0IGRlcGVuZCBvbiBob3cgaXQncwpnb2luZyB0byBiZSB1c2VkIChlY2hvIC1lLCBw
cmludGYsIC4uLikuCgpGaXhlczogZmFiNTBlZDNiMTUzMjAzN2ZhNjc1ODJhNmI0N2FjNDA4NGRh
YWE4OCAoInV0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9uczogYXV0b21hdGljYWxseSBj
b21taXQgcmVzdWx0IikKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgotLS0KIHV0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3V0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucyBiL3V0aWxzL2J1bXAt
c3RhYmxlLWtlcm5lbC12ZXJzaW9ucwppbmRleCBhZjg1ZDMyODUyLi45NWE3MDU5Yjg5IDEwMDc1
NQotLS0gYS91dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMKKysrIGIvdXRpbHMvYnVt
cC1zdGFibGUta2VybmVsLXZlcnNpb25zCkBAIC04NSw3ICs4NSw3IEBAIHVwZGF0ZV9saW51eF9o
YXNoKCkgewogICAgICAgICAgICAgICAgIGZpCiAKICAgICAgICAgICAgICAgICB1cGRhdGVkX3Jl
bGVhc2VzX2xpc3Q9IiR7dXBkYXRlZF9yZWxlYXNlc19saXN0fSAke3JlbGVhc2VfdmVyc2lvbn0u
eCIKLSAgICAgICAgICAgICAgICB1cGRhdGVkX3ZlcnNpb25zPSIke3VwZGF0ZWRfdmVyc2lvbnN9
XG4gLSAke29sZF92ZXJzaW9ufSAtPiAke25ld192ZXJzaW9ufSIKKyAgICAgICAgICAgICAgICB1
cGRhdGVkX3ZlcnNpb25zPSIke3VwZGF0ZWRfdmVyc2lvbnN9IiQnXG4nIiAtICR7b2xkX3ZlcnNp
b259IC0+ICR7bmV3X3ZlcnNpb259IgogICAgICAgICAgICAgZmkKICAgICAgICAgZWxzZQogICAg
ICAgICAgICAgIyBEaWZmZXJlbnQgbGluZTogUmVzZXQgaGFzaCBsaXN0IGFuZCBqdXN0IGNvcHkg
dGhpcyBsaW5lIG92ZXIgYXMgaXMuCi0tIAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
