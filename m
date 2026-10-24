Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8B606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sMhZI5BE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=fgwCFHjf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950DE80F97;
	Sat, 24 Oct 2026 21:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcMLm3kZNSTn; Sat, 24 Oct 2026 21:50:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D63580F5D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792878617;
	b=bL+3VfTlw8FmwkBGJ4PaRU/k+naPYPPCCVAyR9mn9FoAvGRc6yr0tYWRJeCkPH8jiFTW
	 nGDIVY+2DOv9uAs585E2/YuKIa3Zk2kDz3sv8gouL3+e25n2JAbPKzVFsAPhucVjZMDxv
	 arXLjI/C5LVU9cf08S4dX4HHLl+Hq/LOLDTt+nEYLeadr6kP2kS4yNniVxw5pmVzQA0As
	 eWx2LvBdrBp6KbXUDxj5AfD/705q5EtuFTcJNrv+aegxvDNexHT7FqqHFTmoi2KZAGMYn
	 tGolgbUj0ZlRAhhPx6ncYnUf+YVa2ZIH8JhwK70N73kgbSSkkFpdZFhES51ddyRH84Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792878617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=oaFGgilTLo243DNTyIM1vU9B/JZc7XUyVhVn13N5V/E=;
	b=maqgtBNeOMxLckNZdkonM1HrVHox1xXIhrCkPRB31HCa84ok8IaztkuAnAScGN+L7KR+
	 tsQU/PyPwTUBSIUgnwAnEqKahIYwXjFngIEM2He6wzyVuZcx+jJsJK4X2zSr8Ma/DUJoz
	 dmCeSLTrujRvAyWsHNLNwd3d5ouLsjNtbcCrOtF8uOgfIdjPHzYTpDW4ndWXmQLtMRyWS
	 VyW70myuDSb1W+yGO0eFrntImhVf4cJiid0Lws5PJmlUX3UE+g9sQahOx1324DUZlnU5H
	 dwUFNMUwJb76s9vfN/ionNPgGAcNw5Zq40iCmTJDC53ilu4rv6IbctXCO8WAr6viQHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792878617;
	bh=oaFGgilTLo243DNTyIM1vU9B/JZc7XUyVhVn13N5V/E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sMhZI5BE6cmSTLks29pGAffrJfVGbHBfohdEgjnigT/RLP6r00k0/fSPpeF6yBIEd
	 MJH/vjA0dnU37KgUJXgJhoGkkOAUs01ZvRvLlro59vKVmgqO3bAjPXjDpyqi11n6JH
	 XZXNgz+vvBww3sf2YVw32P0mtDtGmnb3d/RZBbxnx3nFHBPskfYmIVS0WzbZ9App+o
	 9YI0C2eirne+q/cwJUP9hrCFJ+PPap3q5x3gh4ovYs25CZVe1gYMKPGsKw0lavwn7K
	 v7ba9tfLlGto8a6ZNsXt9UFZ8OKMHy9UaIrOJmdCxhC2jeLV5LeLTrhFEfpOFj6rtZ
	 N7dxCttT27uaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D63580F5D;
	Sat, 24 Oct 2026 21:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8929243
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EDCE4061D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkGTgMOOtuoR for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:50:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3AEB340636
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792878613;
 b=Z3zJ0Vm3/Qv3nczBvPLERid8YZs0+CKgPNH8/PcDRDDLFV9/EpO1DWzuKTLTF0x3itAS
 0YAn7Q5boruMjtFCZNr9JFYhqjFDTica/aAcyfgGA1dHwr78ApK4Y3TF25u8soVmUpw/z
 wL37+yuRPoVp9scFX6VDVEGQkdCOdMuCDcC/AXHovaSPbYTwH5ZU9l9qTLAO3LvtWAxmg
 t0TBkDp1HZD9dZDqQ0BgAr2pTPQncYdfgJDARPv46QXSyGETSyzKnN10p6hot9r8isoU0
 fl/+/rQDYIokUNJzxd7SHnFHYgRqAkln0i7TMynYpDD3BX60kwLRvwzSPuysOfI5Q2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792878613;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=dRWjZx395wDvf1GDjR4liQN6MJka40D9oGDk2+Dd/xk=;
 b=HF9EYE7QGOzLBbLUwBxh5RjXmQQODotW4HGvoIxqSo4y/u4Jrf9rHqsvp/WnsxP+YWOO
 OsxCBspwKJLzDK6ufa4x0ids82wg3QTYEtnRoIiqazopsAFcuaKNMx9fFpvMA2nIuLMh6
 02SNrbs8NRZdPwffZimtHK04LlkpMhnF0vnfGYhs3fdm3fcCkvuhXjmLZozWRDWS/U5Cc
 m4TzfHHMKRPSfyLh2HbFyZ4M5MCuzSz8uLaiSrTNE3wsyh9PP1Glq28FO3ItmjdybeDOX
 4qX0z1JFI0MauZhmoVZL0rfeJ2iqaLxQQYP4WGXWFbZa61EE/9IW8rKKZT5V8xce9PA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=fgwCFHjf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fgwCFHjf
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AEB340636
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:50:12 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c423b145922so252326566b.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792878611; x=1793483411; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dRWjZx395wDvf1GDjR4liQN6MJka40D9oGDk2+Dd/xk=;
 b=fgwCFHjfQUhsdWxFiwL61NXMOsQt39dTVHtpG9UJJY/fIWfitbXufuAGdJQKgFupt0
 HeZNP3JJxe3RJhm6RN+2NCYM7K6Dokx6CGtE1WU2WcUSKNxFyC/QgccTubR7ewKA+PF5
 ODoGTEFEza1TygIBizHSdYfOK4eg2BEdhTmcVf2dWgyFK1Ov2kmt4Pq544eyLIYE/WTc
 KmUmFovyDHPi03QZyxhn4Y/uBNLHNQ5LFB2LZGcwdqj5QTmITiExxorGVf2ebCq69zcs
 Il6qe4tUo9qEIJfaWLMvfnft8UYFTWSPOQkvtufadvsPeW9+OuTzXHy8wgp1vy0O+une
 c9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792878611; x=1793483411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dRWjZx395wDvf1GDjR4liQN6MJka40D9oGDk2+Dd/xk=;
 b=EvCND9CGjQYEKQjxh2QwHnmw49oB+EDIaWlI4CsFAO4TnbcrO94j7PLBlFtqo7jx8M
 vc/klizoQaFLxpK/F13H6PpqqKHkMavCBYjtvI+puc2UyFkT2L4CwgB787/2R8lKdfh/
 uEHH6gEe1eFIKstu+yHOfFaZRPXIakMUI7v8IwPfUHYvz3W6tYLyWG72LldYLY40ap3D
 fSAARD7w+FolbZD6Zme8OwWTwcgZ7+9MdUK28m57ZdXDL7N9uRTM9pKvSPbWaH115jTB
 CR8z6qy34Ebbg9CD+Avjw0pRyDC0AJMoV69LG57hd/SHUYjAywdcl6rjViq/i5kAT3Ci
 inmQ==
X-Gm-Message-State: AFq9FYJ175Xy1xH9C7DxvuKtu2rJA89OauRg6p+XjauF7fOfong96lIt
 UxTWSSl0AAMSHKEoI6z46GGvnQPnCJXt1CxuhU0B1tJTcwBieELnvyCLK2Igo8Gg
X-Gm-Gg: AYBFou1jAtsnLquMVdqnjgxamNvu9IOYc4S0L7N/ElnY/tab/ePFC6aDlNaIYGc5iwy
 MUbPdK2lz/TyCKFXB/T0VCfFrtImY5MAYJWoqlf7ImYAgyikR+Gizm1EPwzCDz+fn0hG1K9/t9h
 trwaSGCsCzH1rZVS/GB2BvFuyeAB6RGAljhnnxM/ZlfZLKo4FWdtdpqmNA64oU+3XknNwhFwqse
 9d4ScMxnoVqGbBTUAkaZkFVdBceQKL//Fk5PlHigk8LMP9IEmlviNgjbsWdp6MEAhD7LHZly7dV
 gVTNLWnzUezTJbxeNqd5oRTDHhs6kxYPvLPpm9PEOz+vu2Ae7HcFkpgitrU/Z4QbfYcLtVv7guI
 g/phWeiUzSNhn1mbhkN15Yn9+X0b5Ab5CtKXn5WqF9weFFc2VleMjBkv9RionpQOCOCxQpMoMAx
 SGmR8FF4SKOoLxLeDA057+9cfm4073FH6VCBFi4z0iKmsVP6QsPZng0guhV/S+WAiTylxTauzdz
 keyqf47dL+GrTQH4bJrLbSLeT0NaVgsluhkYaYAGeBG4V0NhRkCeD964g5VusD+PpKZuTP58Jp+
 tAMmPuTtV5CqgiMu06Y1AzJogsortneArOU=
X-Received: by 2002:a17:906:7312:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46bde8c7d8mr343279966b.40.1792878610814; 
 Sat, 24 Oct 2026 14:50:10 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd35004asm129678666b.4.2026.10.24.14.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 14:50:10 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:50:09 +0200
Message-Id: <20261024215009.1004860-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024215009.1004860-1-yegorslists@googlemail.com>
References: <20261024215009.1004860-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/openssh: fix build on MIPS before
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT,WEIRD_PORT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
