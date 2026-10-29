Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050D606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rJh1m4O7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29EA760D9E;
	Fri, 30 Oct 2026 14:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3kr0tUWrFpS; Fri, 30 Oct 2026 14:20:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3CB5560DA6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370037;
	b=CsCcTk5LlHJfJus0szQK8tUIxlz9HrfFiDlDgSv6fPC0BZQJ6jnQyLm9uzjzm9uQR4Rw
	 FCJlLCKLjKbS2AP/PwaVIX6kMxH/1MeT1F38ELxPIv5dPzZod7Ec8smQf867ISlLcgTwt
	 w4GOa2E3WoP2kzuwPQa/YXITjzMe+r7lbq/9GQ27VjZkYlkbwDgLAe3fYI7s+FoHlfJKb
	 nbvHegIR/uYDapVqIClPnkXqg1hvzoDoBjPmAP0L6CNesaQJnkel+2lPAADw1sUscO0WS
	 aX1rl7mZ4/IV3ycGJJTeebpqQxBG6illf/TpAnHi4ENQRZDDXajQjp4U5WFZ1/pzrDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=57Ixupv/4VjYOx/TBDqtZVGEKaipZEtYDcucW7GaCcA=;
	b=N3zpU4JEpHsrPYh9ZRs0unXycJV2uDDF8FTdD90GvisjHCm5aZoj1RoznPCH2MF55ABa
	 zkNa037fSNObKl6HAfnq3hnxkW+CBq7T+WWutgfkTGdzFtztwOIRmkPM4U96k6vVYvWei
	 0gg9UgWve0sRYs4er+Qgyha65qyItgPuUqyik50rZCgT+19yL0iFryRdu7YNeniGzw4th
	 iignxEGWT9eam51nuoJUJir/vrarbkknle9z7QOWI87AfoFLd8/BiyqvPnQr0QWL69XSo
	 RvUCNPYnrQfJBdcwKkP6e9aXlTnt0ghP2i4A2ffUD8fDSGKnqcmdrk8xm8BW37oAfFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370037;
	bh=57Ixupv/4VjYOx/TBDqtZVGEKaipZEtYDcucW7GaCcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rJh1m4O7DiIJPvJepPrZ9beSiP9Y4agz2J2qTGoyS3iXv5WFjxpr9ABd+DDIpTca9
	 eupgAyKhnpT/6v/CJYfdpILdo5zXqhRmCvxvXLAB3IczP3U0WBDBPGivqbBvnJpOrJ
	 By3br/GQrPakKlrf1c6or1rYf3piWqjZy59yN4c53wCmoqob7uc6TcLaAERgpmRNdj
	 PxWr++Wgcep92kczG/k+UTmBv6U0BUltn+9qcvWR5oKWVznZdgfeu8WRNUKt5c5aee
	 7SrRSHSBGQUve8Thbv/End31ZnNeIxTTBlovZzRbscF5+ZYoqhJG4ELMs2CNeR1Esj
	 0ZM7tKorYVqMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CB5560DA6;
	Fri, 30 Oct 2026 14:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 693EDD47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57C1440C86
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBAxOrnwYqKS for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 934A040BCC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=acUsNZQL2xPMZ91AgUiOP23st9fDZ80saO9gUlB4wpid3Xqp5TSRW+NWTkYjI5EVFvvq
 Nlj2zV+r5hUvery28IgpfmJdrpAmkvLe3/urrfFapDoSdcBH0qjbpvdO+QUiHntIICJ/r
 ZwInmqAo8/Xzo28f18LfcQwHC1s30E0roFZlZy7jQiVAN4L1m6IC0HssPoawOlONIm2pF
 xTTb7vbiPoQWaHiwY7Md7NBzYxtDSEEieHQHZEEWc57sf9eXR7s/5cWnJZ4pafVxxAJ37
 8UiXECSJHfln04wY31uY7Usl8Q85IjfyZWd3feeJ0SZ0Qv5QmZcH/x3dus/ng94zkBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=60ebL/u/bhS8gl6qQ6IiAWEHKcON9mCZziIJ4GerrVI=;
 b=MA33MRAZsj3gpVkf2uFtzO1F+bbkEL/6zIbVEsph+D1sqCjjB4gYtr3aS0WXiAjNhzLL
 WjRufp4Tgnn5hS58hTGaIJp/M62nSyHEzfnqntEMe7+M/JLsVwKuUsoyBi/+QHTvHSOzs
 cjdBiifQXhsLJYH2W0zfPV5V+Jrh6198534e5nt/ancCwdfgS5Dr0dt8u9Qgh36FZmYMN
 8JHDISiZ/v91eSxnKFSVjIVotGzU+6EilHEKsSHKBE/Kjkv8drKQ5vhfRwfRGnoanZBgN
 iQt6iDCgbtxhVtcfbEBzXEyvjoz4rQzwk8Fhhzm9rc+0E2K5uO/REJmSubzy5BtsDlg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 934A040BCC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1B489D388; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:12 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5e5396b693c34bfcff2c37eb43c4b24cdab6e5d7
X-Git-Newrev: df0f72151b9be5c6c140272ad17c91387017b2c5
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.B1B489D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/openssh: fix
 build on MIPS before R6 at -O0
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
Content-Type: multipart/mixed; boundary="===============7724396189143721914=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS,WEIRD_PORT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7724396189143721914==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df0f72151b9be5c6c140272ad17c91387017b2c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 6b111651fe6d4320819536c4135f40dc240ab4af)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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
 

--===============7724396189143721914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7724396189143721914==--
