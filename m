Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A98EC79FBE
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 12:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F7260790;
	Wed,  9 Sep 2026 12:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1ka2OhS4YKI; Wed,  9 Sep 2026 12:39:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ADB736078C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788957581;
	b=XKsoJHVLJzO0m41ADyRRi3XtDsT4RXMRjoGaawCY4+WVVYPxQ4xmjOeonOnVEq7cVpA4
	 rIoEUY0Pljb2JqV6RMvei4zkWoPo+h1bkJ+F22ejW2bzRN2sAZO22GA7BCkoCa4XBlfk/
	 cKEeIvY0iB3VmE4K1waKgm0LWvLiMPOnn1BswZzbUF6dcB5d32qsdqdy9d/IMl/cqXcef
	 5TJ7TB6wI4r+LKG91i1NFbrXo+gMMLSqj94HhdBDhbqAA3SKvZ9Z+7pwLIdIO826Qm1ZY
	 LtJK/2sP1MXW10hpDshx474qEnx/xxSSrMpC3SDU1qUBCRLxxbdLXHudWzcyprJudLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=p5nkDcljFN7rf6njsUup+ddkHHjkJ8H7ron4ICVxSDc=;
	b=g3TD+i68rfgw1A6ZZS9/mU8ZXRQiFKE/5BNxzDZEipL4h4TZrWmg/R2yADtN/PU0V4sr
	 JyVvsJz2Epz1lcaisIZQE4SMiAgYHQwjmQBl6nZcHeCKVI6He3iYnVpozF4C6fH3sQ0zK
	 JmUBuxS8eAzXdJijuZYL2n27Gpf8w6sVHA1ibjxuwutqaEpXng1GjdP9pPSBso+iznTqX
	 Z0eA/SHEhyAacWmgCDorJhhSalny2BDCK7b+aKUqVFs8dOhGh/XiTXxXdW7TAsUpVBQLx
	 yR4FBZA0cNYkefxur75Rp75kJYsZXUTakRJUHTVyli1lTaQjyxrI1Q/3+A6pBzz9fRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788957581;
	bh=p5nkDcljFN7rf6njsUup+ddkHHjkJ8H7ron4ICVxSDc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwL3bKEmZ8yL+x+ND2bP9zkMMiXjCmoUnRZqu+5RiIY0xVG4Q2eLBZQY10ck7TLzy
	 yKDmKR77VV8Wn33NBHEBK/29hnY0NrLBJ3DHtFKGfck/kcieUmYMTWyOs+ihC3EP5V
	 9cADy5ksVfiTQxYBJ1co26f5iBHNR9B+GFCQ0tX/hefZV8H2Qkm2rCs0L1m7mK/oAh
	 q+olOOfVkSLEhhnjnBwep1ERvcQT0lboJaiFzIEVSV7z0VpqsT3lhbIzqFYMLVyrd1
	 /+HQknU9SARx4VWY68muH8qS1thWkOiStlIBVwn3D1sxIv+q8xy1ptZsb7nVKOnvxu
	 8yn15NvpNJCOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB736078C;
	Wed,  9 Sep 2026 12:39:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B32782E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F2480D83
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjAEBkt49GzY for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 12:39:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7C6CB80C25
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788957579;
 b=Tqu5UHt9Xmeqh85Gr5r9Xb82KF4NNNgu//3X34movmwYCILl28W/DJ/LmyBIIMz5/dVl
 Nt41L6YkBEUOclLDhwPaMZJ0+r9SgFHXK7JV5S55PyyOyssk1lcWOKxUAIxjLmD24u6Wa
 0xhqCmQKJ2KRzs0Fq5ZRTf3z4uDqN0/QUblyMN4S8o5q3SrwHru31K/i0YyjxMsX8fdqk
 RpLX4kpk8WCs6rZ9B0EVkWpm24G8B2NdT0RdLgueVTQPymPIlRvRbsoNn473dRV901MAB
 W400dn6TLGrvHDR1qCYCl5W2JBZVc9X71QEn8IPDL7Vn+xIn2RKkyBUxNHQ6vokEBMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788957579;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=X89k4L++ReUu3TNEmRjTEtnJ/PNRHtj4ynF8SK/oj30=;
 b=GJdeGshmGv510ms9K6XJZfF4YNdB+hBmxRBgkViVNHJeq7BlUe7NXbC9kc/4G9yTTMfI
 Ssu7r8jz5bByHd7E2R1CoQQj3hB6MePp+YxhYjzCoBlv/6EWq3jJnBUhhiFHZLeW8FQ2O
 HivXRl+ihWRISHz1rM9AHFc3qPJqP4UqNKJGjmyZYGstm6M5F0Iia1uqbJKq8KXIvfX4l
 LnVqbDM7xyymoLJ0nMb3did9khe8REt3aRg7JyBpMlpDbmtWXD8BZiHT7zvC1ps1rVCKd
 ZolqiZNeCQLbXpnLEV6QAgSHYVuVB56ct1GmG5FIuojg1xX9evrGVAzB1u44OQkMNdA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=thewebers.ws; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=h0Uzj+wd; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=h0Uzj+wd
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C6CB80C25
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:38 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4a4cb36ae00so4326928b6e.0
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788957578; x=1789562378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X89k4L++ReUu3TNEmRjTEtnJ/PNRHtj4ynF8SK/oj30=;
 b=h0Uzj+wdCfXdNm6Jny4xVo43/c683YMjKFev2hyhPu4OxDQxZS6H9bu4cqjMf8JHMd
 LBfhorpwY5vhjaOcCoRJ8VFnz4n6QwIzdrHcoKyGRBcoVmYdCM6a+fYzf1QmGW7oQuA2
 ahbeqncuibvio0V819kixQKtq8OVJi9Pym6YIbJGEA2g5NQbPFOuMmhBdFETe2Zmyt3L
 JZUgoioFAIzNa7eIapyFm96FOQetxkYZO3lLrUXiNeeoB+FUjEjXUzWjtxTTSFFeqEJY
 Du1cthtwljnpYFb5CPfpqe0ColUgTSd+VUPRMox1HHh8pywvU8GmPOnLasGG9aJ7ngb4
 9b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788957578; x=1789562378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=X89k4L++ReUu3TNEmRjTEtnJ/PNRHtj4ynF8SK/oj30=;
 b=sZcWcA5t+BYnkYgunhXkwTqg9bm8FOfDGVKXqKInWG2XezojqCiMrO1q71s8Z3iqx+
 k9foVozgltOG8k9Jgqjze/RK12rNHYkI8uLZbyasYf8pUhLt+h8fWLS+YBoDBxGY2WTd
 0C8wsTAl+bHoTeLQsiLpI+7VQj0ds+bHKsnhgO4GoZyC4gGA7gFI/9HIQdUlX2FwZBN9
 t/eYM70D2PTOL9Co6p4WslraTM12tb0O78BnjOeDbrMFwSO0RfV8tpLqa8psCzTfkptU
 S9Fz9Z8jkt6gt2U05825F5LcPGCJ1BFlC1eVDu4OZLLKbf8LDPhBIf22avshwbs/huvx
 kJ4A==
X-Gm-Message-State: AFuF++nr90ZF60webI9LVkZSl3oBOS1WZySiVm4hnJouLgnjCsKLWbmg
 pCilnMJ3zfsduCJslt0NZp24CGS0rB81VVZOog19HBG9Xev77k4afBipTorsdw==
X-Gm-Gg: AYBFou2U5g2TR0n+zSz5cLJMBO8nAJsAz2YpHB10zPNsTcprYIOYFqKuUuwEyblW/HL
 61Zd2UTEOY2bvsZkXZwsMp78oCdeeTsFzvyQ1TkgbJXmmkYOcGAqdQP/RqvXlimMpS92RuBI/Ni
 1vHAWyYlGsxnKVmF/21uZ3oKVtXey/sUc4uV7E0jKrvELWVVeNrNfhSTuAh1CgluH78BCaGeYxK
 WkgaK+hUyNtprAfD2zmMw4LWsBzw91PX/c3pDpU1YrRCnR5o8MACvMznTfQOzRvwmfPW4AspSkV
 sBMfhxBM0BQmfcUS33ECEcD382qGG+C1otPPrbMGcGKsLhsSCCpwfyzx4fwIuvdsVRb79Yr5PO8
 Inf4VOdpVebdNeeg+DIJ0RQRWHhkNOczA6ZFWuOL1b96x5+qZfAP9xBz7pgGWdMZkI6mnEV9Hia
 4c+xCb7Od8o8lS3kwBrXGtVv+s9J4EhM2NQsuv9AZuAnrNFUHhJDu/OcJD9AArmAxfZ2E7p463c
 ya6nJ0fSBcWrrFn+7ENK3gxBsGaavk0slpAJaqT
X-Received: by 2002:a05:6808:6d90:b0:485:48da:133d with SMTP id
 5614622812f47-4b9621b00f7mr17672954b6e.10.1788957577860; 
 Wed, 09 Sep 2026 05:39:37 -0700 (PDT)
Received: from penguin.lxd (138-28-90-168.fttx.imoncommunications.net.
 [138.28.90.168]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b971c8ed6asm16218585b6e.17.2026.09.09.05.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 05:39:36 -0700 (PDT)
From: Matthew Weber <matt@thewebers.ws>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr,
 Matthew Weber <matt@thewebers.ws>
Date: Wed,  9 Sep 2026 07:39:23 -0500
Message-Id: <20260909123925.29971-2-matt@thewebers.ws>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260909123925.29971-1-matt@thewebers.ws>
References: <20260909123925.29971-1-matt@thewebers.ws>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] support/scripts/check-host-bins: report
 RPATH errors after library errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The missing-library check sets the overall error status before the RPATH
check. Use a separate flag for the RPATH diagnostic header so both errors are
reported when applicable.

Assisted-by: GitHub Copilot [VS Code]
Signed-off-by: Matthew Weber <matt@thewebers.ws>
---
Depends on v3 of the check-host-bins series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=520240

The test script is available at:
https://gist.github.com/matthew-l-weber/34fae15a4319a81462961eadf0e31164

While exercising v3's missing-library check, a mixed dependency case exposed
that it sets the shared error status before the RPATH diagnostic is emitted.
The existing header guard then suppresses the RPATH header.

Test 3k creates a binary with two non-toolchain dependencies. One is placed
in the synthetic HOST_DIR/lib, while the other remains absent, and the binary
uses an invalid RPATH. It verifies that check-host-bins emits both the
missing-library diagnostic and a separate RPATH diagnostic header.

 support/scripts/check-host-bins | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-host-bins b/support/scripts/check-host-bins
index cddf6a08b2..5233f6cd1d 100755
--- a/support/scripts/check-host-bins
+++ b/support/scripts/check-host-bins
@@ -12,12 +12,13 @@ main() {
     local pkg="${1}"
     local hostdir="${2}"
     local perpackagedir="${3}"
-    local file ret
+    local file ret rpath_hdr missing_libs
 
     # Remove duplicate and trailing '/' for proper match
     hostdir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${hostdir}" )"
 
     ret=0
+    rpath_hdr=0
     while read -r file; do
         is_elf "${file}" || continue
         elf_needs_rpath "${file}" "${hostdir}" || continue
@@ -30,7 +31,8 @@ main() {
             printf '  - %s\n' ${missing_libs}
         fi
         check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
-        if [ ${ret} -eq 0 ]; then
+        if [ ${rpath_hdr} -eq 0 ]; then
+            rpath_hdr=1
             ret=1
             printf "***\n"
             printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
