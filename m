Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2B606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OJ73eJIC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTZ1CoiP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD3760748;
	Sat, 31 Oct 2026 17:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZ6CHPZoYAAV; Sat, 31 Oct 2026 17:21:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9195160782
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467284;
	b=qV3nRJGoARfHumPPmTxOPVfld9reUzH5sTxu4uccgbvGdSN4hveb1dLfIzQfTNfCIb88
	 jSPQFn+/YkOA+TKjQqedioO/vgrRpKH1wG8v91paPUZ0uCqq+DPkyf7s972H5Vu7d8vUp
	 2Gq//YaL/7Glq28By7l/70NsDMrXyNk7sZ/0D1r+JBJ/9LCF1X8F2kVKydbxPAqLH5d7C
	 gGYmSnKi96FUy+vkutXwqEWTHo2KoFh5TRm/4d4bGKarYpZVkirj9s2mHpF7AfUlHhZqB
	 Gk1RRU8qL8CW/5THboPagNDlrs9WHUAwZJaDN+xciCirbvZ/6FJjLRm0cwofVY6G4KA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bepkw/V9QoKdtjHv2P4pybTND10R6hejXE+PsK8QO5g=;
	b=OCoLMDNYb+08GMCozJXZVMGt/OKPlQQecolDDKfFETBM5+hycLQQvWdkDHSxfiuE+x4+
	 facZPlQ+CGSltCKlfUMo06DKYYr+BAuQKBmAboNGyJp996u2WN5E+5O9jTHgLTKy1bQG+
	 aJfgS/sdKJqH1hDquzZh8fPETtGR4Qn9w4r20+TLVownXQPhopbVOMSbRt6M1CgM0pKSv
	 MZ58mBy5bIBRwxid6cCRAG0SCeJgAnbQ6fR92IK/xYWiuA3ptvkBD0MNgD5+yYz/2d3Dv
	 hGWb5vlxw5Iyhq0ktmHzKFjffnnMRqZQ06ggihP5Y1uDqjRUBx603DXCjUcAn16i2yg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTZ1CoiP;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467284;
	bh=Bepkw/V9QoKdtjHv2P4pybTND10R6hejXE+PsK8QO5g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OJ73eJICsqk7ksfo/3/DYFgl+6n6an94Ca7Yzdxk+eVNtwsg75K8hUi8ztQAQpl92
	 9hfeIPD8ZbvhTMhJO2crfYdgJcN9Byu80is+57au0vEHr/dHAFEp4PsgU4lhLt8Msm
	 1tVyvcgh1goofps32/Tbdb8rI7ZmVtJ3Hdzkve9T72eXzoxuwnBcNGpc42ZVZ27nsD
	 vmoO1BCi02yowLPUN5RBhdcbdQt/adBIuW8aCeLKmQWeVbrBofInf7pt3JZyp8/g0P
	 wzuTzPPYGHeNVzyIGSFUhLpmG9+Qkz5e6Hn36vOZdGnPi0VhPl1oPbKSa8Odxfq8su
	 WD+Cz/kAxt5UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9195160782;
	Sat, 31 Oct 2026 17:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FC3D4E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40788607BB
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bxa67cBH5dmM for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:21:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B6082607A6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467263;
 b=s92FQjtKsDeSjZoOBNC5uJwluBWzTS5Rd3ifawc0NtkJhwk7EjS7U36+Jqofu+yM8EB4
 hdztjOlw7wjfqVNhTEtaJnWpCbxIs8VGwjM+aNM3BtaFTTRKsjdV0pClAhyoRprk4Nz3t
 2KFRYDl4aclFToDSqbP3E10dgbZXJkZ29zAkcYAP9iT/IIze8NWkarxsMGciRMTGhJ//P
 gwS8sxDvo4mTMga3Ybjr2a1mVHSYVyFgiXfrb2Ejynjjl1OGOrQUmlCxehZQMJ2QKYq6n
 h3sjQkC8H3JIe6kPbsu3eddpcLu7Mbz0gnIMoQZP3nrB5L2gT5w6R/ePgmfjLYI79eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467263;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=NsnufSiucuMjk3myrADd7JMWwyFrfYi4BdhFvW/m7aA=;
 b=Bffx/X2oS3C5XtxeQ+i7Iv2M7nlFJGNUBU1WvHzTC855+zhAnDb4xmCdP/oNvVNzbTpP
 e8sjfMsaFp3ChAGqVNiFvm6b37i0ldblpxK0X9/BQ6n8BX5omfgYDG4NfXcH3E928vUvB
 5CSksCe/J5prS9Gj7pY85CACYTdO1YYY94Uk1aBq1CoKBBojVzgHRzgpg6Mi14qOfpTaG
 27bDAW/D5pTq/ixtnezfWbQcJt5HwX/KKnqR/hiEd2aGm7XrNnkKxrrOcLyg16xMoaRRc
 oILPyv88cWFFpfCbEdQi9Rk2YhFQabxCnzCuu7R0tkuPNffBv6CkUauV4NsbfGwjFew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=aTZ1CoiP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aTZ1CoiP
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6082607A6
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:03 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-833e671ee9fso1933862a34.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467263; x=1794072063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NsnufSiucuMjk3myrADd7JMWwyFrfYi4BdhFvW/m7aA=;
 b=aTZ1CoiPoNmkg+z4qySuc55wN+tmBYzUUBESJZxyqPaT9C1CFxVgELccfRzsHmtF15
 VDE9w9EXCFeJcGP8B+qPlZ0swnSkhSRwgxbbtk0WJcTzr2DXxUXzR1mfRx7099NhD3Ua
 XMyzVdgrZuKwwSzGeqQYypBHHx33aKf0N7EWEBkMM9eGnt7CXSNg6e7DD3km/z4AAEFV
 ra/mlSm0Y5WhQTO7PDacj0ZPppl7gEUGMj2IoPhU06COVc1JM0qQn+mqwMExScs5vY1l
 T5AcE/Whbljgghim7OdI3FOhMD7kkEiJmpCr7Ue+nXriyKEJ0E+xTq05u4qD6AhFLAAq
 RfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467263; x=1794072063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NsnufSiucuMjk3myrADd7JMWwyFrfYi4BdhFvW/m7aA=;
 b=OrSb5rqcnVPu17Dal2tbnOsxg9e3DCjD1nS/pVwWz5RSvaFbJccVv1eAocz19LSGpn
 fdn5HNaUIUq1TnfCAFlkLnusd+20W6enVIYeCRFFkINl5I3MPWGixRr9oI/iqYSuE/Vp
 VCN7LSkafkeOUcOG5KcGOQggS31iv5XM3X7cfIJslkOiwf7tV0pP5cLG1HcXIAO2Aghw
 bydBME6sxkFN7JeUVKCKo2GNAy4DRMSb7BE0InkVky5CriDw8avFEb8oKoJr4xsrsFrE
 l/BtsCXYx4LBCS2WbiaJHFVAYUuJQBNOPMg/PyBQUHtKZNivQepxElM1fuEvPDRfApmH
 wV+Q==
X-Gm-Message-State: AFq9FYKUwquFP5Hukb1441HVOR/zk7iC2PP3/HBiqmy0OYzALLCcl+JU
 1ThyzWsd3BnkYDkY0Qad2OMSt0TfCfi0DDIxz12d5p1j2rNdDPpGHNH8gEO/CA==
X-Gm-Gg: AYBFou19O3pDTTd7l7M3Bvb1GZz7k2mTNWS7V24pTOcXD+D/Y7i0RkZypa3yLGLM4vN
 dieSblcJuBGAT8LNtxcONl+qBdttNnoBOhmvP5kb25x/rXIZVw/xAgyqRFKOjiThXAvxlk8SPuJ
 pM5GL3UPBmgkbMxBVU3oogOQxJTQqrqAaUH5s0GDXWk/5usSsCjCjXdWk2An77QzZJi7FRuu37i
 czv4jB+mt+9OoX/KGyXH6fOZY1mw7W7DRPhvZeNkSfp/QjF1TtCGYfNPhlXqZozBkP70xM1YLhv
 loh3B2XcBIf8M/n62iUUkZDRdJ1OzakaPwr4DM57fk3mrdRfjuvgeKAYvWVRlrfTF5pNt4k1ZM+
 wFbwJ749Hb5tC0ruPSCQOL4j8nBP1+YuEmPpcB8K2TaGSDcMPa2K3yCJP+Dw+FYwhZ+dGwq60BT
 n/k4SjakzcALQZ+IMrvr/05o6Yg4EAiA2S+9p20jT5LxECYwsZhZHiCsHLRkMfJICkV9U96KjYk
 EoXWwFkUFQRqH0qt0TH72dVXMUXYCehHYhlVGhuF3ev5uXTY6sPLh/XmF3ATH7L58QlQ14SMbGu
 GtzN044I8s8I73cEYsMRRk+XYQEc/I3NGJQtQ1V+7nAN/lUK79jl2z0OUQZo5yiBMuFVUlVaw0d
 kZ28oaSINym5FQcH6cXRmsHAk/Y61qXS5my0ZKAe7dXIkyAsdwKgInbh9W4Q/kOg9J/MAMA/5Ud
 DXGkC6pNHdxdi+TlVNJp2Uh3l3L1XOXFuDLbIgW0EEUwX/GyoHpXuTQCxZjloPF5nRkhG6uCbzp
 Q==
X-Received: by 2002:a05:6830:910:b0:823:e626:2764 with SMTP id
 46e09a7af769-85d364a677fmr4511459a34.5.1793467262713; 
 Sat, 31 Oct 2026 10:21:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:21:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:53 -0600
Message-ID: <20261031172019.2683287-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-websockets: bump to version 17.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
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
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 4ba9d2ce95..87ac397a84 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  1be3342bf865f39fa2db23bbafe1320d  websockets-17.3.tar.gz
-sha256  1c7dd93a1c9f89297471493674b1fc1d9467cafd45374f2172213046bdb3a329  websockets-17.3.tar.gz
+md5  58b9d7046b11916e5ff1ddfe31e54e30  websockets-17.4.tar.gz
+sha256  09d3939b70df0c8ad2da145ebd50978bccaee1d565e838b0e7921a34d38571eb  websockets-17.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 460cf5e70b..7f2bcb1112 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 17.3
+PYTHON_WEBSOCKETS_VERSION = 17.4
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/30/4b/4692be6d5bf739ed049b3813901c42091f8c054df89d5c089343823dea0d
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/75/79/590c5f0cc7d1661195aeefccb0e342b79f4c77d368d526d028821a390332
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
