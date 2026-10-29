Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83347606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ru3teOLe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jydIJaYO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F11F80F81;
	Thu, 29 Oct 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JM_Z7My69AsX; Thu, 29 Oct 2026 14:46:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CE4780F6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793285197;
	b=TL6WSEq1lDx3qZsZcYOtYvjAwnqfvOnpaxHBMvy1Zmq2jtXm+O0OcaQU9aQsxUthLtSH
	 U+kCzUXrOfpMucsZC6HpVktPti/nRF1iOnqh4jK27SHdQQrAFm4VqQyhsUfd+DalHaR0h
	 3+ZTaWkhttKO2Np9vXDjJjebXNrgQErJ2c2pky+JPqKQLAeJoyNbC47MZXZwyJpd5GqJl
	 NcnGS+NXlqX65Zq311WIek1KE9ZL4NGonRlWht87PUnvnqvrAVtyE076IRVNERfMY/ZBl
	 H/ve8kHenUIjYt8lcNoah9EEUCvvJnS+Lf+inp1Rp/2JCiikLA2ayrVdB9SBDbwfcJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793285197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5f2lSCmNI41XbxVqVmbhSb1hSMoJU8ix2nr3rsO1ZOQ=;
	b=VPj1E3uIDHRjpCC9Lo8B1hZ8K5XccMsqqbu4vOgQ9NkAsdwyTtZMq9A1UAs/ZUtbMD6O
	 nEvtbFDNohqWd9dJ+H4+mdxM+ssMu3KqFifqRJx8uRXBBRqaQ5USXIfCacOqH0WtPFOI0
	 JdcBszaC70aGjS8EWbdnK630HQNp0H+uP6RRaTDAxjhuWR0LTen8jGlv1aFzi/5v+fgE2
	 EMDpdZ4jDItTf/namFrYrrJcLvRd7lhDCTj19nNLutNdH5xcfHBiXXiuICdzGFGrrA6g5
	 Bxw/evDlV7k0FbeZioVy+XcnsMdyi8Hr/q119ANOvDpOexvsxM/vf7eFXXxpYURjYwQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793285197;
	bh=5f2lSCmNI41XbxVqVmbhSb1hSMoJU8ix2nr3rsO1ZOQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ru3teOLe3tECa5esfYplw81i7ObGEeKg7uaih9U8LctIy6vuzuG1dGmYj+Der9usf
	 YVIeh74iFAspZrody72wJNpkPDtH8ZpxhZdUtPg+2zGLXSwoLqSNkoTtGUavCyNd1D
	 TXy0TW4H/hZvYwM9lqbWKXAbHwoHjweuQY4U7/ljEagpfQxwVFyDL9CFZeauB3opiP
	 Q0Vuy1shJHBa5g9e8KI1Y3nOF/o+7wFWyqv8ERSFlS2qAkkd++9wmiAX8a4YMjV+um
	 oqqf4soGDNTf3n2/VtOm/QrwG+2Uh+yJZ8e4PBSyke/dIXrGXcmcfcUPJ8XKcCVWZ4
	 tQOFz5WShMP5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE4780F6E;
	Thu, 29 Oct 2026 14:46:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 423EB2FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27782400FF
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pC5z68DjHH80 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:46:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 93CDB40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285193;
 b=Wd3VXJ7r9UQcuQfFZxIMJ9babJ6rZa+/2XCK7+wBpF7wmEhKGAXU6DHZH0FS4gbBEKK3
 H+pKXFTbFYB3J9sDMMw4AiAXUAyfLynJvPg9u3zHF7qUxAWb2nBe7H8Eb1zWuPa78dBJe
 bEb/nySkmYLdOwkv/0eCumKAWNDtzmh+UeOcKqiXlAU3ZApquF5MDoL/06/i9cdPm35c+
 V9ddNUc9tjJRS5YE8E0stKzUAoXP1iZkujKsOy/4MwXsCxWHRE+gTsjtMr2xmrWPTkzRn
 aSd9lhhvIFmMmqxYTurN9VnQYyDsoI9O8hJVgMrQa1xnXmiMjO9J9qullQVKicKmdBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285193;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding;
 bh=BJBI7bx36UhsUID34WKb9+miW6IOZ/f5qL16aIQ0OS0=;
 b=h6IzMZmhJnDALzxNcFmWTXDjte0ixoOPgSAeD/6UbduJI8/+ApxWqMVcspCBLwzmUYC6
 k93FV7LX1PO7xm4rOOLlJuxNXAH980Pd+JtzvuPTY+Hg6uLBwB4ZDprjf9uSa+yWP3E0m
 nnQ1/UW7niz4PW/Yy1OeBr3/4gUF35A8FiWRNnj8XV6jsy3DWFY0mU9JtYfY5ttbwiKab
 tgkzF0iCKNISUFyP67De85EZcfIKP2MnIOcnnYPdwGryy4UBblzeR6oXiA9tQu1scVQUK
 A+flzqHJVm3Xx4XCyeDoKwLVKvcAxRezOaM0oBxDRdE61lGhAqKa1FlCssJFr/du68Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=jydIJaYO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=jydIJaYO
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93CDB40024
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:46:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a218c463d1so14819465e9.0
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285190; x=1793889990; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BJBI7bx36UhsUID34WKb9+miW6IOZ/f5qL16aIQ0OS0=;
 b=jydIJaYOU3yd+lXrAaK73pBtuwtDLh46DR117ithFBhrMckm+g2jJeDwOTQAauJAtn
 D0u6t6BT7gsVa38TovFqHkJDqLK3C8HNtwNacJLAzFpKaesLUQ60fdVHefFU+k6s2oFN
 cKUSaMYDoxi5qydOz2nhTt9+9OEN1XxtgyXfVItxHAzmkroqotHoYHixDhy5pO5leUwF
 JcWlLTfURzKMUPL29JLocGzTvaAkUEy6etL+i9IGgZXAk/3DAvzf3onpCD9PriNEycZh
 NLe+v4rxYDeJ74pczsLyfkqt/twW3bPCRSrfgcdL3u40xkCcXkLW4+UXMlQU7t81R61i
 fAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285190; x=1793889990;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BJBI7bx36UhsUID34WKb9+miW6IOZ/f5qL16aIQ0OS0=;
 b=tfWmQiJw/CBaS3FyaNoERkI0BffbKwGCSHcFpsWGSXnsLpx2CHPiS/slCJEnghmvBE
 eQS1QrEloNupVuxQa7TPj6u7v18fCfRdRguVXlj+5JMLZKuZE6d7EmyWUZgjbPWwPqfh
 Obcms5o7KVgSNdWqVJiFxXwy1DGkBOVR1NreFMpjYPDhSoAZ3A57KvAq5xIFQr8ct7a+
 Oo/lso3VHBMJgm4lfn/xbZ/WLiJVLTbaIWmFRkRKzoxBjD9X1omRXgx7PZRr9Yk4MJ34
 5Rpcc5+rlPuhTElNOSzoUzaS/L1wIcqdZ3QeSmeSNQER0uU9acJw97V0eOPH9AIW5Klm
 rt8A==
X-Gm-Message-State: AFq9FYIlWMaRwD2+VyoWhIWjArpYciHzuO3NSbARTr21R1UnYMPVwP69
 FYsb+evkF0++T/sLuBUqXQPXrbCyt5T2pC1BfeH7STyG4tjxn/0tj+eQuuubmQ==
X-Gm-Gg: AYBFou1UANE3UbvIYMG6gPrl+RJA7Fk3Kob8HoSf6Mb5mPLviwQ2kJ2/+u3pyaDTfRG
 HXVeHCH6B9Kli9pKrwiS1Pg3HdDrD0cHQeMmClc8XoCznaoovbvRUnr3RLp2rl1k8JpT6vjQuBf
 wKZ2rWAspO2Wb5Nk1fZAqZnbv2CeQKTkSXNwz2OojSc3F2jLTP2iE6RefOg9edzKlSEiIoMqUj/
 Y1cmA7DwARdoVD/nLERaB7K43mUZPisJkJUWVn+gznUNfuNjqvgRn4l2HCoG+ZRVklADa79AZV7
 Vmak49JeT+FqaGReW/HctB0VFqKw0MTEKclNTOx/VaGQ1d7g4wVDgcozhUPGbqXlD01E9s9tK9r
 MfdpaIxtlX3nYw2KcC53q6yXiQTyla0N+zBRZDDYSycaN5YtudnwTUbn3dekkn6BLxhb1+40V8V
 Ee49l6d6RYrthLnF2Jzkdlm9PtwA/3JicZh8Sswfkn7t2d9c+80p8WrOnVmxtiEO2JKM8xYjFbU
 6foJ2nEd8nMSo9Yk4lUqKp7ONaM6Hs2iARMD1BtPAYhNa9azG6WleSBbDtIdhz+cExhw6nbdJ/C
 zlur7USxIFMzOGMTAORmw7gbn6yv+euIDLMuoAai8bpY7nThiWPcGgSpLlDEuCCamy7KFAD0Q0F
 KUn4s6aOUadHGz42sHraI4C05vcppTAeu/jlCvH4TmgU=
X-Received: by 2002:a05:600c:a103:b0:4a8:b8b4:6226 with SMTP id
 5b1f17b1804b1-4a9672f8581mr102188025e9.28.1793285188091; 
 Thu, 29 Oct 2026 07:46:28 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb9cesm36780359f8f.27.2026.10.29.07.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:46:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:46:26 +0100
From: =?iso-8859-1?B?TOlv?= DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <auNcQniz__S94Mhg@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v4] package/qoriq-cst: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NXP Code Signing Tool (CST) for QorIQ and Layerscape secure boot.

Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
---
Changes v3 -> v4:
 - rebase on current master
 - regenerate the OpenSSL 3 patch from the upstream commit
 - add create_hdr --hash without the private keys (merged upstream)
 - add create_hdr --srkh-file (upstream PR #10)
 - add cst_verify (upstream PR #11)

Changes v2 -> v3:
 - rename to qoriq-cst, to avoid confusion with the unrelated i.MX
   CST

Changes v1 -> v2:
 - bump to lf-6.18.37-2.1.0
 - replace the OpenSSL 3 patch by the commit merged upstream, as no
   release tag includes it yet
---
 DEVELOPERS                                    |    3 +
 package/Config.in                             |    1 +
 package/Config.in.host                        |    1 +
 ...common-port-to-the-OpenSSL-3-EVP-API.patch |  438 ++++
 ...-hash-does-not-need-the-private-keys.patch |   34 +
 ...rkh-file-to-write-the-SRKH-as-gen_fu.patch |  160 ++
 ...crypto_rsa_verify-and-a-verify-hook-.patch |  397 ++++
 ...erify-for-the-TA-3.x-ESBC-and-ISBC-h.patch | 1827 +++++++++++++++++
 ...-pbi-and-pbl-modes-over-libqoriq-rcw.patch | 1293 ++++++++++++
 package/qoriq-cst/Config.in                   |   12 +
 package/qoriq-cst/Config.in.host              |    8 +
 package/qoriq-cst/qoriq-cst.hash              |    2 +
 package/qoriq-cst/qoriq-cst.mk                |   45 +
 13 files changed, 4221 insertions(+)
 create mode 100644 package/qoriq-cst/0001-common-port-to-the-OpenSSL-3-EVP=
-API.patch
 create mode 100644 package/qoriq-cst/0002-create_hdr-hash-does-not-need-th=
e-private-keys.patch
 create mode 100644 package/qoriq-cst/0003-create_hdr-add-srkh-file-to-writ=
e-the-SRKH-as-gen_fu.patch
 create mode 100644 package/qoriq-cst/0004-common-taal-add-crypto_rsa_verif=
y-and-a-verify-hook-.patch
 create mode 100644 package/qoriq-cst/0005-verify-add-cst_verify-for-the-TA=
-3.x-ESBC-and-ISBC-h.patch
 create mode 100644 package/qoriq-cst/0006-verify-add-the-pbi-and-pbl-modes=
-over-libqoriq-rcw.patch
 create mode 100644 package/qoriq-cst/Config.in
 create mode 100644 package/qoriq-cst/Config.in.host
 create mode 100644 package/qoriq-cst/qoriq-cst.hash
 create mode 100644 package/qoriq-cst/qoriq-cst.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..fe458c9d9f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2174,6 +2174,9 @@ F:	package/petitboot/
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 =

+N:	Leo DENIEUL <leo.denieul.yoshino@gmail.com>
+F:	package/qoriq-cst
+
 N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..6ec28fd6d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2748,6 +2748,7 @@ menu "Security"
 	source "package/optee-test/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
+	source "package/qoriq-cst/Config.in"
 	source "package/refpolicy/Config.in"
 	source "package/restorecond/Config.in"
 	source "package/selinux-python/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..6a27a6cd4d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -100,6 +100,7 @@ menu "Host utilities"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/qoriq-cst/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
 	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
diff --git a/package/qoriq-cst/0001-common-port-to-the-OpenSSL-3-EVP-API.pa=
tch b/package/qoriq-cst/0001-common-port-to-the-OpenSSL-3-EVP-API.patch
new file mode 100644
index 0000000000..54097c0be0
--- /dev/null
+++ b/package/qoriq-cst/0001-common-port-to-the-OpenSSL-3-EVP-API.patch
@@ -0,0 +1,438 @@
+From ef3aa97df6d2378eeb2dc53f6097ba79b04884db Mon Sep 17 00:00:00 2001
+From: Vincent <vjardin@free.fr>
+Date: Sat, 5 Sep 2026 01:41:20 +0200
+Subject: [PATCH] common: port to the OpenSSL 3 EVP API
+
+Fix compilation: upgrade to OpenSSL 3.0.
+
+Side benefits: it gains the support of "RSA PUBLIC KEY" (PKCS#1)
+and "PUBLIC KEY" (SubjectPublicKeyInfo) PEM files.
+
+Older toolchain and openssl kept "build"able.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/nxp-qoriq/cst/commit/ef3aa97df6d2378eeb2dc53f=
6097ba79b04884db
+Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
+---
+ common/crypto_utils.c           | 127 ++++++++++++++++++++++++-------
+ tools/key_generation/gen_keys.c | 131 +++++++++++++++++++-------------
+ 2 files changed, 178 insertions(+), 80 deletions(-)
+
+diff --git a/common/crypto_utils.c b/common/crypto_utils.c
+index 9a83411..0882cd0 100644
+--- a/common/crypto_utils.c
++++ b/common/crypto_utils.c
+@@ -34,36 +34,65 @@
+  */
+ =

+ #include <crypto_utils.h>
+-#include <openssl/ssl.h>
++#include <openssl/evp.h>
++#include <openssl/pem.h>
++#include <openssl/bn.h>
++#include <openssl/rsa.h>
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++#include <openssl/core_names.h>
++#endif
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#define EVP_MD_CTX_new		EVP_MD_CTX_create
++#define EVP_MD_CTX_free		EVP_MD_CTX_destroy
++#endif
++
++static EVP_MD_CTX **hash_ctx(void *ctx)
++{
++	return (EVP_MD_CTX **)ctx;
++}
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_init
+- * Description	:	Wrapper function for SHA256_Init
++ * Description	:	Wrapper function for EVP SHA256 init
+  ************************************************************************=
***/
+ void crypto_hash_init(void *ctx)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Init(c);
++	EVP_MD_CTX *c =3D EVP_MD_CTX_new();
++
++	*hash_ctx(ctx) =3D c;
++	if (c =3D=3D NULL || EVP_DigestInit_ex(c, EVP_sha256(), NULL) !=3D 1) {
++		fprintf(stderr, "Error in initialising SHA256\n");
++		exit(EXIT_FAILURE);
++	}
+ }
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_update
+- * Description	:	Wrapper function for SHA256_Update
++ * Description	:	Wrapper function for EVP SHA256 update
+  ************************************************************************=
***/
+ void crypto_hash_update(void *ctx, void *data, uint32_t len)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Update(c, data, len);
++	if (EVP_DigestUpdate(*hash_ctx(ctx), data, len) !=3D 1) {
++		fprintf(stderr, "Error in updating SHA256\n");
++		exit(EXIT_FAILURE);
++	}
+ }
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_final
+- * Description	:	Wrapper function for SHA256_Final
++ * Description	:	Wrapper function for EVP SHA256 final
+  ************************************************************************=
***/
+ void crypto_hash_final(void *hash, void *ctx)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Final(hash, c);
++	EVP_MD_CTX *c =3D *hash_ctx(ctx);
++
++	if (EVP_DigestFinal_ex(c, hash, NULL) !=3D 1) {
++		fprintf(stderr, "Error in finalising SHA256\n");
++		exit(EXIT_FAILURE);
++	}
++	EVP_MD_CTX_free(c);
++	*hash_ctx(ctx) =3D NULL;
+ }
+ =

+ /************************************************************************=
***
+@@ -79,7 +108,6 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 	FILE *fp;
+ 	unsigned char buf[IOBLOCK];
+ 	size_t bytes =3D 0;
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+ =

+ 	/* open the file */
+ 	fp =3D fopen(fname, "rb");
+@@ -102,7 +130,7 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 			break;
+ 		}
+ =

+-		SHA256_Update(c, buf, bytes);
++		crypto_hash_update(ctx, buf, bytes);
+ 	}
+ =

+ 	fclose(fp);
+@@ -112,14 +140,16 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_rsa_sign
+- * Description	:	Wrapper function for RSA_sign
++ * Description	:	Wrapper function for EVP_PKEY_sign
+  ************************************************************************=
***/
+ int crypto_rsa_sign(void *img_hash, uint32_t len, void *rsa_sign,
+ 			uint32_t *rsa_len, char *key_name)
+ {
+-	int ret;
++	int ret =3D FAILURE;
+ 	FILE *fpriv;
+-	RSA *priv_key;
++	EVP_PKEY *priv_key;
++	EVP_PKEY_CTX *pctx =3D NULL;
++	size_t sign_len;
+ =

+ 	/* Open the private Key */
+ 	fpriv =3D fopen(key_name, "r");
+@@ -128,7 +158,7 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, void=
 *rsa_sign,
+ 		return FAILURE;
+ 	}
+ =

+-	priv_key =3D PEM_read_RSAPrivateKey(fpriv, NULL, NULL, NULL);
++	priv_key =3D PEM_read_PrivateKey(fpriv, NULL, NULL, NULL);
+ 	fclose(fpriv);
+ 	if (priv_key =3D=3D NULL) {
+ 		printf("Error in key reading %s:\n", key_name);
+@@ -136,14 +166,23 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, vo=
id *rsa_sign,
+ 	}
+ =

+ 	/* Sign the Image Hash with Private Key */
+-	ret =3D RSA_sign(NID_sha256, img_hash, len,
+-			rsa_sign, rsa_len,
+-			priv_key);
+-	if (ret !=3D 1) {
++	sign_len =3D EVP_PKEY_size(priv_key);
++	pctx =3D EVP_PKEY_CTX_new(priv_key, NULL);
++	if (pctx =3D=3D NULL ||
++	    EVP_PKEY_sign_init(pctx) !=3D 1 ||
++	    EVP_PKEY_CTX_set_rsa_padding(pctx, RSA_PKCS1_PADDING) !=3D 1 ||
++	    EVP_PKEY_CTX_set_signature_md(pctx, EVP_sha256()) !=3D 1 ||
++	    EVP_PKEY_sign(pctx, rsa_sign, &sign_len, img_hash, len) !=3D 1) {
+ 		printf("Error in Signing\n");
+-		return FAILURE;
++		goto out;
+ 	}
+-	return SUCCESS;
++
++	*rsa_len =3D sign_len;
++	ret =3D SUCCESS;
++out:
++	EVP_PKEY_CTX_free(pctx);
++	EVP_PKEY_free(priv_key);
++	return ret;
+ }
+ =

+ /************************************************************************=
***
+@@ -158,9 +197,15 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, voi=
d *rsa_sign,
+ int crypto_extract_pub_key(char *fname_pub, uint32_t *len, uint8_t *key_p=
tr)
+ {
+ 	FILE *fp;
+-	RSA *pub_key;
+ 	uint32_t key_len;
++	int ret =3D FAILURE;
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	EVP_PKEY *pub_key;
++	BIGNUM *modulus =3D NULL, *exponent =3D NULL;
++#else
++	RSA *pub_key;
+ 	const BIGNUM *modulus, *exponent;
++#endif
+ =

+ 	fp =3D fopen(fname_pub, "r");
+ 	if (fp =3D=3D NULL) {
+@@ -169,7 +214,11 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t =
*len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ =

++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	pub_key =3D PEM_read_PUBKEY(fp, NULL, NULL, NULL);
++#else
+ 	pub_key =3D PEM_read_RSAPublicKey(fp, NULL, NULL, NULL);
++#endif
+ 	fclose(fp);
+ 	if (pub_key =3D=3D NULL) {
+ 		fprintf(stderr, "Error in key reading %s:\n",
+@@ -177,17 +226,32 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t=
 *len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ =

++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	key_len =3D EVP_PKEY_size(pub_key);
++
++	/* get N and E */
++	if (EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_N,
++				  &modulus) !=3D 1 ||
++	    EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_E,
++				  &exponent) !=3D 1) {
++		fprintf(stderr, "Error: %s is not an RSA public key\n",
++			fname_pub);
++		goto out;
++	}
++#else
+ 	key_len =3D RSA_size(pub_key);
+-	*len =3D 2 * key_len;
+ =

+ #if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	/* copy N and E */
+-        modulus =3D (BIGNUM *)pub_key->n;
+-        exponent =3D (BIGNUM *)pub_key->e;
++	modulus =3D (BIGNUM *)pub_key->n;
++	exponent =3D (BIGNUM *)pub_key->e;
+ #else
+ 	/* get N and E */
+ 	RSA_get0_key(pub_key, &modulus, &exponent, NULL);
+ #endif
++#endif
++	*len =3D 2 * key_len;
++
+ 	/* Copy N component */
+ 	BN_bn2bin(modulus, key_ptr);
+ =

+@@ -202,7 +266,16 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t =
*len, uint8_t *key_ptr)
+ 	 */
+ 	BN_bn2bin(exponent, key_ptr + key_len - BN_num_bytes(exponent));
+ =

+-	return SUCCESS;
++	ret =3D SUCCESS;
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++out:
++	BN_free(modulus);
++	BN_free(exponent);
++	EVP_PKEY_free(pub_key);
++#else
++	RSA_free(pub_key);
++#endif
++	return ret;
+ }
+ =

+ /************************************************************************=
***
+diff --git a/tools/key_generation/gen_keys.c b/tools/key_generation/gen_ke=
ys.c
+index da74cc7..c4f7495 100644
+--- a/tools/key_generation/gen_keys.c
++++ b/tools/key_generation/gen_keys.c
+@@ -37,13 +37,18 @@
+  *     Eric Young (eay@cryptsoft.com)"
+  */
+ =

+-#define OPENSSL_NO_KRB5
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <openssl/ssl.h>
+ #include <unistd.h>
+ #include <getopt.h>
++#include <openssl/evp.h>
++#include <openssl/pem.h>
++#include <openssl/rsa.h>
++#include <openssl/bio.h>
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++#include <openssl/encoder.h>
++#endif
+ =

+ #define RSA_LEN1	1024
+ #define RSA_LEN2	2048	=

+@@ -52,79 +57,99 @@
+ #define PRI_KEY_FILE "srk.pri"
+ #define PUB_KEY_FILE "srk.pub"
+ =

+-static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++static int write_key_pem(EVP_PKEY *pkey, int selection, FILE *fp)
+ {
+-	RSA *srk =3D NULL;
+-	BIGNUM *public_exponent =3D NULL;
+-	int ret =3D 0;
+-
+-	/* Allocate space for RSA structure */
+-	srk =3D RSA_new();
++	OSSL_ENCODER_CTX *ectx;
++	int ok;
+ =

+-	if (srk =3D=3D NULL) {
++	ectx =3D OSSL_ENCODER_CTX_new_for_pkey(pkey, selection, "PEM",
++					     "type-specific", NULL);
++	if (ectx =3D=3D NULL)
+ 		return -1;
+-	}
+ =

+-	public_exponent =3D BN_new();
+-	if (public_exponent =3D=3D NULL || !BN_set_word(public_exponent, RSA_F4)=
) {
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	ok =3D OSSL_ENCODER_to_fp(ectx, fp);
++	OSSL_ENCODER_CTX_free(ectx);
+ =

+-	ret =3D RSA_generate_key_ex(srk, n, public_exponent, NULL);
+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	return (ok =3D=3D 1) ? 0 : -1;
++}
++
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_KEYPAIR, fp);
++}
+ =

+-	ret =3D PEM_write_RSAPrivateKey(fpri, srk, NULL, NULL, 0, 0, NULL);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_PUBLIC_KEY, fp);
++}
++#else
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa =3D EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ =

+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa =3D=3D NULL)
+ 		return -1;
+-	}
++	ok =3D PEM_write_RSAPrivateKey(fp, rsa, NULL, NULL, 0, 0, NULL);
++	RSA_free(rsa);
++
++	return (ok =3D=3D 1) ? 0 : -1;
++}
+ =

+-	ret =3D PEM_write_RSAPublicKey(fpub, srk);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa =3D EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ =

+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa =3D=3D NULL)
+ 		return -1;
+-	}
++	ok =3D PEM_write_RSAPublicKey(fp, rsa);
++	RSA_free(rsa);
+ =

+-#ifdef DEBUG
+-	printf("public modulus (n):\n");
+-	printf("%s\n", BN_bn2hex(srk->n));
++	return (ok =3D=3D 1) ? 0 : -1;
++}
++#endif
+ =

+-	printf("public exponent (e):\n");
+-	printf("%s\n", BN_bn2hex(srk->e));
++static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++{
++	EVP_PKEY *srk =3D NULL;
++	EVP_PKEY_CTX *ctx;
++	int ret =3D -1;
+ =

+-	printf("private exponent (d):\n");
+-	printf("%s\n", BN_bn2hex(srk->d));
++	ctx =3D EVP_PKEY_CTX_new_id(EVP_PKEY_RSA, NULL);
++	if (ctx =3D=3D NULL)
++		return -1;
+ =

+-	printf("secret prime factor (p):\n");
+-	printf("%s\n", BN_bn2hex(srk->p));
+-	printf("secret prime factor (q):\n");
+-	printf("%s\n", BN_bn2hex(srk->q));
++	if (EVP_PKEY_keygen_init(ctx) !=3D 1 ||
++	    EVP_PKEY_CTX_set_rsa_keygen_bits(ctx, n) !=3D 1 ||
++	    EVP_PKEY_keygen(ctx, &srk) !=3D 1)
++		goto out;
+ =

+-	printf("dmp1 [ d mod (p-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmp1));
+-	printf("dmq1 [ d mod (q-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmq1));
++	if (write_private_key(srk, fpri) !=3D 0)
++		goto out;
+ =

+-	printf("iqmp [ q^-1 mod p ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->iqmp));
++	if (write_public_key(srk, fpub) !=3D 0)
++		goto out;
+ =

+-	printf("RSA SIZE: %d\n", RSA_size(srk));
++#ifdef DEBUG
++	{
++		BIO *out =3D BIO_new_fp(stdout, BIO_NOCLOSE);
+ =

++		if (out !=3D NULL) {
++			EVP_PKEY_print_private(out, srk, 0, NULL);
++			BIO_free(out);
++		}
++		printf("RSA SIZE: %d\n", EVP_PKEY_size(srk));
++	}
+ #endif
+ =

+-	RSA_free(srk);
+-	BN_free(public_exponent);
++	ret =3D 0;
++out:
++	EVP_PKEY_free(srk);
++	EVP_PKEY_CTX_free(ctx);
+ =

+-	return 0;
++	return ret;
+ }
+ =

+ void usage(void)
+-- =

+2.53.0
+
diff --git a/package/qoriq-cst/0002-create_hdr-hash-does-not-need-the-priva=
te-keys.patch b/package/qoriq-cst/0002-create_hdr-hash-does-not-need-the-pr=
ivate-keys.patch
new file mode 100644
index 0000000000..ad41e2e763
--- /dev/null
+++ b/package/qoriq-cst/0002-create_hdr-hash-does-not-need-the-private-keys=
.patch
@@ -0,0 +1,34 @@
+From 8ac7172921560b94952704ef818c6fcea40982f3 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?L=3DC3=3DA9o=3D20Denieul?=3D <ldenieul@iliad-free.fr>
+Date: Mon, 26 Oct 2026 18:24:36 +0100
+Subject: [PATCH] create_hdr: --hash does not need the private keys
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+--hash only prints the SRK hash, but the key count
+check was still required one PRI_KEY per PUB_KEY,
+so --hash failed without the private keys.
+
+Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
+Upstream: https://github.com/nxp-qoriq/cst/commit/8ac7172921560b94952704ef=
818c6fcea40982f3
+---
+ tools/header_generation/create_hdr_common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/header_generation/create_hdr_common.c b/tools/header_ge=
neration/create_hdr_common.c
+index a2363ce..6df563e 100644
+--- a/tools/header_generation/create_hdr_common.c
++++ b/tools/header_generation/create_hdr_common.c
+@@ -414,7 +414,7 @@ int create_srk_calc_hash(uint32_t max_keys)
+ 		return FAILURE;
+ 	}
+ =

+-	if (gd.option_img_hash =3D=3D 0) {
++	if (gd.option_img_hash =3D=3D 0 && gd.option_srk_hash =3D=3D 0) {
+ 		if (gd.num_srk_entries !=3D gd.num_pri_key) {
+ 			printf("Public and Private Key Count Mismatch\n");
+ 			return FAILURE;
+-- =

+2.53.0
+
diff --git a/package/qoriq-cst/0003-create_hdr-add-srkh-file-to-write-the-S=
RKH-as-gen_fu.patch b/package/qoriq-cst/0003-create_hdr-add-srkh-file-to-wr=
ite-the-SRKH-as-gen_fu.patch
new file mode 100644
index 0000000000..757c1990ea
--- /dev/null
+++ b/package/qoriq-cst/0003-create_hdr-add-srkh-file-to-write-the-SRKH-as-=
gen_fu.patch
@@ -0,0 +1,160 @@
+From 7c10620f013e6a844d43601da58fb8a03fd3c5c6 Mon Sep 17 00:00:00 2001
+From: Vincent <vjardin@free.fr>
+Date: Sat, 24 Oct 2026 00:19:40 +0200
+Subject: [PATCH] create_hdr: add --srkh-file to write the SRKH as gen_fuse=
scr
+ fields
+
+The SRK table hash is the value to fuse in the SFP SRKH registers and
+cannot be changed afterwards.
+
+The header tools print it as 8 SFP_SRKHR words that the user then
+copies into the SRKH_0 to SRKH_7 fields of the gen_fusescr input file
+by hand, a step where a typo, a wrong word order or a stale value fuses
+an SRKH that matches no image.
+
+--srkh-file <file> writes those eight fields directly, in the register
+order the tools already print, with or without --hash.
+
+The smoke test checks the file against the printed words and the hash,
+and feeds it to gen_fusescr.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/nxp-qoriq/cst/pull/10/commits/7c10620f013e6a8=
44d43601da58fb8a03fd3c5c6
+Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
+---
+ common/include/global.h                       |  3 ++
+ tools/header_generation/create_hdr_common.c   | 47 +++++++++++++++++++
+ .../create_hdr_pbi/create_hdr_pbi_main.c      |  1 +
+ 3 files changed, 51 insertions(+)
+
+diff --git a/common/include/global.h b/common/include/global.h
+index 9f765ef..1b42b8d 100644
+--- a/common/include/global.h
++++ b/common/include/global.h
+@@ -37,6 +37,7 @@ int create_srk_calc_hash(uint32_t max_keys);
+ int parse_input_file(char **list, uint32_t num_list);
+ int calculate_signature(void);
+ int create_img_hash_file(void);
++int create_srkh_file(void);
+ int append_signature(void);
+ int create_ie_file(char *file_name);
+ int read_file_in_buffer(uint8_t *ptr, char *file_name);
+@@ -143,6 +144,7 @@ struct g_data_t {
+ 	uint8_t srk_hash_flag;
+ 	uint8_t hdr_file_flag;
+ 	uint8_t entry1_flag;
++	uint8_t srkh_file_flag;
+ 	uint8_t rcw_file_flag;
+ 	uint8_t rcw_opfile_flag;
+ 	char pub_fname[MAX_NUM_KEY][MAX_FNAME_LEN];
+@@ -172,6 +174,7 @@ struct g_data_t {
+ =

+ 	char hdr_file_name[MAX_FNAME_LEN];
+ 	char img_hash_file_name[MAX_FNAME_LEN];
++	char srkh_file_name[MAX_FNAME_LEN];
+ 	char rsa_sign_file_name[MAX_FNAME_LEN];
+ 	char sg_file_name[MAX_FNAME_LEN];
+ =

+diff --git a/tools/header_generation/create_hdr_common.c b/tools/header_ge=
neration/create_hdr_common.c
+index a2363ce..22457aa 100644
+--- a/tools/header_generation/create_hdr_common.c
++++ b/tools/header_generation/create_hdr_common.c
+@@ -50,6 +50,7 @@ static struct option long_options[] =3D {
+ 	{"in", required_argument, 0, 'i'},
+ 	{"app", required_argument, 0, 'a'},
+ 	{"app_off", required_argument, 0, 'o'},
++	{"srkh-file", required_argument, 0, 'k'},
+ 	{"help", no_argument, &gd.help_flag, 1},
+ 	{0, 0, 0, 0}
+ };
+@@ -58,6 +59,8 @@ static void print_usage(char *tool)
+ {
+ 	printf("\t--verbose          Display header Info after Creation\n");
+ 	printf("\t--hash             Print the SRK(Public key) hash.\n");
++	printf("\t--srkh-file <file> Write the SRK hash as the SRKH_0..SRKH_7\n"=
);
++	printf("\t                   fields of a gen_fusescr input file\n");
+ 	printf("\t--img_hash         Header is generated without Signature.\n");
+ 	printf("\t                   Image Hash is stored in separate file.\n");
+ 	printf("\t--help             Show the Help for Tool Usage.\n");
+@@ -256,6 +259,11 @@ int create_hdr(int argc, char **argv)
+ 				printf("offset is %d\n", offset);
+ 				append_flag =3D true;
+ 				break;
++			case 'k':
++				strncpy(gd.srkh_file_name, optarg,
++					MAX_FNAME_LEN - 1);
++				gd.srkh_file_flag =3D 1;
++				break;
+ 			default:
+ 				 printf("?? getopt returned character code 0%o ??\n", c);
+ 		}
+@@ -373,8 +381,19 @@ int create_hdr(int argc, char **argv)
+ 		srk =3D (uint32_t *)gd.srk_hash;
+ 		for (i =3D 0; i < SHA256_DIGEST_LENGTH / sizeof(uint32_t); i++)
+ 			printf("\n\t SFP SRKHR%i =3D %08x", i, htonl(srk[i]));
++		if (gd.srkh_file_flag) {
++			ret =3D create_srkh_file();
++			if (ret !=3D SUCCESS)
++				return ret;
++			printf("\n\t SRKH fields written to %s",
++			       gd.srkh_file_name);
++		}
+ 	} else {
+ 		printf("\nSRK (Public Key) Hash Not Available");
++		if (gd.srkh_file_flag) {
++			printf("\nError: --srkh-file needs the SRK hash\n");
++			return FAILURE;
++		}
+ 	}
+ 	ret =3D get_apnd_img(gd.input_file);
+ 	if (ret !=3D SUCCESS)
+@@ -535,6 +554,34 @@ int append_signature(void)
+ 	return SUCCESS;
+ }
+ =

++/************************************************************************=
***
++ * Function	:	create_srkh_file
++ * Arguments	:	NONE
++ * Return	:	SUCCESS or FAILURE
++ * Description	:	Writes the SRK hash as SRKH_0..SRKH_7 gen_fusescr fields
++ ************************************************************************=
***/
++int create_srkh_file(void)
++{
++	int i;
++	FILE *fp;
++	uint32_t word;
++
++	fp =3D fopen(gd.srkh_file_name, "w");
++	if (fp =3D=3D NULL) {
++		printf("Error in opening the file: %s\n", gd.srkh_file_name);
++		return FAILURE;
++	}
++	for (i =3D 0; i < SHA256_DIGEST_LENGTH / sizeof(uint32_t); i++) {
++		memcpy(&word, gd.srk_hash + i * sizeof(uint32_t), sizeof(word));
++		fprintf(fp, "SRKH_%d=3D%08x\n", i, htonl(word));
++	}
++	if (fclose(fp) !=3D 0) {
++		printf("Error in Writing to file %s\n", gd.srkh_file_name);
++		return FAILURE;
++	}
++	return SUCCESS;
++}
++
+ /************************************************************************=
***
+  * Function	:	create_img_hash_file
+  * Arguments	:	NONE
+diff --git a/tools/header_generation/create_hdr_pbi/create_hdr_pbi_main.c =
b/tools/header_generation/create_hdr_pbi/create_hdr_pbi_main.c
+index 0f725ec..1ed76b6 100644
+--- a/tools/header_generation/create_hdr_pbi/create_hdr_pbi_main.c
++++ b/tools/header_generation/create_hdr_pbi/create_hdr_pbi_main.c
+@@ -45,6 +45,7 @@ static struct option long_options[] =3D {
+ 	{"out", required_argument, 0, 'h'},
+ 	{"in", required_argument, 0, 'i'},
+ 	{"sben", no_argument, &gd.option_sb_en, 1},
++	{"srkh-file", required_argument, 0, 'k'},
+ 	{"help", no_argument, &gd.help_flag, 1},
+ 	{0, 0, 0, 0}
+ };
+-- =

+2.53.0
+
diff --git a/package/qoriq-cst/0004-common-taal-add-crypto_rsa_verify-and-a=
-verify-hook-.patch b/package/qoriq-cst/0004-common-taal-add-crypto_rsa_ver=
ify-and-a-verify-hook-.patch
new file mode 100644
index 0000000000..79e4078fae
--- /dev/null
+++ b/package/qoriq-cst/0004-common-taal-add-crypto_rsa_verify-and-a-verify=
-hook-.patch
@@ -0,0 +1,397 @@
+From 877c967e6c2bfb94e28385520cdf4c359044a794 Mon Sep 17 00:00:00 2001
+From: Vincent <vjardin@free.fr>
+Date: Sat, 24 Oct 2026 14:42:36 +0200
+Subject: [PATCH] common, taal: add crypto_rsa_verify() and a verify hook in
+ the TAAL table
+
+crypto_utils.c can sign but it has nothing to check
+a signature with.
+
+Let's support OpenSSL 1.1, 3.x and 4.x
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/nxp-qoriq/cst/pull/11/commits/877c967e6c2bfb9=
4e28385520cdf4c359044a794
+Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
+---
+ common/crypto_utils.c         | 100 ++++++++++++++++++++++++++++++++++
+ common/include/crypto_utils.h |   4 ++
+ taal/include/ta_1_x.h         |   4 ++
+ taal/include/ta_2_x.h         |   6 ++
+ taal/include/ta_3_x.h         |   4 ++
+ taal/include/taal.h           |   6 ++
+ taal/taal.c                   |  54 +++++++++++++++---
+ taal/taal_api.c               |   9 +++
+ 8 files changed, 179 insertions(+), 8 deletions(-)
+
+diff --git a/common/crypto_utils.c b/common/crypto_utils.c
+index 0882cd0..fcfa09f 100644
+--- a/common/crypto_utils.c
++++ b/common/crypto_utils.c
+@@ -40,6 +40,7 @@
+ #include <openssl/rsa.h>
+ #if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
+ #include <openssl/core_names.h>
++#include <openssl/param_build.h>
+ #endif
+ =

+ #if OPENSSL_VERSION_NUMBER < 0x10100000L
+@@ -185,6 +186,105 @@ out:
+ 	return ret;
+ }
+ =

++/************************************************************************=
***
++ * Function	:	rsa_pub_from_bin
++ * Arguments	:	modulus, exponent - big endian, mod_len bytes each
++ * Return	:	EVP_PKEY or NULL
++ * Description	:	Build an RSA public key from an SRK table entry
++ ************************************************************************=
***/
++static EVP_PKEY *rsa_pub_from_bin(const uint8_t *modulus,
++				  const uint8_t *exponent, uint32_t mod_len)
++{
++	EVP_PKEY *pkey =3D NULL;
++	BIGNUM *n, *e;
++
++	n =3D BN_bin2bn(modulus, mod_len, NULL);
++	e =3D BN_bin2bn(exponent, mod_len, NULL);
++	if (n =3D=3D NULL || e =3D=3D NULL)
++		goto out;
++
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	{
++		OSSL_PARAM_BLD *bld =3D OSSL_PARAM_BLD_new();
++		OSSL_PARAM *params =3D NULL;
++		EVP_PKEY_CTX *ctx =3D NULL;
++
++		if (bld =3D=3D NULL ||
++		    OSSL_PARAM_BLD_push_BN(bld, OSSL_PKEY_PARAM_RSA_N, n) !=3D 1 ||
++		    OSSL_PARAM_BLD_push_BN(bld, OSSL_PKEY_PARAM_RSA_E, e) !=3D 1 ||
++		    (params =3D OSSL_PARAM_BLD_to_param(bld)) =3D=3D NULL ||
++		    (ctx =3D EVP_PKEY_CTX_new_from_name(NULL, "RSA", NULL)) =3D=3D NULL=
 ||
++		    EVP_PKEY_fromdata_init(ctx) !=3D 1 ||
++		    EVP_PKEY_fromdata(ctx, &pkey, EVP_PKEY_PUBLIC_KEY,
++				      params) !=3D 1)
++			pkey =3D NULL;
++		EVP_PKEY_CTX_free(ctx);
++		OSSL_PARAM_free(params);
++		OSSL_PARAM_BLD_free(bld);
++	}
++#else
++	{
++		RSA *rsa =3D RSA_new();
++
++		if (rsa =3D=3D NULL)
++			goto out;
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++		rsa->n =3D n;
++		rsa->e =3D e;
++#else
++		if (RSA_set0_key(rsa, n, e, NULL) !=3D 1) {
++			RSA_free(rsa);
++			goto out;
++		}
++#endif
++		n =3D e =3D NULL;
++		pkey =3D EVP_PKEY_new();
++		if (pkey =3D=3D NULL || EVP_PKEY_assign_RSA(pkey, rsa) !=3D 1) {
++			RSA_free(rsa);
++			EVP_PKEY_free(pkey);
++			pkey =3D NULL;
++		}
++	}
++#endif
++out:
++	BN_free(n);
++	BN_free(e);
++	return pkey;
++}
++
++/************************************************************************=
***
++ * Function	:	crypto_rsa_verify
++ * Arguments	:	img_hash, len - SHA256 digest
++ *			rsa_sign, rsa_len - PKCS#1 v1.5 signature
++ *			modulus, exponent, mod_len - public key, SRK layout
++ * Return	:	SUCCESS when the signature verifies, FAILURE otherwise
++ ************************************************************************=
***/
++int crypto_rsa_verify(const void *img_hash, uint32_t len,
++		const void *rsa_sign, uint32_t rsa_len,
++		const uint8_t *modulus, const uint8_t *exponent,
++		uint32_t mod_len)
++{
++	int ret =3D FAILURE;
++	EVP_PKEY *pub_key;
++	EVP_PKEY_CTX *pctx;
++
++	pub_key =3D rsa_pub_from_bin(modulus, exponent, mod_len);
++	if (pub_key =3D=3D NULL)
++		return FAILURE;
++
++	pctx =3D EVP_PKEY_CTX_new(pub_key, NULL);
++	if (pctx !=3D NULL &&
++	    EVP_PKEY_verify_init(pctx) =3D=3D 1 &&
++	    EVP_PKEY_CTX_set_rsa_padding(pctx, RSA_PKCS1_PADDING) =3D=3D 1 &&
++	    EVP_PKEY_CTX_set_signature_md(pctx, EVP_sha256()) =3D=3D 1 &&
++	    EVP_PKEY_verify(pctx, rsa_sign, rsa_len, img_hash, len) =3D=3D 1)
++		ret =3D SUCCESS;
++
++	EVP_PKEY_CTX_free(pctx);
++	EVP_PKEY_free(pub_key);
++	return ret;
++}
++
+ /************************************************************************=
***
+  * Function	:	crypto_extract_pub_key
+  * Arguments	:	fname_pub - Public Key File Name
+diff --git a/common/include/crypto_utils.h b/common/include/crypto_utils.h
+index df0f568..5a0cb30 100644
+--- a/common/include/crypto_utils.h
++++ b/common/include/crypto_utils.h
+@@ -48,6 +48,10 @@ void crypto_hash_final(void *hash, void *ctx);
+ int crypto_hash_update_file(void *ctx, char *fname);
+ int crypto_rsa_sign(void *img_hash, uint32_t len,
+ 		void *rsa_sign, uint32_t *rsa_len, char *key_name);
++int crypto_rsa_verify(const void *img_hash, uint32_t len,
++		const void *rsa_sign, uint32_t rsa_len,
++		const uint8_t *modulus, const uint8_t *exponent,
++		uint32_t mod_len);
+ void crypto_print_attribution(void);
+ uint32_t crypto_calculate_crc(void *data, uint32_t length);
+ uint32_t crypto_calculate_checksum(void *data, uint32_t num);
+diff --git a/taal/include/ta_1_x.h b/taal/include/ta_1_x.h
+index 8355ccd..2594f05 100644
+--- a/taal/include/ta_1_x.h
++++ b/taal/include/ta_1_x.h
+@@ -49,4 +49,8 @@ int calc_srk_hash_ta_1_x_nonpbl(void);
+ int dump_hdr_ta_1_x_pbl(void);
+ int dump_hdr_ta_1_x_nonpbl(void);
+ =

++struct verify_req;
++int verify_ta_1_x_pbl(struct verify_req *);
++int verify_ta_1_x_nonpbl(struct verify_req *);
++
+ #endif
+diff --git a/taal/include/ta_2_x.h b/taal/include/ta_2_x.h
+index f931fef..0deebc3 100644
+--- a/taal/include/ta_2_x.h
++++ b/taal/include/ta_2_x.h
+@@ -61,4 +61,10 @@ int dump_hdr_ta_2_0_nonpbl(void);
+ int dump_hdr_ta_2_1_arm7(void);
+ int dump_hdr_ta_2_1_arm8(void);
+ =

++struct verify_req;
++int verify_ta_2_0_pbl(struct verify_req *);
++int verify_ta_2_0_nonpbl(struct verify_req *);
++int verify_ta_2_1_arm7(struct verify_req *);
++int verify_ta_2_1_arm8(struct verify_req *);
++
+ #endif
+diff --git a/taal/include/ta_3_x.h b/taal/include/ta_3_x.h
+index e2bd683..ebe4cf4 100644
+--- a/taal/include/ta_3_x.h
++++ b/taal/include/ta_3_x.h
+@@ -49,4 +49,8 @@ int calc_srk_hash_ta_3_1(void);
+ int dump_hdr_ta_3_0(void);
+ int dump_hdr_ta_3_1(void);
+ =

++struct verify_req;
++int verify_ta_3_0(struct verify_req *);
++int verify_ta_3_1(struct verify_req *);
++
+ #endif
+diff --git a/taal/include/taal.h b/taal/include/taal.h
+index 911ad42..e06ee04 100644
+--- a/taal/include/taal.h
++++ b/taal/include/taal.h
+@@ -53,6 +53,9 @@ typedef int (*ta_img_hash)(void);
+ typedef int (*ta_srk_hash)(void);
+ typedef int (*ta_dump)(void);
+ =

++struct verify_req;
++typedef int (*ta_verify)(struct verify_req *);
++
+ struct taal_t {
+ 	ta_parse	parse_input_file;
+ 	ta_fill		fill_structure;
+@@ -60,6 +63,7 @@ struct taal_t {
+ 	ta_img_hash	calc_img_hash;
+ 	ta_srk_hash	calc_srk_hash;
+ 	ta_dump		dump_hdr;
++	ta_verify	verify;
+ };
+ =

+ /* Wrappers over target API */
+@@ -69,8 +73,10 @@ int taal_create_hdr(enum cfg_taal);
+ int taal_calc_img_hash(enum cfg_taal);
+ int taal_calc_srk_hash(enum cfg_taal);
+ int taal_dump_header(enum cfg_taal);
++int taal_verify(enum cfg_taal, struct verify_req *);
+ =

+ /* Get TA from File */
+ enum cfg_taal get_ta_from_file(char *file_name);
++enum cfg_taal get_ta_from_platform(const char *plat_name);
+ =

+ #endif
+diff --git a/taal/taal.c b/taal/taal.c
+index df2a3d1..7776e5b 100644
+--- a/taal/taal.c
++++ b/taal/taal.c
+@@ -95,6 +95,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_1_x_pbl,
+ 		calc_srk_hash_ta_1_x_pbl,
+ 		dump_hdr_ta_1_x_pbl,
++		verify_ta_1_x_pbl,
+ 	},
+ 	/* TA_1_X_NONPBL */
+ 	{
+@@ -104,6 +105,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_1_x_nonpbl,
+ 		calc_srk_hash_ta_1_x_nonpbl,
+ 		dump_hdr_ta_1_x_nonpbl,
++		verify_ta_1_x_nonpbl,
+ 	},
+ 	/* TA_2_0_PBL */
+ 	{
+@@ -113,6 +115,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_2_0_pbl,
+ 		calc_srk_hash_ta_2_0_pbl,
+ 		dump_hdr_ta_2_0_pbl,
++		verify_ta_2_0_pbl,
+ 	},
+ 	/* TA_2_0_NONPBL */
+ 	{
+@@ -122,6 +125,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_2_0_nonpbl,
+ 		calc_srk_hash_ta_2_0_nonpbl,
+ 		dump_hdr_ta_2_0_nonpbl,
++		verify_ta_2_0_nonpbl,
+ 	},
+ 	/* TA_2_1_ARM7 */
+ 	{
+@@ -131,6 +135,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_2_1_arm7,
+ 		calc_srk_hash_ta_2_1_arm7,
+ 		dump_hdr_ta_2_1_arm7,
++		verify_ta_2_1_arm7,
+ 	},
+ 	/* TA_2_1_ARM8 */
+ 	{
+@@ -140,6 +145,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_2_1_arm8,
+ 		calc_srk_hash_ta_2_1_arm8,
+ 		dump_hdr_ta_2_1_arm8,
++		verify_ta_2_1_arm8,
+ 	},
+ 	/* TA_3_0 */
+ 	{
+@@ -149,6 +155,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_3_0,
+ 		calc_srk_hash_ta_3_0,
+ 		dump_hdr_ta_3_0,
++		verify_ta_3_0,
+ 	},
+ 	/* TA_3_1 */
+ 	{
+@@ -158,6 +165,7 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_3_1,
+ 		calc_srk_hash_ta_3_1,
+ 		dump_hdr_ta_3_1,
++		verify_ta_3_1,
+ 	},
+ 	/* TA_3_2 */
+ 	{
+@@ -167,10 +175,11 @@ static struct taal_t taal[] =3D {
+ 		calc_img_hash_ta_3_1,
+ 		calc_srk_hash_ta_3_1,
+ 		dump_hdr_ta_3_1,
++		verify_ta_3_1,
+ 	},
+ 	/* TA_UNKNOWN_MAX */
+ 	{
+-		NULL, NULL, NULL, NULL, NULL, NULL
++		NULL, NULL, NULL, NULL, NULL, NULL, NULL
+ 	}
+ };
+ 	=

+@@ -264,6 +273,40 @@ int taal_dump_header(enum cfg_taal ta)
+ 	return FAILURE;
+ }
+ =

++/************************************************************************=
***
++ * Function	:	taal_verify
++ * Arguments	:	ta - Trust ARCH Type enum
++ *			req - verification request
++ * Return	:	ERROR or SUCCESS
++ * Description	:	Verify produced headers and images from their bytes
++ ************************************************************************=
***/
++int taal_verify(enum cfg_taal ta, struct verify_req *req)
++{
++	if (taal[ta].verify)
++		return (*taal[ta].verify)(req);
++
++	printf("\n TA Abstraction Layer Error.. Missing Function Definition");
++	return FAILURE;
++}
++
++/************************************************************************=
***
++ * Function	:	get_ta_from_platform
++ * Arguments	:	plat_name - PLATFORM name
++ * Return	:	TA Type
++ * Description	:	Map a PLATFORM name to its TA_TYPE
++ ************************************************************************=
***/
++enum cfg_taal get_ta_from_platform(const char *plat_name)
++{
++	int i;
++
++	for (i =3D 0; i < NUM_TA_TABLE; i++) {
++		if (strcmp(ta_table[i].plat_name, plat_name) =3D=3D 0)
++			return ta_table[i].ta_type;
++	}
++
++	return TA_UNKNOWN_MAX;
++}
++
+ /************************************************************************=
***
+  * Function	:	get_ta_from_file
+  * Arguments	:	file_name - Input File Name
+@@ -272,7 +315,6 @@ int taal_dump_header(enum cfg_taal ta)
+  ************************************************************************=
***/
+ enum cfg_taal get_ta_from_file(char *file_name)
+ {
+-	int i =3D 0;
+ 	char *plat_name;
+ =

+ 	FILE *fp;
+@@ -286,12 +328,8 @@ enum cfg_taal get_ta_from_file(char *file_name)
+ 	find_value_from_file("PLATFORM", fp);
+ 	if (file_field.count =3D=3D 1) {
+ 		plat_name =3D file_field.value[0];
+-		for (i =3D 0; i < NUM_TA_TABLE; i++) {
+-			if (strcmp(ta_table[i].plat_name, plat_name) =3D=3D 0) {
+-				fclose(fp);
+-				return ta_table[i].ta_type;
+-			}
+-		}
++		fclose(fp);
++		return get_ta_from_platform(plat_name);
+ 	} else {
+ 		fprintf(stderr, "Unable to Get PLATFORM from %s\n", file_name);
+ 		fclose(fp);
+diff --git a/taal/taal_api.c b/taal/taal_api.c
+index b96d04b..3d3bcb4 100644
+--- a/taal/taal_api.c
++++ b/taal/taal_api.c
+@@ -111,3 +111,12 @@ __weak int calc_srk_hash_ta_3_1(void) { return (error=
_unsupported()); }
+ =

+ __weak int dump_hdr_ta_3_0(void) { return (error_unsupported()); }
+ __weak int dump_hdr_ta_3_1(void) { return (error_unsupported()); }
++
++__weak int verify_ta_1_x_pbl(struct verify_req *r) { return (error_unsupp=
orted()); }
++__weak int verify_ta_1_x_nonpbl(struct verify_req *r) { return (error_uns=
upported()); }
++__weak int verify_ta_2_0_pbl(struct verify_req *r) { return (error_unsupp=
orted()); }
++__weak int verify_ta_2_0_nonpbl(struct verify_req *r) { return (error_uns=
upported()); }
++__weak int verify_ta_2_1_arm7(struct verify_req *r) { return (error_unsup=
ported()); }
++__weak int verify_ta_2_1_arm8(struct verify_req *r) { return (error_unsup=
ported()); }
++__weak int verify_ta_3_0(struct verify_req *r) { return (error_unsupporte=
d()); }
++__weak int verify_ta_3_1(struct verify_req *r) { return (error_unsupporte=
d()); }
+-- =

+2.53.0
+
diff --git a/package/qoriq-cst/0005-verify-add-cst_verify-for-the-TA-3.x-ES=
BC-and-ISBC-h.patch b/package/qoriq-cst/0005-verify-add-cst_verify-for-the-=
TA-3.x-ESBC-and-ISBC-h.patch
new file mode 100644
index 0000000000..daa433d401
--- /dev/null
+++ b/package/qoriq-cst/0005-verify-add-cst_verify-for-the-TA-3.x-ESBC-and-=
ISBC-h.patch
@@ -0,0 +1,1827 @@
+From 078618dca5804fdd4e8c39fa67515d382ca16566 Mon Sep 17 00:00:00 2001
+From: Vincent <vjardin@free.fr>
+Date: Sat, 24 Oct 2026 14:42:36 +0200
+Subject: [PATCH] verify: add cst_verify for the TA 3.x ESBC and ISBC heade=
rs
+
+cst_verify checks the files the header tools produce, from their bytes
+alone, the way the trust architecture 3.x BootROM and TF-A BL2 check them
+(LX2160, LS1028, LS2088, LS1088, LS2085):
+
+  cst_verify esbc --hdr <hdr> --img <image>      ESBC header and its image
+  cst_verify esbc --in <image with header>       as packed by TF-A (header=
, then
+                                                 the image at CSF_HDR_SZ)
+  cst_verify isbc --hdr <hdr> --img <img>...     Boot1 (ISBC) header and t=
he
+                                                 images of its SG table
+  cst_verify dump <mode> ...                     print what is parsed
+
+Options:
+  --pub <pem>[,<pem>..] (expected SRK table)
+  --srk-hash <hex> (expected SRKH fuse value)
+  --revoke-mask <hex> (SFP key revocation)
+  --platform <name> or --ta 3.0|3.1|3.2
+  --hdr-size <n> (image offset BL2 expects in --in files, 0x3000 by defaul=
t)
+  --json
+  -v
+
+Each check is reported as PASS, FAIL or SKIP with an identifier, in order
+of evaluation. Exit status: 0 all checks pass, 1 at least one fails, 2
+usage or I/O error.
+
+ESBC (TF-A BL2 validate_esbc_header and calc_img_hash):
+  E1  barker code                 E8  SRK table hash equals --srk-hash
+  E2  1 to 8 SRK entries          E9  signature over header, SRK table, im=
age
+  E3  selected key in the table   E10 offsets and lengths inside the files
+  E4  key not in --revoke-mask    E11 modulus top bit set and odd
+  E5  key lengths 1k, 2k or 4k    E12 SRK table equals the --pub keys
+  E6  signature length vs key     E13 image offset equals --hdr-size
+  E7  signature below the modulus E14 no IE key extension
+
+ISBC (BootROM Boot1 validation):
+  I1  barker code                 I8  entry point inside an SG region
+  I2  1 to 8 SRK entries          I9  B01 flag set, no IE key extension
+  I3  selected key in the table   I10 offsets, lengths and image sizes
+  I4  key and signature lengths,  I11 key not in --revoke-mask
+      signature below the modulus I12 SRK table equals the --pub keys
+  I5  SRK table hash              I13 modulus top bit set and odd
+  I6  1 to 8 SG entries in the file
+  I7  signature over header, SRK table, SG table and images
+
+Example, a TF-A build for LX2160A:
+
+  cst_verify isbc --hdr hdr_bl2 --img bl2.bin --pub srk.pub
+  cst_verify esbc --in bl31.bin.cst --pub srk.pub
+
+The benefit: avoid loading an image that is not properly signed.
+For instance, it can be used during an upgrade process/flow before
+flashing the image that would not be accepted after a reboot.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/nxp-qoriq/cst/pull/11/commits/078618dca5804fd=
d4e8c39fa67515d382ca16566
+Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
+---
+ Makefile                                |  15 +
+ README                                  |   2 +
+ tools/verification/cst_verify.c         | 279 ++++++++++
+ tools/verification/include/verify.h     | 217 ++++++++
+ tools/verification/verify_common.c      | 672 ++++++++++++++++++++++++
+ tools/verification/verify_esbc_ta_3_x.c | 199 +++++++
+ tools/verification/verify_isbc_ta_3_x.c | 219 ++++++++
+ tools/verification/verify_ta_3_x.c      |  52 ++
+ 8 files changed, 1655 insertions(+)
+ create mode 100644 tools/verification/cst_verify.c
+ create mode 100644 tools/verification/include/verify.h
+ create mode 100644 tools/verification/verify_common.c
+ create mode 100644 tools/verification/verify_esbc_ta_3_x.c
+ create mode 100644 tools/verification/verify_isbc_ta_3_x.c
+ create mode 100644 tools/verification/verify_ta_3_x.c
+
+diff --git a/Makefile b/Makefile
+index a78ba9e..d41f6b9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -33,6 +33,7 @@ CCFLAGS +=3D -I$(OPENSSL_INC_PATH)
+ endif
+ =

+ LIBS +=3D -lssl -lcrypto -ldl
++JSON_LIBS ?=3D -ljson-c
+ =

+ genkeys_OBJS =3D gen_keys.o
+ genotpmk_OBJS =3D gen_otpmk_drbg.o
+@@ -89,6 +90,14 @@ gen_fusescr_OBJS =3D $(basename $(gen_fusescr_SRCS))
+ gen_fusescr_OBJS :=3D $(notdir $(gen_fusescr_OBJS))
+ gen_fusescr_OBJS :=3D $(gen_fusescr_OBJS:%=3D%.o)
+ =

++cst_verify_SRCS =3D $(wildcard common/*.c) \
++		$(wildcard taal/*.c) \
++		$(wildcard tools/verification/*.c)
++
++cst_verify_OBJS =3D $(basename $(cst_verify_SRCS))
++cst_verify_OBJS :=3D $(notdir $(cst_verify_OBJS))
++cst_verify_OBJS :=3D $(cst_verify_OBJS:%=3D%.o)
++
+ vpath %.c 	common/ taal/ tools/header_generation/ \
+ 		tools/header_generation/create_hdr_isbc/ tools/header_generation/create=
_hdr_isbc/taal_api/ \
+ 		tools/header_generation/create_hdr_esbc/ tools/header_generation/create=
_hdr_esbc/taal_api/ \
+@@ -98,12 +107,14 @@ vpath %.c 	common/ taal/ tools/header_generation/ \
+ 		tools/pbi_creation/ \
+ 		tools/signature_generation/ \
+ 		tools/fuse_provisioning \
++		tools/verification/ \
+ =

+ INCLUDES =3D 	-Itools/header_generation/create_hdr_isbc/include/ \
+ 		-Itools/header_generation/create_hdr_esbc/include/ \
+ 		-Itools/header_generation/create_hdr_pbi/include/ \
+ 		-Itools/header_generation/create_hdr_cf/include/ \
+ 		-Itools/fuse_provisioning/include/ \
++		-Itools/verification/include/ \
+ 		-Itaal/include -Icommon/include \
+ 		-I$(LIB_HASH_DRBG_INCLUDE_PATH)
+ =

+@@ -113,6 +124,7 @@ INSTALL_BINARIES =3D 	create_hdr_isbc create_hdr_esbc \
+ 			create_hdr_pbi create_hdr_cf \
+ 			gen_keys gen_otpmk_drbg gen_drv_drbg \
+ 			gen_sign sign_embed gen_fusescr \
++			cst_verify \
+ =

+ # targets that are not files
+ .PHONY: all clean
+@@ -157,6 +169,9 @@ gen_drv_drbg: ${gendrv_OBJS} $(LIB_HASH_DRBG)
+ gen_fusescr: ${gen_fusescr_OBJS}
+ 	${LD} ${LDFLAGS} -o $@ $^ ${LIBS}
+ =

++cst_verify: ${cst_verify_OBJS}
++	${LD} ${LDFLAGS} -o $@ $^ ${LIBS} ${JSON_LIBS}
++
+ $(LIB_HASH_DRBG):
+ 	@echo "#########################################"
+ 	@echo "### Building Shared Library hash_drbg ###"
+diff --git a/README b/README
+index 3094e77..d4c2f2b 100644
+--- a/README
++++ b/README
+@@ -12,6 +12,8 @@ CST tool providing the following tools:
+ 3. Signature Geneartion
+ 	- gen_sign
+ 	- sign_embed
++4. Verification
++	- cst_verify
+ =

+ Wrapper scripts for invoking the Header creation tools have also been pro=
vided:
+ 1. uni_pbi (create_hdr_pbi)
+diff --git a/tools/verification/cst_verify.c b/tools/verification/cst_veri=
fy.c
+new file mode 100644
+index 0000000..2068db4
+--- /dev/null
++++ b/tools/verification/cst_verify.c
+@@ -0,0 +1,279 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <getopt.h>
++
++#include <verify.h>
++#include <crypto_utils.h>
++
++struct g_data_t gd;
++
++enum {
++	OPT_HDR =3D 256,
++	OPT_IMG,
++	OPT_IN,
++	OPT_HDR_SIZE,
++	OPT_PLATFORM,
++	OPT_TA,
++	OPT_PUB,
++	OPT_SRK_HASH,
++	OPT_REVOKE_MASK,
++	OPT_JSON,
++};
++
++static const struct option long_options[] =3D {
++	{"hdr", required_argument, 0, OPT_HDR},
++	{"img", required_argument, 0, OPT_IMG},
++	{"in", required_argument, 0, OPT_IN},
++	{"hdr-size", required_argument, 0, OPT_HDR_SIZE},
++	{"platform", required_argument, 0, OPT_PLATFORM},
++	{"ta", required_argument, 0, OPT_TA},
++	{"pub", required_argument, 0, OPT_PUB},
++	{"srk-hash", required_argument, 0, OPT_SRK_HASH},
++	{"revoke-mask", required_argument, 0, OPT_REVOKE_MASK},
++	{"json", no_argument, 0, OPT_JSON},
++	{"verbose", no_argument, 0, 'v'},
++	{"help", no_argument, 0, 'h'},
++	{0, 0, 0, 0}
++};
++
++static void print_usage(void)
++{
++	printf("Usage:\n"
++	       "  cst_verify esbc --hdr <hdr> --img <image> [common]\n"
++	       "  cst_verify esbc --in <image with prepended header> [common]\n"
++	       "  cst_verify isbc --hdr <hdr_bl2> --img <img1> [--img <img2> ...=
] [common]\n"
++	       "  cst_verify dump <esbc|isbc> <same arguments>\n"
++	       "\n"
++	       "Verify the CSF headers and images produced by CST for the\n"
++	       "trust architecture 3.x BootROM and TF-A BL2, from the output\n"
++	       "files only.\n"
++	       "\n"
++	       "common:\n"
++	       "  --platform <name>     LX2160, LS1028, LS2088, LS1088, LS2085 (=
default: TA 3.1 layout)\n"
++	       "  --ta 3.0|3.1|3.2      trust architecture instead of --platform=
\n"
++	       "  --pub <pem>[,<pem>..] expected SRK public keys, the whole tabl=
e in order\n"
++	       "  --srk-hash <hex>      expected SRK table hash (SFP SRKH), 64 h=
ex digits\n"
++	       "  --revoke-mask <hex>   SFP key revocation bits (SFP_OSPR[KEY_RE=
VOC])\n"
++	       "  --hdr-size <n>        image offset BL2 expects in --in files (=
default 0x%x, 0 =3D any)\n"
++	       "  --json                machine readable report\n"
++	       "  -v, --verbose         print every check, not only the failures=
\n"
++	       "\n"
++	       "Exit status: 0 all checks pass, 1 at least one check fails,\n"
++	       "2 usage or I/O error.\n", VR_DEFAULT_HDR_SIZE);
++}
++
++static int parse_mode(const char *s, enum verify_mode *m)
++{
++	if (strcmp(s, "esbc") =3D=3D 0)
++		*m =3D VERIFY_ESBC;
++	else if (strcmp(s, "isbc") =3D=3D 0)
++		*m =3D VERIFY_ISBC;
++	else
++		return -1;
++	return 0;
++}
++
++static int parse_ta(const char *s, enum cfg_taal *ta)
++{
++	if (strcmp(s, "3.0") =3D=3D 0)
++		*ta =3D TA_3_0;
++	else if (strcmp(s, "3.1") =3D=3D 0)
++		*ta =3D TA_3_1;
++	else if (strcmp(s, "3.2") =3D=3D 0)
++		*ta =3D TA_3_2;
++	else
++		return -1;
++	return 0;
++}
++
++static int parse_pub(struct verify_req *r, char *list)
++{
++	char *tok, *save =3D NULL;
++
++	for (tok =3D strtok_r(list, ",", &save); tok;
++	     tok =3D strtok_r(NULL, ",", &save)) {
++		if (r->num_pub =3D=3D VR_MAX_PUB) {
++			fprintf(stderr, "cst_verify: at most %d --pub keys\n",
++				VR_MAX_PUB);
++			return -1;
++		}
++		memset(&r->pub[r->num_pub], 0, sizeof(r->pub[0]));
++		if (crypto_extract_pub_key(tok, &r->pub[r->num_pub].key_len,
++					   r->pub[r->num_pub].pkey) !=3D SUCCESS)
++			return -1;
++		r->num_pub++;
++	}
++	return r->num_pub ? 0 : -1;
++}
++
++static void free_req(struct verify_req *r)
++{
++	int i;
++
++	vr_free_blob(&r->hdr);
++	vr_free_blob(&r->in);
++	for (i =3D 0; i < r->num_img; i++)
++		vr_free_blob(&r->img[i]);
++	free(r->items);
++}
++
++int main(int argc, char **argv)
++{
++	struct verify_req r;
++	const char *hdr_name =3D NULL, *in_name =3D NULL;
++	const char *img_name[VR_MAX_IMG];
++	int num_img =3D 0, i, c, ret;
++	uint64_t v;
++
++	memset(&r, 0, sizeof(r));
++	r.hdr_size =3D VR_DEFAULT_HDR_SIZE;
++	r.ta =3D TA_3_1;
++
++	if (argc < 2) {
++		print_usage();
++		return VR_EXIT_ERROR;
++	}
++	if (strcmp(argv[1], "-h") =3D=3D 0 || strcmp(argv[1], "--help") =3D=3D 0=
) {
++		print_usage();
++		return VR_EXIT_PASS;
++	}
++	optind =3D 1;
++	if (strcmp(argv[1], "dump") =3D=3D 0) {
++		r.dump =3D 1;
++		optind =3D 2;
++	}
++	if (optind >=3D argc || parse_mode(argv[optind], &r.mode) !=3D 0) {
++		fprintf(stderr, "cst_verify: expected esbc or isbc\n");
++		return VR_EXIT_ERROR;
++	}
++	optind++;
++
++	while ((c =3D getopt_long(argc, argv, "vh", long_options, NULL)) !=3D -1=
) {
++		switch (c) {
++		case OPT_HDR:
++			hdr_name =3D optarg;
++			break;
++		case OPT_IMG:
++			if (num_img =3D=3D VR_MAX_IMG) {
++				fprintf(stderr, "cst_verify: at most %d --img\n",
++					VR_MAX_IMG);
++				return VR_EXIT_ERROR;
++			}
++			img_name[num_img++] =3D optarg;
++			break;
++		case OPT_IN:
++			in_name =3D optarg;
++			break;
++		case OPT_HDR_SIZE:
++			if (vr_parse_u64(optarg, &v) !=3D 0 || v > 0xffffffffULL)
++				goto bad_arg;
++			r.hdr_size =3D (uint32_t)v;
++			break;
++		case OPT_PLATFORM:
++			r.ta =3D get_ta_from_platform(optarg);
++			if (r.ta !=3D TA_3_0 && r.ta !=3D TA_3_1 && r.ta !=3D TA_3_2) {
++				fprintf(stderr, "cst_verify: platform %s: only trust architecture 3.x=
 is supported\n",
++					optarg);
++				return VR_EXIT_ERROR;
++			}
++			r.ta_set =3D 1;
++			break;
++		case OPT_TA:
++			if (parse_ta(optarg, &r.ta) !=3D 0)
++				goto bad_arg;
++			r.ta_set =3D 1;
++			break;
++		case OPT_PUB:
++			if (parse_pub(&r, optarg) !=3D 0)
++				return VR_EXIT_ERROR;
++			break;
++		case OPT_SRK_HASH:
++			if (vr_parse_hex(optarg, r.srk_hash, VR_HASH_LEN) !=3D 0)
++				goto bad_arg;
++			r.srk_hash_set =3D 1;
++			break;
++		case OPT_REVOKE_MASK:
++			if (vr_parse_u64(optarg, &v) !=3D 0 || v > 0xffffffffULL)
++				goto bad_arg;
++			r.revoke_mask =3D (uint32_t)v;
++			r.revoke_set =3D 1;
++			break;
++		case OPT_JSON:
++			r.json =3D 1;
++			break;
++		case 'v':
++			r.verbose =3D 1;
++			break;
++		case 'h':
++			print_usage();
++			return VR_EXIT_PASS;
++		default:
++			print_usage();
++			return VR_EXIT_ERROR;
++		}
++	}
++	if (optind !=3D argc) {
++		fprintf(stderr, "cst_verify: unexpected argument %s\n",
++			argv[optind]);
++		return VR_EXIT_ERROR;
++	}
++
++	if (hdr_name && vr_load_file(&r.hdr, hdr_name) !=3D 0)
++		return VR_EXIT_ERROR;
++	if (in_name && vr_load_file(&r.in, in_name) !=3D 0)
++		return VR_EXIT_ERROR;
++	for (i =3D 0; i < num_img; i++) {
++		if (vr_load_file(&r.img[i], img_name[i]) !=3D 0)
++			return VR_EXIT_ERROR;
++		r.num_img++;
++	}
++
++	if (!r.ta_set && !r.dump)
++		vr_report(&r, "TA", VR_INFO,
++			  "no --platform given, assuming the TA 3.1/3.2 header layout (LX2160,=
 LS1028, LS2088, LS1088)");
++
++	ret =3D taal_verify(r.ta, &r);
++	if (r.dump) {
++		free_req(&r);
++		return ret =3D=3D SUCCESS ? VR_EXIT_PASS : VR_EXIT_ERROR;
++	}
++	if (ret !=3D SUCCESS)
++		r.error =3D 1;
++	vr_print_report(&r);
++	ret =3D vr_exit_code(&r);
++	free_req(&r);
++	return ret;
++
++bad_arg:
++	fprintf(stderr, "cst_verify: invalid value for %s: %s\n",
++		argv[optind - 2], optarg);
++	return VR_EXIT_ERROR;
++}
+diff --git a/tools/verification/include/verify.h b/tools/verification/incl=
ude/verify.h
+new file mode 100644
+index 0000000..ba56e74
+--- /dev/null
++++ b/tools/verification/include/verify.h
+@@ -0,0 +1,217 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#ifndef _VERIFY_H_
++#define _VERIFY_H_
++
++#include <stdint.h>
++#include <stddef.h>
++#include <global.h>
++#include <taal.h>
++
++#define VR_CSF_HDR_SIZE		0x50
++#define VR_SRK_ENTRY_SIZE	(sizeof(struct srk_table_t))
++#define VR_SG_ENTRY_SIZE	(sizeof(struct sg_table_t))
++#define VR_HASH_LEN		SHA256_DIGEST_LENGTH
++#define VR_MAX_IMG		MAX_NUM_SG_ENTRY
++#define VR_MAX_PUB		MAX_NUM_KEY
++#define VR_MAX_SRK		MAX_NUM_KEY
++#define VR_DEFAULT_HDR_SIZE	0x3000
++#define VR_UNREVOCABLE_KEY	8
++
++#define VR_EXIT_PASS		0
++#define VR_EXIT_FAIL		1
++#define VR_EXIT_ERROR		2
++
++enum verify_mode {
++	VERIFY_ESBC,
++	VERIFY_ISBC,
++};
++
++enum vr_status {
++	VR_PASS,
++	VR_FAIL,
++	VR_SKIP,
++	VR_INFO,
++};
++
++struct verify_blob {
++	const char *name;
++	uint8_t *data;
++	size_t len;
++};
++
++struct vr_item {
++	char id[8];
++	enum vr_status status;
++	char msg[256];
++};
++
++struct verify_req {
++	enum verify_mode mode;
++	enum cfg_taal ta;
++	int ta_set;
++	int dump;
++	int verbose;
++	int json;
++
++	struct verify_blob hdr;
++	struct verify_blob in;
++	struct verify_blob img[VR_MAX_IMG];
++	int num_img;
++
++	uint32_t hdr_size;
++
++	int srk_hash_set;
++	uint8_t srk_hash[VR_HASH_LEN];
++	int revoke_set;
++	uint32_t revoke_mask;
++	int num_pub;
++	struct srk_table_t pub[VR_MAX_PUB];
++
++	struct vr_item *items;
++	int num_items;
++	int cap_items;
++	int num_fail;
++	int img_hash_set;
++	uint8_t img_hash[VR_HASH_LEN];
++	int srkh_set;
++	uint8_t srkh[VR_HASH_LEN];
++	int error;
++};
++
++enum csf_kind {
++	CSF_ESBC,
++	CSF_ISBC,
++	CSF_PBI,
++};
++
++struct csf_hdr_view {
++	enum csf_kind kind;
++	int ta30;
++	uint8_t barker[BARKER_LEN];
++	uint32_t srk_tbl_off;
++	uint8_t num_srk;
++	uint8_t srk_sel;
++	uint8_t misc_flags;
++	uint8_t uid_flags;
++	uint32_t psign;
++	uint32_t sign_len;
++	uint64_t img_addr;
++	uint32_t img_len;
++	uint32_t ie_key_sel;
++	uint32_t sg_off;
++	uint32_t sg_entries;
++	uint64_t entry_point;
++	uint32_t fsl_uid[MAX_NUM_FSL_UID];
++	uint32_t oem_uid[MAX_NUM_OEM_UID];
++};
++
++struct srk_view {
++	uint32_t num;
++	const uint8_t *tbl;
++	size_t len;
++};
++
++struct sg_entry_view {
++	uint32_t len;
++	uint32_t target;
++	uint64_t src;
++};
++
++struct vr_key {
++	int index;
++	const uint8_t *modulus;
++	const uint8_t *exponent;
++	uint32_t mod_len;
++};
++
++/* Common check identifiers, mapped to per mode ids */
++enum vr_common_check {
++	CK_BARKER,
++	CK_NUM_SRK,
++	CK_SRK_SEL,
++	CK_REVOKED,
++	CK_KEY_LEN,
++	CK_SIGN_LEN,
++	CK_SIG_LT_MOD,
++	CK_SRKH,
++	CK_SIGNATURE,
++	CK_BOUNDS,
++	CK_MODULUS,
++	CK_PUB,
++	CK_MAX
++};
++
++/* verify_common.c */
++void vr_report(struct verify_req *r, const char *id, enum vr_status st,
++	       const char *fmt, ...);
++int vr_load_file(struct verify_blob *b, const char *name);
++void vr_free_blob(struct verify_blob *b);
++int vr_rd32(const uint8_t *p, size_t len, uint64_t off, uint32_t *v);
++int vr_in_range(size_t len, uint64_t off, uint64_t n);
++int vr_parse_u64(const char *s, uint64_t *v);
++int vr_parse_hex(const char *s, uint8_t *out, size_t n);
++void vr_hex(char *dst, const uint8_t *p, size_t n);
++void vr_print_report(struct verify_req *r);
++int vr_exit_code(struct verify_req *r);
++
++int csf_parse_hdr(const uint8_t *p, size_t len, enum csf_kind kind, int t=
a30,
++		  struct csf_hdr_view *h);
++void csf_dump_hdr(const struct csf_hdr_view *h);
++int srk_view_init(struct srk_view *s, const uint8_t *buf, size_t len,
++		  uint64_t off, uint32_t num);
++uint32_t srk_key_len(const struct srk_view *s, int i);
++const uint8_t *srk_key(const struct srk_view *s, int i);
++void srk_dump(const struct srk_view *s);
++void srk_hash(const struct srk_view *s, uint8_t *hash);
++int sg_parse(const uint8_t *p, size_t len, uint64_t off, uint32_t n,
++	     int ta30, struct sg_entry_view *sg);
++void sg_dump(const struct sg_entry_view *sg, uint32_t n);
++
++int vr_check_barker(struct verify_req *r, const char *id,
++		    const struct csf_hdr_view *h);
++int vr_check_srk(struct verify_req *r, const char *const ids[CK_MAX],
++		 const struct csf_hdr_view *h, const uint8_t *buf, size_t len,
++		 uint64_t base, struct srk_view *srk, struct vr_key *key);
++int vr_check_signature(struct verify_req *r, const char *id,
++		       const uint8_t *hash, const uint8_t *sig,
++		       uint32_t sign_len, const struct vr_key *key,
++		       const char *what);
++void vr_report_flags(struct verify_req *r, const char *id,
++		     const struct csf_hdr_view *h);
++
++/* verify_esbc_ta_3_x.c, verify_isbc_ta_3_x.c */
++int verify_esbc_ta_3_x(struct verify_req *r, int ta30);
++int verify_isbc_ta_3_x(struct verify_req *r, int ta30);
++int verify_isbc_buffers(struct verify_req *r, int ta30, const char *what,
++			const uint8_t *hdr, size_t hdr_len,
++			const struct verify_blob *img, int num_img,
++			struct csf_hdr_view *out_hdr, struct srk_view *out_srk,
++			struct sg_entry_view *out_sg);
++
++#endif
+diff --git a/tools/verification/verify_common.c b/tools/verification/verif=
y_common.c
+new file mode 100644
+index 0000000..f996093
+--- /dev/null
++++ b/tools/verification/verify_common.c
+@@ -0,0 +1,672 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <stdarg.h>
++#include <ctype.h>
++#include <errno.h>
++
++#include <json-c/json.h>
++
++#include <verify.h>
++#include <crypto_utils.h>
++
++#define VR_MAX_FILE_SIZE	(256UL * 1024 * 1024)
++
++static const uint8_t barker_ta_3_x[BARKER_LEN] =3D { 0x12, 0x19, 0x20, 0x=
01 };
++
++static const char *vr_status_name(enum vr_status st)
++{
++	switch (st) {
++	case VR_PASS:
++		return "PASS";
++	case VR_FAIL:
++		return "FAIL";
++	case VR_SKIP:
++		return "SKIP";
++	case VR_INFO:
++		return "INFO";
++	}
++	return "?";
++}
++
++void vr_report(struct verify_req *r, const char *id, enum vr_status st,
++	       const char *fmt, ...)
++{
++	struct vr_item *it;
++	va_list ap;
++
++	if (r->num_items =3D=3D r->cap_items) {
++		int cap =3D r->cap_items ? r->cap_items * 2 : 32;
++		struct vr_item *n =3D realloc(r->items, cap * sizeof(*n));
++
++		if (n =3D=3D NULL) {
++			fprintf(stderr, "cst_verify: out of memory\n");
++			exit(VR_EXIT_ERROR);
++		}
++		r->items =3D n;
++		r->cap_items =3D cap;
++	}
++	it =3D &r->items[r->num_items++];
++	memset(it, 0, sizeof(*it));
++	snprintf(it->id, sizeof(it->id), "%s", id);
++	it->status =3D st;
++	va_start(ap, fmt);
++	vsnprintf(it->msg, sizeof(it->msg), fmt, ap);
++	va_end(ap);
++	if (st =3D=3D VR_FAIL)
++		r->num_fail++;
++}
++
++int vr_load_file(struct verify_blob *b, const char *name)
++{
++	FILE *fp;
++	long size;
++
++	fp =3D fopen(name, "rb");
++	if (fp =3D=3D NULL) {
++		fprintf(stderr, "cst_verify: cannot open %s: %s\n", name,
++			strerror(errno));
++		return -1;
++	}
++	if (fseek(fp, 0, SEEK_END) !=3D 0 || (size =3D ftell(fp)) < 0 ||
++	    (unsigned long)size > VR_MAX_FILE_SIZE ||
++	    fseek(fp, 0, SEEK_SET) !=3D 0) {
++		fprintf(stderr, "cst_verify: cannot size %s\n", name);
++		fclose(fp);
++		return -1;
++	}
++	b->data =3D malloc(size ? size : 1);
++	if (b->data =3D=3D NULL) {
++		fprintf(stderr, "cst_verify: out of memory\n");
++		fclose(fp);
++		return -1;
++	}
++	if (size && fread(b->data, 1, size, fp) !=3D (size_t)size) {
++		fprintf(stderr, "cst_verify: cannot read %s\n", name);
++		fclose(fp);
++		free(b->data);
++		b->data =3D NULL;
++		return -1;
++	}
++	fclose(fp);
++	b->name =3D name;
++	b->len =3D size;
++	return 0;
++}
++
++void vr_free_blob(struct verify_blob *b)
++{
++	free(b->data);
++	b->data =3D NULL;
++	b->len =3D 0;
++}
++
++int vr_in_range(size_t len, uint64_t off, uint64_t n)
++{
++	return off <=3D len && n <=3D len - off;
++}
++
++int vr_rd32(const uint8_t *p, size_t len, uint64_t off, uint32_t *v)
++{
++	if (!vr_in_range(len, off, 4))
++		return -1;
++	*v =3D (uint32_t)p[off] | ((uint32_t)p[off + 1] << 8) |
++	     ((uint32_t)p[off + 2] << 16) | ((uint32_t)p[off + 3] << 24);
++	return 0;
++}
++
++int vr_parse_u64(const char *s, uint64_t *v)
++{
++	char *end;
++
++	if (s =3D=3D NULL || *s =3D=3D '\0')
++		return -1;
++	errno =3D 0;
++	*v =3D strtoull(s, &end, 0);
++	if (errno !=3D 0 || *end !=3D '\0')
++		return -1;
++	return 0;
++}
++
++int vr_parse_hex(const char *s, uint8_t *out, size_t n)
++{
++	size_t i;
++
++	if (s[0] =3D=3D '0' && (s[1] =3D=3D 'x' || s[1] =3D=3D 'X'))
++		s +=3D 2;
++	if (strlen(s) !=3D 2 * n)
++		return -1;
++	for (i =3D 0; i < 2 * n; i++) {
++		int c =3D tolower((unsigned char)s[i]);
++		int d;
++
++		if (c >=3D '0' && c <=3D '9')
++			d =3D c - '0';
++		else if (c >=3D 'a' && c <=3D 'f')
++			d =3D c - 'a' + 10;
++		else
++			return -1;
++		if (i % 2 =3D=3D 0)
++			out[i / 2] =3D d << 4;
++		else
++			out[i / 2] |=3D d;
++	}
++	return 0;
++}
++
++void vr_hex(char *dst, const uint8_t *p, size_t n)
++{
++	static const char digits[] =3D "0123456789abcdef";
++	size_t i;
++
++	for (i =3D 0; i < n; i++) {
++		dst[2 * i] =3D digits[p[i] >> 4];
++		dst[2 * i + 1] =3D digits[p[i] & 0xf];
++	}
++	dst[2 * n] =3D '\0';
++}
++
++static const char *mode_name(enum verify_mode m)
++{
++	switch (m) {
++	case VERIFY_ESBC:
++		return "esbc";
++	case VERIFY_ISBC:
++		return "isbc";
++	}
++	return "?";
++}
++
++void vr_print_report(struct verify_req *r)
++{
++	int i, checks =3D 0;
++	char hex[2 * VR_HASH_LEN + 1];
++
++	for (i =3D 0; i < r->num_items; i++)
++		if (r->items[i].status !=3D VR_INFO)
++			checks++;
++
++	if (r->json) {
++		struct json_object *root =3D json_object_new_object();
++		struct json_object *list =3D json_object_new_array();
++
++		if (root =3D=3D NULL || list =3D=3D NULL) {
++			fprintf(stderr, "cst_verify: out of memory\n");
++			exit(VR_EXIT_ERROR);
++		}
++		json_object_object_add(root, "mode",
++				       json_object_new_string(mode_name(r->mode)));
++		for (i =3D 0; i < r->num_items; i++) {
++			struct vr_item *it =3D &r->items[i];
++			struct json_object *o =3D json_object_new_object();
++
++			json_object_object_add(o, "id", json_object_new_string(it->id));
++			json_object_object_add(o, "status",
++					       json_object_new_string(vr_status_name(it->status)));
++			json_object_object_add(o, "msg", json_object_new_string(it->msg));
++			json_object_array_add(list, o);
++		}
++		json_object_object_add(root, "checks", list);
++		if (r->img_hash_set) {
++			vr_hex(hex, r->img_hash, VR_HASH_LEN);
++			json_object_object_add(root, "image_hash",
++					       json_object_new_string(hex));
++		}
++		if (r->srkh_set) {
++			vr_hex(hex, r->srkh, VR_HASH_LEN);
++			json_object_object_add(root, "srk_hash",
++					       json_object_new_string(hex));
++		}
++		json_object_object_add(root, "failed", json_object_new_int(r->num_fail)=
);
++		json_object_object_add(root, "checks_run", json_object_new_int(checks));
++		json_object_object_add(root, "verdict",
++				       json_object_new_string(r->error ? "ERROR" :
++							      r->num_fail ? "FAIL" : "PASS"));
++		printf("%s\n", json_object_to_json_string_ext(root,
++			JSON_C_TO_STRING_PRETTY | JSON_C_TO_STRING_SPACED |
++			JSON_C_TO_STRING_NOSLASHESCAPE));
++		json_object_put(root);
++		return;
++	}
++
++	for (i =3D 0; i < r->num_items; i++) {
++		struct vr_item *it =3D &r->items[i];
++
++		if (it->status =3D=3D VR_FAIL || r->verbose)
++			printf("%s %s: %s\n", it->id, vr_status_name(it->status),
++			       it->msg);
++	}
++	if (r->srkh_set && (r->verbose || r->num_fail =3D=3D 0)) {
++		vr_hex(hex, r->srkh, VR_HASH_LEN);
++		printf("SRK hash: %s\n", hex);
++	}
++	if (r->error)
++		printf("verdict: ERROR\n");
++	else if (r->num_fail)
++		printf("verdict: FAIL (%d of %d checks failed)\n", r->num_fail,
++		       checks);
++	else
++		printf("verdict: PASS (%d checks)\n", checks);
++}
++
++int vr_exit_code(struct verify_req *r)
++{
++	if (r->error)
++		return VR_EXIT_ERROR;
++	return r->num_fail ? VR_EXIT_FAIL : VR_EXIT_PASS;
++}
++
++/************************************************************************=
***
++ * CSF header, SRK table and SG table views
++ ************************************************************************=
***/
++int csf_parse_hdr(const uint8_t *p, size_t len, enum csf_kind kind, int t=
a30,
++		  struct csf_hdr_view *h)
++{
++	uint32_t lo, hi, uid_base;
++	int i;
++
++	if (len < VR_CSF_HDR_SIZE)
++		return -1;
++	memset(h, 0, sizeof(*h));
++	h->kind =3D kind;
++	h->ta30 =3D ta30;
++	memcpy(h->barker, p, BARKER_LEN);
++	vr_rd32(p, len, 0x04, &h->srk_tbl_off);
++	h->num_srk =3D p[0x08];
++	h->srk_sel =3D p[0x09];
++	h->misc_flags =3D p[0x0b];
++	h->uid_flags =3D p[0x0f];
++	vr_rd32(p, len, 0x10, &h->psign);
++	vr_rd32(p, len, 0x14, &h->sign_len);
++
++	switch (kind) {
++	case CSF_ESBC:
++		vr_rd32(p, len, 0x18, &lo);
++		vr_rd32(p, len, 0x1c, &hi);
++		h->img_addr =3D ((uint64_t)hi << 32) | lo;
++		vr_rd32(p, len, 0x20, &h->img_len);
++		vr_rd32(p, len, 0x24, &h->ie_key_sel);
++		uid_base =3D 0x28;
++		break;
++	case CSF_ISBC:
++		vr_rd32(p, len, 0x18, &h->sg_off);
++		vr_rd32(p, len, 0x1c, &h->sg_entries);
++		vr_rd32(p, len, 0x20, &lo);
++		if (ta30) {
++			h->entry_point =3D lo;
++			uid_base =3D 0x24;
++		} else {
++			vr_rd32(p, len, 0x24, &hi);
++			h->entry_point =3D ((uint64_t)hi << 32) | lo;
++			uid_base =3D 0x28;
++		}
++		break;
++	case CSF_PBI:
++	default:
++		uid_base =3D ta30 ? 0x24 : 0x28;
++		break;
++	}
++	for (i =3D 0; i < MAX_NUM_FSL_UID; i++)
++		vr_rd32(p, len, uid_base + 4 * i, &h->fsl_uid[i]);
++	for (i =3D 0; i < MAX_NUM_OEM_UID; i++)
++		vr_rd32(p, len, uid_base + 4 * MAX_NUM_FSL_UID + 4 * i,
++			&h->oem_uid[i]);
++	return 0;
++}
++
++void csf_dump_hdr(const struct csf_hdr_view *h)
++{
++	int i;
++
++	printf("  barker            : %02x %02x %02x %02x\n", h->barker[0],
++	       h->barker[1], h->barker[2], h->barker[3]);
++	printf("  SRK table offset  : 0x%x\n", h->srk_tbl_off);
++	printf("  number of SRKs    : %u\n", h->num_srk);
++	printf("  SRK select        : %u\n", h->srk_sel);
++	printf("  misc flags        : 0x%02x (LW=3D%d B01=3D%d ISS=3D%d MP=3D%d =
IE=3D%d)\n",
++	       h->misc_flags, !!(h->misc_flags & 0x80),
++	       !!(h->misc_flags & 0x40), !!(h->misc_flags & 0x20),
++	       !!(h->misc_flags & 0x10), !!(h->misc_flags & 0x01));
++	printf("  UID flags         : 0x%02x (FUID=3D%d OID0..4=3D%d%d%d%d%d)\n",
++	       h->uid_flags, !!(h->uid_flags & 0x80), !!(h->uid_flags & 0x40),
++	       !!(h->uid_flags & 0x20), !!(h->uid_flags & 0x10),
++	       !!(h->uid_flags & 0x08), !!(h->uid_flags & 0x04));
++	printf("  signature offset  : 0x%x\n", h->psign);
++	printf("  signature length  : 0x%x\n", h->sign_len);
++	switch (h->kind) {
++	case CSF_ESBC:
++		printf("  image address     : 0x%llx\n",
++		       (unsigned long long)h->img_addr);
++		printf("  image length      : 0x%x\n", h->img_len);
++		printf("  IE key select     : %u\n", h->ie_key_sel);
++		break;
++	case CSF_ISBC:
++		printf("  SG table offset   : 0x%x\n", h->sg_off);
++		printf("  SG entries        : %u\n", h->sg_entries);
++		printf("  entry point       : 0x%llx\n",
++		       (unsigned long long)h->entry_point);
++		break;
++	case CSF_PBI:
++		break;
++	}
++	printf("  FSL UID           : %08x %08x\n", h->fsl_uid[0], h->fsl_uid[1]=
);
++	printf("  OEM UID           :");
++	for (i =3D 0; i < MAX_NUM_OEM_UID; i++)
++		printf(" %08x", h->oem_uid[i]);
++	printf("\n");
++}
++
++int srk_view_init(struct srk_view *s, const uint8_t *buf, size_t len,
++		  uint64_t off, uint32_t num)
++{
++	uint64_t tlen =3D (uint64_t)num * VR_SRK_ENTRY_SIZE;
++
++	if (!vr_in_range(len, off, tlen))
++		return -1;
++	s->num =3D num;
++	s->tbl =3D buf + off;
++	s->len =3D tlen;
++	return 0;
++}
++
++uint32_t srk_key_len(const struct srk_view *s, int i)
++{
++	uint32_t v =3D 0;
++
++	vr_rd32(s->tbl, s->len, (uint64_t)i * VR_SRK_ENTRY_SIZE, &v);
++	return v;
++}
++
++const uint8_t *srk_key(const struct srk_view *s, int i)
++{
++	return s->tbl + (size_t)i * VR_SRK_ENTRY_SIZE + 4;
++}
++
++void srk_dump(const struct srk_view *s)
++{
++	uint32_t i;
++	char hex[2 * 8 + 1];
++
++	for (i =3D 0; i < s->num; i++) {
++		uint32_t kl =3D srk_key_len(s, i);
++		const uint8_t *k =3D srk_key(s, i);
++
++		vr_hex(hex, k, 8);
++		printf("  SRK %u: key_len 0x%x (RSA-%u) modulus %s...\n", i + 1,
++		       kl, kl * 4, hex);
++	}
++}
++
++void srk_hash(const struct srk_view *s, uint8_t *hash)
++{
++	uint8_t ctx[CRYPTO_HASH_CTX_SIZE];
++
++	crypto_hash_init(ctx);
++	crypto_hash_update(ctx, (void *)s->tbl, s->len);
++	crypto_hash_final(hash, ctx);
++}
++
++int sg_parse(const uint8_t *p, size_t len, uint64_t off, uint32_t n,
++	     int ta30, struct sg_entry_view *sg)
++{
++	uint32_t i, lo, hi;
++
++	if (n > VR_MAX_IMG || !vr_in_range(len, off, (uint64_t)n * VR_SG_ENTRY_S=
IZE))
++		return -1;
++	for (i =3D 0; i < n; i++) {
++		uint64_t e =3D off + (uint64_t)i * VR_SG_ENTRY_SIZE;
++
++		vr_rd32(p, len, e, &sg[i].len);
++		vr_rd32(p, len, e + 4, &sg[i].target);
++		vr_rd32(p, len, e + 8, &lo);
++		vr_rd32(p, len, e + 12, &hi);
++		sg[i].src =3D ta30 ? lo : (((uint64_t)hi << 32) | lo);
++	}
++	return 0;
++}
++
++void sg_dump(const struct sg_entry_view *sg, uint32_t n)
++{
++	uint32_t i;
++
++	for (i =3D 0; i < n; i++)
++		printf("  SG %u: src 0x%llx len 0x%x target 0x%x\n", i + 1,
++		       (unsigned long long)sg[i].src, sg[i].len, sg[i].target);
++}
++
++/************************************************************************=
***
++ * Checks shared by the ESBC, ISBC and PBI headers
++ ************************************************************************=
***/
++int vr_check_barker(struct verify_req *r, const char *id,
++		    const struct csf_hdr_view *h)
++{
++	if (memcmp(h->barker, barker_ta_3_x, BARKER_LEN) !=3D 0) {
++		vr_report(r, id, VR_FAIL,
++			  "barker %02x%02x%02x%02x, expected 12192001",
++			  h->barker[0], h->barker[1], h->barker[2], h->barker[3]);
++		return -1;
++	}
++	vr_report(r, id, VR_PASS, "barker code 12192001");
++	return 0;
++}
++
++static int valid_key_len(uint32_t key_len)
++{
++	return key_len =3D=3D 2 * 128 || key_len =3D=3D 2 * 256 || key_len =3D=
=3D 2 * 512;
++}
++
++int vr_check_srk(struct verify_req *r, const char *const ids[CK_MAX],
++		 const struct csf_hdr_view *h, const uint8_t *buf, size_t len,
++		 uint64_t base, struct srk_view *srk, struct vr_key *key)
++{
++	uint32_t i, key_len;
++	const uint8_t *sig;
++	int bad =3D 0;
++
++	if (h->num_srk =3D=3D 0 || h->num_srk > VR_MAX_SRK) {
++		vr_report(r, ids[CK_NUM_SRK], VR_FAIL,
++			  "%u SRK entries, allowed 1 to %d", h->num_srk,
++			  VR_MAX_SRK);
++		return -1;
++	}
++	vr_report(r, ids[CK_NUM_SRK], VR_PASS, "%u SRK entries", h->num_srk);
++
++	if (h->srk_sel =3D=3D 0 || h->srk_sel > h->num_srk) {
++		vr_report(r, ids[CK_SRK_SEL], VR_FAIL,
++			  "SRK select %u, allowed 1 to %u", h->srk_sel,
++			  h->num_srk);
++		return -1;
++	}
++	vr_report(r, ids[CK_SRK_SEL], VR_PASS, "SRK %u selected", h->srk_sel);
++
++	if (srk_view_init(srk, buf, len, base + h->srk_tbl_off, h->num_srk) !=3D=
 0) {
++		vr_report(r, ids[CK_BOUNDS], VR_FAIL,
++			  "SRK table at 0x%llx + %u * %zu bytes is outside the file (%zu bytes=
)",
++			  (unsigned long long)(base + h->srk_tbl_off),
++			  h->num_srk, VR_SRK_ENTRY_SIZE, len);
++		return -1;
++	}
++	if (!vr_in_range(len, base + h->psign, h->sign_len)) {
++		vr_report(r, ids[CK_BOUNDS], VR_FAIL,
++			  "signature at 0x%llx + 0x%x bytes is outside the file (%zu bytes)",
++			  (unsigned long long)(base + h->psign), h->sign_len,
++			  len);
++		return -1;
++	}
++	if (base + h->psign < base + h->srk_tbl_off + srk->len &&
++	    base + h->srk_tbl_off < base + h->psign + h->sign_len) {
++		vr_report(r, ids[CK_BOUNDS], VR_FAIL,
++			  "signature at 0x%x overlaps the SRK table at 0x%x",
++			  h->psign, h->srk_tbl_off);
++		return -1;
++	}
++	vr_report(r, ids[CK_BOUNDS], VR_PASS,
++		  "SRK table at 0x%x and signature at 0x%x inside the file",
++		  h->srk_tbl_off, h->psign);
++
++	for (i =3D 0; i < h->num_srk; i++) {
++		key_len =3D srk_key_len(srk, i);
++		if (!valid_key_len(key_len)) {
++			vr_report(r, ids[CK_KEY_LEN], VR_FAIL,
++				  "SRK %u key_len 0x%x, allowed 0x100, 0x200 or 0x400",
++				  i + 1, key_len);
++			bad =3D 1;
++		}
++	}
++	if (bad)
++		return -1;
++	vr_report(r, ids[CK_KEY_LEN], VR_PASS, "SRK key lengths valid");
++
++	key_len =3D srk_key_len(srk, h->srk_sel - 1);
++	if (h->sign_len !=3D key_len / 2 ||
++	    (h->sign_len !=3D 128 && h->sign_len !=3D 256 && h->sign_len !=3D 51=
2)) {
++		vr_report(r, ids[CK_SIGN_LEN], VR_FAIL,
++			  "signature length 0x%x, SRK %u key_len 0x%x needs 0x%x",
++			  h->sign_len, h->srk_sel, key_len, key_len / 2);
++		return -1;
++	}
++	vr_report(r, ids[CK_SIGN_LEN], VR_PASS,
++		  "signature length 0x%x matches RSA-%u", h->sign_len,
++		  key_len * 4);
++
++	key->index =3D h->srk_sel;
++	key->modulus =3D srk_key(srk, h->srk_sel - 1);
++	key->mod_len =3D key_len / 2;
++	key->exponent =3D key->modulus + key->mod_len;
++
++	if ((key->modulus[0] & 0x80) =3D=3D 0 ||
++	    (key->modulus[key->mod_len - 1] & 0x01) =3D=3D 0) {
++		vr_report(r, ids[CK_MODULUS], VR_FAIL,
++			  "SRK %u modulus: most significant bit %s, %s",
++			  h->srk_sel, key->modulus[0] & 0x80 ? "set" : "clear",
++			  key->modulus[key->mod_len - 1] & 1 ? "odd" : "even");
++		return -1;
++	}
++	vr_report(r, ids[CK_MODULUS], VR_PASS,
++		  "SRK %u modulus has its top bit set and is odd", h->srk_sel);
++
++	sig =3D buf + base + h->psign;
++	if (memcmp(sig, key->modulus, h->sign_len) >=3D 0) {
++		vr_report(r, ids[CK_SIG_LT_MOD], VR_FAIL,
++			  "signature is not numerically below the SRK %u modulus",
++			  h->srk_sel);
++		bad =3D 1;
++	} else {
++		vr_report(r, ids[CK_SIG_LT_MOD], VR_PASS,
++			  "signature is below the modulus");
++	}
++
++	if (r->revoke_set) {
++		if (h->srk_sel !=3D VR_UNREVOCABLE_KEY &&
++		    ((1u << (VR_UNREVOCABLE_KEY - 1 - h->srk_sel)) & r->revoke_mask)) {
++			vr_report(r, ids[CK_REVOKED], VR_FAIL,
++				  "SRK %u is revoked by mask 0x%x", h->srk_sel,
++				  r->revoke_mask);
++			bad =3D 1;
++			} else {
++			vr_report(r, ids[CK_REVOKED], VR_PASS,
++				  "SRK %u not revoked by mask 0x%x", h->srk_sel,
++				  r->revoke_mask);
++		}
++	} else {
++		vr_report(r, ids[CK_REVOKED], VR_SKIP,
++			  "no --revoke-mask given");
++	}
++
++	srk_hash(srk, r->srkh);
++	r->srkh_set =3D 1;
++	if (r->srk_hash_set) {
++		if (memcmp(r->srkh, r->srk_hash, VR_HASH_LEN) !=3D 0) {
++			vr_report(r, ids[CK_SRKH], VR_FAIL,
++				  "SRK table hash differs from --srk-hash");
++			} else {
++			vr_report(r, ids[CK_SRKH], VR_PASS,
++				  "SRK table hash matches --srk-hash");
++		}
++	} else {
++		vr_report(r, ids[CK_SRKH], VR_SKIP, "no --srk-hash given");
++	}
++
++	if (r->num_pub) {
++		int mismatch =3D (uint32_t)r->num_pub !=3D h->num_srk;
++
++		for (i =3D 0; !mismatch && i < h->num_srk; i++) {
++			if (srk_key_len(srk, i) !=3D r->pub[i].key_len ||
++			    memcmp(srk_key(srk, i), r->pub[i].pkey,
++				   r->pub[i].key_len) !=3D 0)
++				mismatch =3D 1;
++		}
++		if (mismatch) {
++			vr_report(r, ids[CK_PUB], VR_FAIL,
++				  "SRK table differs from the %d --pub key(s)",
++				  r->num_pub);
++			} else {
++			vr_report(r, ids[CK_PUB], VR_PASS,
++				  "SRK table matches the %d --pub key(s)",
++				  r->num_pub);
++		}
++	} else {
++		vr_report(r, ids[CK_PUB], VR_SKIP, "no --pub given");
++	}
++
++	return bad ? -1 : 0;
++}
++
++int vr_check_signature(struct verify_req *r, const char *id,
++		       const uint8_t *hash, const uint8_t *sig,
++		       uint32_t sign_len, const struct vr_key *key,
++		       const char *what)
++{
++	memcpy(r->img_hash, hash, VR_HASH_LEN);
++	r->img_hash_set =3D 1;
++	if (crypto_rsa_verify(hash, VR_HASH_LEN, sig, sign_len, key->modulus,
++			      key->exponent, key->mod_len) !=3D SUCCESS) {
++		vr_report(r, id, VR_FAIL,
++			  "signature does not verify with SRK %d over %s",
++			  key->index, what);
++		return -1;
++	}
++	vr_report(r, id, VR_PASS, "signature verifies with SRK %d over %s",
++		  key->index, what);
++	return 0;
++}
++
++void vr_report_flags(struct verify_req *r, const char *id,
++		     const struct csf_hdr_view *h)
++{
++	vr_report(r, id, VR_INFO,
++		  "misc flags 0x%02x (LW=3D%d B01=3D%d ISS=3D%d MP=3D%d IE=3D%d) UID fl=
ags 0x%02x (FUID=3D%d OID=3D%d%d%d%d%d)",
++		  h->misc_flags, !!(h->misc_flags & 0x80),
++		  !!(h->misc_flags & 0x40), !!(h->misc_flags & 0x20),
++		  !!(h->misc_flags & 0x10), !!(h->misc_flags & 0x01),
++		  h->uid_flags, !!(h->uid_flags & 0x80), !!(h->uid_flags & 0x40),
++		  !!(h->uid_flags & 0x20), !!(h->uid_flags & 0x10),
++		  !!(h->uid_flags & 0x08), !!(h->uid_flags & 0x04));
++}
+diff --git a/tools/verification/verify_esbc_ta_3_x.c b/tools/verification/=
verify_esbc_ta_3_x.c
+new file mode 100644
+index 0000000..1cf7b4d
+--- /dev/null
++++ b/tools/verification/verify_esbc_ta_3_x.c
+@@ -0,0 +1,199 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <stdio.h>
++#include <string.h>
++
++#include <verify.h>
++#include <crypto_utils.h>
++
++/************************************************************************=
***
++ * Function	:	esbc_locate
++ * Description	:	Select the header buffer and the image of an ESBC
++ *			request, from --in (header followed by the image) or
++ *			from --hdr and --img
++ ************************************************************************=
***/
++static int esbc_locate(struct verify_req *r, const uint8_t **hdr,
++		       size_t *hdr_len, const char **hdr_name)
++{
++	if (r->in.data) {
++		*hdr =3D r->in.data;
++		*hdr_len =3D r->in.len;
++		*hdr_name =3D r->in.name;
++	} else if (r->hdr.data) {
++		*hdr =3D r->hdr.data;
++		*hdr_len =3D r->hdr.len;
++		*hdr_name =3D r->hdr.name;
++	} else {
++		fprintf(stderr, "cst_verify: esbc needs --in or --hdr\n");
++		return -1;
++	}
++	if (*hdr_len < VR_CSF_HDR_SIZE) {
++		fprintf(stderr, "cst_verify: %s: %zu bytes, shorter than a CSF header\n=
",
++			*hdr_name, *hdr_len);
++		return -1;
++	}
++	return 0;
++}
++
++static void esbc_dump(struct verify_req *r, const char *name,
++		      const uint8_t *buf, size_t len,
++		      const struct csf_hdr_view *h)
++{
++	struct srk_view srk;
++
++	printf("ESBC header %s (%zu bytes)\n", name, len);
++	csf_dump_hdr(h);
++	if (srk_view_init(&srk, buf, len, h->srk_tbl_off, h->num_srk) =3D=3D 0)
++		srk_dump(&srk);
++	else
++		printf("  SRK table outside the file\n");
++	if (r->in.data && h->img_len <=3D len)
++		printf("  image             : last 0x%x bytes, at offset 0x%zx\n",
++		       h->img_len, len - h->img_len);
++	else if (r->num_img)
++		printf("  image             : %s (%zu bytes)\n", r->img[0].name,
++		       r->img[0].len);
++}
++
++static const char *const esbc_ids[CK_MAX] =3D {
++	[CK_BARKER] =3D "E1",
++	[CK_NUM_SRK] =3D "E2",
++	[CK_SRK_SEL] =3D "E3",
++	[CK_REVOKED] =3D "E4",
++	[CK_KEY_LEN] =3D "E5",
++	[CK_SIGN_LEN] =3D "E6",
++	[CK_SIG_LT_MOD] =3D "E7",
++	[CK_SRKH] =3D "E8",
++	[CK_SIGNATURE] =3D "E9",
++	[CK_BOUNDS] =3D "E10",
++	[CK_MODULUS] =3D "E11",
++	[CK_PUB] =3D "E12",
++};
++
++/************************************************************************=
***
++ * Function	:	esbc_verify
++ * Description	:	Replay the checks of TF-A validate_esbc_header() and
++ *			calc_img_hash() on an ESBC header and its image
++ ************************************************************************=
***/
++static void esbc_verify(struct verify_req *r, const uint8_t *buf, size_t =
len,
++			const struct csf_hdr_view *h)
++{
++	struct srk_view srk;
++	struct vr_key key;
++	const uint8_t *img;
++	uint64_t img_off, hdr_end;
++	uint8_t ctx[CRYPTO_HASH_CTX_SIZE];
++	uint8_t hash[VR_HASH_LEN];
++
++	vr_report(r, "E0", VR_INFO, "image address 0x%llx, image length 0x%x",
++		  (unsigned long long)h->img_addr, h->img_len);
++	vr_report_flags(r, "E0", h);
++
++	if (vr_check_barker(r, esbc_ids[CK_BARKER], h) !=3D 0)
++		return;
++	if (vr_check_srk(r, esbc_ids, h, buf, len, 0, &srk, &key) !=3D 0)
++		return;
++
++	if (h->misc_flags & 0x01) {
++		vr_report(r, "E14", VR_FAIL,
++			  "IE key extension flag set, not supported");
++		return;
++	}
++	vr_report(r, "E14", VR_PASS, "no IE key extension");
++
++	hdr_end =3D (uint64_t)h->psign + h->sign_len;
++	if (r->in.data) {
++		if (h->img_len > len || len - h->img_len < hdr_end) {
++			vr_report(r, esbc_ids[CK_BOUNDS], VR_FAIL,
++				  "image length 0x%x does not fit after the header (0x%llx bytes) in =
the %zu byte file",
++				  h->img_len, (unsigned long long)hdr_end, len);
++			return;
++		}
++		img_off =3D len - h->img_len;
++		img =3D buf + img_off;
++		vr_report(r, esbc_ids[CK_BOUNDS], VR_PASS,
++			  "image of 0x%x bytes at offset 0x%llx", h->img_len,
++			  (unsigned long long)img_off);
++		if (r->hdr_size =3D=3D 0)
++			vr_report(r, "E13", VR_SKIP, "--hdr-size 0, image offset not checked");
++		else if (img_off !=3D r->hdr_size)
++			vr_report(r, "E13", VR_FAIL,
++				  "image at offset 0x%llx, BL2 hashes from 0x%x (CSF_HDR_SZ)",
++				  (unsigned long long)img_off, r->hdr_size);
++		else
++			vr_report(r, "E13", VR_PASS,
++				  "image offset 0x%llx matches CSF_HDR_SZ",
++				  (unsigned long long)img_off);
++	} else {
++		if (r->num_img !=3D 1) {
++			vr_report(r, esbc_ids[CK_BOUNDS], VR_FAIL,
++				  "esbc --hdr needs exactly one --img, %d given",
++				  r->num_img);
++			return;
++		}
++		if (r->img[0].len !=3D h->img_len) {
++			vr_report(r, esbc_ids[CK_BOUNDS], VR_FAIL,
++				  "image length field 0x%x, %s is 0x%zx bytes",
++				  h->img_len, r->img[0].name, r->img[0].len);
++			return;
++		}
++		img =3D r->img[0].data;
++		vr_report(r, esbc_ids[CK_BOUNDS], VR_PASS,
++			  "image %s matches the image length 0x%x",
++			  r->img[0].name, h->img_len);
++		vr_report(r, "E13", VR_SKIP, "image given separately");
++	}
++
++	crypto_hash_init(ctx);
++	crypto_hash_update(ctx, (void *)buf, VR_CSF_HDR_SIZE);
++	crypto_hash_update(ctx, (void *)srk.tbl, srk.len);
++	crypto_hash_update(ctx, (void *)img, h->img_len);
++	crypto_hash_final(hash, ctx);
++	vr_check_signature(r, esbc_ids[CK_SIGNATURE], hash, buf + h->psign,
++			   h->sign_len, &key, "header, SRK table and image");
++}
++
++int verify_esbc_ta_3_x(struct verify_req *r, int ta30)
++{
++	const uint8_t *buf;
++	size_t len;
++	const char *name;
++	struct csf_hdr_view h;
++
++	if (esbc_locate(r, &buf, &len, &name) !=3D 0)
++		return FAILURE;
++	csf_parse_hdr(buf, len, CSF_ESBC, ta30, &h);
++
++	if (r->dump) {
++		esbc_dump(r, name, buf, len, &h);
++		return SUCCESS;
++	}
++
++	esbc_verify(r, buf, len, &h);
++	return SUCCESS;
++}
+diff --git a/tools/verification/verify_isbc_ta_3_x.c b/tools/verification/=
verify_isbc_ta_3_x.c
+new file mode 100644
+index 0000000..2f73836
+--- /dev/null
++++ b/tools/verification/verify_isbc_ta_3_x.c
+@@ -0,0 +1,219 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <stdio.h>
++#include <string.h>
++
++#include <verify.h>
++#include <crypto_utils.h>
++
++static void isbc_dump(const char *name, const uint8_t *buf, size_t len,
++		      int ta30, const struct csf_hdr_view *h,
++		      const struct verify_blob *img, int num_img)
++{
++	struct srk_view srk;
++	struct sg_entry_view sg[VR_MAX_IMG];
++	int i;
++
++	printf("ISBC header %s (%zu bytes)\n", name, len);
++	csf_dump_hdr(h);
++	if (srk_view_init(&srk, buf, len, h->srk_tbl_off, h->num_srk) =3D=3D 0)
++		srk_dump(&srk);
++	else
++		printf("  SRK table outside the file\n");
++	if (sg_parse(buf, len, h->sg_off, h->sg_entries, ta30, sg) =3D=3D 0)
++		sg_dump(sg, h->sg_entries);
++	else
++		printf("  SG table outside the file\n");
++	for (i =3D 0; i < num_img; i++)
++		printf("  image %d           : %s (%zu bytes)\n", i + 1,
++		       img[i].name, img[i].len);
++}
++
++static const char *const isbc_ids[CK_MAX] =3D {
++	[CK_BARKER] =3D "I1",
++	[CK_NUM_SRK] =3D "I2",
++	[CK_SRK_SEL] =3D "I3",
++	[CK_REVOKED] =3D "I11",
++	[CK_KEY_LEN] =3D "I4",
++	[CK_SIGN_LEN] =3D "I4",
++	[CK_SIG_LT_MOD] =3D "I4",
++	[CK_SRKH] =3D "I5",
++	[CK_SIGNATURE] =3D "I7",
++	[CK_BOUNDS] =3D "I10",
++	[CK_MODULUS] =3D "I13",
++	[CK_PUB] =3D "I12",
++};
++
++/************************************************************************=
***
++ * Function	:	verify_isbc_buffers
++ * Arguments	:	what - where the header comes from, for messages
++ *			hdr, hdr_len - header, SRK table, SG table, signature
++ *			img, num_img - the images, one per SG entry, in order
++ * Return	:	0 when every check ran, -1 when a check stopped them
++ * Description	:	Replay the BootROM validation of a Boot1 (ISBC) header
++ ************************************************************************=
***/
++int verify_isbc_buffers(struct verify_req *r, int ta30, const char *what,
++			const uint8_t *hdr, size_t hdr_len,
++			const struct verify_blob *img, int num_img,
++			struct csf_hdr_view *out_hdr, struct srk_view *out_srk,
++			struct sg_entry_view *out_sg)
++{
++	struct csf_hdr_view h;
++	struct srk_view srk;
++	struct vr_key key;
++	struct sg_entry_view sg[VR_MAX_IMG];
++	uint8_t ctx[CRYPTO_HASH_CTX_SIZE];
++	uint8_t hash[VR_HASH_LEN];
++	uint32_t i;
++	int bad =3D 0, ep_in =3D -1;
++
++	if (csf_parse_hdr(hdr, hdr_len, CSF_ISBC, ta30, &h) !=3D 0) {
++		vr_report(r, isbc_ids[CK_BOUNDS], VR_FAIL,
++			  "%s: %zu bytes, shorter than a CSF header", what,
++			  hdr_len);
++		return -1;
++	}
++	if (out_hdr)
++		*out_hdr =3D h;
++	vr_report(r, "I0", VR_INFO, "entry point 0x%llx, %u SG entries",
++		  (unsigned long long)h.entry_point, h.sg_entries);
++	vr_report_flags(r, "I0", &h);
++
++	if (vr_check_barker(r, isbc_ids[CK_BARKER], &h) !=3D 0)
++		return -1;
++	if (vr_check_srk(r, isbc_ids, &h, hdr, hdr_len, 0, &srk, &key) !=3D 0)
++		return -1;
++	if (out_srk)
++		*out_srk =3D srk;
++
++	if ((h.misc_flags & 0x40) =3D=3D 0) {
++		vr_report(r, "I9", VR_FAIL,
++			  "B01 flag clear, the BootROM expects it set in a Boot1 header");
++		return -1;
++	}
++	if (h.misc_flags & 0x01) {
++		vr_report(r, "I9", VR_FAIL,
++			  "IE key extension flag set, not supported");
++		return -1;
++	}
++	vr_report(r, "I9", VR_PASS, "B01 flag set, no IE key extension");
++
++	if (h.sg_entries =3D=3D 0 || h.sg_entries > VR_MAX_IMG) {
++		vr_report(r, "I6", VR_FAIL, "%u SG entries, allowed 1 to %d",
++			  h.sg_entries, VR_MAX_IMG);
++		return -1;
++	}
++	if (sg_parse(hdr, hdr_len, h.sg_off, h.sg_entries, ta30, sg) !=3D 0) {
++		vr_report(r, "I6", VR_FAIL,
++			  "SG table at 0x%x + %u * %zu bytes is outside %s (%zu bytes)",
++			  h.sg_off, h.sg_entries, VR_SG_ENTRY_SIZE, what,
++			  hdr_len);
++		return -1;
++	}
++	vr_report(r, "I6", VR_PASS, "%u SG entries at 0x%x", h.sg_entries,
++		  h.sg_off);
++	if (out_sg)
++		memcpy(out_sg, sg, sizeof(sg));
++
++	if ((uint32_t)num_img !=3D h.sg_entries) {
++		vr_report(r, isbc_ids[CK_BOUNDS], VR_FAIL,
++			  "%d image(s) for %u SG entries", num_img, h.sg_entries);
++		return -1;
++	}
++	for (i =3D 0; i < h.sg_entries; i++) {
++		if (img[i].len !=3D sg[i].len) {
++			vr_report(r, isbc_ids[CK_BOUNDS], VR_FAIL,
++				  "SG %u length 0x%x, %s is 0x%zx bytes", i + 1,
++				  sg[i].len, img[i].name, img[i].len);
++			bad =3D 1;
++		}
++	}
++	if (bad)
++		return -1;
++	vr_report(r, isbc_ids[CK_BOUNDS], VR_PASS,
++		  "image sizes match the SG table");
++
++	crypto_hash_init(ctx);
++	crypto_hash_update(ctx, (void *)hdr, VR_CSF_HDR_SIZE);
++	crypto_hash_update(ctx, (void *)srk.tbl, srk.len);
++	crypto_hash_update(ctx, (void *)(hdr + h.sg_off),
++			   h.sg_entries * VR_SG_ENTRY_SIZE);
++	for (i =3D 0; i < h.sg_entries; i++)
++		crypto_hash_update(ctx, img[i].data, img[i].len);
++	crypto_hash_final(hash, ctx);
++	if (vr_check_signature(r, isbc_ids[CK_SIGNATURE], hash, hdr + h.psign,
++			       h.sign_len, &key,
++			       "header, SRK table, SG table and images") !=3D 0)
++		bad =3D 1;
++
++	for (i =3D 0; i < h.sg_entries; i++) {
++		if (h.entry_point >=3D sg[i].src &&
++		    h.entry_point - sg[i].src < sg[i].len)
++			ep_in =3D i + 1;
++	}
++	if (ep_in < 0) {
++		vr_report(r, "I8", VR_FAIL,
++			  "entry point 0x%llx is outside every SG region",
++			  (unsigned long long)h.entry_point);
++		bad =3D 1;
++	} else {
++		vr_report(r, "I8", VR_PASS, "entry point 0x%llx inside SG %d",
++			  (unsigned long long)h.entry_point, ep_in);
++	}
++	return bad ? -1 : 0;
++}
++
++int verify_isbc_ta_3_x(struct verify_req *r, int ta30)
++{
++	struct csf_hdr_view h;
++
++	if (r->hdr.data =3D=3D NULL) {
++		fprintf(stderr, "cst_verify: isbc needs --hdr\n");
++		return FAILURE;
++	}
++	if (r->hdr.len < VR_CSF_HDR_SIZE) {
++		fprintf(stderr, "cst_verify: %s: %zu bytes, shorter than a CSF header\n=
",
++			r->hdr.name, r->hdr.len);
++		return FAILURE;
++	}
++	csf_parse_hdr(r->hdr.data, r->hdr.len, CSF_ISBC, ta30, &h);
++
++	if (r->dump) {
++		isbc_dump(r->hdr.name, r->hdr.data, r->hdr.len, ta30, &h,
++			  r->img, r->num_img);
++		return SUCCESS;
++	}
++
++	if (r->num_img =3D=3D 0) {
++		fprintf(stderr, "cst_verify: isbc needs one --img per SG entry\n");
++		return FAILURE;
++	}
++	verify_isbc_buffers(r, ta30, r->hdr.name, r->hdr.data, r->hdr.len,
++			    r->img, r->num_img, NULL, NULL, NULL);
++	return SUCCESS;
++}
+diff --git a/tools/verification/verify_ta_3_x.c b/tools/verification/verif=
y_ta_3_x.c
+new file mode 100644
+index 0000000..eda7cf7
+--- /dev/null
++++ b/tools/verification/verify_ta_3_x.c
+@@ -0,0 +1,52 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <stdio.h>
++
++#include <verify.h>
++#include <ta_3_x.h>
++
++static int verify_ta_3_x(struct verify_req *r, int ta30)
++{
++	switch (r->mode) {
++	case VERIFY_ESBC:
++		return verify_esbc_ta_3_x(r, ta30);
++	case VERIFY_ISBC:
++		return verify_isbc_ta_3_x(r, ta30);
++	}
++	return FAILURE;
++}
++
++int verify_ta_3_0(struct verify_req *r)
++{
++	return verify_ta_3_x(r, 1);
++}
++
++int verify_ta_3_1(struct verify_req *r)
++{
++	return verify_ta_3_x(r, 0);
++}
+-- =

+2.53.0
+
diff --git a/package/qoriq-cst/0006-verify-add-the-pbi-and-pbl-modes-over-l=
ibqoriq-rcw.patch b/package/qoriq-cst/0006-verify-add-the-pbi-and-pbl-modes=
-over-libqoriq-rcw.patch
new file mode 100644
index 0000000000..5824e0108d
--- /dev/null
+++ b/package/qoriq-cst/0006-verify-add-the-pbi-and-pbl-modes-over-libqoriq=
-rcw.patch
@@ -0,0 +1,1293 @@
+From 77637933c260210512911029d51b42b80fe883ea Mon Sep 17 00:00:00 2001
+From: Vincent <vjardin@free.fr>
+Date: Sun, 25 Oct 2026 16:22:47 +0100
+Subject: [PATCH] verify: add the pbi and pbl modes over libqoriq-rcw
+
+A la BootROM's way, let's add a pbi check.
+
+New arguments:
+  cst_verify pbi  --pbl <pbl>                    RCW and signed PBI comman=
ds
+  cst_verify pbl  --pbl <pbl> --flash-base <a>   whole PBL: the PBI, the b=
lock
+                                                 copies it performs, the B=
oot1
+                                                 header they put in memory
+                     --xip-window <base>:<size>  boot device window of the=
 pbl mode,
+		                                 the PBL at --flash-base by default
+
+cst_verify decodes the RCW and the PBI commands with libqoriq-rcw
+(https://github.com/vjardin/libqoriq-rcw) 1.4.0 or later and is built only
+when pkg-config finds it. rcw_pbl_verify() walks the PBI as the BootROM
+executes it, jumps followed, and judges the envelope, the checksum, the
+PBI length and the CRC; cst_verify reports that verdict as P1, P4, P5 and =
P6,
+collects the commands executed for the pbl mode, and dumps them as .pbi
+source lines with rcw_pbi_to_source().
+
+New checks:
+
+PBI (BootROM PBI validation):
+  P1  RCW preamble, load command, checksum, PBI length
+  P2  load security header first, header parsed, B01 clear
+  P3  signature over the PBI words and the SRK table
+  P4  PBI CRC when the stop command carries one
+  P5  a stop or CRC and stop at the PBI length; an earlier stop ends
+      execution and leaves a development buffer the BootROM never reads
+      (RM 8.2.6)
+  P6  every PBI command executed decoded with libqoriq-rcw (an unknown
+      or reserved command fails)
+  P7  SRK table hash              P10 key not in --revoke-mask
+  P8  SRK table equals --pub keys P11 SRK table and signature inside the f=
ile,
+  P9  key and signature lengths       outside the PBI words
+
+PBL (what the BootROM does with the PBL on the boot device):
+  X1  the PBI verifies
+  X2  the block copies read inside the PBL file, but for copies from
+      memory (source type 0), whose destination content is unknown;
+      a conditional jump leaves the path to the hardware and fails
+  X3  the Boot1 CSF header pointer designates written memory
+  X4  the Boot1 header verifies against that memory (I checks)
+  X5  every SG region is written by a block copy or lies in the device win=
dow
+  X6  the entry point is inside a written SG region
+  X7  the PBI and Boot1 headers carry the same SRK table
+
+Example, a TF-A build for LX2160A booting from FlexSPI NOR:
+  cst_verify pbl --pbl bl2_flexspi_nor_sec.pbl --flash-base 0x20000000 --p=
ub srk.pub
+  cst_verify esbc --in bl31.bin.cst --pub srk.pub
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/nxp-qoriq/cst/pull/11/commits/77637933c260210=
512911029d51b42b80fe883ea
+Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
+---
+ Makefile                               |  19 +-
+ tools/verification/cst_verify.c        |  42 ++-
+ tools/verification/include/verify.h    |  43 ++-
+ tools/verification/verify_common.c     |   4 +
+ tools/verification/verify_pbi_ta_3_x.c | 465 ++++++++++++++++++++++++
+ tools/verification/verify_pbl_ta_3_x.c | 479 +++++++++++++++++++++++++
+ tools/verification/verify_ta_3_x.c     |   4 +
+ 7 files changed, 1048 insertions(+), 8 deletions(-)
+ create mode 100644 tools/verification/verify_pbi_ta_3_x.c
+ create mode 100644 tools/verification/verify_pbl_ta_3_x.c
+
+diff --git a/Makefile b/Makefile
+index d41f6b9..0992b8f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -35,6 +35,17 @@ endif
+ LIBS +=3D -lssl -lcrypto -ldl
+ JSON_LIBS ?=3D -ljson-c
+ =

++RCW_PKG ?=3D libqoriq-rcw
++RCW_MIN_VERSION ?=3D 1.4.0
++HAVE_RCW :=3D $(shell pkg-config --atleast-version=3D$(RCW_MIN_VERSION) $=
(RCW_PKG) 2>/dev/null && echo yes)
++ifeq ($(HAVE_RCW),yes)
++RCW_CFLAGS ?=3D $(shell pkg-config --cflags $(RCW_PKG))
++RCW_LIBS ?=3D $(shell pkg-config --libs $(RCW_PKG))
++VERIFY_BINARIES =3D cst_verify
++else
++$(info $(RCW_PKG) >=3D $(RCW_MIN_VERSION) not found by pkg-config, cst_ve=
rify is not built)
++endif
++
+ genkeys_OBJS =3D gen_keys.o
+ genotpmk_OBJS =3D gen_otpmk_drbg.o
+ gendrv_OBJS =3D gen_drv_drbg.o
+@@ -118,13 +129,13 @@ INCLUDES =3D 	-Itools/header_generation/create_hdr_i=
sbc/include/ \
+ 		-Itaal/include -Icommon/include \
+ 		-I$(LIB_HASH_DRBG_INCLUDE_PATH)
+ =

+-CCFLAGS=3D -g -Wall -Wno-strict-aliasing -Werror $(INCLUDES)
++CCFLAGS=3D -g -Wall -Wno-strict-aliasing -Werror $(INCLUDES) $(RCW_CFLAGS)
+ =

+ INSTALL_BINARIES =3D 	create_hdr_isbc create_hdr_esbc \
+ 			create_hdr_pbi create_hdr_cf \
+ 			gen_keys gen_otpmk_drbg gen_drv_drbg \
+ 			gen_sign sign_embed gen_fusescr \
+-			cst_verify \
++			$(VERIFY_BINARIES)
+ =

+ # targets that are not files
+ .PHONY: all clean
+@@ -170,7 +181,7 @@ gen_fusescr: ${gen_fusescr_OBJS}
+ 	${LD} ${LDFLAGS} -o $@ $^ ${LIBS}
+ =

+ cst_verify: ${cst_verify_OBJS}
+-	${LD} ${LDFLAGS} -o $@ $^ ${LIBS} ${JSON_LIBS}
++	${LD} ${LDFLAGS} -o $@ $^ ${LIBS} ${JSON_LIBS} ${RCW_LIBS}
+ =

+ $(LIB_HASH_DRBG):
+ 	@echo "#########################################"
+@@ -195,7 +206,7 @@ install-%: %
+ 	$(INSTALL) -m 755 $< $(DESTDIR)$(BIN_DEST_DIR)/cst/
+ =

+ clean:
+-	${RM} *.o ${INSTALL_BINARIES}
++	${RM} *.o ${INSTALL_BINARIES} cst_verify
+ =

+ distclean:	clean
+ 	${RM} *.pub *.pri $(LIB_HASH_DRBG)
+diff --git a/tools/verification/cst_verify.c b/tools/verification/cst_veri=
fy.c
+index 2068db4..148c423 100644
+--- a/tools/verification/cst_verify.c
++++ b/tools/verification/cst_verify.c
+@@ -39,6 +39,9 @@ enum {
+ 	OPT_HDR =3D 256,
+ 	OPT_IMG,
+ 	OPT_IN,
++	OPT_PBL,
++	OPT_FLASH_BASE,
++	OPT_XIP_WINDOW,
+ 	OPT_HDR_SIZE,
+ 	OPT_PLATFORM,
+ 	OPT_TA,
+@@ -52,6 +55,9 @@ static const struct option long_options[] =3D {
+ 	{"hdr", required_argument, 0, OPT_HDR},
+ 	{"img", required_argument, 0, OPT_IMG},
+ 	{"in", required_argument, 0, OPT_IN},
++	{"pbl", required_argument, 0, OPT_PBL},
++	{"flash-base", required_argument, 0, OPT_FLASH_BASE},
++	{"xip-window", required_argument, 0, OPT_XIP_WINDOW},
+ 	{"hdr-size", required_argument, 0, OPT_HDR_SIZE},
+ 	{"platform", required_argument, 0, OPT_PLATFORM},
+ 	{"ta", required_argument, 0, OPT_TA},
+@@ -70,9 +76,11 @@ static void print_usage(void)
+ 	       "  cst_verify esbc --hdr <hdr> --img <image> [common]\n"
+ 	       "  cst_verify esbc --in <image with prepended header> [common]\n"
+ 	       "  cst_verify isbc --hdr <hdr_bl2> --img <img1> [--img <img2> ...=
] [common]\n"
+-	       "  cst_verify dump <esbc|isbc> <same arguments>\n"
++	       "  cst_verify pbi  --pbl <pbl> [common]\n"
++	       "  cst_verify pbl  --pbl <pbl> --flash-base <addr> [--xip-window =
<base>:<size>] [common]\n"
++	       "  cst_verify dump <esbc|isbc|pbi|pbl> <same arguments>\n"
+ 	       "\n"
+-	       "Verify the CSF headers and images produced by CST for the\n"
++	       "Verify the CSF headers, PBI and images produced by CST for the\n"
+ 	       "trust architecture 3.x BootROM and TF-A BL2, from the output\n"
+ 	       "files only.\n"
+ 	       "\n"
+@@ -96,6 +104,10 @@ static int parse_mode(const char *s, enum verify_mode =
*m)
+ 		*m =3D VERIFY_ESBC;
+ 	else if (strcmp(s, "isbc") =3D=3D 0)
+ 		*m =3D VERIFY_ISBC;
++	else if (strcmp(s, "pbi") =3D=3D 0)
++		*m =3D VERIFY_PBI;
++	else if (strcmp(s, "pbl") =3D=3D 0)
++		*m =3D VERIFY_PBL;
+ 	else
+ 		return -1;
+ 	return 0;
+@@ -134,6 +146,20 @@ static int parse_pub(struct verify_req *r, char *list)
+ 	return r->num_pub ? 0 : -1;
+ }
+ =

++static int parse_xip(struct verify_req *r, char *arg)
++{
++	char *colon =3D strchr(arg, ':');
++
++	if (colon =3D=3D NULL)
++		return -1;
++	*colon =3D '\0';
++	if (vr_parse_u64(arg, &r->xip_base) !=3D 0 ||
++	    vr_parse_u64(colon + 1, &r->xip_size) !=3D 0)
++		return -1;
++	r->xip_set =3D 1;
++	return 0;
++}
++
+ static void free_req(struct verify_req *r)
+ {
+ 	int i;
+@@ -171,7 +197,7 @@ int main(int argc, char **argv)
+ 		optind =3D 2;
+ 	}
+ 	if (optind >=3D argc || parse_mode(argv[optind], &r.mode) !=3D 0) {
+-		fprintf(stderr, "cst_verify: expected esbc or isbc\n");
++		fprintf(stderr, "cst_verify: expected esbc, isbc, pbi or pbl\n");
+ 		return VR_EXIT_ERROR;
+ 	}
+ 	optind++;
+@@ -190,8 +216,18 @@ int main(int argc, char **argv)
+ 			img_name[num_img++] =3D optarg;
+ 			break;
+ 		case OPT_IN:
++		case OPT_PBL:
+ 			in_name =3D optarg;
+ 			break;
++		case OPT_FLASH_BASE:
++			if (vr_parse_u64(optarg, &r.flash_base) !=3D 0)
++				goto bad_arg;
++			r.flash_base_set =3D 1;
++			break;
++		case OPT_XIP_WINDOW:
++			if (parse_xip(&r, optarg) !=3D 0)
++				goto bad_arg;
++			break;
+ 		case OPT_HDR_SIZE:
+ 			if (vr_parse_u64(optarg, &v) !=3D 0 || v > 0xffffffffULL)
+ 				goto bad_arg;
+diff --git a/tools/verification/include/verify.h b/tools/verification/incl=
ude/verify.h
+index ba56e74..01f857e 100644
+--- a/tools/verification/include/verify.h
++++ b/tools/verification/include/verify.h
+@@ -32,6 +32,7 @@
+ #include <stddef.h>
+ #include <global.h>
+ #include <taal.h>
++#include <qoriq-rcw/rcw.h>
+ =

+ #define VR_CSF_HDR_SIZE		0x50
+ #define VR_SRK_ENTRY_SIZE	(sizeof(struct srk_table_t))
+@@ -50,6 +51,8 @@
+ enum verify_mode {
+ 	VERIFY_ESBC,
+ 	VERIFY_ISBC,
++	VERIFY_PBI,
++	VERIFY_PBL,
+ };
+ =

+ enum vr_status {
+@@ -84,6 +87,11 @@ struct verify_req {
+ 	struct verify_blob img[VR_MAX_IMG];
+ 	int num_img;
+ =

++	int flash_base_set;
++	uint64_t flash_base;
++	int xip_set;
++	uint64_t xip_base;
++	uint64_t xip_size;
+ 	uint32_t hdr_size;
+ =

+ 	int srk_hash_set;
+@@ -205,7 +213,7 @@ int vr_check_signature(struct verify_req *r, const cha=
r *id,
+ void vr_report_flags(struct verify_req *r, const char *id,
+ 		     const struct csf_hdr_view *h);
+ =

+-/* verify_esbc_ta_3_x.c, verify_isbc_ta_3_x.c */
++/* verify_esbc_ta_3_x.c, verify_isbc_ta_3_x.c, verify_pbi_ta_3_x.c */
+ int verify_esbc_ta_3_x(struct verify_req *r, int ta30);
+ int verify_isbc_ta_3_x(struct verify_req *r, int ta30);
+ int verify_isbc_buffers(struct verify_req *r, int ta30, const char *what,
+@@ -213,5 +221,38 @@ int verify_isbc_buffers(struct verify_req *r, int ta3=
0, const char *what,
+ 			const struct verify_blob *img, int num_img,
+ 			struct csf_hdr_view *out_hdr, struct srk_view *out_srk,
+ 			struct sg_entry_view *out_sg);
++int verify_pbi_ta_3_x(struct verify_req *r, int ta30);
++int verify_pbl_ta_3_x(struct verify_req *r, int ta30);
++
++/* PBI command stream of the TA 3.x service processor, as libqoriq-rcw wa=
lks it */
++struct pbi_cmd {
++	uint32_t idx;
++	uint32_t word;
++	rcw_pbi_op_t op;
++	uint32_t nargs;
++	uint32_t arg[3];
++};
++
++struct pbi_view {
++	rcw_pbl_report_t rep;
++	struct pbi_cmd *cmds;
++	int ncmd;
++	int cap;
++	int oom;
++	int sec_hdr_idx;
++	int csf_ptr_set;
++	uint32_t csf_ptr;
++	int stop_idx;
++	int nblk;
++};
++
++int pbi_decode(const uint8_t *buf, size_t len, struct pbi_view *v);
++void pbi_free(struct pbi_view *v);
++void pbi_dump(const uint8_t *buf, size_t len, const struct pbi_view *v);
++int pbi_parse_sec_hdr(const uint8_t *buf, size_t len, const struct pbi_vi=
ew *v,
++		      int ta30, struct csf_hdr_view *h, uint64_t *hdr_off);
++int verify_pbi_stream(struct verify_req *r, int ta30, const uint8_t *buf,
++		      size_t len, struct pbi_view *v, struct csf_hdr_view *h,
++		      struct srk_view *srk);
+ =

+ #endif
+diff --git a/tools/verification/verify_common.c b/tools/verification/verif=
y_common.c
+index f996093..6fc4d88 100644
+--- a/tools/verification/verify_common.c
++++ b/tools/verification/verify_common.c
+@@ -200,6 +200,10 @@ static const char *mode_name(enum verify_mode m)
+ 		return "esbc";
+ 	case VERIFY_ISBC:
+ 		return "isbc";
++	case VERIFY_PBI:
++		return "pbi";
++	case VERIFY_PBL:
++		return "pbl";
+ 	}
+ 	return "?";
+ }
+diff --git a/tools/verification/verify_pbi_ta_3_x.c b/tools/verification/v=
erify_pbi_ta_3_x.c
+new file mode 100644
+index 0000000..ec30bb8
+--- /dev/null
++++ b/tools/verification/verify_pbi_ta_3_x.c
+@@ -0,0 +1,465 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <verify.h>
++#include <crypto_utils.h>
++
++#define RCW_WORDS		(RCW_PBL_PBI_OFFSET / 4)
++#define PBI_START		RCW_PBL_PBI_OFFSET
++
++static const char *stop_name(rcw_pbi_op_t op)
++{
++	return op =3D=3D RCW_PBI_CRC_STOP ? "CRC and stop" : "stop";
++}
++
++static void pbi_visit(const rcw_pbi_cmd_t *rc, size_t off, void *arg)
++{
++	struct pbi_view *v =3D arg;
++	struct pbi_cmd *c;
++	uint32_t k;
++
++	if (v->oom)
++		return;
++	if (v->ncmd =3D=3D v->cap) {
++		int cap =3D v->cap ? 2 * v->cap : 64;
++		struct pbi_cmd *p =3D realloc(v->cmds, cap * sizeof(*p));
++
++		if (p =3D=3D NULL) {
++			v->oom =3D 1;
++			return;
++		}
++		v->cmds =3D p;
++		v->cap =3D cap;
++	}
++	c =3D &v->cmds[v->ncmd++];
++	memset(c, 0, sizeof(*c));
++	c->idx =3D RCW_WORDS + (uint32_t)(off / 4);
++	c->word =3D rc->word;
++	c->op =3D rc->op;
++	c->nargs =3D (uint32_t)rc->nargs;
++	for (k =3D 0; k < rc->nargs && k < 3; k++)
++		c->arg[k] =3D rc->args[k];
++
++	switch (rc->op) {
++	case RCW_PBI_LOAD_SEC_HDR:
++		if (v->sec_hdr_idx < 0)
++			v->sec_hdr_idx =3D c->idx;
++		break;
++	case RCW_PBI_LOAD_CSF_PTR:
++		v->csf_ptr_set =3D 1;
++		v->csf_ptr =3D c->arg[0];
++		break;
++	case RCW_PBI_BLOCKCOPY:
++		v->nblk++;
++		break;
++	case RCW_PBI_STOP:
++	case RCW_PBI_CRC_STOP:
++		v->stop_idx =3D c->idx;
++		break;
++	default:
++		break;
++	}
++}
++
++/************************************************************************=
***
++ * Function	:	pbi_decode
++ * Arguments	:	buf, len - the PBL file
++ * Return	:	0, or -1 when the command table cannot be allocated
++ * Description	:	libqoriq-rcw reads the RCW envelope and walks the PBI
++ *			commands the BootROM executes: v->rep is its verdict,
++ *			v->cmds the commands walked
++ ************************************************************************=
***/
++int pbi_decode(const uint8_t *buf, size_t len, struct pbi_view *v)
++{
++	memset(v, 0, sizeof(*v));
++	v->sec_hdr_idx =3D -1;
++	v->stop_idx =3D -1;
++	rcw_pbl_verify(buf, len, 1, pbi_visit, v, &v->rep);
++	return v->oom ? -1 : 0;
++}
++
++void pbi_free(struct pbi_view *v)
++{
++	free(v->cmds);
++	v->cmds =3D NULL;
++}
++
++void pbi_dump(const uint8_t *buf, size_t len, const struct pbi_view *v)
++{
++	const rcw_pbl_report_t *rep =3D &v->rep;
++	const rcw_pbi_check_t *chk =3D &rep->chk;
++	char line[RCW_PBI_SOURCE_MAX];
++	rcw_pbi_cmd_t rc;
++	uint64_t off;
++	int i;
++
++	printf("RCW: load command 0x%08x, PBI length %u words, SB_EN %d, checksu=
m 0x%08x (computed 0x%08x)\n",
++	       rep->pbl.load_rcw_cmd, rep->pbl.pbi_length, rep->pbl.sb_en,
++	       rep->pbl.checksum, rep->pbl.checksum_computed);
++	printf("PBI commands:\n");
++	for (i =3D 0; i < v->ncmd; i++) {
++		const struct pbi_cmd *c =3D &v->cmds[i];
++
++		off =3D (uint64_t)c->idx * 4;
++		if (rcw_pbi_decode(buf + off, len - off, 1, &rc) =3D=3D RCW_OK)
++			rcw_pbi_to_source(&rc, line, sizeof(line));
++		else
++			line[0] =3D '\0';
++		printf("  word %4u: %08x %s\n", c->idx, c->word, line);
++	}
++	switch (rep->pbi) {
++	case RCW_ERR_BAD_BINARY:
++		printf("  word %4u: unknown command 0x%08x, decoding stopped\n",
++		       RCW_WORDS + (uint32_t)(chk->end / 4), chk->cmd.word);
++		break;
++	case RCW_ERR_TRUNCATED:
++		printf("  stream truncated at word %u\n",
++		       RCW_WORDS + (uint32_t)(chk->end / 4));
++		break;
++	case RCW_ERR_PBI_OVERRUN:
++		printf("  word %4u: command runs past the PBI length\n",
++		       RCW_WORDS + (uint32_t)(chk->end / 4));
++		break;
++	case RCW_ERR_PBI_LENGTH:
++		printf("  no stop command at the PBI length (word %u)\n",
++		       RCW_WORDS + (uint32_t)(chk->len / 4) - 2);
++		break;
++	case RCW_ERR_PBI_JUMP:
++	case RCW_ERR_PBI_NO_CONDITION:
++		printf("  word %4u: %s\n", RCW_WORDS + (uint32_t)(chk->end / 4),
++		       rcw_strerror(rep->pbi));
++		break;
++	case RCW_ERR_PBI_CONDITIONAL:
++		printf("  word %4u: conditional jump, the path beyond it is not walked\=
n",
++		       RCW_WORDS + (uint32_t)(chk->end / 4));
++		break;
++	default:
++		if (chk->end < chk->len)
++			printf("  words %u to %u after the stop are not executed\n",
++			       RCW_WORDS + (uint32_t)(chk->end / 4),
++			       RCW_WORDS + (uint32_t)(chk->len / 4) - 1);
++		break;
++	}
++	if (chk->stop_op =3D=3D RCW_PBI_CRC_STOP)
++		printf("  CRC 0x%08x (computed 0x%08x)\n", chk->crc, chk->crc_computed);
++}
++
++int pbi_parse_sec_hdr(const uint8_t *buf, size_t len, const struct pbi_vi=
ew *v,
++		      int ta30, struct csf_hdr_view *h, uint64_t *hdr_off)
++{
++	if (v->sec_hdr_idx < 0)
++		return -1;
++	*hdr_off =3D (uint64_t)(v->sec_hdr_idx + 1) * 4;
++	if (!vr_in_range(len, *hdr_off, VR_CSF_HDR_SIZE))
++		return -1;
++	return csf_parse_hdr(buf + *hdr_off, len - *hdr_off, CSF_PBI, ta30, h);
++}
++
++static const char *const pbi_ids[CK_MAX] =3D {
++	[CK_BARKER] =3D "P2",
++	[CK_NUM_SRK] =3D "P2",
++	[CK_SRK_SEL] =3D "P2",
++	[CK_REVOKED] =3D "P10",
++	[CK_KEY_LEN] =3D "P9",
++	[CK_SIGN_LEN] =3D "P9",
++	[CK_SIG_LT_MOD] =3D "P9",
++	[CK_SRKH] =3D "P7",
++	[CK_SIGNATURE] =3D "P3",
++	[CK_BOUNDS] =3D "P11",
++	[CK_MODULUS] =3D "P9",
++	[CK_PUB] =3D "P8",
++};
++
++/************************************************************************=
***
++ * Function	:	verify_pbi_stream
++ * Arguments	:	buf, len - the PBL file
++ *			v - decoded PBI, to be released with pbi_free()
++ *			h, srk - the PBI security header and its SRK table
++ * Return	:	0 when every check ran, -1 when a check stopped them
++ * Description	:	Replay the BootROM validation of the RCW and PBI
++ ************************************************************************=
***/
++int verify_pbi_stream(struct verify_req *r, int ta30, const uint8_t *buf,
++		      size_t len, struct pbi_view *v, struct csf_hdr_view *h,
++		      struct srk_view *srk)
++{
++	struct vr_key key;
++	const rcw_pbl_report_t *rep =3D &v->rep;
++	const rcw_pbi_check_t *chk =3D &rep->chk;
++	uint64_t hdr_off, pbi_end;
++	uint32_t i, nwrite =3D 0, nacs =3D 0, nother =3D 0, last;
++	uint8_t ctx[CRYPTO_HASH_CTX_SIZE];
++	uint8_t hash[VR_HASH_LEN];
++
++	memset(h, 0, sizeof(*h));
++	memset(srk, 0, sizeof(*srk));
++	if (pbi_decode(buf, len, v) !=3D 0) {
++		vr_report(r, "P1", VR_FAIL, "cannot allocate the command table");
++		return -1;
++	}
++	if (rep->envelope =3D=3D RCW_ERR_TRUNCATED) {
++		vr_report(r, "P1", VR_FAIL, "%zu bytes, shorter than the RCW", len);
++		return -1;
++	}
++	if (!rep->preamble_ok) {
++		vr_report(r, "P1", VR_FAIL,
++			  "RCW preamble 0x%08x, expected 0x%08x", rep->word0,
++			  RCW_PBL_PREAMBLE);
++		return -1;
++	}
++	if (!rep->load_rcw_ok) {
++		vr_report(r, "P1", VR_FAIL, "load RCW command 0x%08x unknown",
++			  rep->word1);
++		return -1;
++	}
++	if (rep->envelope !=3D RCW_OK) {
++		vr_report(r, "P1", VR_FAIL, "RCW envelope: %s",
++			  rcw_strerror(rep->envelope));
++		return -1;
++	}
++	pbi_end =3D (uint64_t)PBI_START + chk->len;
++	if (rep->pbl.pbi_length < 2 || pbi_end > len) {
++		vr_report(r, "P1", VR_FAIL,
++			  "PBI length %u words ends at 0x%llx in a %zu byte file",
++			  rep->pbl.pbi_length, (unsigned long long)pbi_end, len);
++		return -1;
++	}
++	if (rep->has_checksum && !rep->checksum_ok) {
++		vr_report(r, "P1", VR_FAIL,
++			  "RCW checksum 0x%08x, computed 0x%08x", rep->pbl.checksum,
++			  rep->pbl.checksum_computed);
++		return -1;
++	}
++	vr_report(r, "P1", VR_PASS,
++		  "RCW preamble, load command 0x%08x%s, PBI length %u words",
++		  rep->pbl.load_rcw_cmd,
++		  rep->has_checksum ? " with valid checksum" : "",
++		  rep->pbl.pbi_length);
++	vr_report(r, "P1", VR_INFO,
++		  rep->pbl.sb_en ? "SB_EN set in the RCW" :
++		  "SB_EN clear in the RCW, the BootROM verifies only when the ITS fuse =
is set");
++
++	if (rep->pbi =3D=3D RCW_ERR_BAD_BINARY) {
++		vr_report(r, "P6", VR_FAIL,
++			  "unknown or reserved PBI command 0x%08x at word %u, cannot delimit t=
he stream",
++			  chk->cmd.word, RCW_WORDS + (uint32_t)(chk->end / 4));
++		return -1;
++	}
++	if (rep->pbi =3D=3D RCW_ERR_TRUNCATED || rep->pbi =3D=3D RCW_ERR_PBI_OVE=
RRUN) {
++		vr_report(r, "P6", VR_FAIL,
++			  "PBI command at word %u runs past PBI length",
++			  RCW_WORDS + (uint32_t)(chk->end / 4));
++		return -1;
++	}
++	if (rep->pbi =3D=3D RCW_ERR_PBI_JUMP || rep->pbi =3D=3D RCW_ERR_PBI_NO_C=
ONDITION) {
++		vr_report(r, "P6", VR_FAIL, "%s at word %u: %s",
++			  rcw_pbi_op_name(chk->cmd.op),
++			  RCW_WORDS + (uint32_t)(chk->end / 4), rcw_strerror(rep->pbi));
++		return -1;
++	}
++	for (i =3D 0; i < (uint32_t)v->ncmd; i++) {
++		const struct pbi_cmd *c =3D &v->cmds[i];
++
++		switch (c->op) {
++		case RCW_PBI_CCSR_WRITE:
++			nwrite++;
++			if ((c->word & 0x0ffffff8) =3D=3D 0x01e00400)
++				vr_report(r, "P6", VR_INFO,
++					  "word %u: CCSR write 0x%08x to 0x%07x (boot location pointer)",
++					  c->idx, c->arg[0], c->word & 0x0fffffff);
++			break;
++		case RCW_PBI_ALTCFG_WRITE:
++			nacs++;
++			break;
++		case RCW_PBI_BLOCKCOPY:
++			vr_report(r, "P6", VR_INFO,
++				  "word %u: block copy type 0x%02x, 0x%x bytes from 0x%08x to 0x%08x",
++				  c->idx, c->word & 0xff, c->arg[2], c->arg[0],
++				  c->arg[1]);
++			break;
++		case RCW_PBI_LOAD_CSF_PTR:
++			vr_report(r, "P6", VR_INFO,
++				  "word %u: Boot1 CSF header pointer 0x%08x", c->idx,
++				  c->arg[0]);
++			break;
++		case RCW_PBI_JUMP:
++			nother++;
++			vr_report(r, "P6", VR_INFO,
++				  "word %u: jump forward 0x%x bytes to word %u",
++				  c->idx, c->arg[0], c->idx + c->arg[0] / 4);
++			break;
++		case RCW_PBI_JUMP_COND:
++			nother++;
++			vr_report(r, "P6", VR_INFO,
++				  "word %u: conditional jump forward 0x%x bytes to word %u when the c=
ondition is 0x%08x, the path beyond it is not walked",
++				  c->idx, c->arg[0], c->idx + c->arg[0] / 4,
++				  c->arg[1]);
++			break;
++		case RCW_PBI_LOAD_SEC_HDR:
++		case RCW_PBI_STOP:
++		case RCW_PBI_CRC_STOP:
++			break;
++		default:
++			nother++;
++			break;
++		}
++	}
++	vr_report(r, "P6", VR_PASS,
++		  "%d PBI commands decoded: %u CCSR writes, %u AltConfig writes, %d blo=
ck copies, %u others",
++		  v->ncmd, nwrite, nacs, v->nblk, nother);
++
++	last =3D RCW_WORDS + (uint32_t)((chk->len - RCW_PBL_TERMINATOR_BYTES) / =
4);
++	if (rep->pbi !=3D RCW_OK && rep->pbi !=3D RCW_ERR_PBI_CONDITIONAL) {
++		if (!rep->terminated)
++			vr_report(r, "P5", VR_FAIL,
++				  "no stop command within PBI length");
++		else
++			vr_report(r, "P5", VR_FAIL,
++				  "stop command at word %d ends execution, but the PBI length does no=
t end on a stop command (word %u)",
++				  v->stop_idx, last);
++		return -1;
++	}
++	if (rep->pbi =3D=3D RCW_OK && chk->end < chk->len)
++		vr_report(r, "P5", VR_INFO,
++			  "stop command at word %d ends execution, words %u to %u are not exec=
uted",
++			  v->stop_idx, RCW_WORDS + (uint32_t)(chk->end / 4),
++			  RCW_WORDS + (uint32_t)(chk->len / 4) - 1);
++	vr_report(r, "P5", VR_PASS, "%s command at word %u ends the PBI",
++		  stop_name(chk->stop_op), last);
++
++	if (v->sec_hdr_idx !=3D RCW_WORDS) {
++		vr_report(r, "P2", VR_FAIL,
++			  "first PBI command is %s, expected load security header",
++			  rcw_pbi_op_name(v->cmds[0].op));
++		return -1;
++	}
++	if (pbi_parse_sec_hdr(buf, len, v, ta30, h, &hdr_off) !=3D 0) {
++		vr_report(r, "P2", VR_FAIL, "security header does not fit");
++		return -1;
++	}
++	vr_report_flags(r, "P2", h);
++	if (vr_check_barker(r, pbi_ids[CK_BARKER], h) !=3D 0)
++		return -1;
++	if (h->misc_flags & 0x40) {
++		vr_report(r, "P2", VR_FAIL,
++			  "B01 flag set, the BootROM expects it clear in a PBI header");
++		return -1;
++	}
++	if (h->misc_flags & 0x01) {
++		vr_report(r, "P2", VR_FAIL,
++			  "IE key extension flag set, not supported");
++		return -1;
++	}
++	vr_report(r, "P2", VR_PASS, "load security header first, B01 clear");
++
++	if (hdr_off + h->srk_tbl_off < pbi_end ||
++	    hdr_off + h->psign < pbi_end) {
++		vr_report(r, pbi_ids[CK_BOUNDS], VR_FAIL,
++			  "SRK table or signature overlaps the PBI commands ending at 0x%llx",
++			  (unsigned long long)pbi_end);
++		return -1;
++	}
++	if (vr_check_srk(r, pbi_ids, h, buf, len, hdr_off, srk, &key) !=3D 0)
++		return -1;
++
++	if (chk->stop_op =3D=3D RCW_PBI_CRC_STOP) {
++		if (!rep->crc_ok) {
++			vr_report(r, "P4", VR_FAIL, "PBI CRC 0x%08x, computed 0x%08x",
++				  chk->crc, chk->crc_computed);
++			return -1;
++		}
++		vr_report(r, "P4", VR_PASS, "PBI CRC 0x%08x", chk->crc);
++	} else {
++		vr_report(r, "P4", VR_SKIP, "stop command without CRC");
++	}
++
++	crypto_hash_init(ctx);
++	crypto_hash_update(ctx, (void *)(buf + PBI_START), chk->len);
++	crypto_hash_update(ctx, (void *)srk->tbl, srk->len);
++	crypto_hash_final(hash, ctx);
++	return vr_check_signature(r, pbi_ids[CK_SIGNATURE], hash,
++				  buf + hdr_off + h->psign, h->sign_len, &key,
++				  "PBI commands and SRK table");
++}
++
++static void pbi_dump_all(struct verify_req *r, int ta30)
++{
++	struct pbi_view v;
++	struct csf_hdr_view h;
++	struct srk_view srk;
++	uint64_t hoff;
++
++	printf("PBL %s (%zu bytes)\n", r->in.name, r->in.len);
++	if (pbi_decode(r->in.data, r->in.len, &v) !=3D 0) {
++		printf("  cannot allocate the command table\n");
++		return;
++	}
++	if (v.rep.envelope !=3D RCW_OK) {
++		printf("  %s\n", v.rep.envelope =3D=3D RCW_ERR_TRUNCATED ?
++		       "file too short for an RCW" : !v.rep.preamble_ok ?
++		       "no RCW preamble" : "no load RCW command");
++		return;
++	}
++	pbi_dump(r->in.data, r->in.len, &v);
++	if (pbi_parse_sec_hdr(r->in.data, r->in.len, &v, ta30, &h, &hoff) =3D=3D=
 0) {
++		printf("PBI security header at 0x%llx\n",
++		       (unsigned long long)hoff);
++		csf_dump_hdr(&h);
++		if (srk_view_init(&srk, r->in.data, r->in.len,
++				  hoff + h.srk_tbl_off, h.num_srk) =3D=3D 0)
++			srk_dump(&srk);
++		else
++			printf("  SRK table outside the file\n");
++	} else {
++		printf("  no load security header command\n");
++	}
++	pbi_free(&v);
++}
++
++int verify_pbi_ta_3_x(struct verify_req *r, int ta30)
++{
++	struct pbi_view v;
++	struct csf_hdr_view h;
++	struct srk_view srk;
++
++	if (r->in.data =3D=3D NULL) {
++		fprintf(stderr, "cst_verify: pbi needs --pbl\n");
++		return FAILURE;
++	}
++
++	if (r->dump) {
++		pbi_dump_all(r, ta30);
++		return SUCCESS;
++	}
++
++	verify_pbi_stream(r, ta30, r->in.data, r->in.len, &v, &h, &srk);
++	pbi_free(&v);
++	return SUCCESS;
++}
+diff --git a/tools/verification/verify_pbl_ta_3_x.c b/tools/verification/v=
erify_pbl_ta_3_x.c
+new file mode 100644
+index 0000000..f89ad2d
+--- /dev/null
++++ b/tools/verification/verify_pbl_ta_3_x.c
+@@ -0,0 +1,479 @@
++/*
++ * Copyright 2026 Free Mobile, Vincent Jardin
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are=
 met:
++ *     * Redistributions of source code must retain the above copyright
++ *       notice, this list of conditions and the following disclaimer.
++ *     * Redistributions in binary form must reproduce the above copyright
++ *       notice, this list of conditions and the following disclaimer in =
the
++ *       documentation and/or other materials provided with the distribut=
ion.
++ *     * Neither the name of the above-listed copyright holders nor the
++ *       names of any contributors may be used to endorse or promote prod=
ucts
++ *       derived from this software without specific prior written permis=
sion.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "A=
S IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, =
THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTOR=
S BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE=
SS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF=
 THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <verify.h>
++
++#define PBL_MAX_HDR_EXTENT	0x100000
++#define PBL_COPY_FROM_MEMORY	0x00
++
++struct mem_seg {
++	uint64_t dst;
++	uint64_t size;
++	uint64_t file_off;
++	uint64_t avail;
++	uint32_t word;
++	uint32_t mem_src;
++	int from_memory;
++};
++
++struct mem_model {
++	const uint8_t *file;
++	size_t file_len;
++	struct mem_seg *seg;
++	int nseg;
++	uint64_t win_base;
++	uint64_t win_size;
++};
++
++/************************************************************************=
***
++ * Function	:	mem_source
++ * Return	:	index of the block copy that last wrote the byte,
++ *			-1 for the boot device window, -2 for nothing,
++ *			-3 for a block copy from memory
++ ************************************************************************=
***/
++static int mem_source(const struct mem_model *m, uint64_t a, uint8_t *byt=
e)
++{
++	int i;
++
++	for (i =3D m->nseg - 1; i >=3D 0; i--) {
++		const struct mem_seg *s =3D &m->seg[i];
++
++		if (a >=3D s->dst && a - s->dst < s->size) {
++			if (s->from_memory)
++				return -3;
++			if (a - s->dst >=3D s->avail)
++				return -2;
++			*byte =3D m->file[s->file_off + (a - s->dst)];
++			return i;
++		}
++	}
++	if (a >=3D m->win_base && a - m->win_base < m->win_size &&
++	    a - m->win_base < m->file_len) {
++		*byte =3D m->file[a - m->win_base];
++		return -1;
++	}
++	return -2;
++}
++
++static int mem_read(const struct mem_model *m, uint64_t addr, uint64_t n,
++		    uint8_t *out, uint64_t *missing)
++{
++	uint64_t p;
++
++	if (n > UINT64_MAX - addr) {
++		*missing =3D addr;
++		return -1;
++	}
++	for (p =3D 0; p < n; p++) {
++		if (mem_source(m, addr + p, &out[p]) < -1) {
++			*missing =3D addr + p;
++			return -1;
++		}
++	}
++	return 0;
++}
++
++static void mem_describe(const struct mem_model *m, uint64_t addr, char *=
buf,
++			 size_t buflen)
++{
++	uint8_t b;
++	int src =3D mem_source(m, addr, &b);
++
++	if (src >=3D 0)
++		snprintf(buf, buflen, "block copy at word %u from PBL offset 0x%llx",
++			 m->seg[src].word,
++			 (unsigned long long)(m->seg[src].file_off + (addr - m->seg[src].dst))=
);
++	else if (src =3D=3D -1)
++		snprintf(buf, buflen, "the boot device window at PBL offset 0x%llx",
++			 (unsigned long long)(addr - m->win_base));
++	else if (src =3D=3D -3)
++		snprintf(buf, buflen, "a block copy from memory, content unknown");
++	else
++		snprintf(buf, buflen, "nothing");
++}
++
++/************************************************************************=
***
++ * Function	:	pbl_build_model
++ * Description	:	X2: simulate the PBI block copies over the PBL file,
++ *			along the path libqoriq-rcw walked
++ ************************************************************************=
***/
++static int pbl_build_model(struct verify_req *r, const struct pbi_view *v,
++			   struct mem_model *m)
++{
++	int i, bad =3D 0, past =3D 0, nmem =3D 0;
++
++	if (v->rep.pbi =3D=3D RCW_ERR_PBI_CONDITIONAL) {
++		vr_report(r, "X2", VR_FAIL,
++			  "conditional jump at word %u: the path taken depends on hardware sta=
te, not simulated",
++			  v->ncmd ? v->cmds[v->ncmd - 1].idx : 0);
++		return -1;
++	}
++
++	m->file =3D r->in.data;
++	m->file_len =3D r->in.len;
++	m->nseg =3D 0;
++	m->seg =3D calloc(v->nblk ? v->nblk : 1, sizeof(*m->seg));
++	if (m->seg =3D=3D NULL)
++		return -1;
++	if (r->xip_set) {
++		m->win_base =3D r->xip_base;
++		m->win_size =3D r->xip_size;
++	} else {
++		m->win_base =3D r->flash_base;
++		m->win_size =3D r->in.len;
++	}
++
++	for (i =3D 0; i < v->ncmd; i++) {
++		const struct pbi_cmd *c =3D &v->cmds[i];
++		struct mem_seg *s =3D &m->seg[m->nseg];
++
++		if (c->op !=3D RCW_PBI_BLOCKCOPY)
++			continue;
++		if ((uint64_t)c->arg[1] + c->arg[2] > 0x100000000ULL) {
++			vr_report(r, "X2", VR_FAIL,
++				  "block copy at word %u: destination 0x%08x + 0x%x wraps",
++				  c->idx, c->arg[1], c->arg[2]);
++			bad =3D 1;
++			continue;
++		}
++		s->word =3D c->idx;
++		s->dst =3D c->arg[1];
++		s->size =3D c->arg[2];
++		if (c->arg[0] < r->flash_base ||
++		    c->arg[0] - r->flash_base >=3D r->in.len) {
++			if ((c->word & 0xff) =3D=3D PBL_COPY_FROM_MEMORY) {
++				s->mem_src =3D c->arg[0];
++				s->from_memory =3D 1;
++				vr_report(r, "X2", VR_INFO,
++					  "block copy at word %u: 0x%llx bytes from memory 0x%08x to 0x%llx,=
 content unknown",
++					  c->idx, (unsigned long long)s->size,
++					  s->mem_src, (unsigned long long)s->dst);
++				m->nseg++;
++				nmem++;
++				continue;
++			}
++			vr_report(r, "X2", VR_FAIL,
++				  "block copy at word %u: source 0x%08x outside the PBL (flash base 0=
x%llx, 0x%zx bytes)",
++				  c->idx, c->arg[0],
++				  (unsigned long long)r->flash_base, r->in.len);
++			bad =3D 1;
++			continue;
++		}
++		s->file_off =3D c->arg[0] - r->flash_base;
++		s->avail =3D r->in.len - s->file_off;
++		if (s->avail > s->size)
++			s->avail =3D s->size;
++		if (s->avail < s->size) {
++			vr_report(r, "X2", VR_INFO,
++				  "block copy at word %u: the last 0x%llx of 0x%llx bytes lie past th=
e end of the PBL file (erased flash)",
++				  c->idx, (unsigned long long)(s->size - s->avail),
++				  (unsigned long long)s->size);
++			past =3D 1;
++		}
++		vr_report(r, "X2", VR_INFO,
++			  "block copy at word %u: 0x%llx bytes from PBL offset 0x%llx to 0x%ll=
x",
++			  c->idx, (unsigned long long)s->size,
++			  (unsigned long long)s->file_off,
++			  (unsigned long long)s->dst);
++		m->nseg++;
++	}
++	if (bad)
++		return -1;
++	vr_report(r, "X2", VR_PASS, "%d block copies simulated from the PBL%s",
++		  m->nseg - nmem, past ? ", some end past the file" : "");
++	return 0;
++}
++
++static uint64_t isbc_hdr_extent(const struct csf_hdr_view *h)
++{
++	uint64_t e =3D VR_CSF_HDR_SIZE, t;
++
++	if (h->num_srk && h->num_srk <=3D VR_MAX_SRK) {
++		t =3D (uint64_t)h->srk_tbl_off + h->num_srk * VR_SRK_ENTRY_SIZE;
++		if (t > e)
++			e =3D t;
++	}
++	if (h->sg_entries && h->sg_entries <=3D VR_MAX_IMG) {
++		t =3D (uint64_t)h->sg_off + h->sg_entries * VR_SG_ENTRY_SIZE;
++		if (t > e)
++			e =3D t;
++	}
++	t =3D (uint64_t)h->psign + h->sign_len;
++	if (t > e)
++		e =3D t;
++	return e;
++}
++
++static void pbl_dump_memory(const struct mem_model *m, const struct pbi_v=
iew *v,
++			    int ta30)
++{
++	struct csf_hdr_view h;
++	struct srk_view srk;
++	struct sg_entry_view sg[VR_MAX_IMG];
++	uint8_t first[VR_CSF_HDR_SIZE], *hdr;
++	uint64_t extent, missing;
++	int i;
++
++	printf("Memory written by the PBI (flash base 0x%llx, device window 0x%l=
lx + 0x%llx):\n",
++	       (unsigned long long)(m->win_base), (unsigned long long)m->win_bas=
e,
++	       (unsigned long long)m->win_size);
++	for (i =3D 0; i < m->nseg; i++) {
++		if (m->seg[i].from_memory) {
++			printf("  0x%08llx - 0x%08llx from memory 0x%08x (word %u), content un=
known\n",
++			       (unsigned long long)m->seg[i].dst,
++			       (unsigned long long)(m->seg[i].dst + m->seg[i].size - 1),
++			       m->seg[i].mem_src, m->seg[i].word);
++			continue;
++		}
++		printf("  0x%08llx - 0x%08llx from PBL offset 0x%llx (word %u)%s\n",
++		       (unsigned long long)m->seg[i].dst,
++		       (unsigned long long)(m->seg[i].dst + m->seg[i].size - 1),
++		       (unsigned long long)m->seg[i].file_off, m->seg[i].word,
++		       m->seg[i].avail < m->seg[i].size ? ", tail past the file" : "");
++	}
++	if (!v->csf_ptr_set) {
++		printf("No Boot1 CSF header pointer\n");
++		return;
++	}
++	printf("Boot1 CSF header pointer 0x%08x\n", v->csf_ptr);
++	if (mem_read(m, v->csf_ptr, VR_CSF_HDR_SIZE, first, &missing) !=3D 0) {
++		printf("  header byte 0x%llx is not written\n",
++		       (unsigned long long)missing);
++		return;
++	}
++	csf_parse_hdr(first, sizeof(first), CSF_ISBC, ta30, &h);
++	csf_dump_hdr(&h);
++	extent =3D isbc_hdr_extent(&h);
++	if (extent > PBL_MAX_HDR_EXTENT) {
++		printf("  header extent 0x%llx implausible\n",
++		       (unsigned long long)extent);
++		return;
++	}
++	hdr =3D malloc(extent);
++	if (hdr =3D=3D NULL)
++		return;
++	if (mem_read(m, v->csf_ptr, extent, hdr, &missing) !=3D 0) {
++		printf("  header byte 0x%llx is not written\n",
++		       (unsigned long long)missing);
++	} else {
++		if (srk_view_init(&srk, hdr, extent, h.srk_tbl_off, h.num_srk) =3D=3D 0)
++			srk_dump(&srk);
++		if (sg_parse(hdr, extent, h.sg_off, h.sg_entries, ta30, sg) =3D=3D 0) {
++			sg_dump(sg, h.sg_entries);
++			for (i =3D 0; i < (int)h.sg_entries; i++) {
++				char from[96];
++
++				mem_describe(m, sg[i].src, from, sizeof(from));
++				printf("  SG %d first byte written by %s\n", i + 1,
++				       from);
++			}
++		}
++	}
++	free(hdr);
++}
++
++int verify_pbl_ta_3_x(struct verify_req *r, int ta30)
++{
++	struct pbi_view v;
++	struct csf_hdr_view ph, h, ih;
++	struct srk_view psrk, isrk;
++	struct sg_entry_view sg[VR_MAX_IMG];
++	struct verify_blob img[VR_MAX_IMG];
++	char img_name[VR_MAX_IMG][48];
++	struct mem_model m;
++	uint8_t first[VR_CSF_HDR_SIZE], *hdr =3D NULL;
++	uint64_t extent, missing;
++	int pbi_ret, i, populated =3D 1, ep_in =3D -1, ret =3D SUCCESS;
++
++	memset(&m, 0, sizeof(m));
++	memset(img, 0, sizeof(img));
++	memset(&isrk, 0, sizeof(isrk));
++	memset(&ih, 0, sizeof(ih));
++	if (r->in.data =3D=3D NULL) {
++		fprintf(stderr, "cst_verify: pbl needs --pbl\n");
++		return FAILURE;
++	}
++	if (!r->flash_base_set) {
++		fprintf(stderr, "cst_verify: pbl needs --flash-base (0x20000000 for Fle=
xSPI NOR, 0x1000 for SD)\n");
++		return FAILURE;
++	}
++
++	if (r->dump) {
++		verify_pbi_ta_3_x(r, ta30);
++		if (pbi_decode(r->in.data, r->in.len, &v) =3D=3D 0 &&
++		    pbl_build_model(r, &v, &m) =3D=3D 0)
++			pbl_dump_memory(&m, &v, ta30);
++		free(m.seg);
++		pbi_free(&v);
++		return SUCCESS;
++	}
++
++	pbi_ret =3D verify_pbi_stream(r, ta30, r->in.data, r->in.len, &v, &ph,
++				    &psrk);
++	if (v.rep.envelope !=3D RCW_OK || v.cmds =3D=3D NULL ||
++	    (v.rep.pbi !=3D RCW_OK && v.rep.pbi !=3D RCW_ERR_PBI_CONDITIONAL)) {
++		vr_report(r, "X1", VR_FAIL,
++			  "the PBI command stream cannot be decoded, no cross check possible");
++		goto out;
++	}
++	vr_report(r, "X1", pbi_ret =3D=3D 0 ? VR_PASS : VR_FAIL,
++		  pbi_ret =3D=3D 0 ? "the signed PBI verifies" :
++		  "the signed PBI does not verify, see the P checks");
++
++	if (pbl_build_model(r, &v, &m) !=3D 0)
++		goto out;
++
++	if (!v.csf_ptr_set) {
++		vr_report(r, "X3", VR_FAIL,
++			  "no Boot1 CSF header pointer command in the PBI");
++		goto out;
++	}
++	if (mem_read(&m, v.csf_ptr, VR_CSF_HDR_SIZE, first, &missing) !=3D 0) {
++		vr_report(r, "X3", VR_FAIL,
++			  "Boot1 CSF header at 0x%08x: byte 0x%llx is not written by a block c=
opy from the PBL nor inside the boot device window",
++			  v.csf_ptr, (unsigned long long)missing);
++		goto out;
++	}
++	csf_parse_hdr(first, sizeof(first), CSF_ISBC, ta30, &h);
++	extent =3D isbc_hdr_extent(&h);
++	if (extent > PBL_MAX_HDR_EXTENT) {
++		vr_report(r, "X3", VR_FAIL,
++			  "Boot1 CSF header at 0x%08x: fields reach 0x%llx bytes past it, impl=
ausible",
++			  v.csf_ptr, (unsigned long long)extent);
++		goto out;
++	}
++	hdr =3D malloc(extent);
++	if (hdr =3D=3D NULL) {
++		ret =3D FAILURE;
++		goto out;
++	}
++	if (mem_read(&m, v.csf_ptr, extent, hdr, &missing) !=3D 0) {
++		vr_report(r, "X3", VR_FAIL,
++			  "Boot1 CSF header at 0x%08x: byte 0x%llx of its tables is not writte=
n by a block copy from the PBL nor inside the boot device window",
++			  v.csf_ptr, (unsigned long long)missing);
++		goto out;
++	}
++	{
++		char from[96];
++
++		mem_describe(&m, v.csf_ptr, from, sizeof(from));
++		vr_report(r, "X3", VR_PASS,
++			  "Boot1 CSF header at 0x%08x (0x%llx bytes with its tables) written b=
y %s",
++			  v.csf_ptr, (unsigned long long)extent, from);
++	}
++
++	if (h.sg_entries =3D=3D 0 || h.sg_entries > VR_MAX_IMG ||
++	    sg_parse(hdr, extent, h.sg_off, h.sg_entries, ta30, sg) !=3D 0) {
++		vr_report(r, "X5", VR_SKIP,
++			  "SG table unusable, see the I checks");
++		populated =3D 0;
++		verify_isbc_buffers(r, ta30, "Boot1 header in memory", hdr,
++				    extent, img, 0, NULL, NULL, NULL);
++		vr_report(r, "X4", VR_FAIL, "the Boot1 header does not verify");
++		goto out;
++	}
++	for (i =3D 0; i < (int)h.sg_entries; i++) {
++		char from[96];
++
++		img[i].data =3D malloc(sg[i].len ? sg[i].len : 1);
++		if (img[i].data =3D=3D NULL) {
++			ret =3D FAILURE;
++			goto out;
++		}
++		img[i].len =3D sg[i].len;
++		snprintf(img_name[i], sizeof(img_name[i]), "SG %d at 0x%llx",
++			 i + 1, (unsigned long long)sg[i].src);
++		img[i].name =3D img_name[i];
++		if (mem_read(&m, sg[i].src, sg[i].len, img[i].data, &missing) !=3D 0) {
++			vr_report(r, "X5", VR_FAIL,
++				  "SG %d: 0x%x bytes at 0x%llx: byte 0x%llx is not written by a block=
 copy from the PBL nor inside the boot device window",
++				  i + 1, sg[i].len, (unsigned long long)sg[i].src,
++				  (unsigned long long)missing);
++			populated =3D 0;
++			continue;
++		}
++		mem_describe(&m, sg[i].src, from, sizeof(from));
++		vr_report(r, "X5", VR_INFO, "SG %d: 0x%x bytes at 0x%llx written by %s",
++			  i + 1, sg[i].len, (unsigned long long)sg[i].src, from);
++	}
++	if (!populated) {
++		vr_report(r, "X4", VR_SKIP,
++			  "SG regions missing, the Boot1 header is not verified against memory=
");
++		goto entry;
++	}
++	vr_report(r, "X5", VR_PASS, "%u SG regions fully written", h.sg_entries);
++
++	if (verify_isbc_buffers(r, ta30, "Boot1 header in memory", hdr, extent,
++				img, h.sg_entries, &ih, &isrk, sg) =3D=3D 0)
++		vr_report(r, "X4", VR_PASS,
++			  "the Boot1 header verifies against the memory the PBI writes");
++	else
++		vr_report(r, "X4", VR_FAIL,
++			  "the Boot1 header does not verify against the memory the PBI writes,=
 see the I checks");
++
++entry:
++	for (i =3D 0; i < (int)h.sg_entries; i++) {
++		if (img[i].data =3D=3D NULL || !populated)
++			continue;
++		if (h.entry_point >=3D sg[i].src &&
++		    h.entry_point - sg[i].src < sg[i].len)
++			ep_in =3D i + 1;
++	}
++	if (ep_in > 0)
++		vr_report(r, "X6", VR_PASS,
++			  "entry point 0x%llx inside the written SG region %d",
++			  (unsigned long long)h.entry_point, ep_in);
++	else
++		vr_report(r, "X6", VR_FAIL,
++			  "entry point 0x%llx is not inside a written SG region",
++			  (unsigned long long)h.entry_point);
++
++	if (psrk.tbl && h.num_srk && h.num_srk <=3D VR_MAX_SRK &&
++	    srk_view_init(&isrk, hdr, extent, h.srk_tbl_off, h.num_srk) =3D=3D 0=
) {
++		if (isrk.len =3D=3D psrk.len &&
++		    memcmp(isrk.tbl, psrk.tbl, psrk.len) =3D=3D 0)
++			vr_report(r, "X7", VR_PASS,
++				  "the PBI and Boot1 headers carry the same SRK table");
++		else
++			vr_report(r, "X7", VR_FAIL,
++				  "the PBI and Boot1 headers carry different SRK tables, one SRKH can=
not match both");
++	} else {
++		vr_report(r, "X7", VR_SKIP, "SRK tables not comparable");
++	}
++
++out:
++	for (i =3D 0; i < VR_MAX_IMG; i++)
++		free(img[i].data);
++	free(hdr);
++	free(m.seg);
++	pbi_free(&v);
++	return ret;
++}
+diff --git a/tools/verification/verify_ta_3_x.c b/tools/verification/verif=
y_ta_3_x.c
+index eda7cf7..b73d8fb 100644
+--- a/tools/verification/verify_ta_3_x.c
++++ b/tools/verification/verify_ta_3_x.c
+@@ -37,6 +37,10 @@ static int verify_ta_3_x(struct verify_req *r, int ta30)
+ 		return verify_esbc_ta_3_x(r, ta30);
+ 	case VERIFY_ISBC:
+ 		return verify_isbc_ta_3_x(r, ta30);
++	case VERIFY_PBI:
++		return verify_pbi_ta_3_x(r, ta30);
++	case VERIFY_PBL:
++		return verify_pbl_ta_3_x(r, ta30);
+ 	}
+ 	return FAILURE;
+ }
+-- =

+2.53.0
+
diff --git a/package/qoriq-cst/Config.in b/package/qoriq-cst/Config.in
new file mode 100644
index 0000000000..9a12564d07
--- /dev/null
+++ b/package/qoriq-cst/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QORIQ_CST
+	bool "qoriq-cst"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+
+	  The purpose of this variant is to verify the signatures of
+	  the bootloader directly on the target before an update and
+	  not to generate keys. It prevents the target from bricking
+	  the board by verifying the signatures.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/qoriq-cst/Config.in.host b/package/qoriq-cst/Config.in=
.host
new file mode 100644
index 0000000000..c1e5d36e1f
--- /dev/null
+++ b/package/qoriq-cst/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_QORIQ_CST
+	bool "host qoriq-cst"
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+	  Provides tools to generate keys, create security headers and
+	  sign firmware images, especially the bootloader.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/qoriq-cst/qoriq-cst.hash b/package/qoriq-cst/qoriq-cst=
.hash
new file mode 100644
index 0000000000..70da431658
--- /dev/null
+++ b/package/qoriq-cst/qoriq-cst.hash
@@ -0,0 +1,2 @@
+sha256  6a4febf221c894cd0566d4c35722b8df753b386b8871deedfed5b5f4d52e09c3  =
qoriq-cst-lf-6.18.37-2.1.0.tar.gz
+sha256  7c8437ed27fc42fb35a90e3be5f1dfbe1b877058df1784eeb59057ceb5acc8cc  =
LICENSE
diff --git a/package/qoriq-cst/qoriq-cst.mk b/package/qoriq-cst/qoriq-cst.mk
new file mode 100644
index 0000000000..0ce3a68fde
--- /dev/null
+++ b/package/qoriq-cst/qoriq-cst.mk
@@ -0,0 +1,45 @@
+##########################################################################=
######
+#
+# qoriq-cst
+#
+##########################################################################=
######
+
+QORIQ_CST_VERSION =3D lf-6.18.37-2.1.0
+QORIQ_CST_SITE =3D $(call github,nxp-qoriq,cst,$(QORIQ_CST_VERSION))
+QORIQ_CST_LICENSE =3D BSD-3-Clause
+QORIQ_CST_LICENSE_FILES =3D LICENSE
+
+QORIQ_CST_DEPENDENCIES =3D openssl
+HOST_QORIQ_CST_DEPENDENCIES =3D host-openssl
+
+define QORIQ_CST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC=3D"$(TARGET_CC)" \
+		LD=3D"$(TARGET_CC)" \
+		CROSS_COMPILE=3D"$(TARGET_CROSS)"
+endef
+
+define QORIQ_CST_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(TARGET_DIR) \
+		prefix=3D/usr install
+endef
+
+define HOST_QORIQ_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) \
+	CFLAGS=3D"$(HOST_CFLAGS)" \
+	LDFLAGS=3D"$(HOST_LDFLAGS)" \
+	$(MAKE) -C $(@D) \
+		CC=3D"$(HOSTCC)" \
+		LD=3D"$(HOSTCC)" \
+		CROSS_COMPILE=3D""
+endef
+
+define HOST_QORIQ_CST_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(HOST_DIR) \
+		prefix=3D/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
