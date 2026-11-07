Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F6606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dWPNBdri;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFkSvIRa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13684075D;
	Sat,  7 Nov 2026 16:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myMw2c7XrdR8; Sat,  7 Nov 2026 16:34:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA5BA4075F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069278;
	b=qtzHOlCzrjzvqWF5zivNbBZHROlpVPArmKrcAGJoe06NnaKfeW1fb9mabfALIAr9W5Wc
	 KwNtIKKMlBG+evbvvkpiNVNKts9YJy6rencnljxAbts4PCHWB86s+VyK0YTLGQGNx8YUP
	 zw83Cc+0DbAk8rvABmxcDmRLNevCeZdJIuyXUsWnSP3xfJbtlAu/bIS2g66T3QyVJ79w/
	 LTdqVH2SresHwbDhYxin+MTKnSF7JieCo1inaEWZpTKw9maVHqHOsJss1Yxu1bsBnKqH3
	 s7QVRZmGL0pQjaL0DR7a2MIpr4wt6JG1zF7zIABGFehw2i2IEz4zxsVunBLnmX80XFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WWRrOX7DAM/g3brXMEkvu4kk++O4rnFKOMl5Fqc/VyQ=;
	b=cAqSRdy/Q04SBCPFkHXo+KNpKlWLC990+6QFp0tC9uREuccmB8OKH6GMTe0Un5s5xh/o
	 nOh1m4+kw8wfI1bMaoB38lFlsCNqNzdmdGD6Jp6OTGgTq6vFnYwDBw0AdGPr7Nxb+zcC2
	 K+pf4jNmxMd3byyfn8XERujp1fYZBN48SsZzRrDo7ZixUTOroxdxozRwO+HYfZeZ1XqX4
	 d78oECBj+zbilXL3RJ+wBNe1RufETZ5QR30wekdJgsQKbKtZZTUubzjOhQJs48uIreDxJ
	 bbdeCxyKvGLVGVyCHhf79GtoTVh0BRNKxq/f/7WSxM30gEc0FfEHM4PScKDdp5MVbZw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFkSvIRa;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069278;
	bh=WWRrOX7DAM/g3brXMEkvu4kk++O4rnFKOMl5Fqc/VyQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dWPNBdrioFALffCfbD22TYW+O9m0FPN0sInDKRP13cZcGeGM1gjMpMRcAs33a/c7N
	 TBjizPovwbX4LLswosAVZy9fDWpwsT0bef2AQ2o5ZEjrCblL3CPKtjhEn5Sbw4ypd7
	 /B1ZuGlfkIdQzohDVbznS89mWGxemYK641tJ6f0zFySsxYoswsGCWGq5NVydDlEjPB
	 CQ7m2FGYqk53/SH58CxL29qg1ME2qWaRlcZUfEkdLYjbDtVrymMK3g2CxGQq+UtL7c
	 0LB+QS6zK3xjIQZzUFGuk92CBz0Qb0+JmiwOAMrpHybfHkEOt0yXDOQuuYxt/FlGCl
	 7y4bPmBysAB1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA5BA4075F;
	Sat,  7 Nov 2026 16:34:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B49C734D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9493640790
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOJ0pDIoz2HC for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F4C34075D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=QFkSvIRa
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F4C34075D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so11843265e9.0
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069272; x=1794674072; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6MVcDac+O3oVc4V3KFGCm2+l+vXtz4IEHAPToacTPQU=;
 b=QFkSvIRaIc0duA7sPKbh1i9TZ/lb4MtqZJdEA0SdHGOHqDJY/1T47Sj5sCa/2kZQSA
 d2A4p0F5/Zqvu/ab2AgtU1w2m2E0bfIglp/8hvxW0acUtAi8I0+R1jBix8O0QWsK3WTx
 nI5Q+eci2gplxsbYcMWogjlIMxXS+oveqMO7EFJ0QHhrk8ucztXGLrhXFL3VO5o6oG7Q
 CXEQyD86T/O0gtmgLqMz0QIJ4CbarlW8sVLTrh65FXnBd1vBvQdzizdxCoOZ3opH+oQ2
 JYTIGvcs1w/S+a/qx5sqamtA23UxjSYdpQz5p0N8Pa7Y7JAau6n0BitiNi4HBjXIaiAn
 cHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069272; x=1794674072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6MVcDac+O3oVc4V3KFGCm2+l+vXtz4IEHAPToacTPQU=;
 b=GATButMc6szyZhg4nBPi74E+xwD+M28/FrKKIaQvNikSlSMWjyu4GWlsYJdpH8Nw+1
 xNqiB7HVPB/ASs+/AbJRlzI0ekBiwc7RVpXnrk3ajg0P/Qkfp+lcW+6xVeDLkz6XKRDL
 uk7JxHgKsTcsGcHxR9rsPFCSoFt0CA6auSxXL9RWCO+aoJ0Pv8m8mONbmYaEDTMXxsrM
 Xv2QN0rpLFMAJ8vtCM1kBm30aJBw//jPmOR4+v9n23jn4KiWSpS0foDzAEMhzKdmz79M
 nAqRyydMsNRjTDa2zJ9UOG3fohWRJlGgqKsQwemD1VWIj/HTUmSkVDStY6cOCLjhMMsC
 EuJg==
X-Gm-Message-State: APuU4Z8orBoBR1i8L4kCCWz5NpSA+nychOuU6x+QZv/8ChUP5YIaR2oo
 IZ7oZVmiFcdMicXm8nUofaDK0G7pO0KlCsxLJI/k39yqW4+K8YI0hqzRM9UooNYo
X-Gm-Gg: AYBFou1vV2SUup9AjEkfwr9DxfxnrwYTjoQjSMKG07Z4pKuO3kCYew9n+IXbCxofPXz
 VO3VUikkN6FPqLoeJw9A6SRosg9kSE1tZ0hgyGgswEk1Gza1EiRNg6f0RYEVSBfpW4S+y4oegx8
 IUUZEHQ0V5XX+N6y2dpaVhiDGn633PSKeHi7HPhEuHhKakVhRtBYK1Yf4VJj7Qk8KiExqzd2rHl
 IQrNVUPvknREgxaVCThz2GqvA7FOGl1ZzIV+yfW726WrWnCjF7oH2aOHB2W4DneQruP/bQ3u1B3
 tGo8jRMclCBthjUWtPhzohcRQWfiW3a0UR8GJH6PcXoRZq8B7+xSpi2VW1vddtVA2viUSxts4JG
 2LhHeZr5pDqJro9W2QeWVX3Ozf4tIVScUgYrgNTN4wYVY9f6DeExVf9SHPpilPaFT+r7rybjvIs
 TrsygR0NXCkS/sbkmegVKjnGJuxAMuIAvbpXNJC8pTmsUFXEafJy16suinW4BN665+4Dpv5SjUs
 Ax34k3b/E+DNmJKJ0sddLSYNY4IbGgnWN8CC/KIWUgEX4X7dxqO8juX5+6tm6s3Sn+tUrB4+X9K
 aiwcbIddE+TgX5cDrOxP99GEQ1Fu0cPssd3gwLWd7XuhEI9OzaNR4g==
X-Received: by 2002:a05:600c:4ece:b0:4a3:59c9:a743 with SMTP id
 5b1f17b1804b1-4b6dfe8e516mr108696635e9.27.1794069272162; 
 Sat, 07 Nov 2026 08:34:32 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:31 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:06 +0100
Message-ID: <20261107163414.560896-8-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 07/15] package/postgresql: drop the unused
 install-world options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the move to meson in cc77be28fc ("package/postgresql: bump version
to 17.2"), POSTGRESQL_INSTALL_TARGET_OPTS and
POSTGRESQL_INSTALL_STAGING_OPTS are not used: the meson infra installs
with ninja install and has no such variables.

Nothing is lost: install-world is install plus the documentation, which
is disabled with -Ddocs=disabled, and the contrib modules built by the
world target are installed by ninja install. Drop the dead options.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/postgresql/postgresql.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index d852dc0e1e..41024e2b49 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -30,8 +30,6 @@ POSTGRESQL_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
 POSTGRESQL_NINJA_OPTS += world
-POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
-POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
