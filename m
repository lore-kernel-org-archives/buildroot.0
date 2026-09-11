Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3062C88E4D
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 21:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CCF380AAD;
	Fri, 11 Sep 2026 21:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inY5uUpz8E8s; Fri, 11 Sep 2026 21:13:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8771D80AEF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789161201;
	b=eSsK0lbp63dDih9B5ZghSKXXwowl07J5N+ZRRyQ3OYtA2JFRKZuyq8TNzZqS39Uk4EV0
	 wi0k/9mB/OhaFpQJJYwp45wTjZC4stm8W75S+cRFtzBcwfTzCvwvyn5Cl+p7Ukvx/K6Nb
	 2zosTemqx2oztUbfl1AERhCeGbJaYemjOTlgZ5qfEUxsM/srEEOjGdBAIS3KrBd/akfzv
	 0WigB9N7GeCYtDh/TzwJoCHQlIOyd2wX/LSUQjb5Yf7ndnn9lU/GaRwDG6+8GXHOrnHtJ
	 PUHve+sZck/rhUm+ThTyHUFXCCf107efDo5KY9y/DNL4+G+wMbJGut0g061le8PdgZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789161201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3L0/2sStvVRi8MataDgE5vbxXNHWeBmPhrFm0cD3PDg=;
	b=oUSk6HNjSUo4pXiPVXJ3yPJg/Vz8FL8Ihclbx/63j/y/YEhGnQx6EcJEB55tWZ5G1Ii8
	 x05pzgyE2HN/gPqYTKyr+ppkP3r0AEWE1b+EfLUt7VnUtwzGpdOlsmdaA4vVrYsTbghru
	 kieWj4zN2Go24iUXTNmDWJy9g/DEmeZyWpdfXWAOiSSd3m3WQC8S26JA0YMp90CuN31o+
	 QxRT6DGMy+/M0p5nn//UscXOw5alQomHLbW0wKXI7iRsuRyXT27d9GLdcVRZVnyXsMUqL
	 1sT+/oWEhjMpXZU22pZ79dwa0WoVbITt1FnaDSK+aIIPEUUh4lvTGCdah8/iWtyzQyw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789161201;
	bh=3L0/2sStvVRi8MataDgE5vbxXNHWeBmPhrFm0cD3PDg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jkj/gz8P8lp0d2J6HRy4flqXP3fCccuZXsQqLeS2d4KXTAx3SDffs5JLf40gNgLGR
	 2Jm5R5m2BYkPQGOAP3ib3MVXSFq3BC50KQyVsFCsVAKBjA6vLn5ApcaVXZpJF/fHBk
	 fEXRh1b+jIZQzwO7NtGrRXrhgd3faejVZs7rvBzlZaP/XU+w/siWC8ivVY0DpWeuSS
	 NqcXK13j3wKw7SApKTUYu6gL3dGg1laW+jI6Bm5nh6V+u1Ym2XKRN+KlJtS9Stq+Nl
	 8dP1GyhQldvN4s/s4UaEM0k66T+bGzDUvpWWshPWu1l6NZRlptm1VhOFYNjNi/1gAp
	 u8L4+6ZpB1Zvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8771D80AEF;
	Fri, 11 Sep 2026 21:13:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52BFD7AB
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 381D66060C
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wF4Sb7Cb2aC for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 21:13:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 377BB60613
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789161199;
 b=OH9YFOxszH4u37jV0959bJc9EJJY7vWkIu60C7QL+5I9AncwCgnVawKg/wM39gItMpid
 pTkzDu/gOxA+jJDx8NdTGyo6d9YUUwaYMnyIZbfx/rGEsIbkgXSJpAn80wtUIf9IfX+/C
 DOOoauBFKiGJEG7XhCIMiAYGXBdt1Q1I0ZsoCaBsIoScBBU8mO10lSwUhZpkvSey6Vlkm
 bIQ2GbBDUmIXhyfiyoh0DADItHsAHk38oN1dmM6ZZ0s/GKgwuamb+Df7FN20OjEMO1667
 DDXk+fKhQGcBMLihrY4XbV8Lm8P5/rfZlBVSSxqkFVLYLgRU2JfckCMFnCeR8kqPqXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789161199;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=mphz3jvVFw0mi1MzCyQOS1kw+Ou+odOdtMiowXiQqFc=;
 b=FxFUU7qslw4G4EECaGm/o05MRfuYc7hA7ss+1KC48Wv0fZCphWpXKvO/qG0XaLLxyuow
 J315r7DsjLN8ej4qAjcqP27TDsCGxrdw/9V7JwbD3D801pM95jpAyZKgdKFjs4wljlY5u
 T+2iVL5rta92p5D05JsmIA1+ur2rrgK/Akf0JVO5pzb9M9R7AK77DGLXfidSGlnxJ9f+O
 J++i2DHTsVe/U9deTDziSeEqrsfqj6PV0ou2+hDLqixI1EYrdj6J2k47DbSqtCdltL9DN
 MBwlO4CfDOYg8jhS8xvoUmST78UFTYhiz8ZYgnjtS22wTu45stPuMmMGZw7pMHsDdxQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kDKs4PE9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kDKs4PE9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 377BB60613
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789161196;
 bh=mphz3jvVFw0mi1MzCyQOS1kw+Ou+odOdtMiowXiQqFc=;
 h=From:To:Subject:Date:From;
 b=kDKs4PE93Lk0bxQdY8vyrBNk61vobbPO8Gz7h379V3pQV71KI2BLmyt16QJ5duxSk
 VJrMMCsiqoASvj7ik1PfALZOLLfd6Nr6ph1fOA+uwD0FQYvH+/0RlZuyy9/xSU9EDT
 dAQJO1pnjVQu2cyPi9+7PNEib3aBvmWJSYfk98cEk61A3iAAjj/wH7DEddN/BMR6K2
 XlrgUwZuK5K4zTaxROzi94wMjAkb1JLg3U6SV4SlP7vZe2wJW7N5Bcd3b35CBJQlfE
 FTe7GIADTNgZuf8BTZRPm70GmQyLSfjp/X+YXQGwm8/HHflOm/R2J9TLs6sufNurzY
 P+xx0OIq6+YQg==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2ADAA4C3BA9
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 23:13:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53018)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x58Ye-00000000500-1FXX
 for buildroot@buildroot.org; Fri, 11 Sep 2026 21:13:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 11 Sep 2026 23:13:16 +0200
Message-ID: <20260911211316.775727-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tools: security bump version
 to 5.8
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

https://github.com/tpm2-software/tpm2-tools/blob/5.8/docs/CHANGELOG.md

Fixes: GHSA-v7w4-4gc9-qcgv, GHSA-gwfg-w3jr-xh66 & GHSA-qp88-8f4j-wv7q.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/fcf635d7503b974aaf5a5a605f114fbc081c3127

 package/tpm2-tools/tpm2-tools.hash | 3 ++-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index cb7e8085d6..a2ce45205e 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tpm2-software/tpm2-tools/releases/tag/5.8
+sha256  1cb73185cae814b4e15c7c2d0b22642d640faf48775f4156a1fd92edf84bef73  tpm2-tools-5.8.tar.gz
 # Locally computed:
-sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
 sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  docs/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index cdb8931a3c..72b0dbf8c5 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 5.7
+TPM2_TOOLS_VERSION = 5.8
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = docs/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
