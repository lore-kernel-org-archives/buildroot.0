Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08202606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hgEv4/DA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IkZ5fR0p
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFBBF811F8;
	Thu, 22 Oct 2026 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJBdWOsIghTl; Thu, 22 Oct 2026 17:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EBA2B811E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792688868;
	b=a+1L0xYL4QbcY+lTvZCgACN7kTcXRmVKlUJIX9q5CqoJA70CLgv96e/EQjNEdB5St1he
	 GhPCTztZWkrjuqhb2rKpd6TnK8kgCGpkNFpcYsTv++PdcFDxACHvc47qjX4nIkxL+xSHq
	 AVNZbd/jVCUag+CbO9T1qC7+psbC9VQHzFDTbbvfdta6swPglNr9iojJa7SrW5EWelyjm
	 z9q8yD4zl/KCMBGXR5chTr8qEez30vViRv88gzp6s70zjxEsmhxUu16FFGZJ6OtJl9QjH
	 PpDYoww3DSRUO2oU/sD7P8dxSbzKF5baVg9NBc02tBPo+luyP4KkkqY9XwmBSOB8aqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792688868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=eFrm9q3M8xhdCsNmWt2BZ57ZQHwH5f80u/sNMyxIBA4=;
	b=OEo9HYdR+/BFVk8jsiSSgv9oO9l7eK4O7RP/yPUcIFV5RWYbdRibOx7nqCubRDE9W0jZ
	 7SlEQnZahOtFMF4jea93mmtDSZQkeXSoi0kaDildj2c0W4HB52tWx32m6/Wqd0ZpXbaxH
	 fBsA/iNg4ee1PqGL9RINaShm8QensCVBJwJT4ccOLrQOnsDKrW6e180I16JJUS3ETaRwt
	 J0NzqhRW+SDJtEXxYmgITyKCLVu4KA2Wv3J3e8O4l2617AdDNt20BqAKRAOaPXrFTURil
	 mD+Rn6iKGr3j1rm87pZFz1Yk0Q+tAFKdyLyzuca4afmAmSRgk78PiSHFtXeGEbBygNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792688868;
	bh=eFrm9q3M8xhdCsNmWt2BZ57ZQHwH5f80u/sNMyxIBA4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgEv4/DA4HwaisGzoWLXl0EMqQP0xO2eESmv/ZftY0zgTgeDgQlv+Jh1qupJsjgsS
	 Io3gAtt3XQBqNpJS162IR/lwl2DCdWVN7HZLuFJN8AZocoa35HpvQMWOAOVWUa7Jz7
	 U36KNK28urPdl9/s2ABMEhvEJl4uli6KrLnDJajdH++rPoJap4Ir6F4GkB7bhnOy8Z
	 /dMFN59VVMh8nBlKmF4P1dcZOPlbGmkR2HrRsagR1ApUHbuUTA9DVETNMNAIUT0ol6
	 Mh34d/muco8KirVQxfWCNC/tbnH6RBVFs6gncWXKoYffrvMPngcgi9qoaBYWbAS4Ws
	 0aYVkMZiZ1plw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA2B811E7;
	Thu, 22 Oct 2026 17:07:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B00D191C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 960A8606C4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BA2ZaLSP70L for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 17:07:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D50F0606A5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792688864;
 b=Sq1Z9+Fa0jet0DySZu+UxAMRdUvUg9vI1FePSG8vCZVcjOS1C3i4oE22Ykyjvrl9f9Z+
 3tQ7BDBeMCapUybOIqeQVbCOBDHo+0EJTfsZhAp/zPzbXIkbYiJn5OCeZ1vRoxRKGO8Wg
 rTT4GjT4SWqipT2iKimShY0zdRFy/jprTnk+2g5splFnu8URusPJ+Rxr7KYUvGCoFDY/q
 tBFo73sdkpsY8XGsC+y9uUiBg0lfopx4av0FInbDvsCCv9bvBidinQPQXNuhJjIXUMQU/
 zR1W0bdB9LoTe24n4eqIFJUW8NAtA2Dzs7PNYudALrASQBtY4lc0n+eJvgcgei+kFhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792688864;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9OmrFnQvut1h3MTw8N/qc6YDIaTdVzthdh+6nou3zwo=;
 b=ab/4cIwY7vxhtyVA0yAEOEEThJ33iWJtfGaq2b1c/oOFkp/dJBGzzSCIGaknph5lrawZ
 H6EBn6WuC+OrFy31+3UgFB41lpUBmUm1b8ypeZPRbVMOrCP3o+rmCT/ELv+hQrvqcPcdk
 UTKFHIV6BLs34+wE8+chS4Q6zWkavIDnGIfN8k2VqQ3RAtiDf+lmPw7tt4GztwIISTQhr
 X0lWL7/ra84rF+HxjfYDkv803KNWG4OpQfXqTA8IGjEzfpRwLB0xQ7CfeMJqrnmXoVJLf
 3oelgfRoyERRuvd4yL331IqfIHILzQlYhQ593us7kM96gfZP01T1/jQIXcdSw3RMD1A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IkZ5fR0p; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IkZ5fR0p
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D50F0606A5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:07:43 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7f432ac553fso2034130a34.3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792688862; x=1793293662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9OmrFnQvut1h3MTw8N/qc6YDIaTdVzthdh+6nou3zwo=;
 b=IkZ5fR0pRYO+KbaLX9QJFhQNpimePlvLdaGVMCiiCWooeq/vISQ9p0yGN8/disut1u
 gEmGI3MZIbfKWZkJLT8dcI/fs7j2LG+uHLXkZOC4nVuRGUfGFnw1zbytanewoQmKyD9q
 pbHiE6bhJMS7/2zdolCAn1UTvNRAsOZUZTECGeoWHq6iRH4++xXeFH2pnE5l9/QHBZlx
 98IVMdgMQcJaWt+abBmmgaG1IVmxtE5UMqWyviJqdUpMoYHK7ztP6eCT64IwnhSzueKs
 XBL9zGXLIObBuUMxnMyw82b7uEMT7fJLJD2uihKz3YB/htdNT2ZfOAHsCOzk5NoT6VjF
 TWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792688862; x=1793293662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9OmrFnQvut1h3MTw8N/qc6YDIaTdVzthdh+6nou3zwo=;
 b=kpl2b+feymV1/Q9hsMKGGkYC0X1bpYUsjVjXvKshgJz5JZrdeePXhToW8eeH9L6uy9
 dAAjosu5HKh8uy4MSkrJj9hzk02MitllAFVB9owRo9c8WBqBVpnVCQcFkYRh6ZuhD/BM
 X755Uzem5n6SPBgy2jKYG3eCVHPUvmbXLEEGu9Yb2gbmD7fGV751+fInYlisW8ukIMEK
 5+8Yp2nEphGLNO+3qNEWDDFJXsTs2/5ag5C+7veXojmKMn5VX6YlrmbCS0XLqh9XyEUR
 bB2lOxMPAj0ySizCXBb1RTEzVhFKeBDrLpxXxJ5tUiL83OGlaKsBiZe4HrbB8uXH30bP
 V9uA==
X-Gm-Message-State: AFq9FYKo1wUeYRiuZUGIR7bY08K0Vgj7+15Vp+XuEDKZ+aiicFEFIHHh
 eHFrCF5rbdIdQGRKGCkFlbe8p7nyD931XWifz8TuecuJsm+oP1EybVIAqW+0OBBY
X-Gm-Gg: AYBFou1vUrcX3JzhgiZzlxL1eVurxn8aa16Z8uFM5jCrJre7sSLsCw/fsIATUSFaNXM
 YdiC/paeVy5dIO0LD2Nq4PM95UWELz0W8brEISKE4XrPqRLWot61d6n6LH0lNiDz2P1EfBeg8Mk
 61GAzCisJ7H11Kbn2R6kZTtNrtyhywxr//l82IZ2nTGlqdoI4wbZk77S2YHnkUEbmZgOVIg6LDV
 gLjJ3BxdGXok+B/GgY/wDzJHhZqXyPJjg5k22mLK8ykw7GjW2YH8PX2lnXneHpTtLRDi1EU/8gn
 /Hilawm1FwVrmhKiJtYah8VGH6RH7GuqYNKdBYmozbZB5mfVgRz1E3S4odqVk3QhBt6WYw/nCVb
 4ZcH6u6GT9mx6dGGNzY9xGEytlOtYCHTcDc5075NsaKuEBUzLz3Jnm29gpFKYXmlMndxRxAm2jl
 yia5rhzHN9FBgDGWGEFms5jgYDM2OyJo2kON3Gv79blLVtW+8M0Y4Hf0cfHKhgTxz3pc6LKKw+P
 PpJZ1lVNi/coqlXOwkq+dhnemQOkvwx5hmFPBLj66zSMMcVYG3j2OvDalukCiCfo9ABuVZZp+lS
 RziJzdATPSI0ezWeP8dhi5+ek+hf0rYIZX6yXcbH0SUzty1u57zY5nMBY6085DUhMgIa5PWu7Nz
 GdzPSKtzAUyXjAUt9r4UhQtyUCdyR1oG3o3voEqDnmNPEfHEFIE5oPg76eE+ZS8xVlwVieA6dTB
 v7AFFYecdM2S3/LHVYTrDW3WY=
X-Received: by 2002:a05:6830:4ac6:b0:7e6:d0ad:5254 with SMTP id
 46e09a7af769-84d0810575cmr4554587a34.8.1792688862190; 
 Thu, 22 Oct 2026 10:07:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-84f7703bfffsm243128a34.5.2026.10.22.10.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 10:07:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 11:07:37 -0600
Message-ID: <20261022170737.3937695-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022170737.3937695-1-james.hilliard1@gmail.com>
References: <20261022170737.3937695-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/tailscale: build with nftables only
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kernel configuration fixups enable nftables support, but do not
enable the additional kernel options needed by legacy iptables. The
package also does not select the iptables userspace tools.

Build with ts_omit_iptables so tailscaled uses its native nftables
backend instead of potentially selecting iptables based on which
tools happen to be installed. The nftables backend communicates
directly with the kernel through Netlink and needs no external
firewall tools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 950f9786ca..8ac2ae41da 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -11,6 +11,7 @@ TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
 TAILSCALE_CPE_ID_VENDOR = tailscale
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
+TAILSCALE_TAGS = ts_omit_iptables
 TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
