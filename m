Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C83606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EY9ab1Nr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJJzWiw0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0029406AE;
	Sat, 31 Oct 2026 20:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8rwjDnpAplr; Sat, 31 Oct 2026 20:19:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B94D740676
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477974;
	b=C6p4oGdz5wbF5VHzQSMMh3uy/8MlsNEVZ/PWeLlPfb1AHNwhXHzX4dRDpjz+lpR3cdcU
	 1z6AyEgXBr7gZvEWM31GwziPFDSeRCt/giRhijGTuiaY4HHkUfQTfK4TMxhRTUcjvV66y
	 hovT+JsDw1zpNSuIBT+Jd9GYtssAAc/8dCe0XK/wn0Y0cfEFk3ht3oT5zsO+D9m+GAWfh
	 PEZ5wfnDJokcS/HxY3h0cP3ozlzgNNEBXecWN1l/5ZyJS/Z7XiiAdSR6BdNb9Rhx/02M8
	 gukAWW2JWeAB5DjIPVUTq2IT9CHYJ6/zGeZH1V7stvcMlr9Kj0D8h0pNisu5DD1JecQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QKe2qKHOStkWG+W2EYLHapVrrkC3aseq2RMhGIarwFM=;
	b=a8rmXzA7FbVqwrOROMVzMY+W/2fHnFLRt4ZairmEJQJplknOuk9S9AvDNY+lF9lTeCZE
	 P0DAhp0LGKa6BQkwKxoQ5OxEi9d1eHAbSjFmapMOOHcgxiZgteDunMrMY4h7yd6DsTojZ
	 UUyniK5mqyJ6HzrzaLS2VVDCaKP86U/s8kALu3YlnDADSOcZp1rx5FOt7hxOvgSMzayh1
	 nr4NdiLdruUDyQdma6bKa3e/BLX81ufVMu4W4yVMbxBIV53jRkX/wn7n82Et8bZly1sOM
	 T8eLf+OyKyTykxrloes/JhgewSmfWyyf8a5K3d5oKivgP5nbZDHHIoARLu7ygBY60Ig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477974;
	bh=QKe2qKHOStkWG+W2EYLHapVrrkC3aseq2RMhGIarwFM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EY9ab1NrRb48gkAEZ2gWvKgHY8s2sLQEbJrnCBi3arX5EYyrCuFWhEidOq6y5h7Fk
	 bsMmTxe/Q3OcjVAtT2ECGyHnuh/j3X6XBpaUDmhZ9H0GDTNdkAyhAV3O2fx6JFI1s8
	 s66TEuexUWdSJ2Fm+jjMiZNn8ZdVAzsOYViJQZQj5TEB7pAECKz/pUlZB84ggUQn8y
	 nMNFJFlqnlTmN4EjN2/+ZRafyxJ+2rZI0fkQBMiAb7glRZpeL1M4lTV/PKhu3URvAb
	 TsLZGvZYteL/0rIghqHnhWyOnyYvdKl6w2aOTXeOfS7AlfyfBDKjFkL+St+TZiNHmp
	 SY/i1hwu4JK/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94D740676;
	Sat, 31 Oct 2026 20:19:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70683411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61BA64022A
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2LSl-11J95N for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7CE5440070
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477970;
 b=H4NPjj/DbDO4+eNM/USzwCUUm4JQVuZ01tFxkuYOZGofSKFUd+n+pjYZiYdj+ZarKxxa
 T939f3lfZPbgKDTUJ/rugumj3TqIEITCvriCRC2L8/7dw7G1EspHiOc47cYNUyw/W0lR0
 mJyvE6Hc9zKy2MvUKpVbQFUZV0ROLQe6kh//3fpendKhwMm27o9OznAkvf0osVUdD4WmJ
 85e9zikbPmQJAjS9CHceOYWftvkDvct/FqpVHiRz6CnnS01Vhx34ztDXGiiDW651QSQoX
 ZyvRR6UPvKVJW4vO1Vp7w2KK+ii3CVRXUHQaLv9eIq+ADnEijuZ9IaqiodJJCmp63BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477970;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2bNxhoHN403VDSBYDpBFmqhu7ummA0K6EvA10Q0a11A=;
 b=W0og8Sc9wboyvyFAKR7iXKAtZeZwixED5HiyMYzz4NdO903DSG8RRHOLmsZNKUXTuJvh
 I+tp8b67QE4/T3fbzN8WRkzWnp5dh8jZ/GdCp0Wuloh7PTwJ0YRaIGuo6UIW7iJ5NPzM6
 aeQGVBtw5zICnsB4PUOK88mFugTlFVaa7KbB+bFLzsR7pF6TbS/XkPaFTCiCjafqfASi1
 mHMDHhWwQoMlc13PjVHwI1UyrJbOD7DHCsHCaJdTUENuZHg2HrnIJVysuS1nHEocSPcmF
 8X62jdz/G654OUIkrHYxukcFOKnAZxkr2y9tu5pdr9Gpuu29lYi++lDO+NeN2j6xreQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=yJJzWiw0; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yJJzWiw0
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE5440070
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:29 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-70059e4dab6so1151869eaf.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477969; x=1794082769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2bNxhoHN403VDSBYDpBFmqhu7ummA0K6EvA10Q0a11A=;
 b=yJJzWiw0sFqovYjDZvCeoWTBMNw+UlezWVm4h9P2u+d3jN/RmHXbxxcm0q74TTKDL/
 1T36yMHWH602bjCvfTusRPYIeDsDanEuhFdlVJzarDS+Fj7RYrKiq8ShRw06IP/5s00f
 faycl0b8AVb5+ktKEKN/E4C2kftJmHRGp/pdf0Cve0WINQ54Y9QtZWYLqHVVeBKYy1mM
 NbOX6im+WYoEGrwR6C8IjAdFQoXIpg27PnOnZkjv3xjB2bWIw3qtWLNbn9Wlm6d1bHqj
 hS8M3BDKmLMuGN2cBxqgtGOV7vuYTI3743rZC7FuZFx1mvkf+ob2x+GFj2f3m5IL21vu
 blQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477969; x=1794082769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2bNxhoHN403VDSBYDpBFmqhu7ummA0K6EvA10Q0a11A=;
 b=cOdmNhS+SluZq+kTJYv6jH93VDyRzMHamj7BRXu76S9JCdYS4AufHu0j5urYGVG/ML
 aBYDrb72g2P620n/r1qdns5kIWYw76Z8qY8si53YX8t587X3up43d+BET4DKIP27MfZX
 ESiTOktJxZ/hQFmk9GKz3SuCeXRGI63Ud+a0SoT19FHEFyydpzGkt6OGqN+mfcqYkXoV
 9i/qFrEM8IwyDlCofJimCGfZHskvVIto7c6jdpzBAQWHyse8/A2hhF8Alk7QBwj3Uu33
 XLAhCqB0Lzo2NKRBjy+mzxiWgw/+r/nCY8Oung6rlgZgTWohdN7ARqy5wAfynxt3eSUO
 YQJQ==
X-Gm-Message-State: AFq9FYLQFNr6e0tarflWQgHGOC6HT0gwf/V5JBX5etZcO24Ewe0fZ5s0
 tHG6ly7dhEUAL66gspveuVM8N8T0VhLgm2czjwxSE2atC/keFTRg2IEVuYG0qg==
X-Gm-Gg: AYBFou0vTBJ7g29WZbxHO/11CH7SI4Jb9dwMiVSAn0U9sjtNAWayjOHdzzQ9PJTYGEJ
 rqpCQFvRIt9i8p8L8qiOG3kxLLyroAxGzHMvfBZ4OZmL8n++4gv44zSGk8u4dDV67zfdxlpNEHV
 MkMBVFSxUQbmMLWFxJlav/Ye8XrN3gadWA8ekeqkpyxO9Pl31yXDzgBtcfzS+c7gpVs+eEFVemJ
 BmJNl7jGWPJppesh98OKH96Fqg6rtJ6k/KGBXrESqo2i68td02QRCwrgPOPLQC6v//jGRaH2j5M
 +qnVgV1KvXusLPLmgyTvyrFjUXDxeKWwzi1/LuXeVsT3McxGVRchSa4JfNOsIUF8BPIuJ4297dA
 Y/XoGmnjBNRowDBF5hOjFtxKfd1N0/q4HzcUbJ73pHmISoQD2Get6NCg1JylSdsbUH2lr3IJV1t
 eR4InJybTnDxrIZMfa2fVF/qQcLV17BicZ3LHdNSLfo/ZkDIQ83zoOjxyDwYre3klKXyFg2tWHi
 zvGTVRssvCp9tW6dtxpG6NINxJjBArxxc/i9p09l3bKzjgtlJCjT8zmf6Owq3txvK8yENWFlBWJ
 fDfjnWaKXBMSa3fuHQt0imlCKmb4hKd264isglHnlmU2IG7oAskQUxC1/sfHk5v1ualrSxX3R/K
 SR39LgS/wrJL9Uh4o+s2jIf1hQzxksoBCLvyjcvg7W968z3RXUtbWXG88LM6onHAdbsFK4M+5Il
 AujA7vRjjg3wZfpz+BRAKex/z/t/4jW9ZQKWzl2Cdp1RHeJxRo63TOI6A3ArYxeM4ZjHzki8PaJ
 A==
X-Received: by 2002:a05:6820:c2d0:10b0:70a:4053:52e7 with SMTP id
 006d021491bc7-714f1f8157amr2544765eaf.8.1793477968983; 
 Sat, 31 Oct 2026 13:19:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:07 -0600
Message-ID: <20261031201918.2850153-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-platformdirs: security bump to
 version 4.14.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix unsafe Unix runtime-directory selection and multipath site-directory
injection:
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-2gh9-8m4r-2xwh
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-jmm4-8x35-q6fq
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-9w45-w2cj-r5hx
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-5pjc-393q-rwmf

Add the host-python-hatch-fancy-pypi-readme build dependency for
both the target and host variants.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash |  4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 641b1e62f9..073f9b002d 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
-sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
+md5  07dd523bb5ca12c4525df2cd242336b1  platformdirs-4.14.2.tar.gz
+sha256  6d13b4c1d66b7548dcec9e3db13c1ba9d9adb65041b5d07869313afc07e6e41b  platformdirs-4.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 0aebffb6a9..f6da1e5498 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.5
+PYTHON_PLATFORMDIRS_VERSION = 4.14.2
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/6e/4e/2684728d9f2c8c4110738dcadca7e0bed4b60c8dc68c40c2a9e0cf017900
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
-HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+PYTHON_PLATFORMDIRS_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
