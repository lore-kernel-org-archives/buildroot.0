Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5F606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qYnoiBTR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0037B40561;
	Sat, 24 Oct 2026 21:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqVg5ojp-4XS; Sat, 24 Oct 2026 21:24:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 749DF40582
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877044;
	b=cA9v1SQTKVLp2ahuygbIC40BO/wcSuuAa146tDqO/vE6/XmzlRkjTARmBOinCeOFyBAD
	 KRYV2yD1fVKr+shLCVYjwoOU4ngA+Jh54AuIw3a/zoqGbaChWaUlTcLEkpqDJwIYQlrKl
	 sWVbgeyrIwotJ7iCrWztdHPpe8IB0FqKv3PBzajivD1Mb18oVbAPkzR1t3fNkGFK72NCh
	 2xavwAhQieixjOV66d6ei2cnk2Pxkc+vOpMsJwvrMptsGXKLng7s8FK7m9c+5tQVgY6+/
	 Le0gdAjgg1AXPJ+OoNRotJmqwdsy0OCQMBhafyIpSXflh6CekTS3XcvojeemFEyjJEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=l2E4OA2LZTWadlBV6azLWTu36m6iAB/OL5Dg+KY0akk=;
	b=FVHdZyMlxU8mRuzVniaUSpSR9q+RRQ9dWv7nuBfUTuVxfvXOKclLmpGCfFidR96Rf032
	 tLz5dfFV+2oHNTBBcsWvkQzauMm5J5X/knokE+U23/31B9zLGJCV5IJwjY9k2Yew2VcHd
	 aS/k2HG9YjNJ2jz3hM4L+JH2pBpAT9IHsbCP3UOFTg2EMDuP0UFHTKkLdxyM7y+mlUGcz
	 jv0n6s5K6DE9IBf07m3QbK7hfvmgH8sfXbHbPWfI48Noyqv5pwzLPn/6ysS3PrkXyv8vw
	 eTWlFDoxFTnSQSXa92WoYlUEbQ081HK1AHcR/ktgoEUE/iUCppPX4qy6qo7mnoEcgoQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877044;
	bh=l2E4OA2LZTWadlBV6azLWTu36m6iAB/OL5Dg+KY0akk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qYnoiBTR/rH4IMyP/l9XXOSW8uDbt2P0cKr31JFGh+gT7vRFxABbzqBAQg6HndZ9Z
	 iTxyCf2O7jn8l51lNj8aAgLzi0OkFid2Oaj9rUENHaP9M5dab6UZdmew+U8lnUfBdf
	 2VmtANrAuw/uiKWF8rfGk3w/KMZ5yG4ZWJGe1BPb1i3J4zeCGN1/8YsMP3Lr3OPIho
	 35zjLC9yGuEcrWqjNsp/2jayEOKzttkAMREW/scIVO+YGjcEGR/1D7u1vNywWz0vDT
	 n6ECaEEnXH5Rx//k72YKAJhhMJNHwaJK0YN0xK1r/EOSTt/gQsDcwNXkOrxglFqgQ1
	 jePnpjoWhM4lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 749DF40582;
	Sat, 24 Oct 2026 21:24:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E74522F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE7EE60626
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IxQbiWxg12O for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76EE860619
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877037;
 b=maJdgecA9xffy/HbpK+bA5EnZobkhCfSYANlAD62pVtjXppJmIE0/AJblVZFHbIY1m2p
 djA6Xl6F1W7to3rpbLmDuHAxk4ttTecSEn42jY4fCR6+0LvCmvI0GpVC57dgs40CLkFJ3
 QngwTZoM37tWmPC76JssdWKc8O+9MBAypYAgI2ChgBhkvr0rY/K6nEserE++wqYWtK8ry
 yso/gFIaBACC+OpsitrbVBJXeM0Vik87H7H5bc2RfgJaqKht1ZK2REDuF6kKgt3O1CQQv
 Fx64L1VImfhXvbbL4VoN0pdFpE2Oxc5O0BDL6Flgd1NUAPJHl1jZ9p/Xui+GReS9w5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877037;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pqC9JZ5xth3py3HDtkBUcfnY3MT6Ru3CIggXWGtiO4w=;
 b=jKarVKja1bb/snzv//rAGmLWOM+ZrJ2FcxlQBiur0jMVwE1sEpvfiKK50JQqbAjIUlzm
 3T7DrTNCfdjW3sQOhOVkkHxrrR9ieAggY1SoQ9joLXyMlUDtiV1Ihfxpht6Hb1SnYAevr
 dOPPbpZdcLD5fGEhSz9N6Jue9rrJZpQa6aqLWr2Bl0ib7/ZYfr2P0I4uZvdnrQMseSU24
 5mG4K+gUgEA1j5FyKUit7uIbhjYkfD2ZQQ4SFanoeH1CFKaFVjpVyXpsPLw/6RfR3eTCm
 Dp8KgYgOK0iRbe+qM4Pays0tAmNIJ6qHmUURw0BRoyJQ1Tn4BI7mIPpdppfSuJh/Vsg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76EE860619
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46E629CDCA; Sat, 24 Oct 2026 21:22:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:22:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1209926be7654e6cbd25c0a89623999315d9dc9
X-Git-Newrev: 2191cb7c281f404d42d04f7887d4c60b9690b44e
X-Patchwork-Hint: ignore
Message-Id: <20261024212232.46E629CDCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump version to 1.99.1
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2191cb7c281f404d42d04f7887d4c60b9690b44e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://blog.rust-lang.org/2026/10/15/Rust-1.99.1/
https://blog.rust-lang.org/2026/10/01/Rust-1.99.0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 132 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 58aca986e0..9eaef55cee 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,72 +1,72 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.98.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  0b514a8cc1cbcd939bff0f151661fe58b6ea5c7a7f645a5098c69e32e8c1e0a2  rust-1.98.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.98.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  51733c05e0f784825aab7391761199eb090456b2e95e45420c544eb25eaee3ba  rust-1.98.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.98.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  93f2a12d19de1ebcb3373fb6acafcf01218ea77e920014e3e7edfd5e0345ec2c  rust-1.98.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.98.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  2086a3b53bbb40670cbbcd436858279c800c0579ea2588a294d0219775de9ea3  rust-1.98.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  06871396a06f61f2d72f57b5ed31a0da69e8185af3989d2efb2665c6e982c062  rust-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  61a9cbf434ed16982cbd6269cd441f9640ac34ed73ced92f4867bc0ce507dab7  rust-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.98.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  78b8c29bf499cc9d339f470bf10bb9e70d4f8b97498e68ac87bdc9c90ca76270  rust-1.98.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.98.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  5326b36c53de11d148c8f8dab6553a3d1006c2cfd32123683073fad3c302605b  rust-1.98.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  9bf796a6ec5b004813ebd0b650775a7c6a4f3aae97ad362ae294798dca4f3b23  rust-std-1.98.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  7e0ad2e67817f224b7a6331e48d6397303fc050edaccf81784ed786ffddc884a  rust-std-1.98.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  64c797743abbac368bed5b68150ed839501bf00e82340331b01d7689333687e9  rust-std-1.98.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  27505e4a2be7e159da17afd162f3a976fd9652bd4e5faea291b63ad06f9d9475  rust-std-1.98.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  86caa709606dfb02d0878360d068bb7fb5b92d4d97789f19f67156e866ae86a5  rust-std-1.98.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  0fd4c0cbf803a135b57a0b079c5149c5ee0e45106230f30d225e459cbd19fc6e  rust-std-1.98.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  0596abc69b2cb67984719b36fcb3cccd16d88db8c0584edd0e9a6d2f06c40c18  rust-std-1.98.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  c4c6deb687f91219cbbf6c280414a14aa826046b5d3ade60ff84620842a359a2  rust-std-1.98.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  95bc80c6257ae135bdc3606629807f21ee53f6cfa18911ceb1d486cd82b4a13a  rust-std-1.98.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  0685de03c96ae65212b519d98116ad581c7ef46ca24acad1364895b7907d71be  rust-std-1.98.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  3c139a8912e5a8fcb69f1cd6ddeb4906da14eb26a443ffe0db33994dd4432fcc  rust-std-1.98.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  dd0efa4210a6da6350a6b05d8ffa43eae4baecf2397cc00a3b028bdf56cdb1ce  rust-std-1.98.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  593943398099aa1b15ab0eb6b0bb138434915e81f7ece68ed8e0aec730125726  rust-std-1.98.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-i586-unknown-linux-musl.tar.xz.sha256
-sha256  3577040cb98e9484fd2854aa9a9978c1fb7dc15c0b4059412d86484c1bcad8b8  rust-std-1.98.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  69f2f0fbc3b71aebd4aef7ff00f31e00944e1528a49287cc4b256334bdc0ec3f  rust-std-1.98.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-i686-unknown-linux-musl.tar.xz.sha256
-sha256  c1b066d393bf15bcdf823388b4358b5d339fe064cc48c8a08e1b7ff6f41abcf3  rust-std-1.98.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  765135d825fcbd03974e033f58cd3f3a0da70a42d6aee600e83db88bc6e3bad6  rust-std-1.98.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  f23c066e7bba9d2216e41b6add0cb429c7cb7f90b449918c5370fbcb88b0dd88  rust-std-1.98.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  8353a10f4195abdcff6391ca5af8add6bf699f872efe0b289932613405fa62b6  rust-std-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  bcbd81e49d72e6907c92ce7d1ba5b25b02bbd85f94cb21567c931aad1d3e3ab7  rust-std-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
-sha256  4144e47bb60bbc3172345095ad4e5e7ea7dc28c9b900eab888a4a5944f34d157  rust-std-1.98.1-riscv64gc-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  2b17f570083cc6dac5c3bdb762e64f75813f62e3668c5dfaefee546d10380d4b  rust-std-1.98.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  91a541a9fd6d276f9782e8657f3163f5e71b76616536b6156d685b60298cd4ab  rust-std-1.98.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  fa3ff450172a16c026944030230c5069947af93c728d9179971d44e5e0cfb561  rust-std-1.98.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.98.1-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  bd9f35880de21dab0e387e84009c00001ae7836a4ba565cb16823f13f75f325f  rust-std-1.98.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  a48fb1e853be56ce9b8e2751f5464dbd5e16440cd81e237920f3a5e7e806333e  rust-1.99.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  f5fae4c94233314fef8cc186e0bb8b7cd4165ee39268fcdb5d1fcd69afd7d7ae  rust-1.99.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  c4266fb77a8991036df4104f2aa0c644a9f1758534592193c977d2d40b5bbcf6  rust-1.99.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  cf1e4959d25c526cd368e43020cdf4c87b7c7c4b7ef113d9b4447c503bdb5763  rust-1.99.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  6791ac9124ac16d883f9f78e39e29a6a34230ab0bddade975ee9aae53a2933b8  rust-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  88294018ee59ca9528cd273fe5d8148b8d3b04ad08f02adcd000983aa9773820  rust-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  4ad1eee9e91f8f21be99cf2aedae2543addc54e0747e2588d87b9e8516b974e3  rust-1.99.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.99.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  231fcae47ee950621374725b5fc3b5441d2fbda2955ac45dd7dc816d8876cfe7  rust-1.99.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  e25668477083d6a9ddb87b9beb9c00742225f38233ccb4bfba3afa7a07427f52  rust-std-1.99.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  2f3eb0d0610e2b7f6b2121d106e2490ac648decfa0c09b30873bdfc60de6c1ab  rust-std-1.99.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  fb93e9715ef14ed17fd6922dd200d14cfe855b46c4fa1e8a03ee85ca75646022  rust-std-1.99.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  32278298365b7b78cf5b67ec34bf5e11821679dfea8a6d867725af860c4cbe50  rust-std-1.99.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  f66cb84ada451344f46757c72d1bfa5a34e8f174affe67b7fa9c3b2d8a033e26  rust-std-1.99.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  74adeec515565c17242c8fafedbda40a30a49f85e9510fc60013cbc539f83782  rust-std-1.99.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  16147e552d542b300e5068075ef0e38600e989816e794afe18e34b6247192598  rust-std-1.99.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  34e0afee32cf40fac1283c2a4c71c265a93973b4df1a774889e89de138bd510d  rust-std-1.99.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  d9f8155889cd3f4fc36ac35dd1ec357c46ae9cade0b106aca03e272b005e0823  rust-std-1.99.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  53fdf6581a24f510def5173813a0d23518a8cde547b9fbf4876499f19feda18c  rust-std-1.99.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  eaf5ee2b0948e18e586af42aa9aeb0e8e5aba515bc2d862bf0d23dc59569a8a9  rust-std-1.99.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  edccfaef9195cb74b5c33541e587629f92433f59fb5e4bbb7b8293f966ecd60a  rust-std-1.99.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  0a0d01938461c2cea3d9771f6a2f9b0bc42e8adbf5b45ecb9cb92b5371688ddf  rust-std-1.99.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-i586-unknown-linux-musl.tar.xz.sha256
+sha256  df81795fc9a09a75f3387ede4b17a10bcfb55ab04a8e358d05172479683bec8d  rust-std-1.99.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  8abb74feac06cfb0d3de4e27301adb05f740661c7d6fb154528906202157ae15  rust-std-1.99.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-i686-unknown-linux-musl.tar.xz.sha256
+sha256  25df5dae9ead02745f709ed133f09700abdec5eb7a8027e08bb41aefb1a451a1  rust-std-1.99.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  25d05cf16db111ecfe7dd8e1a3d61d144f2348e87dafeb07ff3cf402e3196cfd  rust-std-1.99.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  58f8526a50eb47eb106130a29e77c97e3c5fd60af41e8a16a63d39673f9aa33d  rust-std-1.99.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  4bfb8ca55cc13f11addc5782a946b360b78888a18c8e315635b822f961f553c6  rust-std-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  0fe2aa8294281e16886a101466160ec460ed99e51c8af11e1c76f88f8bd0de6b  rust-std-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  59797f5c7c87ef38c1d202576cb6fb9c6423730d8efcaf2fab7c367d2d878a39  rust-std-1.99.1-riscv64gc-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  a5e394a3d85c6888f016abc9ac02dceadc6eb8a7216b8a5ba863d6cf649766ae  rust-std-1.99.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  c73df3e84bba70fa87151ead94aac7848fee8334f16526bc2f97d20372b327ae  rust-std-1.99.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  109b074225bf5b9ea3820890876bfdf4ed161adbfaf94b2b4b5984c85ee5d958  rust-std-1.99.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.99.1-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  1dd241eaeb19ff3b5180461c77bdee93d6cafc669eda9de834e7c06b0ec3ca95  rust-std-1.99.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 9655f5c618..dd6f031d1b 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.98.1
+RUST_BIN_VERSION = 1.99.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 006d7566c3..7f50507e1b 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.98.1-src.tar.xz.sha256
-sha256  be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f  rustc-1.98.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.99.1-src.tar.xz.sha256
+sha256  6451598a99e77f07571960f6b21d577399d3a30f33e80cbd2e3a4aae6535d265  rustc-1.99.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index ca68de589c..6a9a409058 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.98.1
+RUST_VERSION = 1.99.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
