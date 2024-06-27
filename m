Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC41AC3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69F30400A4;
	Thu, 27 Jun 2024 07:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwTCr3HBl-0s; Thu, 27 Jun 2024 07:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F93A40523
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F93A40523;
	Thu, 27 Jun 2024 07:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3761BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2CC409E0
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hebA7-DqSvDt for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85A8C40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A8C40120
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85A8C40120
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 07:54:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3608e6d14b6so4815411f8f.0
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 00:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474885; x=1720079685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjO3Ar3o/mJdtV+HqdvBX9O6T+MbUjA8EeghISUfR6A=;
 b=oh3k5R4YfMV0R6615Y+3Qh9rLOuoXZ7i6qUMlhrzCqD0U3dVqQMNqxGMcnbUvy7ZRd
 HzeYwTn2KeQ3193H1EGsTyvl2bkzfI2S+rn2O8bRUZl08OEG/tfeFUXLO94A3mUVD1aE
 cWAtbg9sjM/wWg9afe+ZEBLcKbFMsC2yL9XcNVg3tnyYOxjn+aSD1kPzZ5Fqk892KiCE
 d5hCZnAdI/UEsPZOiFjXDgb7RFN1rHvU4xJii2SrVF2xSucyllL77JJ9GRPtdl4MU4QN
 w4T2h6l5JpdhAKnB3sRtvKWbZgFd/P4LX+X99iMoUMUz/bBiXlWDXeZSBsZY3nZeF14c
 0BZA==
X-Gm-Message-State: AOJu0Yz2fQT94MRGTFFNpYRR47pGyM0lsHpDk95hxRwmCx0legP/PqGL
 jhA6zUx9+zAnUZ7xB1jcghH+HxYaELPXcf4YjdWJDj5kxIJZtMu959px5k/YVqj2UyTVUj1AjGp
 S
X-Google-Smtp-Source: AGHT+IFu2IFsZW8XNoSrJJgZnfvIXHgAkqOMAoqPnPh142Fxl+kzTAwyqlawnqJHl4Gv1r2XDtQfwQ==
X-Received: by 2002:a5d:44c8:0:b0:362:4dc7:dc7b with SMTP id
 ffacd0b85a97d-366e965298amr7942213f8f.58.1719474884822; 
 Thu, 27 Jun 2024 00:54:44 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ee67sm991923f8f.110.2024.06.27.00.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:54:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 09:54:35 +0200
Message-ID: <20240627075441.4116645-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719474885; x=1720079685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jjO3Ar3o/mJdtV+HqdvBX9O6T+MbUjA8EeghISUfR6A=;
 b=oC9PsE/d0BjlijO2DBiY9xyF9d1FPjc8tortXmeeUOcLuCJK9fTVaM6p25XQ2U0B+Q
 H92+/LY5VU/Xl64TfP9fOP6IEipnDJ2vKhw20Xl+YpEwq+j4O1+3M04NIcwlFXklFXsv
 hSYI1Y592Rid/NsIG+Vz89IVjaVsiCNpxvwHA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oC9PsE/d
Subject: [Buildroot] [PATCH 0/6] add missing tpm2-openssl package and
 tpm2_ptool script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series complete the tpm2 related package list in Buildroot in
order to ease getting started with tpm devices. For example, some
tutorial uses tpm2_ptool script that is currently not installed by
tpm2-pkcs11 package.

Romain Naour (6):
  package/ima-evm-utils: update url to github
  package/tpm2-openssl: new package
  package/python-asn1crypto: add host-variant
  package/python-pkgconfig: new host package
  package/python-tpm2-pytss: new package
  package/tpm2-pkcs11: install tool script (tpm2_ptool)

 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  2 ++
 package/ima-evm-utils/ima-evm-utils.mk        |  2 +-
 .../python-asn1crypto/python-asn1crypto.mk    |  1 +
 .../python-pkgconfig/python-pkgconfig.hash    |  5 +++++
 package/python-pkgconfig/python-pkgconfig.mk  | 16 ++++++++++++++
 package/python-tpm2-pytss/Config.in           | 14 ++++++++++++
 .../python-tpm2-pytss/python-tpm2-pytss.hash  |  5 +++++
 .../python-tpm2-pytss/python-tpm2-pytss.mk    | 22 +++++++++++++++++++
 package/tpm2-openssl/Config.in                | 17 ++++++++++++++
 package/tpm2-openssl/tpm2-openssl.hash        |  3 +++
 package/tpm2-openssl/tpm2-openssl.mk          | 19 ++++++++++++++++
 package/tpm2-pkcs11/Config.in                 | 22 +++++++++++++++++++
 package/tpm2-pkcs11/tpm2-pkcs11.mk            | 20 +++++++++++++++++
 14 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 package/python-pkgconfig/python-pkgconfig.hash
 create mode 100644 package/python-pkgconfig/python-pkgconfig.mk
 create mode 100644 package/python-tpm2-pytss/Config.in
 create mode 100644 package/python-tpm2-pytss/python-tpm2-pytss.hash
 create mode 100644 package/python-tpm2-pytss/python-tpm2-pytss.mk
 create mode 100644 package/tpm2-openssl/Config.in
 create mode 100644 package/tpm2-openssl/tpm2-openssl.hash
 create mode 100644 package/tpm2-openssl/tpm2-openssl.mk

-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
