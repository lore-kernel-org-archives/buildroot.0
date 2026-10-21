Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29572606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BQ2IIv7S
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 065534030F;
	Wed, 21 Oct 2026 19:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq6c-69lyPuL; Wed, 21 Oct 2026 19:25:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 123E2404DE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610726;
	b=RWTKf2qJofsipzPbukR0P+irfyYlyA5S5//0Vwe7GjVqqBmLQt1Hw25ZRwk0BkbqIDoH
	 2eq1JSAr6mNcp3IKNtYB+X1QCM/QIYc6EPLwf5WhnHmEK9RZP9uJFZAdZNa3KoEKf4PO5
	 up4TSEaE41XpCjsoJpRORLS98+tDo8wPRHpKyjnLq0tW7RFWJ2wHs1Ymu/mtuYcLEl+u8
	 67YiiGtBKQs2J8MG6ZWCU78Dc7hV6De89iq7D4WxaVazLVv5hoUa2VMR+pJLghpimelZO
	 C6s7LID9gjVJOBrJk/cMjTkXcCkXSguKu3As7ZgJ4Jx0q/zV86ttlVTJvUpApajJoAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610726;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=80qlpxWvVSjkZc/3TZ0lhWfmGEJsJVO8xfIBib+M5s0=;
	b=lFSBAhfMCjPg0DLPDMgrrDzK7X6ZmpyfuGNbB2lVKZDtmKClkqYyNPfWviFU6YKNJC78
	 tgP/OhV3tlfAwfOKmrFY4DOxDp4TMAKdpnRNglA+nDTvpTtY18RlD2uswb8vpLtXVF4zn
	 mcMxafuTgB22ZDKsLjs8O4CCvcq+59IsrkRoH/IfK5WSI/JIvQ7nVRDDZ+AP9BB+By13D
	 xdD5P7FRoQ8Vf9yFZSZUw0WuY2/DO5kvlvbPLBvsl8B2mgyTjgNRbB3MGpEfcBd7Aa2ql
	 O2wLNOWLgSpTAsRMMG2Kgl+r8ugDXZB0mlFYARo/kI2Opo0HY/ounkiG6UanIyNv2gQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610726;
	bh=80qlpxWvVSjkZc/3TZ0lhWfmGEJsJVO8xfIBib+M5s0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BQ2IIv7SstKiCQ+zPPRaV62K6oN7kv19nhuL9PGIHqFij6HdLHSfgyGlJdaz4YPHi
	 pnViF5+fWmMmRZzT9iZNpLhEMsdJJqKkYocdVc+sbmX8eBqHdJRT96OMGqJhioa5Mh
	 Z23GYzJEVK2qfUtDh//OQnFsUC+3HxxWCWM7K00Vb9+ucMlljJopZAh+znWmo9peV0
	 z0ShyZabcbRCAWMRq2gqFhwecpyEULE30DbNJ9xfTpycPA0sv002xZisH0zHs7jJ/c
	 w4Aah6PojgMsOOF6W1LOW9XUbsPJKKd4csIwS1zZW26KxYaXpD1AcVVau+5Qm2uyEO
	 IdyeujKdPx0Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 123E2404DE;
	Wed, 21 Oct 2026 19:25:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7865B3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A3B3404DE
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zln2yoLA2ayR for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:25:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A7B8F4030F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610724;
 b=ivLrRw4uWPFYXw4cKCrJwgjLoeKCtIp4yh52K5yTjLmTwPg1rC3uHvmXrW6jnJ4X8vif
 AczB5InMSdJUMdrt+sdHr6dtokqqwvBm+f7lyiMxQ88SDupnYI5SL6mgW+RUDwrVE6tMi
 KjfmA679Q7Bou59EQD2leaz06RDhr5QE/mCPnVDwK3s52d/NQFFY7o2ytOWnl7MlX6J6g
 L1NTWXemat/DdKqFONlYuf1URVVBn8rIShlaRJpg+bSIr1h2B6Kprld1dHYM/P7ioMgbL
 3Om454x7KiY+aULgiSOJ9hjJWGVz4CWJW4hcJf2SpBNUAy1dCZmFgeuDyYNaRnQnLUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610724;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZwXKqYG8dD+B95TEfbN5+tHtcUcz9TiP46jhjLbADMI=;
 b=XaCnTzIZnjxIWmES0FR9H38HWodg1ebMeL1vFrPN/giOO/AtDyeQ1UhHA9mfkGYuIUF7
 mNkoFMmsoYtIcCoyb5FPkKG/JpeUYMId2na3GzcLIyBdDAc9EMmqGXDWAnu9tOAYzqkJn
 c5LS60Kuux6sh+IxdTbXh/apW3EWe27/26rBKf5kIVsXBKqBZbTuvJ7zqORDqbEbOUnKh
 CcHVjletX4yAs3GyKdik6nqwE0oDb5XnFv0bjkbLvM0b3mfPwOB1Z3WxG531RKcdwNLtO
 fCYkAH9O63W85gEIs9nfFUs4IRu5hEto9+amHpiTC7OrcrsFQjTuqRsIhMMAqwzrT0w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B8F4030F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:25:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1231699AC6; Wed, 21 Oct 2026 19:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:24:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b9c0915bf293d96bc469986e83d911b9b8c9087
X-Git-Newrev: d2d3833f1d4d4bba742bafee3197fc456d41ec42
X-Patchwork-Hint: ignore
Message-Id: <20261021192401.1231699AC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: use external linking
 on ARM Thumb
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2d3833f1d4d4bba742bafee3197fc456d41ec42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

On ARMv5, runtime/cgo calls __sync_synchronize, which comes from
libgcc.a. When cgo objects have unresolved symbols, the Go internal
linker loads libgcc.a itself to resolve them. With
BR2_ARM_INSTRUCTIONS_THUMB=y, gcc is built with --with-mode=thumb, so
libgcc.a contains Thumb code, which the internal linker rejects:

  link: R_ARM_THM_CALL, are you using -marm?

Go already passes -marm when it compiles the cgo C sources, so adding
-marm to CGO_CFLAGS does not help. The call from ARM code into Thumb
code must switch the processor to the other instruction set, which the
internal linker cannot do. Force external linking instead: GNU ld can,
by rewriting the call to BLX or routing it through a small stub.

Fixes: https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa

Signed-off-by: Christian Stewart <christian@aperture.us>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 3e388cb257..cf12dd56b0 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -146,6 +146,17 @@ ifeq ($(BR2_aarch64),y)
 $(2)_EXTLDFLAGS += -fuse-ld=bfd
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS),yy)
+# On ARMv5, runtime/cgo calls helpers such as __sync_synchronize that
+# come from libgcc.a. With BR2_ARM_INSTRUCTIONS_THUMB, libgcc.a is built
+# as Thumb code while Go emits ARM code. A call between the two must
+# switch the processor to the other instruction set, which Go's
+# internal linker cannot do: it aborts on the R_ARM_THM_CALL relocation.
+# The external linker (GNU ld) can, by rewriting the call to BLX or
+# routing it through a small stub, so use it.
+$(2)_LDFLAGS += -linkmode=external
+endif
+
 ifneq ($$($(2)_EXTLDFLAGS),)
 $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
