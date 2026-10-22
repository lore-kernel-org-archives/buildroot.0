Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CB2606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ECC68119B;
	Thu, 22 Oct 2026 20:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0xf2_p-cR0Y; Thu, 22 Oct 2026 20:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 45CDD811D8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792700891;
	b=hs0Z0XY3LnmUJPMQnr0nZ6/iDDsS2hXE9wQYszVhF4Yr3UywHdnfdU28tqU1OrVxgpvN
	 lwYKCzmuFsNOLK9acreJX/8LlVbgBOEA4UTFQAR6NvMTrqLbquCd7+qL6wDXyO1SweaK5
	 gd98Ne6E26j8vt4VQMwpFzB+dMtUknaTDXXJ/cvSqf00zNw2b8H4+jpQgnj8cT12n3JUD
	 1VN61lAof74H7j8x+LU4S5ngK4visiSNCPFWq/pKCWX+4x06w7yDMf/Zf87D5XNhx5fZ1
	 FRN3ejYSjZJ9eTqOXi6wjJV9TIyP3A8ktx3w9P09DvDyF2Bf0HUaboM+rLxauVkmwBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792700891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tMe0GlhamXs2ZJq1YQ90RWY3SAttq7iaJ5CpVgNGiQ0=;
	b=rdhEI7RIA75AmSMGmBSrQ392HUQbyMMT/vMpaTPQt79HpdT7VxQYXUVNVebJgRlG0K9b
	 tfi9N0FgKlw7bzsgA1W8XKFr2z9kgmxdF6XmJMiERHxwDK4jQVqmENXQtblVOPFppQ06w
	 zq8KmmunKbMp20lEX0fIXn1rvmahQd3Cpe9M8DY9q9peBvomwG2rM2/QYm0GA4YFNzkj3
	 M1SGqrxl/PH7wqRqzGc0SWQMepfsx/0BclHa6/jzRhW7lm+++1GFShijJMChGFDMcToFw
	 mHv7R63pNVH5oJ/FIxPViua7M3fnFMOqiQu0FKGdLbeKNpXC3IDxJLZG4YgJVkVoedA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792700891;
	bh=tMe0GlhamXs2ZJq1YQ90RWY3SAttq7iaJ5CpVgNGiQ0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ELCGqBJVlvedCtMFpqxoKTJBe6zMgS3tAZjSVdwMQa4dGdZ+33Vm9XTkbGIDL/v57
	 ceySIW8q0n+MaUHCLIndGaYOWnzlzW36iPmc3yPCvPx4SUid7vjCRVduk8LZw7VMMr
	 JWUVjvb1vx6LGw9NqmWrA+eq7DzPazI9C7hu2N87BG41PwzhB7zSTwIJsT82zqCdQ+
	 kX/sqTiUHSzLE0cmOsVNOW69zNaoWZFKpziCcMSDRsJe1sAyUJCqOFJfZgKXRx5HRT
	 PhP7xpFxMuYG0HVhGKIKyDXFK7PkikStYoXrEO2L5Q/wblwNHGCJFFmzVVBTI3+ism
	 qGP22VUm/pohg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CDD811D8;
	Thu, 22 Oct 2026 20:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2671D4BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1814F607BB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEBwUgQxwGBp for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:28:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA47B606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792700889;
 b=hYBsJeBZWmvBOud2Ol6brqzsotKiGxmwDhdodRGWZ8n2IJ6xwpWoU64d3omTWWq34oOU
 s8DIu7JS2nBykvCPWPOGzGR0SRLtq7ahWSrEmUwE9/Fwa46cZexihPlJhq2hZb18Y9fDE
 S72VZ6hfrCYXv/90K6c83eUHnCfRKO5+3UjwSqUt87eCJHo6BWlkDosy634gfOkHz6EiF
 WxbKZHtQ3+QuxNHE5npUuEbtPC6OwZmMoxh6l4iFb3XcD9gImy8lWNfhjhL+zyHmmNA4J
 stRHKCpdh+WoixrBFarNCiSIklujtCsgf1BXmjIF4eocfGQnFPm5BV1pcsExC2qBajw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792700889;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KqSTZV0KykdCS/msVqTUm95QmrQwNbIzfHpKbC3oLdc=;
 b=TnpHbmrsajGIcMd5+77M25+3PK6heh4rfFp64A+Fya4KPahPbuq9sBui91Lhb7+c5BHN
 76JAFt6lFca7ZirPTfnC+z1m37AAAvZxcXNoLUR+1rKuparH0JjhOWj5BSwpOEVHwOBmF
 j5FxVEuIT3vHuvATWhrMdlXUUn0ATsi9hePE+mxqrPh2ukL/xx7pKDD2xEsaQGE1xaIVR
 sOm0pPY3k/fSDLqS7wA0N58Jf1wRpUJaLnBxrwND/s9UPpmfIUFrPXcqU0Ns/5HfDLzHx
 707wMZktaVqr1or6CanvjE7Uhq29qJfPWbqBe16fgppVsJSX6ZngWsEEtmxTz6BAqgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="PRIk/Frt"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PRIk/Frt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA47B606A5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792700885;
 bh=KqSTZV0KykdCS/msVqTUm95QmrQwNbIzfHpKbC3oLdc=;
 h=From:To:Cc:Subject:Date:From;
 b=PRIk/Frt+CldrvLtuJeqoL8lfL4AJMWyu1N99GfrwOsvWu9jOXIQYYl82V3tXinXE
 fN+C3uNYJL/gGsKd92ZQqdGzJa8AxdyVA1IiAL1JkqETJmTNLkJZqAL8lYrVrU0zu3
 b4F7hdbfA0aXaThCRfLrPQ0FQGGKi2hDZgd7e9L+TZ//LYIXyFmDzSMqBsK+DP3hn/
 W36Yb4pdaYKbyxXART8rfoaxuDtKVngSYpI7VTKIThDNBDg2qxzfw60aaVQTueaQs3
 Z9/mjo5dUFpLya9xsV97nrQEMHljF5inHQ4RYTIjwjRhTELETmpNjAJ+zFb5TYnCKa
 QgvYgOTqgB4iQ==
X-KAS-Sym: v3:f51bdf72230551df:bEDLgusuAfOSVOlDoS0BfONunFQwMecZiiLGkuR2nWKMe
 NXJ1rDWiVQ6biepoK+5GG0v98DWDvxrV65VD9/CVLk1J70uDyvHWe5d2DRP/L0dRPDc5797lQpA
 5xYFQiTqH2M41dWp2GscRoN3eCoZG6AXYnBtGn/XpmEqKalvbNza6MCvU7iz8iTxr4iMqVxMoXJ
 dVE2TJJ9Z9nT/mjrcUNpfFfrlDruFJtGcV+A/UZrBYobG2bJCY5kSxeVub1DJEUcd/v0jiGKz2c
 j5TXbQoltpI7CG5BA71rc2zGnHk4PvMhiBh2BqI4iCHI4qcdx4P7UoZju7Y4u3RE80Iz1chw==:
 3bCDXF/cnBOS5GO1oZndwjr7Iz3zRhLcV3OXLUPMxBG24WVFg6cNUDy/FD2VP4sC4zIILvdjhDn
 UE12MIvalVOaZ4gMBQjqIASGrrBA3p2XM0BPJlV5cCAKEsfdY2mcgcnBHQfRuWgFhp2HTW4hrQJ
 BCW3MZHkP1IP2FAoSfupT4Yq81Kx1ujthcQlDK+1wfqlf8ufDse3Ed5Z8aEHj9oPFQ6itr0zsS2
 0Mae3znw3HfCsMczw9j+CTjfnKX7ATtglHHppugoUPOCwLXyjQjA1x2zfZCGLYxPHoLaX6bATFX
 uQN4ioO508grG0v3YBnxomOu1NxWC/Os1WWabTX/aEPyy6m8P1gUXLSs3I0uJ5ylfxd83xiuHtV
 1A/CaRcIbZOda61qJF12aJLVo6njbO7e9oyMSvGg5Auw6fEuloFSAY4f7r5/R7SP86/XHhsfi/S
 prmK9CQH876XvoIpK699Hp3H99I9b4GzCjcQXOnQ/J933T7Pd6mDdo0BvEEux4Q+lMQwERWbbtF
 ZZ7TOf+AqDcnt9SswO0OZ9BCLLP5+UFLr7CivCluOx0xUUE0A6QFH7sSVvzjJhVTp1AHdpbq9AY
 UCk6k6qYiZMczBWxr5tLE21P07JmPv2DZWeaqiJGSug4KhcN5XdFx4uiMlwdl20=
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95AC9A4C6109;
 Thu, 22 Oct 2026 22:28:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55182)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJzOO-000000005Ss-3W92;
 Thu, 22 Oct 2026 20:28:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 22:28:05 +0200
Message-ID: <20261022202805.1466157-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump version to
 2026.10.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/certifi/python-certifi/compare/2026.10.18...2026.10.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
FTR: 2026.10.18 was a security release:
https://github.com/certifi/python-certifi/security/advisories/GHSA-6q48-6c7w-9gw2

 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index c6e0206ea8..a583c17bae 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
-sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
+md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
+sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 5430596350..bdfb8ed12a 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.10.18
+PYTHON_CERTIFI_VERSION = 2026.10.19
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
