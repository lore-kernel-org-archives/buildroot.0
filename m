Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C08606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L5bH5Yt2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED2960D8A;
	Fri, 30 Oct 2026 14:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIZbrBWIK9dF; Fri, 30 Oct 2026 14:20:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6D60D60D7B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370019;
	b=AzOkCe4Ot9NWRfLn4iSMDusJYB5EshTSqkyqWErhe3Cz82iIdYh6zK/ASC82xUGfST9E
	 SeX8HFWTHu+i0ZtLiVVa3jX+JNvDjfCsI0CAZd81oJEikssdogwzNnBFxCJLyEq7fauLx
	 /QjPjQlqE15WZpz9at3auKo4uOG7cGkPI2dylDDX1Z1FXtmDCNNRp2EmiOj8frZ6yQNfL
	 NpYWcDa6wfz6Ghbhco0qn3JIbAAjwbLFVJgguQL/CxHRZ+fwU8lCkRLGLKu53FlZmZF1q
	 P9NHQVBZ2SUrB9elKI6lAhYAHtFPSwMjKQuAEIQe3WYGcYrirPzwsHnUuEq3kOODUcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370019;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Wd2PB9CTIDVMeqQ4Foq5swRIpxfsxPB2DbkwmP2Z48A=;
	b=bQcZO+YqkR8qcTvubi01wrFx+EM1LF+2jFKKczklTCDGACU5AtNlCEQN962NE0OSX1yn
	 WmBmeCF0o8PeKB/lIV5sRgLmvyWVRS8V82d9WviS3Ksp8gp4rwSqJQfs3GYxUnxQx1J9Y
	 oyUlSDvf16v9jys7t8c8hXSR2RKkSt5llegYutTtBdsYkgIKbJ+fDB+rjovKV2FxmrSbq
	 8agP9/B3S5ev5wFdva1DgScNci9hCzZS0ydo38QYtjmpM/rgJssC8RpTq8ZAF47YZUo8Q
	 q+bDr/ENSjs9/UvyyO1lX0TFhSiOaiQAAdt2yhMn+B0/CM7vgCmhUFjkRtMgjpb0I6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370019;
	bh=Wd2PB9CTIDVMeqQ4Foq5swRIpxfsxPB2DbkwmP2Z48A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L5bH5Yt2qqh2VLREVDkMZKtmgSvlKYwfQ4rJTNOh33NfhgSQQszWUEozWGg+RX78r
	 kuW6hf5n4bS1IYw78pdtla47ztt85pkmLM7vOvnKJaAmMIFPsxgOiQBcM5/8+H2Aij
	 gi2IxnPON+VZnfm5QR68GcVb5W2D2GyDdXa7Ilr4W3oRD312Rxbgkn45amtFUHh6tE
	 PpwPMe3Hewh6l8zSljtp9iwDQOofOpeznK2S93UPNBEqSosAwQIw+ThF/SJcn0qPCU
	 r6+cd2fni/se+L7FjfF8PMp/3qWurbTGoqkS9ONEjse6EyIEkvHdTYEdE0McnLID9X
	 YfJ+9JoRX59MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D60D60D7B;
	Fri, 30 Oct 2026 14:20:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B9C0362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 217ED4053F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGJ0ne_kLdrT for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 63D10400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=pXKWPSiurpkRFkJSIuVAldUcMNKRH3ewSY3Kn/dx3gzCD1DYqxcN5I97VfDeTP+r2Pdx
 7lwdLANShItk3DjmrwOgBfu+qjwIWBG5sEwbQrctJjwAx0HFFefbj490UVkaRAD2ZyoPz
 8q1T28Oy7fUX3bBwkBhwVsAqTrda+V3v+8JVvMBe+B0Mbvvxq6HLaTYpGonCa/XVQ9/n1
 Ooipn5zQtw/tVXX1Jul21saRweLeuUJervzUDhx4PeDHunYMS6ITrApft+rrHMAYthdj6
 H+jM2plu2VnZt5Y6sn6eWpAZYri1OUzFKrc6BU8G7cHpmdknXPCW50ykRyquPilusZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rUxgL4VPpUgSkgFjCCjjusAbNFG2moqAG6330t8F5Nk=;
 b=gt8qRBlTqWyHOtEWFHot5YF1H1TdT3Hiy0FdAuteC/vw3zz0OYRiSzAjNaBDwAK096f2
 vUTYKHxYi+oAiSvbAcO4fQdLApnQuaIDUi5MJqDxvlbTUnKEQ5r+/lnZSsgYF6LaWIXHI
 YPmyyVNvT3alho2nXomicBYTxIllILoeP15XXq9Far5ItWCNpiOo92VzFP/5bZyBxc1yx
 3afujq1tKFZp1zZnIAMlSJQzEHhuSu1drbpZ1qloT7vXtmyL15KgW6j4qfiZ3v5fDq97B
 UwtPLNOtkemlxM30BVN7wQuXKZvq3MpAJonwyPN1K3pW8Kv6Uur8TolpvdGwVdMip7w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63D10400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81E7C9D389; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1b21ef98296af5540a59075d21bed163b7b3d8db
X-Git-Newrev: d2b9fcad0df1e1d6813206fe45f7999e908a9c2e
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.81E7C9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-golang: use
 external linking on ARM Thumb
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
Content-Type: multipart/mixed; boundary="===============5400028015414422132=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5400028015414422132==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2b9fcad0df1e1d6813206fe45f7999e908a9c2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit d2d3833f1d4d4bba742bafee3197fc456d41ec42)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============5400028015414422132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5400028015414422132==--
