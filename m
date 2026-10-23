Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cHdOYKFt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vat7alaz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EE26067B;
	Fri, 23 Oct 2026 18:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EqVbb40YL5E; Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 286B460680
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779520;
	b=bQhbd67yE43lNwoA87PXXN2Si7AH5snk4zgxRzuZXFNPLEI3VNwGPnFrzHAn4rJjdxuQ
	 pyjep1jQ+oMaQGuVeu4+FG7W5JpyL1GnbLiTmLUe5WF6YuqdrHtKIY6R3SFkF3ULiD7Il
	 MmoB7YyymGoARBj7kpaC6qxLK1DbXhIwmISw+4CaMUR2+5DLPmuzfX2hEFBfz/yORIqoM
	 qRYsIkVbS3SS6N8gXH9jpediiSqnz0AIIjk6L8m8vFQBkQX9Kw3n05O50ZYytugEHotKX
	 QIvhyjdriCxbjYAccHbE3lBrM6v19nvB8ou9lF54X6kO64yW+PbBqPS8F0L7lrvbU7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779520;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yOZVbM5kiYT0/wkSFgHt1BBPaYWQme+JTsj3n1uO9vM=;
	b=lihaTU9IxbzaiTFsK6LIwplwKnnNEnNDp5LNCXX91lJM6DLjIBInEzmcSEPqZBLUATH0
	 AXjUeubv9iG7mubAU3BtWT3nNY9cJxrEiHBMazmJfeViXc4C264/BLgXbbYSHjI4kvYsS
	 LgajUkFr5D8buGu/whcsxH1FtzD4hnQGXVis5NCSrk6HeuscGzoakyNmAhh8dkRi9PfHr
	 Eu7b7yDRgFJG39cNlkP3LO5dU+t5ZFBbs4ynJv1YcXaUqdfapwV+072Rkd0xLHMVYjOpW
	 Morhw3LruAPnslShrly6fm9+4n43L1Te6R7qpT8kpwFlcbenK3g7i5Ia4HuoKu4aodA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779520;
	bh=yOZVbM5kiYT0/wkSFgHt1BBPaYWQme+JTsj3n1uO9vM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cHdOYKFtPlfF9fAjg9wiJlYtbTvoMDKLHgMLFC7fxueXE0fVU7mn7rRqKOh1TljBv
	 YZwbCSHkl2qozAPuy8a1neuXvMh2v2/VM7XjgO+aM0pcBomjIr1XN7/yukbTX+kfNu
	 pyPnRuPgkt91I1+cE5eIeWFalXn47x5pGxVLiSRcrcMvz97S9XOaQqgGJx4NAyJE1i
	 Tih0Cw/t/gpxaDCZoUgpGde604NYBLT44xjZYsoeNlHX+/KCi0BhWUuF6UhWu58tU4
	 6bR0EEBOIR75t/CsL0H+2U63Q0k6dtECski70IhGkZaeegox2U1Uta2YQ8t4rmXXen
	 Hd/cKK/aBCoKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286B460680;
	Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 758AB12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B49040913
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yClm_l54Ipd for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5FD3B4082E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779514;
 b=m8Nv56KPjl2Tna1eKYlhOTHzN+NHNYm2rqaY3Y+fUBb2vBi5jYwacn4BTXc5OMeabAPG
 pUjO8Zkblqneps+3zCrRdLrd89biCio7f+vnM3WgrJ/odepOiI90dTw4k3S+VO+Nx97dX
 bj0Z79A1NZutIRpt/xlycglcd2TzIBseGVvr1K8FvdT8Co7Chco9zhxW3JCXRPlALyWXB
 cI48GsKvTDgxbdoHCAlalocJhMBr4d/PLJyERK+vOCgMqg7KLLOpzK4dJaIF4H/WOPSec
 dEvQJSQB5OPDaCw1TnogXDZmxHw93Y4DMYYrYoBzYcExyfGVdheqgLLa798CZvm+f2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779514;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=FXL6YpzwrSzgPIo6RJ+Dm2OVWsQU99XAWaHGTcLTIfw=;
 b=cKgh835HnYssWtIDKlGMEacn1auQNmw1GRI18T6EXF3wA8qytyC8NhaYTucYgJCiTmdd
 R0MnTjwbgA/jvhBAktrjT3P9Sa009XPlM9aDUadCstJni2BnVv0WmbhAIbRXiAVF2w73p
 0/BvY1TqR8B8yAyeQJj6M+iNLfFk1jk09T9timTyxQ3Lg0CVxoetz+cT09EOf+RojG2ix
 nWdUKuxj08zxMnq6f+AAw/p0aMnGEXxSaxcx7ICuKLnO4URuul6aZWd2V+LkC1NapjJ7H
 dXWnxATw+Y9CDDc0RS3BcwXj0Xpa/UNzmLTAFHXzOBEt1mJUuEw+6cQ/TAFIfIrdS3g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Vat7alaz; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Vat7alaz
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FD3B4082E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:32 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6b1afdf5196so508937eaf.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779511; x=1793384311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FXL6YpzwrSzgPIo6RJ+Dm2OVWsQU99XAWaHGTcLTIfw=;
 b=Vat7alazbAkfivLZ/7QcNShjSTRq0bxVVOzMk4+cEeFXI/Lw6PWFi6fYDx/m7cxEQ8
 ELloP+CJLkyAMn9UAQkQ4lc2NN9uFPlNty9JMV8n2oIWbkyDoRvBDk+3J7V6jJf/Tf6S
 6V4kJ6PX/RkWE8I6QDZCYJ5wqmpXKC6T0I6JP9pJfmgedlsn30mLH3Wtlj4pWZQyRwJk
 Q7bREXO82pe8K1N/44hCjZtVP4WCKM+ITEmBTlXh6OQAuGNPmUqqxC6duYz6KnqTbLhl
 UyLotthwHE+KcKWjK02cSItEfdSqOmKZw5QmvQrvnYzlkt34vEkdCo2TQXGZd9QiQnJU
 8m/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779511; x=1793384311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FXL6YpzwrSzgPIo6RJ+Dm2OVWsQU99XAWaHGTcLTIfw=;
 b=2VVDt9Uq2XX4QFPC+dwT1ca5m95nCYYH17Wwce+tQiYFx8q2tAFpIaojYuN3WMusc7
 xqZaRg4sqWpswtLOAmoru7s5UNRkfkAsGCRyPzpYWWpuxiqeX5W9rJmLAp3Pd9UBnMrS
 4Q208IjavLweGZ0J9BkOT0HwVVTeRpLh384tQ/ByyYqOgo4jd1vQtdqc7VwmA19i1Bem
 TnmzM0xs4WIKSLD1gFuH1bVtK46nyfcTSFGPdLDU7AMnrD3wsMUK44hqBf1CD63cLNyx
 FePR1Q3Z1bo11dU/NN0ur5NmrtsHy+V6l5geBQtVD8MliaqLcfyki9RrHHX+qs8r6c8k
 hHMA==
X-Gm-Message-State: AFq9FYKK8ahliXx+tbgwzxAxkKazlK6F73AkXbBZTtWQClPrpkrYxR8y
 sX8R+dn22uo196uzV+G7xUdtsJ+1Om5VBylrXRhhJVlyVxJRM6gnpfGKJkUQZA==
X-Gm-Gg: AYBFou1csYrQqaf3UScG/uX5Qp1YiSHCBueB5ar54aVh8dhAfgmYn6t7Rd0SyNuF22D
 Gbb/LPRq2ZeMyTV1456Ws2mr/Z5JPjsEG4CVtWTKu21Z4+t3ky66ZaamHWnvfuW9XgKysKMyaVD
 /5xeRbXE2EOMmfHgfEvTemoyLDR3yGQ9vfzSF7ZWJM98vCeksjZD7oLuMlkn/P+yUnY8N6MlYzi
 6rPE3+dY9jrzdV0iQwcOLtRGG8ExUWefloQdd0hOKyMm6zhHlOU6R4yCeR/VSLLQGfMTwoI8p8x
 3qGshJ36erg8vCGDWsgMLWUPHbRmKTWW7jB297T9RncTLzpEHH3V1TEEjDzmxZGWegjhO6UVMaJ
 Vh6ZYydTBWRH/oIE3HRAC0O8xOys/Hvym4ntX9c/bZ/aLUsQEf2I68PMMSxwf82L2zQUOThwl/Y
 Wit+zQiU1EVpiSdpLHQgjtlHth/QOlw8AQKPXK1sOYN+06cpWLTy/ptWEWLJQqhXp8CfvTD86tc
 gY/rAA0SlXA3WVQ6wMP4sM4OHbUtUDT/8wbd88y1YXwndrtk/CVtIEFEavQU4ecovWURQTFYoDN
 G7XceJqkaFTiGgpVH0L2u5y5bce9TCcJnU4m4EvV08G0c8bLXCULEiTd+CYiPRjeW0DaDqy1uLX
 clgC/39ndW36XgRq62Nqi1xgUYnW+tqQntdf5/zq6NrfeY0dtKqlhjVHrcvMfM7GMVf0gid64T7
 GpnUUZ/Cu4SBDHnrUswa2reLs=
X-Received: by 2002:a05:6820:1612:b0:6ed:6157:4983 with SMTP id
 006d021491bc7-70b887ff665mr2117746eaf.13.1792779511386; 
 Fri, 23 Oct 2026 11:18:31 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:25 -0600
Message-ID: <20261023181818.920329-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-certifi: bump to version
 2026.10.23
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index a583c17bae..96b977a4e4 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
-sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
+md5  9380cf82be7f2a74885ca68665b4b12b  certifi-2026.10.23.tar.gz
+sha256  a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd  certifi-2026.10.23.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index bdfb8ed12a..38fa5c8f22 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.10.19
+PYTHON_CERTIFI_VERSION = 2026.10.23
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
