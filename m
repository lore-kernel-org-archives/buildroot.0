Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33319606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iJWv33M/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWoQW2O6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C32E60D7B;
	Fri,  6 Nov 2026 21:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGAReNg5IZ7D; Fri,  6 Nov 2026 21:19:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 209FA60D71
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999974;
	b=OlfNUgE+Z5n7/28FeRQWqb/dCMFtvnGOSRwCZfCqmY6YD1fhb5KGaso3WSF37SQ7iJIK
	 6RNCcX2fSqLxZO/xGO7xOx0aAUBzf/mcnt86FHNzSH5qwNkigGJOBCEkUb3zpurZ1rbYp
	 bIc6SmKcx9XOO8HmzQB8typ10ZLUz89nb4o1UWdt2TkK9PkORL7JNTooefkPuNZe2cfSP
	 xObi8R+rtDHvGONak8GaMQKAdmVXzqFU+VP5OMYK0FCf0/WQA32F5H74PoZ1tWoOgjCV0
	 4Rnm6MhsqqO484RNKtG/mDHATbQCtqJ/ZDvCJF2HDgVdXz8u9MHEACgOGfp6nFVOLJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WO1SLwsCzBnxjPI4ZXx4EZRduBk2CoRcZeMf52KZoiI=;
	b=sKvfDP5DiOFy5myI6OTRTWfGVwia1LbBYuBQWPv/o9MHNjuOkPqqIrpC1OZA07vFZSP/
	 dOcGs5m1G6IJVNzp5h77D6OW87xjarL275xldhjZ4fkrbDocMe/uEC4vsK41VhSxtKQ6r
	 rN01jtaqYxpqtYrxMS99s8DysLAfJbvCqfwfklMnPAlnM2gXVuIodwqPa8uWiKwj9RKvV
	 lS0tltGZMy92zBZ4ifFURSOIs7j55g66/ahL/9r7s/gXnyIa42h7jXKhtNWBKCI1SbYN1
	 WieYo+yUU20AxuMiN1aYe+N0hX+P8Tk48V0eQsAoS7NMMm1bKWUUzuCdl0WWrbWYy6g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWoQW2O6;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999974;
	bh=WO1SLwsCzBnxjPI4ZXx4EZRduBk2CoRcZeMf52KZoiI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iJWv33M/sXUyjsBvE2krr66oCkzwu7P0ox2vQ/js9qno4dSRdh3YrConrMaZIDFV5
	 B/cLalh4LV5eF1PBvGPJOllsWJmXhoILgxh3FLjXEUlEn+ciOVSXXZoPcqwbtYcfhR
	 HCv3X/HaKbPhrg3MAe828ahmdQxbSM80i4V7lxfNNSrfTQjp3WKnbbQdwkyYnI/mo1
	 h67BYiHBNLJjSKjattYr4JO4KCLx9M5Rc6pfINWujRqlwCLXrAH4VD7Z7P+IDc0nqi
	 FUC+mYjrA1QwjkAkYgsChjFW1r+xxxTwv7Bs32iho19VY4hGWEoDHi9E1PMD1JDGOi
	 fl5v3m0VGjLng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209FA60D71;
	Fri,  6 Nov 2026 21:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0FBB31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2D0360D6F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKRTgCBARkEe for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE4FD60D7A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ZWoQW2O6
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE4FD60D7A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:31 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-4adba7b3399so190004fac.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793999970; x=1794604770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wYsI7JKhBYGhA7DKm9AgkUa7WJvULG3VvFZB2r6FgT4=;
 b=ZWoQW2O627IsD0tgkIo96XkEBXhMxqMHRoDByFvtEgQDrbhgEm3uBjlZVZ2MtzY8tV
 d3tCHVQwM8AXOcaL/49znMxURHwqVi5zVpC5l3TrcmvoVTj6oKzys8mAANgPvk8v+6JK
 Xq3Z/QghlSVPhP2OdChyfv1GrgOGr8CiR47Py7s2LcE9dgABFG2tgCv0D48q33Zelqd2
 FS/Lga+q+Dz0sCh7qkuNRptcUv4YzihbCbBP+psjYAvCSbAFqwRI9lQoO2wa/Zw9dVIe
 JG9aJzjK6L+F+kpkOE3r95hMj2sj0lDpR3JkJ4j5yhF9TdWlab+lds2hkx8uLnGTfCCY
 gw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793999970; x=1794604770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wYsI7JKhBYGhA7DKm9AgkUa7WJvULG3VvFZB2r6FgT4=;
 b=AG2Zoe8cZHUxaJyHy8rRnRpLFUBKGMleYeyzaM/xHNGlg054m4yQ48Nn2GqBIh8r+2
 9PJDHpOcCHvb0zoZDRdPKIp1AYgQtCzv65rR4U5iOe+FvS8PA9n1VPTrpAoWQAiHTg4h
 pbbZv1NYk7DsdITaqlFgJRnzPrs+xpg2qBhwDbKXLdgqH/z5jjNwkZNvGmrZp7yP/pe2
 BilSuUewIsWroJ1mZRD2FXiF73BioA+pS0/n1MeskfI5gsOf60lm87kgzrHvFGsUpod+
 iy4AOHgP3uwN2+mVDASgai2OrzStJQLQi5T3IenSDIwJUyc/uFw2ehJuXU2zCdTT4SNh
 Gzfw==
X-Gm-Message-State: APuU4Z+N+YAPuXmYwKhIP/25YzclipPHd0sOyQJJUigwLUvXd9mBJD0/
 ZXqW/KI0DZCHSUiWq8xNAm1hJsBpewQrysst2axXB3GOeTtMLsO/SnCq3esWTA==
X-Gm-Gg: AYBFou3mhIBLGdhciitCYBMDdapmuYEF4TqFrsJSCDprFdc15Cmq9fpx+DY1tg6X/T/
 zAxD1jou8hYQuVw0UFNpKKvYv2TRNSNktBBNH80szTiSDpGVxh8MkSHcaXxVMUPdGd/9hi1jPZY
 ASGqO6EqMSiSNGOXSrB/iRe6yCb9wy6GTIIwswzyj7IprAmkor9NhsQ4r8RBa32SqBtTIT6FV6i
 4uiJ/SFdy9m0b+cv9bx8iMJPDxxLvZduhUPIy/sO+81bdMIOZVwJearPvO4QJF77hPN+R/KR3h3
 IiaWD6MC8qEv8F6m7M4VWcWk/+OzgW7SV9y7fNyYWIaLczgw1wpsVyRNzI8dL/m5Kql/radc4gP
 c9EkvUmdX2e4pwWpvgmjc91c9HW9M898BwcyPuMgJVZxeEeSoUucfDss0e83mhg2YveR62PA4N3
 z9BOd6AylyFfS2pOTjoatH/asETxTSkKTtH2OFLI5/rqp1YNC2RdoSqsT8TGzcBwxLIcfkJvhBQ
 3vmgPXV6shT6JEUitnphJSaYJu/Rp2yoZVnf4v2ef+mF6dbgJN4IbeXXAS/pYBuWkOcVx+pQFzh
 H3DpQbWUUnMAvsKBEtjk6A5aE8IuLRL3TjgVBX3UbNpDAGaE9ojxRhAqHW8FRpXO+aNMtrE0riJ
 iLCRdY11/rIU0a3MAwMRJpweAE00xgjWpFO5Bg4pw9WXFwAue59sibw3APqadTy0meKZ2X/49pv
 znVxY2GOD5bEfKY/QUdKDaTgq4DyQZEzUhHaO5lnsBQUC+NphodNE5VBgBTWreACiwKB2epKmw
X-Received: by 2002:a05:6870:b2c3:b0:4a7:8aff:348b with SMTP id
 586e51a60fabf-4ad98b802e1mr2376277fac.16.1793999966004; 
 Fri, 06 Nov 2026 13:19:26 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4ad979d7032sm2873593fac.7.2026.11.06.13.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:19:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:19:12 -0700
Message-ID: <20261106211918.2606369-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-selenium: bump to version 4.52.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index c17ad00388..54a2ad9b1c 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  56d83852139d542e3d53cdadbe52e80697e08e91b7c804e0d4d8f0a495d793da  python-selenium-4.51.0-cargo6.tar.gz
+sha256  1e728ef2686db6fc1d1d6c6ae85cb0fc438808acab78033cdb28d1ca01f9a40f  python-selenium-4.52.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  307012b4481479a56605420e81db14686a0274d246d06d224c363ee09297d330  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index e1d288cfe6..92471a8c01 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.51.0
+PYTHON_SELENIUM_VERSION = 4.52.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/c3/d3/c925308af2c9b9a9ccf531cf23ffba4f38c0d750f088a06e560fb2ca0c59
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/96/07/d9a9ca4bbcfaad6e07e8034ccd719ef42032ab25a421fb9171baad4ed734
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
