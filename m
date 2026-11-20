Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0560A3803
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FouuOXXy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re60s89K
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9388140DF9;
	Fri, 20 Nov 2026 11:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRgxQvx8CEu3; Fri, 20 Nov 2026 11:11:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A80E40E3B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795173064;
	b=gmGK1X/WpedRE/f550e914JV+oACqgPHAgS0iBsmdZO5BijE7HX+kLWBdc1gHJciYQP1
	 trGJ9Yon2bRHIVCaFcekOhcUXCSYN9xMqeUNmiwAhwXdlP0TkF+8qfTphlaHk0DbwvjQ3
	 X3N82RYHxvqQyQ2Jdwh2YOt3sBcetO1gpoEMuFAhNygtLSlD77T88FiX7iLgAUd+wyOxq
	 FjNY2VCOEd/gRsEBKhbA8M+NED86SwlF4/wrxowmVgcfILiO58F/nIvFdcfb3O3y9eVtw
	 xpR+EmKGU/gVHhF7QzlawS7mILEQBKNmHmVXutSNned+pbDRDFuTQZhj3MKa2WTcSrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795173064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1rnFTw7hDcFq/9cQ8e3Hgk94S1vjsmeqK1LOhGNaFiI=;
	b=RRfhGJTsAMLQ3mVNL4Un5mlLjZCZuCSHiLs6OoteDwlcfppZha1IBPl6eziVgqWRzMAH
	 ML01KjH+DsyqATBI1IrMAdcIEqOixWSa+ZdrbvwH/LNdg8VPZxdB2lkXgzr6trTLl9SiT
	 WrYDKQ9LdIDUZTmbvImtV/apSvNt7vDhwzsEoIluvTfprFuk3SOZObzzOJ4IDZ89dQrIR
	 E0hm4YkLXh5a7LdIsXZhMP0lAow1BNMtl16yaTtmZNJhY82dntWDA6OgyNFoIpHVuD/SY
	 oaYuOog+eM6nnik9Yn791S6OF7JMXXqoHBJ4G8/xErkpteT4ecv1CH7I28Io1kFRYaw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re60s89K;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795173064;
	bh=1rnFTw7hDcFq/9cQ8e3Hgk94S1vjsmeqK1LOhGNaFiI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FouuOXXyEbfwMYWBeJHd7plBqWM3pZNmugpJWYB2IKGp2jqdqWcRGH4smO19jZM4y
	 CMZUoXBnwlzZX88+SC1Uc7esh7yP7mKYou4ZOSbrbX2Y3s5pWXZxv7fZSYuer46R5D
	 g+RVudhvMHnrJ70SC4HeDjQAhdhVRMPNDoU7OxjYkbOVTMkzqhU0WIZxpzfEFR8Zkg
	 woFOBD1bNwJc5PjD60k6AHZ97sSS81QztFg8DgeE9F4PVNGkl1P0fZyZILNlUUcJB7
	 1Llq+6J+ftxsLhqdyjALrKmf/As4UaWtoX4M2eFlElHwsq5Xi0XrLGb8l5IP9+uu4Z
	 5Evh7hFD2qHVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A80E40E3B;
	Fri, 20 Nov 2026 11:11:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B690E52
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 11:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D60840E18
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 11:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKF46MOMVyaz for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 11:11:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2EC4E40977
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=robimarko@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Re60s89K
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EC4E40977
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 11:11:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4a32576da88so403571f8f.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 03:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795173059; x=1795777859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SXc/whhjgj+qAh+3NXL235fj7cmWMqnML3VXXXxRiSA=;
 b=Re60s89Kk03Q64/QTeOyY9Y+2T8vLA48oCq3evBj76BMSAFQiiywSy0cNem7tcc+Br
 Z88np/6hFyfVjQfYsKYPKpUdWp/YYpY/b66JVT7b3NRcj75OkiGiIiC6AKCsLNnlpfqX
 DSZRG1xdZfeZawc7cc5cpbY1eM4uFnU/1bFe3znz4iR/saUrhBLUO0otLe/GM/YOYWRc
 DPPvKTpSS8S40AFmZHrOJEvF8zFkd4axZG5o3WLhZTOfWR4UZrdzWwWuglUqkFls/Pz5
 UkiGO2rHA5N2ypxA0XHMr+31cCIFl8nIjmFHKtcFaBf497fe3sH6A84wXiEYhRAcaBwU
 2X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795173059; x=1795777859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SXc/whhjgj+qAh+3NXL235fj7cmWMqnML3VXXXxRiSA=;
 b=YS+lronV+S8yCOYEKtd0eRWxwsNcGU4HzGTLzKEn9+AHelmaGukOAgwM2Aeb49WeJq
 RAbgBmVAK1Q8QSqno+L0MTlpCOknukNXb+88KiQ/oNFPzxo/hrzlupZJgPbVYtYzIIMC
 drrTfIBrAH0dm2KYffNu0iRREGAqZtLtglcjB3UnboxwDWZk3V+5/Mw9eL4cDVL8EZ1K
 qMAiEkSi3t98RBRP9Aq6912gMCkJMSUK1lw9ZytBfn5auyIC8kGmwn+71osBNMe8hqm4
 LWWBNStKFgm3HPVD3NFboIFUHVEA159nXcejgQDHL/scdwh0b+UofHPRpK5OkZieR1Tu
 XfKQ==
X-Gm-Message-State: APuU4Z8Q+OobDJ2uCcXF7OY+yDvC/sg/1jkWuVHC4x2nVRMamQJ2Etx3
 qmSMaDk5LlYqP0XIJUulp0wDpXvMmwYMTjfBRffqjSeDy9xEpmEocsAPetIIiAfB7dE=
X-Gm-Gg: AYBFou3Lp/cuCpUV6aXjG7Mt62HzUGgeiHin4Uvtar8OdKv+yG4G64fvTW32LXfi5Ke
 DYM7QHrHxnriEfn2j/GOIlbfELnag/3ls6dH3mg+iWSctLfceEqpVkQN5BXPpQ+c0ok95tpNs/k
 aLA3nb2UqBWBYg+ikWq3tM6LnwbVgXoYG0jgWJK7aJFtxll+AF00660Z2ITftO9gy9mhTfjYN/g
 wiZ85eocPzHi6dBPAyFTaj7qFW3paQCEVbwDESiAzUo6kjYWSGreosjRVkO7bRFATSpEMuRQ2XE
 Lys6dVztxc5piM89eWYFNWicvgL8Vqi8ajJkntawxI9roFqkI2+DoZdxN9+yFe6eJIkJ1zRlimM
 HWpzR9pbU2dfP4ZP9qBInZq0ApMDX9/UJxFPPzBJMgul+BGgy6YNNeZTHjTpO6cKuCpS/k6bzaH
 DDy+ivar5bXVoI0YyypdUk+eKmlirZ8hQ4f/jXeyFhgk/iSzMwvBoAuCCWt9dMV05aeIUx61VO2
 k7A+EDAEqITcTwOTRfzMuEyxiQmwmzOUEnfZPTauSmw7BCzHt9dfE22v9f2cFdR/ok1FcPgHIrV
 HtzmX5pBUtntVSs7YZUtMQAJ9zIEYEic4yadbNcwi8NR7jzP851n6j1yaJyySJayIt1OUXtQg3d
 FZiFplz/Zvqd1mFJRqig6m6+y9fBeyF8/3sZiiMwtHGQ23zw25O8bgfvQhXe7i5j30tDTLQRsp2
 ArZDErBQgebjKUnYeInryx/ab6nip2ptNExg==
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id
 5b1f17b1804b1-4bb88826921mr55434375e9.5.1795173058623; 
 Fri, 20 Nov 2026 03:10:58 -0800 (PST)
Received: from threadripper-fedora-workstation
 (cpe-109-60-83-101.zg3.cable.xnet.hr. [109.60.83.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88f1391csm52199695e9.3.2026.11.20.03.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 03:10:58 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 12:10:46 +0100
Message-ID: <20261120111046.811866-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120111046.811866-1-robimarko@gmail.com>
References: <20261120111046.811866-1-robimarko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/linux-firmware: Add Qualcomm
 IPQ8074 ath11k firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Robert Marko <robimarko@gmail.com>
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

Add ath11k firmware for IPQ8074 WiSoC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index cf0a6d765d..13c488781c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -200,6 +200,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_IPQ6018
 	  Firmware files for the Qualcomm IPQ6018 WiSoC
 	  (ath11k driver, hw1.0).
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_IPQ8074
+	bool "Atheros 11k (IPQ8074)"
+	help
+	  Firmware files for the Qualcomm IPQ8074 WiSoC
+	  (ath11k driver, hw2.0).
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_WCN6855
 	bool "Atheros 11k (WCN6855)"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ac701aef5a..18d88135b5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -280,6 +280,11 @@ LINUX_FIRMWARE_DIRS += ath11k/IPQ6018/hw1.0
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_IPQ8074),y)
+LINUX_FIRMWARE_DIRS += ath11k/IPQ8074/hw2.0
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_WCN6855),y)
 LINUX_FIRMWARE_DIRS += ath11k/WCN6855/hw2.0
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
