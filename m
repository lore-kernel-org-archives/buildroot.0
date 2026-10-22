Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DC606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FzhZKiYn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=gMyPfcRc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D72607E7;
	Thu, 22 Oct 2026 21:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WYGakvr3H5S; Thu, 22 Oct 2026 21:17:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DC6AF6080C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703841;
	b=ih9JC+2bZM9TeXMMT6l5llzIZ5ah7DMDug9SDiLufHt4Oi0Z4mM/ejIsz4yxXSkiSWbr
	 b9UxM5YU/1aGolMFC/NhuqVsVpapxlHzfvZii2Qh7Tn1vIX+THHLTM8n88jaJGkqQWIwg
	 aybU+vvKjwnipOxyFy/uDf4RP/xuoqoELzgKXJ26VC7w/wuUD40lhH6CrHpM9/TdktJwQ
	 uVOfc7A5fuoV53gYdQ10yHov+sqqHepbvMb6iVcwoqs048vEzUimoPK8+iBeK2X1ulOEg
	 Vf1iTAZEWL593LzBJ8GMCV4Zk8FtT4++u8LaqJY21/QhO/ced4XPeAhbSsRaumYYPkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703841;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4QddBYpAeb3EL/rGc8b9X4If6+zlOdibe+xdjJ6GKW8=;
	b=BD96FMoDbxb85Xu45guOTRdSMnV1mQ/+lkwAEScuqrCibSV2ndIbHOvYt+f7coLUTEL4
	 qVpM7ARc1vkFvrALiIBS4OQNfLf6gaK2uzdzRKRKGpSiCdax1TMp1g+2oo4rsFyRuDmP6
	 jWU0mvX1/ckBck7V65WrGMZNVBP6J914JAwbllnjBZ7x5jNmpzJ4LXG9cW4KoJTD5FYkL
	 bQHzhmIUOMEduCQITOMx37hiDKiH7iud53L5rk1K/jvSGqEaQ+eWZM9lOn5IB6z8FfJxn
	 Qe+f9t+q5tzWHX3+4R942RdsGxQXDLyaowz5SceCO5L6MUcmWVFZo5ZM/xlESY58XfQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703840;
	bh=4QddBYpAeb3EL/rGc8b9X4If6+zlOdibe+xdjJ6GKW8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FzhZKiYnb7MgAmNwVk19SyAMLYZi7nq3ltamnEXkyjr9VLpjl6t4ck/yLW3vh0TtQ
	 ianR1XCbtI4f5AX6MHZDdr1VRX3kmKrAwZm1+t2+aZTNt4dEUwqRkyHHgytlIa02QB
	 AmLBKNP2L5+G3l1XgUVAqRUZGSxDoytu3+4V0VFqgqq/0GWZi2PwiGIBhS/3pNtfL7
	 8mDB0rfEEITojI3BRZFxeknmi7PptVvRvD61c0zNyo4rJa+usQbMyrOcJetctXXmF8
	 RveVbdQdg+QBqWSKQDD/K82Yu0C8QRY1iFjAO4kjDn9I/te8YNk0wb2tI9Bw2UkiWP
	 PK31byv7wkymg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6AF6080C;
	Thu, 22 Oct 2026 21:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E1C13C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70DE740960
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYbZZWn-r09G for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:17:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F5594095B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703838;
 b=YQz+e6kWXuRb9UefoTb+m3IlGq/Ci/2SLNtiL0aG6Q1aDSJr09wzQfI5xpnzZ4cfe1hn
 ewIdohaz9f8VBbHyXelQYUC4MS+fsLVYWGnkM88gX9H4RGY/CpsNi62P5W5PbQ6jDwaE2
 wAEHTtqugYNcbt5NKiXpkuA5+KB7AUQKRnxlU8ee0L+FBsMXDeBcnP+Qi+oFQVsxqeH0/
 0SjsdJThOv2+t1P10+K5rMwtoBnW/tB+h7gEFXWOrwjBENSTgc4k7WFjeu1TCRPpPU5Fe
 2CVfAVpCr+g6qDs7AqLpJoqxdsF2DydBB/1y8dVCKO6rSVVFk2jKfbsCtRRvxKC5Dag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703838;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wnQuvjFhqRqe7bb2NGStTtB124n/MXNp/TtggdsBrws=;
 b=AVaDZ2aEp/A2Rrcvt8n4sFR2bzUGDajs9oK3CS+zcx75GEx8ZtE9jZsqTRsFHnCN4q1O
 258+4KEnAlX7Pjz9AC5/UApP9UN0LEzSjk6ne8e6glVhFDthUF3XU6bRgkeKcFgvsMYX/
 qMokAUP4DeQM5hgM0QA6PH2THrock6klZy0mX6HyPc8d/SZ1s3dfBx/1rKKLf3S+b6ACj
 Ax3iaUSSLApwP3jA5PVVt1C8XoahDMyLsBLhvKN1bVktMVFnI7lbDqg9qI6DwEA9ZzA2c
 Uhd9bhyt1yvfNxh0qGVrTXn/j2YHHbqy8BHwrwfeLmXDuztkRRZrFLLOKptXIL1Dsig==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gMyPfcRc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gMyPfcRc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F5594095B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792703836;
 bh=wnQuvjFhqRqe7bb2NGStTtB124n/MXNp/TtggdsBrws=;
 h=From:To:Cc:Subject:Date:From;
 b=gMyPfcRcnTwGwAyh4UkF3lqtQI1qsFooXqywIk0VQwW9sXPK3aX4+YJl2NbrYWGGN
 SjVBYz2/hfFGOSgXH7hnA4Q6wcE7Z7IweJVviOYRZ1XaGoCj8DgAUI94IKlh29ZHHU
 U09bKzadwr5CzD1DTeolo56U19kB9CGfIlSBzPHbD2VU9guli7umnrVUlKRKYERj6B
 8XRItWOm21rsEKOI/391SlhnLxdZNUbr4pLi1pj/81dsTb2W6Mzh0NM2LaeCgInstf
 /OOGsNpg/bcZVtOurzN6+j21CnNg+g0Ur6rS7Ny3TY/KkdKKZ6L7Js82MWKjLbLFC2
 Lr8nhOEfgesPg==
X-KAS-Sym: v3:f51bdf72230551df:mgwc2np/01HqnFMRjXCerrzaou+iB/8xK3BNLNpxtDiUa
 2YrtBSA7JhjzUDu6SAj10VNUqRRVtWj6Kr4S3AJeeipvrmd2DQs6A/LpLQ9jzrWOme9pODRwTCH
 kIffcseROQ+h0ke43l9w7jqPLLmJmtLv4MA4PYRV5dLD+jNxS9EnKV+Owe/R282ti35GAFDNj/K
 RKVjUhQ4wj+nKy+tQwwsmoyKe+iUPDcq7Cz2MFCVs+ZzlBkEc1XkhEJVWVTnByHTUhZ5WgDu5xf
 jqj8CijhQYFGGpnXWEnP9IHyuOBGq/H1imXXb9hWX9BmLexFWtgjAP8EuTYbvOSF9ZFrsQAQ==:
 /89W5TAAF+Oef6khF9xd1nFa4XrQoFyG+DPpOvTwvN1PCXGN6Loz/GvqoknohcQufbAVnDqeyhE
 lflA98z5kYpg49+tf8wW//atlYmKzJryCLCVfI0vnNF1PdC79hLNUAL2Fv8q0HL48qs5fe/ai9G
 bA01AnWBj/OirK6Fb7LXgnTteXUJhse97wWYRSyglk/NcCMlHQiMkcEQP2y7hD3MOFxSfamBu1t
 2ESsBvd5EUVssiOmEJFfhupOhTG/6EGwd0o6yjY0hefHSQJ3FWJMke1ujMTmTul7CwpXmRsyJ/g
 /8H5v9/p+fGkMcW6GlJyEEyUvD7g58AQ8HgNaIz7WeP2mmdbpcBau2447bwahgoZBhumumTFcTH
 UxEdgxRNPtGDqDwixsBthtO2PqsFXOfoQkDuiRIdR3AQW0K8fOgsMz1A0mDuSuPG5BWzukCrUXa
 JpUGpx2LGQUW2FZkBQVWQDSoKwmIhoHM6sBx398In6VP4iqDi2agkPLZCqpHCZKYuXyg+YTvPSq
 43gYDpWRxYnjCMMxBltVuMSoAo8dAUtZD+QIw6gMtd3qKNp9xoXTvwfaeIz63zA2g1xHzockBCr
 4W3+MK2DRrRZemK6VXjtYjMGETZaoTg/XlY4FNL/5A8MtY65v7yRm7Vif/k9330=
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D29AA4C65DD;
 Thu, 22 Oct 2026 23:17:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52012)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xK09z-000000005hY-39U6;
 Thu, 22 Oct 2026 21:17:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:17:16 +0200
Message-ID: <20261022211716.1449715-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/python-pip: security bump version
 to 26.2.2
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://discuss.python.org/t/information-for-python-users-regarding-emudhra-emsign-ca-certificate-security-incident/109576/3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 427cd14ddc..445953d08c 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  f7e8dc36dcc6cdba3bf5c426ad076902  pip-26.2.1.tar.gz
-sha256  f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f  pip-26.2.1.tar.gz
+md5  399f3e6053dd52028d2b60384332cea9  pip-26.2.2.tar.gz
+sha256  3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f  pip-26.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 74c789e097..a2efaf4918 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.2.1
+PYTHON_PIP_VERSION = 26.2.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ae/15/4500e320e6b101ec3b719ae85b697d9940b6cda672bc555bd6016fc60c6f
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fa/e8/0842d757e483e895e670f655084cfe8b8c72580c6769a76b30b2789a0608
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
