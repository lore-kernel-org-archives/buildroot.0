Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ED5606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qDNWeyrI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE7B60B7C;
	Fri, 30 Oct 2026 14:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t29K3b7rxMGc; Fri, 30 Oct 2026 14:18:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AE9660AF6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369912;
	b=Hvtho8R1nW01Ksa3z4YUWNCLLl3KsdN2/cgHrHtlZt+f6IQkKwbQMulAe6D+CwIpX5Hd
	 +6Zzs626AnCTiZ4xIkEuj260skQdU+mYBB1Z/r1USEtGWzinBQ5Q8HG0Y2rtY9nj+DtmX
	 8Ig0oLfNttqgjo7dniwfFVb0F4fLXeLpeAc0O2oJYjCrI+Nav+A7jINwX9zicsqQPIyIB
	 UCp6/QcH1tGIHRYb611lyLrvbKtwqg7aeqLi7kMFVnp9lMpal6xDlBcojcNEKshFxwtQD
	 EJ8MIs8YrNKnIY5rURDZX710QEEzAyoaouMQZDd0dzI69DI9vnwcYY/L3MRJkt5Winw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xhtlQH/3AGFIfofQukZyvGTfAfBqKSK2tFkFBZE9tgc=;
	b=n34tzdkOM/aEFW3pmFw7laPDjqYAkTJrk9kEiYSuRcKYx/HBMGYMuylK+2SxJvKD8SyH
	 t0CNJo7VJbYqDayLlGAII1AX0WwadJze1VnrAF8EeyW/mNSQg/qZ955qdIJ/7vKcWxzGD
	 dHD2vPah3dUwKXYTthpCIpxJP+VL7IGWuawgLOwjrPfOOOla9wr2ITUGrzZ1LUpVYEqL8
	 COlgfDg0UPWRTa4qpP6LejSmhCaW1PWRPcy1ewm+hYlkH6ORLy787c8kT3KZCuYxvPhDa
	 z1aSvjBXaD1Zehaydt385GO/CY1ax+QBqinI+0O6/g9TWq0HqoGGjT5RbpchVMKJReA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369912;
	bh=xhtlQH/3AGFIfofQukZyvGTfAfBqKSK2tFkFBZE9tgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qDNWeyrIfj4uZBK1l8KIC0qbI0qs37di1wq013M6C9Gl5DDF33+lx+CU8hZphjGum
	 h1qr2aNvAXfX7wJhVKqhN0zxrvNVXNLoagREFhNopy+Xl795oAl5Z0KEJF2DI8laqB
	 G10CEa4ubWEHVNJ/BVvV2+aZF2EXKa1JPGru0ttWDA1HfPQb+IQOBL+MZOsvxWJ+T3
	 B2lijNy/wxWhxicFRP60HUi4G3T6QW7KSvmLDvgibWZWVm1ke86VsBgP/eEJQXZWon
	 4PPhKV75VPFH/9W+6xiF1vbh7IM0TAtcOi299KEE2/Gta1fMJd0T0OTyfJCgjUAvnp
	 i2zgWF+r4ZxvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE9660AF6;
	Fri, 30 Oct 2026 14:18:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57CB1712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 382B8812BE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 017MHcX6IqLB for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4472C810B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=CZ5LWlmh03gY8MS0vMbUoLMTOOAwKZr8JOxKCzwncQvV7bBJLH1daKrM1jXeJa6hUwJR
 PSVxCS6F/GcmoPcvckOaHa4+OW3tHnVEazL6WDzrLQAyFJbGMlaoFmWOoJ8extIoBqJY1
 pgIZDzwkA+ozoBqVhBHXMizkIUtTb2b0uRl9l1fwSmTS0gTWzsKf75wxp/JxxqZQStMMS
 ghKZQPgREgpC117WGckOZVZxSOTX2NUhP02w9+VBeZeKXQVnOZQSwk7qvCKYrC3WiRiKg
 zqp5w5X+DARUUqm8JtjEXhsc+eDSxoztITZgYjHQ80pO6qEw9ZXujxEyBi0UgnWsTRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BqB25phmF+5TkhSJejSUlBGJPCfaDzVMYpk2W9ZGHvQ=;
 b=SbKpj6XfvxNM50wjUkCC13/2xuOjwElUPQ8/tPtO6MTfoXnB8b3UYi8XWqVC3iP84bXd
 GOvnSPh3U8aVsTepCk/3jceAtXVMrFiGxaXoTe4w5b1dbzu5TLKaKe5qyHgZoI+b7Kelt
 pKKJrbwLRj12f8vuhBeK5qtINJPfjRfoKSZYgMPQFcJPs7XnNi7lj2nJ1NmKDfk0pxZ3G
 tB9wcUV6ZwRHTlBWcFHQb5w8NTzh+a3HvpDNF4eyXvJufgev2niLcOtdDRwPf5CCzfMBE
 nnU4jJ3ITChS4Ns0jDpBuZQCiKhcHnkwLVvhttaNCzQ6KVLSjK7yk2T8Q7vD+HRdXUg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4472C810B7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6348C9D388; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 71d5251abf7460b6396560f84a6f18383eba194d
X-Git-Newrev: 13212eaef075c524d130f969cac3e61fe22c6a30
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.6348C9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_ttf: disable
 samples and man pages
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
Content-Type: multipart/mixed; boundary="===============6163724584524276457=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6163724584524276457==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13212eaef075c524d130f969cac3e61fe22c6a30
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-6-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b636e15bce8e3795c117d2dd57d43b25e2023733)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_ttf/sdl3_ttf.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index c37d6037be..04a5a9a098 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -14,7 +14,9 @@ SDL3_TTF_INSTALL_STAGING = YES
 SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
 
 SDL3_TTF_CONF_OPTS = \
-	-DSDLTTF_VENDORED=OFF
+	-DSDLTTF_VENDORED=OFF \
+	-DSDLTTF_SAMPLES=OFF \
+	-DSDLTTF_INSTALL_MAN=OFF
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz

--===============6163724584524276457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6163724584524276457==--
