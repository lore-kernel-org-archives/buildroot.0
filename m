Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3D606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fi9sfI7q
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B18FF80C17;
	Sun, 25 Oct 2026 20:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1oqJtDB-UtA; Sun, 25 Oct 2026 20:48:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D5C5F80BEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961336;
	b=RBD8NvmS31nEJdz32PHU2urx4M1k2ZIHlt3iGKQbvlpJkJISCwB0xDR3DeLEPl1ehzbh
	 2SlUNA4nfHw+jh3UnypO1rTaLPY0cEbwoPDT9NnuuRrK7g9QEhAhAK0MzvstGqt/HjcW+
	 IucLkqTbOTJ/jd5OFJZhchZ04T4zQEHcQ0u4iJZ8v7U2iBkEJC/rk0pSpyLYbBq1MBLPw
	 /gtY1UIgYL5oTkgy/u8Pg0S08NxR0M9k5n67WFV8RqKDsekMvC4ies0moFjG56bY++Y7s
	 TPdKtnpgwvPLrLS2K7Evy+TJ8ME/DHmkIZmtDVsX7OpMLmFw5PXtlioKBhEHG2kTUSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xEBJUbX47+6v3pBjNM11DHIH92GVHCxv4IeAlq2c+0Q=;
	b=biB3VmGyPV2HkGmS3AI6ylr8RQW2BZC8HA4gW22OxUG4xTeCzPdbEhFCaRgxqVJ9NHVI
	 et8LqhfT+71y6msMDFLfTiFxj3ZrGeN5AR+zvKx3lNJf7KQjl5c+kNt7WQfGBGnl2lcmu
	 67e0qbuxPT0G089Oi89vhmij34RQwyFTsyUwKjwoh8YeDKQQ7q5gz/gavL81K1e+w1ttk
	 xZby0H7ghuI5x+f74wJR1WW0du7vLcFHMIWfV8sjOk6wbsgN/O/fTwf3XcnstxnlY/yvF
	 cIvtbLrViqO5AyxCdEGcRjA05PKRRrY2USmeYQA8I1ZnKJc34pL9NzbDBIz5MWU6jDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961335;
	bh=xEBJUbX47+6v3pBjNM11DHIH92GVHCxv4IeAlq2c+0Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fi9sfI7qZ4ZwZVASPSgehqP7GWyJXPo0dq54a8Ltgk9GORYtI3wyxfBYpDeEij2iJ
	 4kx2GkaKD6pCanAquxecaBvbsUwaRynfsaPUYBs0cGuTXDaNVvp4Wlq7qfsiK4CD+m
	 ipNBxcIlPCxh7CsmZpd+/YKALw+QKYqTsNpOQZUMn+eR+8LuX+Xp2osPnHDdRarM62
	 MafUG+ybcoEVnnB95OJJYN5g9H8KuBdD3OlQfC/+JE8GsJgANnAGxizt7hQwf8RsIO
	 B8rUJLw5ZvFpwldkNNXUepsVVOHsx8pS9FHkEIlqBCa1N1RonTOBuyxqYWLELurZ+1
	 6IZ9Gi12a/aaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C5F80BEA;
	Sun, 25 Oct 2026 20:48:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED70D356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFE4B605F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCvarIYxxcwW for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:48:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26482605E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961332;
 b=iPBgDuL19S74LreOUmQVfa21sQhGzUD9U9OQNCNqsUAHpZqQP2gpFgG+wNSXcqVKs7ct
 AVrjhzw9IQodqysBusFJ4f6ExmEVArz42th4P1oRFbZ6pjWCfNO7e+yhJ+1fFVtbN6JEW
 OB47qEYlUwRvHm/TWDAuOOvE0RPHfc2+rz3DBIYfFOoFufPLnvsGgzqG9MI3tw77+ufbQ
 ewZC9UhP45/rf4HEKQutzr/9kwviRHCIHcBVWcE0lm+qLvBjZEnHMkT9XpBljTPbBRCdP
 FvW0eHnbhZ9Y0APdkwOgPUFala52NCKAiYSQdQsHsKPyt18/luhdKwCI5sLgoTi6WuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961332;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HFQ/oIYz3iokbYEvET5kix6Ji/+CbJ/R1KhrJUQNYas=;
 b=JzhEjDcMmi8n7h83HKB0Te1uu103YKNOJimkn0vxeqjc8bARboiTj5osASlD1Lq0fHl1
 AvaQUY1TsHqoPRmOAn/sQhwXaWrNfHPlp71vWesrnAnftKyas9N+Y6oF4r6nd0INrqbt6
 gJ+hzbV3CayTjX3JgP7M7A357Sgp+RLF+dnahTrGMPxlOQ4vgmTveaGNjnR3oAcx4tvLa
 k99SWeRlicCOoJ9aNKHDbNuJCqRX3dYAWvityNDx73qSQa11ZyaL5AemA+yMErpHTEu30
 XlyT0OLI55VQgHYQPa8hPjmTC9YlINU7kOGlFhGxsMxCnd1k/O3AwxMlrLno60nm2+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26482605E4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F7B19CE89; Sun, 25 Oct 2026 20:47:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:45:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5b1cdc0454d5d0fc5d9c5b734c38795625f16a6
X-Git-Newrev: 6b111651fe6d4320819536c4135f40dc240ab4af
X-Patchwork-Hint: ignore
Message-Id: <20261025204726.6F7B19CE89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: fix build on MIPS before
 R6 at -O0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	WEIRD_PORT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b111651fe6d4320819536c4135f40dc240ab4af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

openssh fails to build on MIPS64 (n32/n64 ABI) before R6 with
BR2_OPTIMIZE_0:

  during RTL pass: zero_call_used_regs
  channels.c: In function 'channel_set_xtype':
  channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408

Since version 9.6p1, openssh builds with -fzero-call-used-regs=used if
the compiler supports it. On MIPS before R6, gcc rejects this option or
ICEs on functions using the hi/lo registers (gcc bug 104820). The
configure check usually catches this, but at -O0 its test program
builds fine with n32/n64, so the option ends up being used.

Disable -fzero-call-used-regs on MIPS before R6, through the configure
cache variable already used for powerpc64le. This doesn't lose anything,
as the option is never usable there.

This issue has been present since commit 3c047ea463e2
("package/openssh: security bump to version 9.6p1"), which switched
from -fzero-call-used-regs=all (always rejected by the configure check
on MIPS before R6) to -fzero-call-used-regs=used. It therefore affects
2024.02 and later, including all maintained branches. The cache
variable only exists since openssh 10.1, so for branches with an older
openssh, --without-hardening would be needed instead.

Fixes:
https://autobuild.buildroot.org/results/68d260341341afb0dfb7244f641f5196df3649a8

Fixes: 3c047ea463e27ceaafde76d64406862c3322daa0 ("package/openssh: security bump to version 9.6p1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/openssh.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6808db9962..a0cd3168e0 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -36,7 +36,9 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
-ifeq ($(BR2_powerpc64le),y)
+# -fzero-call-used-regs=used is not supported on powerpc64le and makes
+# gcc ICE on MIPS before R6
+ifneq ($(BR2_powerpc64le)$(BR2_TOOLCHAIN_HAS_GCC_BUG_104820),)
 OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
