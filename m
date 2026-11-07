Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63B606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KBzLE6Ra;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeCCaOLa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7431E811AA;
	Sat,  7 Nov 2026 16:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTrEuyon4THp; Sat,  7 Nov 2026 16:34:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9994081168
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069276;
	b=oidAxWGyJ7lRrKxaZG5dzd0BdxBusbPEloErJ6SVI8yO4GfHR/titxlyolcbZTRRg7Be
	 /fxW+o1IPW8/viISEvdvLRkT5Oo4h1/smh8Clgh9XE8/5R/5XEo10Oss+MjZxWGSSIn4O
	 u2SvUpoq6Bp0tXk4gJGqSni5fs/+Hf91Y0mPyd+IBaR8/YihgjZJqdHdf+HglyPn4oQxi
	 Ku00MEL5gO/p7F7emDGk+s7ikgYxZvZE5poCeQmOSGHBkDVTzJVsok4uzp/a43Ks4dXYS
	 AmQHoO7FAJMKBnmqVayZGoolKCWTqsVqMN/pAjqXHIAscxF3vUOM2TfvB4smrDiJJaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=F4w5Ntp6DI9sS1QK+qYgq/ewMVNqvD/zRml8G/6WDtk=;
	b=SPU8EkH8iInZTlcvx4imsED/tDg0Xh69qaVYJ665yuTy+d+Gm408+YM+Sscrm3SJCl6F
	 8MSJrSrYFwOnMsaPDZ/xQGYwAaAeTupSeGFEIH0rooB/J5mTek33CXnjeg96bN3dAOeEJ
	 8aCAaOk9+UvR5q14lXE8K+TcYyuV8AHX/9KvxPAeJVeCtTDPgiG6kWSRp7E2t/l3ObBp8
	 bPyrbTo9REaDeBOCW8o+ungI7p9pVtmBgimvEnwLrGJa5xlBpvo/l593OwSovhqdsyuDi
	 1K1MaMji+lbzjcb3buzP9v6avJdvAFCWoKv4+JZpaQ1/nN6GynppvWo70NL5SU3sIYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeCCaOLa;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069276;
	bh=F4w5Ntp6DI9sS1QK+qYgq/ewMVNqvD/zRml8G/6WDtk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KBzLE6Rampm+Y6heCqqm9UP7DyEnSIBi/X8GMf/0keTTD9EwGovotVMlefBkujf7G
	 7SmM4uP/YPkldj4X0GtpZ6m6UsHtvjJVVBg4tM6ulv8xTwjWZ8rxdpV4jw2gMHmmdZ
	 OpnbmIL3PTHs7pzVGVMVmUiIyzLMAVXbRK4ogCSz17Jq/PDVyR8Zwot3UpOB5qEQc6
	 +x8dPok7MdIbSv2Qpj1D1jdBrnqcXoLqPXSYI2TFMY0qo8YZD9bzKsVC+Gv3YXG74q
	 Zz2g5febpvH/gkXYWa6lCqkEBNkT32ueM9r4Lba3DzvO2/3iSLxhr2k1zgNxTEPghl
	 yMmLghjkVcrzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9994081168;
	Sat,  7 Nov 2026 16:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13218A64
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAE2C8119C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aYApGVPcAVz for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 06E72811AA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=PeCCaOLa
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06E72811AA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so18083465e9.1
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069270; x=1794674070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sdWVtlw4EcGeThxP8h5n3scCEUewm2Fc6oN9zRCbkF4=;
 b=PeCCaOLaBbAlVPHCSKASRPm+0jU7K3B//dhZCrfdBxvMrzrjenUqihailgnx8ZXkex
 7T5njufmp6h4g3RZGL2VnROn5f2anDA6eaa21DvBHB0qZ/aWwgcu8AOeWRvy9JP0XF7o
 12Fl0HGiQ3o205YfP0ncw9w0Mv6K2hlLjmb7EQT3tJPcCQkkb1+ok6EJmElbz29ywgXz
 9dMPffGFD8/XI+Z4Bhko3rSO88yfkm8TulWDkoqM0xvD4kzwUmiqnlaticUf4ajjGNdz
 ARoaMRXoI61Kn5KWPMdIaLVYHT8wmFRsAJROQfDfHbkK6B34Teo+EWUKe70G+g0LBZ9L
 cxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069270; x=1794674070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sdWVtlw4EcGeThxP8h5n3scCEUewm2Fc6oN9zRCbkF4=;
 b=jCpGvLCLhDBtbDdSNUjGPi/FhdC/yNFhCMMpdR0xcdrgF+P8gVAlgSqkpRvCNj7FBy
 uKKUVpvEUtemDDvdsPL+nwk3527wphP1L6qoQICrMHGPgKbJTVJDtQeNHLNYFT+W+4ZS
 +bH6ZiZlG0EWEv5I44J9pJiuFr1OLbfeToUktfROoV1aDP+vdcQMHJZdV0bmVpC4iJwg
 wKkjgQilogLnFyxJjJVTgWNkAZ5VAqaoYQuQtLPOJgjiWA86xxlByLch9RZl22Nd/unE
 GMdA5ofz0FjG5vcQiACgBpsxhp++5nyHp0mOnZDpNvE8QxqAhcpOhPvlUvIWCO3kRmW1
 E0rA==
X-Gm-Message-State: APuU4Z+pvw3nQ2xAaG/oXSi1cK5pPFHxw6kWSM5amJN9GxueTLc3REqj
 fpKm9Q1atQNLSJvJP0mzwBumq9NrjzsRZ61ancdB9u8iWKl5f86UuOXEMyFHeyW1
X-Gm-Gg: AYBFou3Sqqeoy+G3tVQT8dxKr5acHHN0qibee2pNd3pHbl4e00U/ry9E6ty7z3urGKF
 +rf0vB3rqWaPfM8aSdk+PsEoNSfrryNWkCODQ3wsoblHWvPKnmG2Zpzp3kQYcueolkkdwLkxvO7
 ZRFrssuCF/9eByLAiG1D5Cn2f5hdFpvOm5HEUl/QRmXK+WVAf9Dm82x70E1ccf0znKM1VtnXPfi
 ei+rKs1H+KTUIlKazVgpAByhoN6S5Wz9w2XgxugNNx2jZ9T484daLhROEjzAc6luzhtXaZn4Ute
 hiWEUJi1uZBohUuShWRkT78jCHg2eZZrV/O37aZOcpZZnPe1B4VsyQvWvoICaRcaPZet+Kp7cn1
 8lNHJS2Llz3U8tbR9i1ULLJxu0TEfRK/NkPDKaCrrP7GIBnRjvwjIeG6NNbLM1uHyc1jrBtxlk0
 EcKkyiB1lpp/sEkDuOLGuM5ruKJOWGLv5KuVTOR28hbaqtQOmRuS0yYJYlFgkTuxs4drcwOmqv0
 sWMculWWdJQd8JFol9dW+HnKmpXORlBFqdDxT/YcVrtr2/RIzpCN+HXMy0xcuw7Xtsl75ff2ZmT
 4YGhTK7gfvIRAQddAy/CkH13BDLWaFY/WcRLWcxEoT/5SJTpfHfF6SWZ8vvDDcnqjgCI/Q5uLQ=
 =
X-Received: by 2002:a05:600c:8b05:b0:4a7:462c:6b9e with SMTP id
 5b1f17b1804b1-4b6e0172847mr113148655e9.32.1794069270254; 
 Sat, 07 Nov 2026 08:34:30 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:29 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:05 +0100
Message-ID: <20261107163414.560896-7-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 06/15] package/usbip: fix the configure
 options variable
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

Since the package was added in f05f2c1ad7 ("package/usbip: new
package"), --without-tcp-wrappers is set in USBIP_CONFIGURE_OPTS, which
the autotools infra does not use: it uses USBIP_CONF_OPTS.

The option was never passed, so configure links with libwrap whenever
it finds it in the staging directory. Rename the variable, so that the
build does not depend on what else is in staging.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/usbip/usbip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
index b4475c8d89..e56d5f8973 100644
--- a/package/usbip/usbip.mk
+++ b/package/usbip/usbip.mk
@@ -29,7 +29,7 @@ USBIP_SUBDIR = tools/usb/usbip
 USBIP_INSTALL_STAGING = YES
 
 USBIP_AUTORECONF = YES
-USBIP_CONFIGURE_OPTS = --without-tcp-wrappers
+USBIP_CONF_OPTS = --without-tcp-wrappers
 
 define USBIP_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
