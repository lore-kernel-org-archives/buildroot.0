Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07AC606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 22:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fz9xWNsw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pWpCS3WR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5EA86070D;
	Tue, 20 Oct 2026 22:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-M3DIchQ0PE; Tue, 20 Oct 2026 22:34:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 83B4E6071C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792535684;
	b=qsbhkfJvIYJpE8w/nZp/JXYbeQNrSBEUpqRNbi2D8YpQH5Q8+lRFLPWsrnAGrdcXdcXv
	 Brw5G51/8D0kePx7QCkV1egocwHxJUJl38T1oW1DV/mT8sQETuoWJG+GPTkJ41qG8ZUds
	 w3JHoFvs448KlRhk6BJqsf1n1qEUEiaKMmr/ZIw+HoFv1awg39tTqvM9ka0/G/GsaIqOF
	 TZDpjwbOh1pbu79lwsCsihaalW6jMiXRBxjQ2BN0TMMKeoA1rUDaRbtkoNJV4W0A4dKLD
	 A88kZ52dOqYrtT3KyR/D1MIj1RguH7XDWpy3licHpseMlUaZOlnzkWs5T9ZR5cGXcLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792535684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JvSB2eWvlkkDf80hFYL5TjD6l1MfT6Sjd0o3RzVPSq8=;
	b=l7aCY6hzSShF8HjjpfObKXPde0YkHdeJ2sqjmJA1kasbGMzJ76JchhTW5QzFe1zmoP4Q
	 f0SxwBnv7cV/SW3phjgh7JZpm13ZBS9nAsVNzDhToWok8m3iJPkgmM59XjeNMbB5TXfeg
	 eF5mfv6jQyEPesGgCa2jARJk2q4JUJjGbT5azMaTv0Few10dlkcw172XwXp+ghoWRkO7A
	 zcjq4cNw0jxMxtgZa18DsVMMSWDHiD2mC4vrxlOW2Wb3L2ePPi20NPtShD+JbQUo2//tW
	 dHThYw4pHV8EStYOP0oq+f5DEVvTGoqlx7L5D0+UYR8RKpG/OPE01SqvxC4A4F+lc7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792535684;
	bh=JvSB2eWvlkkDf80hFYL5TjD6l1MfT6Sjd0o3RzVPSq8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Fz9xWNsw8OjX+vn7TpwBxAuMPdK/h2VGr90Aa3QzeY6SDuV86zZywun8UzN/j8n34
	 ScYDa2yYwwF5ptd9qNxNSy4B0aAb4GU7gs/3/S+nKAFRPxOgDFKsj6JJhHzfnb1hRU
	 jLvdR4NxZPZorRPKT+xIF64WAvIzq8BvVuVJEILUzFrXBMgqpsDvXe5eVcMN4zwgJj
	 FCjQZYTemlZMEarZkkSrfKPoyKZSfV8BTFtfnduugbR90RueJCY1UJ9BvxqRagrTX+
	 EpfyIClSaSzVICJsezIntlUTiKQ2iomkNt1ZPzGETYiW7rhxBPt0nrQfCkB2HLHEWC
	 4aK4OF/twj4qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B4E6071C;
	Tue, 20 Oct 2026 22:34:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B89B8769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ED7C400F3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKdCGDGEqFw6 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 22:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 90302400CB
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792535682;
 b=D8or8dMpBOCGT7HD10YanNXd+5w2gyjJEpcSGDpLBm0dXkOSF1n6fWIKZWqHpxv8CTmw
 aefVaEHj+kIDMLB72MV6AXRULeB/Gdvw708ZQZk4wfwe+/ANYJCGCMZgVe6bhN3szRl50
 ctVdFHn8kavFaSH4KImQhAfeTvnttoMJVn+9rjndK8w5QhF1y4BtMRpi8QFxlMiZvc1vj
 8xim5nUIpVjbNXabrJ1c+sebycf8iUN+XVLOIztSd5NSFOtN8NpcoQCL0PoreYDjDEhM4
 3uVveQD6QnIdjdpLOink5OJwOzvjKPkNR7hd6drTcEHOcPNnWXDtD5X9a1q7edpgSvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792535682;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EjGDJE+ePPTch2v9NuTssT62pdn+q6g3BxvP/0KRqJY=;
 b=IFTUqkPQWzFqnmyZUQELIc/eSIfuw5T8GtgwZAlherf5WBi2pSjiaiguqZaYrlhmx4yS
 6MEolWolpWAC5pcGHx8q2HItfxAQ29J4MduDyYB4W7nj/79ZAYQBElO5ybpbfAE6YwtBi
 yZsy6dL7vX615wZ519ycP+mA4H/tgm4kSd63sALXMRZzA64TJBfWtwWcEn5A6nLVFUO74
 ZOnF/f+4+EZNVsq+5MALa8A0H16Vne2MO7dIxPW4vj6f8JnHlpFE+XaM7pmN0dKY2xpJo
 MDI3jj177yoUv3DJ4+4oZR+RYNhlbJtVWXrHjAhr+YscqnWqod6YSOl+ISFl/+mlsXg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pWpCS3WR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pWpCS3WR
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90302400CB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:34:42 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-705cb6ceebaso25535eaf.3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792535681; x=1793140481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EjGDJE+ePPTch2v9NuTssT62pdn+q6g3BxvP/0KRqJY=;
 b=pWpCS3WRrQRqNFofW5voonJyjYudDLOXXS2sU6K82+d/9Qgusoq1u35peQz6zw6Kdj
 eVcJY1XtoR84ntg+qFZwGbhe6U4cSsJMBaiQf46A/tmpY7uJi8PmWr4Nze3+XPrD2LX+
 eDfdNuIoRydppQYfELg9gnraAM2hfXgJ9iWYDBQ8pbzMzhPw+SvbNE65msPzLqcHMcB1
 Sqs2SMqyPgc2N7pSox+jIOSEbpDltGitu0qvjKFwmJ0yJWKbTU4YlNohXVGkII4YuYtb
 LXFURkGZ9gxiQSrHtWkDoKO3KpBdXo+CAQS+tI0yZw9IRfMfQNLctrASzLnrlaJbiVJi
 wZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792535681; x=1793140481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EjGDJE+ePPTch2v9NuTssT62pdn+q6g3BxvP/0KRqJY=;
 b=Cm/CW5+x4tPbnGSKZbIXRNYOJImClNF79Is3K2Ch9Wf7y/iG8AOVYDujEIEPkGIzoE
 jhRIRtoq006+Fok5KFZb8tuwIyr3NU1n7eDea+x4l4phm4oXuHYUJCvaEHUFzgLWj2KF
 xFLBp1Ji4bacqX0w6j+hSkEI6glwe1rXB+1DoJUa8fMLdPygRHSJPtsIT9kzXjA4MSHS
 BGa19e1afEKnnU1SVCj7oQSSdHahNyQQi4kqFXkr/0OdvK5+aMiIhdLRhSL4sqZmoBuX
 UHVE4zzLXEM2cRA6nHpz4lw12UEVC+oBtBxuFMMUMipBG99ApQWLQ/YFrNbOIoKPYsTW
 f/FQ==
X-Gm-Message-State: AFq9FYI8+kLI0n9GNaKcMo5nCbHlLNIDoqXZJOgFGcZXweHnCYV3Fd9j
 2UdESUngEDLQakZdyJ+MiFp+y7mFC4P4dlry/Fc0NpGazRRo1e8m/uL/WLTU+A==
X-Gm-Gg: AYBFou39E2yo6Gsb6OFZZHxh+2k154mYmdpgqe8HdcLbHpVm7+OX0+GEm9D88szy7NH
 rSQc9/2MrF7CC/Q5RBxeErQgz5cH3ZCGpWWGtp6nI9yh+0Ln4hgDEilWW3U0AP1Yr36LPZfhpiq
 IFTD6zku7XBiv4Pu8vGcxNgP31gaS1NrHOnHsMrhbhl4bv5vn614ouVuFV9UBsujTVm+3eL5ti9
 zwhDyPNGp2u+5DA4I5hDYNcaYnxsyMvhngTACCiONifOZ3H3Jv+NKAWXCyE+H0t+fa9+svV4y6o
 xH45yyrl8AUGE00PkPSv0XsXxjeAEsDa9F22S4rkgebs4cRucMUkqfMillY4lfB79gbTpufhzPM
 AD6zxsU91q62MRj0YGtkTMG+r/jdfJ+6+DWQr7+QwgzEjtU7Dss0Vz0zzYWcEYAu6fgCuKAtK/C
 3iNzG4TExPp4YWj8sic+1RnyzmoqdFC2+0VSBwPsKcJPA0Kqvu4Un0+4jemcZHvbhmdm1iRkiwx
 JwNOu1n1y5xuyjgw3hoVr0nJNz3UkxhDQS1kbHPDmQS2R1p5ujImn4HwdUmNr6fHP6Zzs8bSMgR
 RxQp/32+bdz36VsKbEJ+B+4B2B3vUxNO/lmBfFebYXto0T+Mq+QzVCjXrPGKgfe3JuScmsD1oY3
 zXwF6AvPGrJ8YKLjLRtoliP3Kv5STVUAZMgkgCbDRYYE=
X-Received: by 2002:a05:6820:1795:b0:6cd:3fbd:1d61 with SMTP id
 006d021491bc7-709412b97b7mr176984eaf.75.1792535681174; 
 Tue, 20 Oct 2026 15:34:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70902ec488fsm694259eaf.5.2026.10.20.15.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 15:34:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 16:34:37 -0600
Message-ID: <20261020223437.1675563-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/python-nats-py: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - bump to version 2.16.0
  - select the python3 ssl module

Changes v1 -> v2:
  - bump to version 2.15.0
---
 package/Config.in                          |  1 +
 package/python-nats-py/Config.in           |  7 +++++++
 package/python-nats-py/python-nats-py.hash |  5 +++++
 package/python-nats-py/python-nats-py.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-nats-py/Config.in
 create mode 100644 package/python-nats-py/python-nats-py.hash
 create mode 100644 package/python-nats-py/python-nats-py.mk

diff --git a/package/Config.in b/package/Config.in
index f3e84b1484..a2be273dea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1274,6 +1274,7 @@ menu "External python modules"
 	source "package/python-mwscrape2slob/Config.in"
 	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
+	source "package/python-nats-py/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-nats-py/Config.in b/package/python-nats-py/Config.in
new file mode 100644
index 0000000000..96d6ec6847
--- /dev/null
+++ b/package/python-nats-py/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_NATS_PY
+	bool "python-nats-py"
+	select BR2_PACKAGE_PYTHON3_SSL
+	help
+	  NATS client for Python.
+
+	  https://github.com/nats-io/nats.py
diff --git a/package/python-nats-py/python-nats-py.hash b/package/python-nats-py/python-nats-py.hash
new file mode 100644
index 0000000000..6dcee7d8d5
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/nats-py/json
+md5  a36b7917297bf3fc5a479f19bcecb43e  nats_py-2.16.0.tar.gz
+sha256  1d137ed7afc9b59033b3199324c6237df2016a5091935871344a787eba6b72fc  nats_py-2.16.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-nats-py/python-nats-py.mk b/package/python-nats-py/python-nats-py.mk
new file mode 100644
index 0000000000..77b3184ab7
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-nats-py
+#
+################################################################################
+
+PYTHON_NATS_PY_VERSION = 2.16.0
+PYTHON_NATS_PY_SOURCE = nats_py-$(PYTHON_NATS_PY_VERSION).tar.gz
+PYTHON_NATS_PY_SITE = https://files.pythonhosted.org/packages/2c/c8/739b72c9201081e48000884d476231873ac82f7247c43b33823eaf3c0bfb
+PYTHON_NATS_PY_SETUP_TYPE = pep517
+PYTHON_NATS_PY_LICENSE = Apache-2.0
+PYTHON_NATS_PY_LICENSE_FILES = LICENSE
+PYTHON_NATS_PY_BUILD_OPTS = --skip-dependency-check
+PYTHON_NATS_PY_DEPENDENCIES = host-python-uv-build
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
