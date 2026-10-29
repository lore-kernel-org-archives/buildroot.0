Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6825606A324
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L7EDrKsm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07AA40C9C;
	Fri, 30 Oct 2026 14:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d3C3vu-FHnG; Fri, 30 Oct 2026 14:18:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B834040C48
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369918;
	b=i4xWK2abgZ2W8vMacpCfMllOMQFqo5hdP1kFz42+I62EkHUfHuKknbko+uZ3nHI4BXX2
	 +eh3ZQdLpCyoHh+k8eNBcJfRsTe/GqC1lun6uhoGsUWNvJm8TyrFhC7OFH2Z56zhVgmFc
	 smeNRX1iSBV/qE0AflSuIYFCixaH4ZuqR5Wh9MpRcIGJ2OxndbBTHl9aEkxns9RIPvUGT
	 o2EUAqUR5nRlfir/KcnMxoCQl5/kSQOrErdJgzG3wui2Pf0YvhyxFE+dz+qykeNZN8dUB
	 5qqYu7y6kjp5NlUiiz7QARA+L/s/XnRyP9O/ln1PwE+GOneAcxu2oIDeNajVbjTDjQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YVnMWdveO7QcCfGYZogAUw5Ewb7fQeJ6NpN4D+bUJnk=;
	b=nrnsHZUfQy4UgzorFWBGfMPUPxhbktQnJEJyd7P2+6x5AKX4FMOYs0cpkPp4u4vA4ooW
	 9DuLxLKx4Pq3PbaMb9oik9FgsaszM+TTenYqo201ainRPPsTcSqasaqVyzkfmyZAK3203
	 cvLwz/N78o+lMxB5gUhtu0vDRbb9WU5AQ4sy7aBNq04qRz60ZMbtwKlunfXzCFzEyJVUH
	 gduqlv7m7AdnGvvt2xl9UOCOqtowwRu1tS20xGXa1i1iABgGq+eheozk6xkEOJ3jt9Ll3
	 Q/K+5U8svjnkdWZx/I1c+5lIDwmltPFZRoaFg9WRIqIieIThpgm4q47qPzFwqp4IrZg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369918;
	bh=YVnMWdveO7QcCfGYZogAUw5Ewb7fQeJ6NpN4D+bUJnk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L7EDrKsmm9g9HmFEfOKCfYdr3KPdF6g1gUODo9fHWqTe3nm3qubpXKcXNW7eFnGAG
	 87loL2K9DB4fGzzFdH7q+mop0GEkF+1QGTBytdNbuKd1vbAIh8ksupFUdOjIT66Eyy
	 R8QEqWFLMWVuJQyApbQTL7Lb7xlUcMOxTqZrz6I23WOp8xWJl/jIjriKNZc4r79/PD
	 bIAwkC0Xq9oAAyWP5NT6Mt249co0Dma0OYta9DrbFAmfQ5oMeuxd/lHehZHw7ixQGK
	 LcAUF0lJ9ui4ASI8/4H5Vq6RoHMlyw0qPSmhybYdm6EfRoCp0ohiOjNuGcs7SHm0Ut
	 2Dn247ZdimYGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B834040C48;
	Fri, 30 Oct 2026 14:18:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D42E8712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C48E381283
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USuFS0afBDz9 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7DAA681135
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=CRU+qdZvM+ewAdyQZVNdnD+AsZDVhu8AQXNw+g+Woanqg1ZpYqUXB0TeMg7YsYvhrhSt
 iKePTOU1QxaLJmJiZoD/dMWHTMXW+48AlIx0h3rimsJpMg5hwfLrygdq8TR5G6I4LGt1e
 em9iowbbh8RENQHTio2yJPkZHdTM0yZIycwlNnKYwpRIqr4N153SR8fIhn+atFEF8FPoU
 Oe1Zu9CVvgvpnBqr608FqGLaQ9PaPs2xc5gxeNLtPYoeCHePvIeLRGoyRCZ/I5o2ZY2zh
 b/fwZkSMQvP9UXsa9JZvX5I92GqAT1CHTtijQiylpUKFlOO9YWECxhrD8Ic+cZPthOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mPc23obEmlJFcN3YGKxpbdqLbFwJgNdEe4IxQcHr4B4=;
 b=m0SC7ux4HLaiqj2WnBuQzozxCFvTi+x6UARahtTkZEZuaPFLgBuZ3AJ2tqBg6uULNTjr
 tTXiwzHPM0U70rUOQWCP8tAFEWKPM/MaN+edyCaX6HxvFU4SEceqdCbY0CEMhzpG/JxLX
 dROirjPDtddQQllIdJI0E4q2//2nx7t+OMCuQBix9gHo4FtZMeX/ESq1OMYpwleTntA3U
 4e9NjUGPDAdzv3+b9eC57F9bNYCzNXn4pqV8k/A4DZj46lvUBq/+ftekan3uVmhKKkoUQ
 Uv2gE4XR42Px8Mp09gMtComJT5breeTyrx79AmxdEGB4y/tcZBVaC4c3zhko3yzkTkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DAA681135
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C9109D388; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8c04b770cf45f40d548aefab7703acc51374c30d
X-Git-Newrev: 9d5fa4f6aa2b0a1bd570cb89e473c9dc6e3bb679
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.9C9109D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/am33x-cm3: fix
 build with gcc >= 15
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
Content-Type: multipart/mixed; boundary="===============7664335337981342054=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7664335337981342054==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d5fa4f6aa2b0a1bd570cb89e473c9dc6e3bb679
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

gcc 15 defaults to the C23 standard, where bool, true and false are
keywords. The am33x-cm3 code base defines them in its own stddef.h,
so the build fails with:

src/include/stddef.h:18:15: error: 'bool' cannot be defined via 'typedef'
   18 | typedef _Bool bool;
      |               ^~~~
src/include/stddef.h:19:8: error: cannot use keyword 'false' as enumeration constant
   19 | enum { false, true };
      |        ^~~~~

The upstream project has not received any commit since 2018 and none
of its branches fix this issue, so rather than carrying a patch that
cannot be submitted to an active upstream, force the GNU C11 standard
in the .mk file.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 874aba9eba6799b6bd033bac73e35af8970fde3a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/am33x-cm3/am33x-cm3.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 8c890a75fc..f753e46134 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -13,8 +13,10 @@ AM33X_CM3_LICENSE_FILES = License.txt
 
 # The build command below will use the standard cross-compiler (normally
 # build for Cortex-A8, to build the FW for the Cortex-M3.
+# The code base predates C23 and defines its own bool/true/false, so
+# force an older C standard to build with gcc >= 15.
 define AM33X_CM3_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC) -std=gnu11" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
 endef
 
 define AM33X_CM3_INSTALL_TARGET_CMDS

--===============7664335337981342054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7664335337981342054==--
