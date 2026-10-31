Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E54606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Dr7JfbVP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbZyUrgX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 331926073B;
	Sat, 31 Oct 2026 17:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogGKCBZJuBHx; Sat, 31 Oct 2026 17:20:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D624660763
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467250;
	b=aJkbQTtwXj6lw6O3jRQIa71tMX6mpHSTyeclOjnaFD9bXJBGuOhMwLq/iNi87Sg/hauR
	 uNrXBBWAZlTXTypNkPR0TD1rrkSUcy1vuskv/sq15pbZjolrJJhz+luHh/T8jdI2/pGZB
	 AlWCEZHFWPdLZ/s+KSv09sN9Wz/2tudbehysPme/zu1/ecx9GAROpIedHhdY7zTzf2sIk
	 +9jYJf43OYcfJ3zNkq0JpaH5ra/D22eGp7sV+0YSP5e/p0QkFs+VXL339gdDtPjpL/WM1
	 YYAnH1E0lIsPWHp8G5EIOVgvJlM9h9xt6cKT15t9fdPT/jYOkMCj+4gJF8cjDhKg2FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NR4drECPdug2zjJd97oOpUAoZaiHfHFQOdEg1cLgJZM=;
	b=OREwcaid3JypkqIVDZvJvnnTTGYcsmK0aN+26Jk+OqBngZzKkf2wkGu0XWC7sd1Ntz7c
	 8kPS2qsB2LBnWBYHc8vOhKP4lsSqIL10jy06IHcSRj/YRxWbMjtrSPe1+ktaa7GgNuB0L
	 hj18w70+eHmpu3fV51NBavs8u5tflFaEuhG9bpoc0EgmaBEay20yPEYrVPHbu1kAYuYoh
	 tA1LIrNhkaX3YvSFZpLJFMb977O8e56CcP5qELGEz+6pkGHfKafZNasdOdtaKbmOyfagf
	 i9JZaff+V7ujdeJmZyf+XJvRCu26VM8yVoZSavNlbf6BeOmtHADoHCPBjBXgoo1C0WA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467250;
	bh=NR4drECPdug2zjJd97oOpUAoZaiHfHFQOdEg1cLgJZM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Dr7JfbVPvB1wjnG5/RCOPjjt82HK/D7Ylc+6rNDtiXX8DGlNvDPwN1N1csC/sIf0n
	 0f7KYx6Btlt9gC9HesGXXc/ex4A4oun5lt2ua16t9lw12RcBVH+OdRcwoWCEZxCwxo
	 UeQPm+8thE5zbZW/PqY5UJTZaj6EPDS5NfT6GNA+Lq6lx+SrqO4wbEM2Rtr73ZmzwB
	 80hDwznVSMuIEy5C5WKro4NOtVijqR61UoHPvUXRwfFcA0BUMDtvIaF6EXxb8nVCpY
	 tuYa/Buk/bcT6hwvxmQEYdRqDkJfXsJsmyXS5ssVJe38SNcICb+Q2ATLwDUYitvLJv
	 BMH5U7IpA1Qjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D624660763;
	Sat, 31 Oct 2026 17:20:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74EE0529
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6037240269
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjEk1P4gbNCr for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7DBAC40012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467239;
 b=ahBE76fa6W/QU0c3dFp4pBI9Wh+ySU1E8bpU67vpEssWDQEt7AIMwJwquBzeaiaf4oIx
 msXF6Vy+kwFdy/m0IolnIgl7ndmYqKyCj+GC/QzcemyTnBDeio7mlIKl/nhmwGictdkTO
 5scU0Dqc9Bxz83QXXCS0KBcGHkYsxegtcwRTMNvxTPeYR4LnzgR+V/KPpJaWNpB0Qe9lh
 3sKqx2EIb82U1MnF9lea+17+c0khLxo7pM7ySlbSn4EKMTtaQVWG9vkuSpyVrGkmzdu/V
 MJdNhTIETfON003foJ6BKJtsTcmwUMz3+GJ47NtVMclkHN/Xo4kdZXywtvZ1zMGCiRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467239;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=FFtOMIx3ZLUXUM1etShD2tW4C1EK/8vdPGI27dVR+MU=;
 b=IrH/B7Dx4UbncIoE5qPK/+zTYmCKRPt3r8DNogPKBS/7uoS7TaZWu++6Of0VNXTlo3sf
 mYMqndsDpE6khlJdzOnArk+UxUgHh723zYoDMsUNWF3CZfKd/5mWD+/cq7A7+3UPOA+ez
 K1Q3l3fig4W1KwGTPKUlAAISwHenDOaUGLZrbUsVifacefzbJrEuU8kg3dw6SM8caEKui
 riDeqyc4tLhrzwCGFdipBAkFRXx9FPczkcuaQT38OuQErG0x8jRMVhE+ClAxO/JnZ/t11
 KdphAmvXp7pxZztIyKIssae87wluXifeGuWxqJB2RcQfUjO4EMt5w7ddgooYp5IDtSQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=QbZyUrgX; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=QbZyUrgX
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DBAC40012
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:39 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-843a4ca671eso733188a34.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467238; x=1794072038; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FFtOMIx3ZLUXUM1etShD2tW4C1EK/8vdPGI27dVR+MU=;
 b=QbZyUrgXCBWQ6Pc2VNNzj9ZApJtkKxxaM2++r4U5nJCq4wpg8WJAegGEZXBHHDv7Xk
 29insxlwvEEHrbGjxbznxiYh1+wmBErGQ//5I/6Le2TXC+5kzeWb/xOymjnwtLhhbSMh
 3KGft6OCwUf8ItlBfAlb0JXL1cQJQhWSOUWmneCwBCYzJJDevbJrYJc+3oPj/istwGPi
 GWoEQLWctbLy8MaxUyh826k3uC3qYqUl7ECDNQFDGkduUccin6990NUiDdJzmeYDl0Kf
 /p2p4LbMwcI+70E1uSNXx/ByUrCmlFTj3A1B2UPax7IiPLamzX3WURM7+fnRu/+dLPSP
 vBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467238; x=1794072038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FFtOMIx3ZLUXUM1etShD2tW4C1EK/8vdPGI27dVR+MU=;
 b=Xp3HpxcALeVhrhNwiJybLwJqPWNJhA1GkfCdWnTt28/cjkIxpo1AK0tQT2LzFf8jNq
 a7UMgzky9m8luhDE2OpMtfzvFgT6OKaS7B/257skPYjF3l6JF0OHsYNMMUZcBeQVkO3+
 b1cbvCt4ouBr450/ta/Otsx36DB7GZfIk7n15lsLmbhDF13lTyCqL8WoKwqapJKCniVi
 D+06dm72B1l2kHipObfFNYpL7uN/diKS0In2RvNItAz4Egncz5FV9mwsT3pla8wkIwe5
 +wVYKeQfn1D+SICvHp3Mk+v59IVkZM8t7ubdgFDujlNrmrmsHluh0Lg5dCFAdFiOdMuN
 gs5w==
X-Gm-Message-State: AFq9FYK04GBiAJeXB0FCk3zFvqKR+DMF7LccLCvRJl3v6Ky8MeTiaZ3w
 3XXSoH0ZhOmUv13WSnEGK9oFVywz6zTID0OMtVknozwpQEAIDvYTdUJr/8w46A==
X-Gm-Gg: AYBFou25A76a5rUQigVZ1yypHsPS8rvaX+UaRQrT2maLx6g4cQmDIXZX/C/Vxv2LPlq
 8XaAjztjtqLBekT4WAidkC0PVnwgXZJv3BlsfwKvijcSXwp5zmQ6z855kDF2mX/uUCfgvscdj4L
 d78TKyJ6ibXqbiD2EAG4GuQkst29yIfU4UlI5iHXwMZqKl2r/XC38pp4kvfgnoO2/Fo2BW+2TI3
 DFFNlkxLRorTc+RMKXYafOBegjYT2DTtbAKYbYgkzc2AnzgfDQJhpOTYvtrwP1HsI5fmJaMh4zo
 eZBe22s03gHDBHe8yn3CB4QMl4u26rmP7U+NDrFesACQh2jrlNY0lo5Zfp+XI71xl6kee6PADjW
 8c/7cUuKge76fkZX1IMP+0aRl33nn4g/f6cK1j8GZpCC1zg/VYQhvUoUFyQ1CMBfxX9tRWIvGGS
 DTGjBL5OATQlHTG/KWRCw4KT7P6cHlqJTdu9lW5yb+7b5ngTd/stlLm0L47hvI0Jt/JRuYCyxLx
 rWo+tSBdsFTx71hMZxBNy0Du0rN2ZN1YrrzYD5/l1bl6a3VOJYKwu01CSVqGm9jl2z9DXCTsfGf
 Zj8+5P4x+FmqM3YSFMNUaQ7Kj6+kpuy1Tstmpn7NsoRXy3YbJqLorjGgr5yKdHOb8XrhVpeKMQb
 NiAwIoC5pcBX1X83OIPf1VAgfowyvarCgiYjZlJP5LLQGYy9utrYx9cFq06LZA2JN4DMWxwGZnJ
 Ji1+h67tCnPf8PD/OUOys2W5X+4iCjyv+g09B13musQWPRjbAmtYYXeLLCRY4jQWtM4H7MC4imM
 HQ=
X-Received: by 2002:a05:6830:268b:b0:7fa:5c68:d053 with SMTP id
 46e09a7af769-85d36698334mr4130952a34.29.1793467238206; 
 Sat, 31 Oct 2026 10:20:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:39 -0600
Message-ID: <20261031172019.2683287-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-jc: bump to version 1.26.2
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
 Manuel Diener <manuel.diener@oss.othermo.de>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index d27a6e99e3..230889053b 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  dfa209538fe6eeaf2f6462847dedd131  jc-1.26.1.tar.gz
-sha256  fdf1a58d05db351bd597438cf3b67ff7a9653cc0da4c63234ce77fe26051a4dc  jc-1.26.1.tar.gz
+md5  1d3871c419721c433f871b2776de4d69  jc-1.26.2.tar.gz
+sha256  6e57c302ce55d5862c1f7be1c2ba2baa630bea1ba690f6bb82a8c7e734b70fc1  jc-1.26.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index b5eb2c08ae..6649750f21 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.26.1
+PYTHON_JC_VERSION = 1.26.2
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/e8/e0/ac16e68e8e56d0c63eb97d6d9a0f1d0320dcd16763ab288de4ea950eb7ca
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/d6/6b/001e082ba68c5ba0a604a6664afb66a1302539da0fdb7862f5d7a9ff0902
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
