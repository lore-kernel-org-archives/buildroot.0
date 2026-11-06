Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0696606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=juRwPDD+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMuiWoMW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A70C608FF;
	Fri,  6 Nov 2026 19:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYFYOcQeSdCM; Fri,  6 Nov 2026 19:16:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87A00608D4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992597;
	b=NtUR9LiR1G4lNjgMWmXI//hIzUwqmlKCwELpBKOALLaTk+Syb4ZKFqNuxW0OAjYFgz3y
	 v7xyFZ2XDQ/JgZVadxJkyyvCcroV9nIj6DlIN+I5rHjli9Q2jgTbL5CE/HP1YqQwTpchq
	 Bw+zljk1rPTqkGYYvscBcqHc5Dgh+XHfy3ldjgSyYsAD7BFb+Xi5zvGzKSxaGzS3If4r2
	 nmEfoKu+PJQtZ5MvEvteK4lOIbJAAT6JIXXPSy09lXWNlC6NRqIObN8oo4dG0nmUfqTY1
	 hW5MtFUhjZtqeDjhH6WnfJcxQarRQxjy7PfYQxg47BrM3i7u+K6i0kN3jWAd3XFz/CA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9NpLmfdF6eK1u/zJjlad7sIKmkzrbJThQ0ch8Nxo5Tc=;
	b=M/Gw7yWH4x3Xe4SHsNaAaji4ABi9Y/o5+21Otcz2K6t5T+TgXPToHqrlJrzhRXeSeW9m
	 EM/8kUs4Z5oeGP4JyNMHhIQne4wxY1gaPNH848lGYtnRXLqeiEb/R05BEadhli/wimolx
	 oiNFE9rvShlww8Sb3LtkTn/fhg/wFawV7ErMSxyK2j6eVPQW+u7oTcjT3GF1Ovilg+pIM
	 xa1AWHzOPiIUfmBOuvUAyczlGkYM1r2EWrPZ3gvhCWPSBa+D7njPfRF3BuuXHUUQDG2f1
	 BfUwtOH7fmO+ZPJC8DOO6jlMZ7gqFSJ75zllEV5zGclT5JV4kC+aJu8ut4LIDc83ZWQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992597;
	bh=9NpLmfdF6eK1u/zJjlad7sIKmkzrbJThQ0ch8Nxo5Tc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=juRwPDD+WpMa6e4zTXklZafrw4byFIfWol7Iqt7s0GG7kqjT84xrCWJvu5RuQU0Fs
	 S0ryQMpzSN0seELsXNPAY+3DmbbpITnZc6DtUdIOqbN0LzMgfQC1UXEBkZWD73YidS
	 l2Jo5T8YjzvK5I3kzqJCPNt6MsRpe55rZCevRgyZN6g4NANjajRJszwkw0Gm44b7zX
	 UHhf9UjVZgQzZCyaYOGIlYf3gq3I0LYQEToF4WUqx2+eGjBl4TrHpmy5Cis3c09mZX
	 JFiNybomt81aZhopiStVphEYcb0WfRDYbDsICoKhXJ4+mhQupc1T3lgAf3XZlMiDeJ
	 8J4E3XyvgbwOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87A00608D4;
	Fri,  6 Nov 2026 19:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD7C362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CFFF40467
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOkAh0ZWLT8t for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C67440437
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=sMuiWoMW
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C67440437
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:30 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-844a8bf7e25so579879a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992590; x=1794597390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1e92XuNOeld/PUXchge3hT6W54e9munJIJHGZ2ejSLo=;
 b=sMuiWoMW1yB9DLGTtGworlz19qnoCS8rSo+m6OgoUOUQ2b/8PQUBx6bOMd7t/QbxUD
 IamUSsTBBZsgW0yPv63WEj2opSkEeDHwugUpAtl8OvQBAPZrFJCIwT8zH3qwsmufO5d0
 XydD1xWR6xjRzYb2l35sAxE1CSCpRuab+y/+9MI0Nx/l19HkEHSCw2n7OhJn0d1d1Mxd
 C04MnulM95eRtbSuiN34bLMRB3V77KWOE5xKwR7GI9SKpDhfM1bj1B76eztoeqaz7TPx
 qfh1DFzE/WgtpL7/pBoZL+L1xP3zpC912gfRgwl6DSEbEFMeuaOM574Q7BQ4kgqldcnR
 3mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992590; x=1794597390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1e92XuNOeld/PUXchge3hT6W54e9munJIJHGZ2ejSLo=;
 b=c/dX6jPUkVQISnbOqPjPhu4RqMvVB7Ts0s9T0YPtG25P2E1JtCVbnX26qHWfze0dl+
 nTFRB1Ixq9R9ksmlUJFRsRIqD9vRzeW0C9XZ8+ke5oIqEfsrmjrxt1cWNJRcowsjYTVJ
 ttaMcUQG+edWf4J2SjkO9wOoRbirZ+aimB3OsXCPfB9PoP2F8qPaRBItk1fSVNAlNMyM
 89H73g/KINdMazO2wi1O0ngzFs2Jn7ngQcwhQuw1T+mgiK9y7QPgx2IbzvaYsWut3Q1X
 BcsYEarRmyjQ/JW2/acQhGoVjidUyUvUhwTZJIbCEMeyYEao+VGBHU7dL6XtpZl6Hln/
 rHjg==
X-Gm-Message-State: APuU4Z/T9yKEFdCmhWX+0n4nlBd+qzRc3Je+bpPN8Xzen/q0nOPRrbIj
 XgvIdA3rZxeGaUgjqQel5bi95dpY8L+/Pb2cxwcUjqcd9DX2mVx53cRgOUfV7g==
X-Gm-Gg: AYBFou2rFCYSCe2HtFVvjzVJg62/UYX4Lch42uXBGb8xhPSpE9YZu2PVmvcE3dg88DJ
 XPFff08IrjlZi1Ybsw/v85JwJjmcOE0vctWxkibttEKSBm41hzo/iwbUv1jWSNweQDN03fITpTa
 PUXSAd8g4PN0Y/ipbdV6JOulfOWTsgxEUXEIZOzvq+rzZ41BCJwR9qFh+2W50oTontExWDTqTAF
 aKy3jKCs4b/MfTPnU95mf1Doz8oYIpgtgkfebKJnLHPFNVX1uuM0ap5oXvJLXHitgBtdwJTj8l/
 UBSXlMdaPhdO2FeDxwO1KiSjn3qtj8Unm4VgzRCsaZ7g4tOYBbzGRfKQuugHKLIeqQ8JNHh4HyB
 TE0VkPL1j1mUVWRGmcr7+nl04foQu/Axs+4qOJGWwZVu8uJVQHusPJNZreKLsFlAHKfZ8AqiVDU
 3peCxPnM26Czfs21/BGPCtkFvbaNXMwxxazajMnlDS9YEFaK0ImJdm/pBv9BmV6iPZpBpLq1iJv
 YJUirSoKk+3cJfehgWyCCfoiFJ4azBnr4jAfxjphBJ1QDFz9JoeGg1ljNz+a52+o7Ay24OxR1dg
 UfnaHLD6CTW+1h1K+BT1HheCFHwqUUibD6sNx/eyUoWm2qMEmBQnVh4BG3Fy6L03Byv0YNt8ZeG
 qT1qkZN1LXJKlh10qdavAmjIWdV0i9NgG8U93DzQWFsydLbbv20F+0TrjPX7qENUURGebLYKu0I
 T5AfbVOSYfTFzfaLkMiIViQFyAFqMSOkWSaju9bG5Z08vDNgsEo4rIkUgnC6wpL/4F31weGPGtj
 w==
X-Received: by 2002:a05:6830:2315:b0:843:cc20:9d07 with SMTP id
 46e09a7af769-85f1d03b0d5mr3640439a34.16.1793992589880; 
 Fri, 06 Nov 2026 11:16:29 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:53 -0700
Message-ID: <20261106191536.2120153-27-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-soupsieve: bump to version 4.0.1
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
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 24c412bd20..b9d6995ca5 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  af3ecc3a57f935be504f942c52d6040b  soupsieve-3.0.4.tar.gz
-sha256  924fab84ae21604c19e175e1f39815eb6fa83ba23836e09e9de180925e5bc4c0  soupsieve-3.0.4.tar.gz
+md5  51eb4768c710a5dcaef95fdc24d23034  soupsieve-4.0.1.tar.gz
+sha256  7621e3c5f6b371ed2c5eabaac5de300ac3d66d05e6d7f34783e31b63c4f90c75  soupsieve-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index e99770925d..13908edc41 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 3.0.4
+PYTHON_SOUPSIEVE_VERSION = 4.0.1
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/19/63/0b6bae54546aed98d72f12d09df57b19a287f01c84d22047fa2e23772ab9
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/01/7c/a64eedae0b7776cb9602d2da9cb8f8caae8e1b4c1da5e8e87bf1e68121ec
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
