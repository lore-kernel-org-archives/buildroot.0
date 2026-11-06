Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C7C606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n/OIQjDN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7haeoVs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18CF4608F5;
	Fri,  6 Nov 2026 19:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bysOC-TiOe0C; Fri,  6 Nov 2026 19:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B189D608A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992578;
	b=LQ49Ts4wwdBrBlbK6nhfEqb3PQcITJ3dIRtmTpv8DQ3WFYyJrAe2rjijfSBMe13emHXu
	 /NTYtg5P9accpnelEclzzzS0s9k9H7Fvt1F7N+Y4X+EPxqvhitDBpl+gk24rUbQh3mSCv
	 zIRzDDiZVyU3ZEvkqc0NKBlaPSy3re03GWoFpNzY/CokzFm5FVBljR4+qgVEhASmTpbdk
	 WfqEvh3ZoQ+uEyTqypfHjmheDTP5I/bnycH/Qe5rTmCVRqKUYAtASR3RJ8OGjDKEvVt8R
	 WghtFc7N0mCs81zTG+lNBqvEnb9pJrpwLF4TO+dA24/m/kz2C7NeWDa+9suv77aa4XQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uz1jRPZZQCaWgxmAJ+6fXrzHb6w4rZ89vnZkshAxavo=;
	b=ajBgPV6g5mlQc1NpHrjWNXjo2WNVZaJ//d7FTBR5mBzW7U6XCYZByG1c9uZyrod3bT0N
	 Q17AOuptk6lk2d2xnQ35oDpri/bf5yIOG/uSC2UD/6c79m27tWte+9li6u9miNtPIHh+h
	 HDQHNiz7EtTuXFOBr7cbwv56EwT5QXg3NPYc7SsMW+lnpSWlEBAsHaItn8aGWb0OCmwrp
	 /UTyvqlQupOo0Qm4lizHoV0OyobN8q+v2iprtvTredGNE1ndLlBz0gV7+Btzt6yReVV9o
	 EugcKOg0k30ZhmWwaZpJaLRxNfaodECGGq8QjktkxNkyNj7PgJp2g2ZU1W64cE87XKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992578;
	bh=uz1jRPZZQCaWgxmAJ+6fXrzHb6w4rZ89vnZkshAxavo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=n/OIQjDNmgYLCqbOzVcZN7YetFY2TzwZd1o+qqvqWU3v2O2k91u7qE8pfXX8S6lsd
	 4JItxsg79zF6jwQTPk7UDIxV7fsfP9/H3xuKiFilVE6kgVGa4TpGIKwTFtCHgjTkZk
	 tb5wJJkG3PzwHGU6LDdmHfwdynPLRq5X12YcJzvyrFYCHJnafYcO2TTxnM+HEX/a6h
	 6LU8tjJIHesoMDqKv6/WbWdEipdxEkLJjipNzq+I4/PIwyOfi0842ntq8OYFmHBUz4
	 POcUdiLedSDxTAL3pfZ3MGNULNyWGILFvSpi82o89/ffJJI9sMoqRwgKp20/tPUcgm
	 aiKppFwdezmiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B189D608A5;
	Fri,  6 Nov 2026 19:16:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD71362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57A26403FF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tg_lvOkKHTlZ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7F796403FE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=I7haeoVs
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F796403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:13 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-847ac7ccd85so630042a34.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992572; x=1794597372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JuS1hWu8B7VNDvjCRzEN1k6yNMQG1oS5MvHKlnIoybM=;
 b=I7haeoVsAxvK73m0cACQ4LbIRP3TSL4s5b4WNqTsWU2k71Wngxo/qzK0Yyr4m3QvoF
 zukgIOuevidD3fQPXa7EA3Fh/QcNTp1nefORAgCWQ/fA5otlZ/sLW2prwFeGeETG987+
 UkHYHnH9oBxHxUfDYeBCl2VUFLkF6gRgw65oqpxg6ZYJjaEzUNs3tGnKnUKS/vttnwYj
 3qusV/6UpweDwg5VEm++PoLIiLujGMhocJ2yHD8OH33NvnFxKRXdfwcQoI+XsbRZ3nLD
 uMr3aAD+fABrSVLvGj0KWAesIPRctUUIm4V2NZnJtUS4ih2Sf2aMU5C8LkySp330ngoC
 Pspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992572; x=1794597372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JuS1hWu8B7VNDvjCRzEN1k6yNMQG1oS5MvHKlnIoybM=;
 b=nwHVWpgq5ulUXPRhOHO5iMgeNNtTmodqy9ZZJKzhbBlAaemVYO4xgHlYPWWol/OHnu
 izxU3VnHE4LIsaEIKp3VXHnM52MdP8STK3nFI5D1NG5x5+1qikDsXgmhUIxbTqRR1nps
 GqMP9Wp1tV6TwqiTfSdXLAbY3yI5WmCdQSlxRNYxlcDD9F0zMp+2rHqWCFCRAyZNgJ2z
 RJJcnwQnEcd33Ata1HrSWhNhKzm+Z2eQqUJ7OU6ks0Jvae2zgnuKRxvoyvyPijUJ+lDt
 AVjuML9cqcDjWD8ekjmrEeKSAn+GpW211bLIxJGg3uaSpGx7FrE3xGC+WJ251SBn0vM6
 XUdw==
X-Gm-Message-State: APuU4Z+/YSjvzGgLekVJf5xHAJykJbreB9ayZRx08eqHS0GDVky2b1tk
 +U4v+Li3tQen6oQ3zTWFyol3AsitQzFvY/ybxAlCBX5t8Qft9elPvZPMJqgCpw==
X-Gm-Gg: AYBFou0Jo8i26+bGzttrDLLhjE6f18SrbDCksT/c8pfC76WCZUn25rxpIbG4qQgyD2z
 NQJxiM2fKceZ6Ti3m0PYvbiR7HyyXczkOhkXnf2xyHIugmx+Bu/KX71VygRAMKPWUvC5tDZktRg
 uXBvzSinuVWd0g6zDNGztC3Hc/jemFo6iYh99jvQN4EiIw83isbkeGs4zfKNSTKS/7pOVIGBRIo
 MVDwMdYL52pg6xE10ngoGl/2qSOLnivsDqq/TX6nys89zmS2EhF2LQdKXpAmGrsfhYI2cO6EbM5
 zTYTrLEHoHi3f8UkEwxAVjsdUliO/QJDaBs1FF/X69QFntQqJVA7k/H03PQ71eyll3Qu5Vdpn9d
 GSZn67aZj2BALw4bNVP6x1lxwcnXFv+HPFgueSAX6tf701ExvVsje0iW1pUw/ngoG6peHt4zn2u
 Jes2RsaJhMgJrS524h34TPUBeu8NjMd2ztDZleY+W3jLDu9dk9B94VNfM/OG5QYTT0owjsrqdyB
 XLmHCR3787AA+81w8snfgKJKDu8oyPn6DrZ9dWDoPRkHSjGlzRXe20GORvcok1dZRsK7hj67tY/
 sPZlBs74oS2YySxLK7tloO01Aowe4AuoY6xQ2CNCzacuM0W7rMuQe8eU0ytf/7JGzYtgOg2eOku
 gHCxVJ3tmw7G4lkoIo//I2VA+jjWQHnrHSlNavRdxN9UYmTa5pHzdW7J/AKhn1ZsWKII353YUjG
 maf7k2zGI3LgO2PMvKjGs7bOF6MqdLQWf3QqBS3VyD05Uz4YpXr2lprl+9INzcslGPgrXOGw9qY
 A==
X-Received: by 2002:a05:6830:914:b0:81f:827a:b1cf with SMTP id
 46e09a7af769-85f1d0b264bmr4384615a34.22.1793992572340; 
 Fri, 06 Nov 2026 11:16:12 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:42 -0700
Message-ID: <20261106191536.2120153-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-markdown: bump to version 3.11.3
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index c24d190e7e..7ac545718d 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  80c89f34ab5bce047528900335301408  markdown-3.11.2.tar.gz
-sha256  87bf5d90f2d2882e2c02fcda182c2800456b985bff38913867c49706481514b0  markdown-3.11.2.tar.gz
+md5  e3cc9d462a4eace02b6336dbab97308b  markdown-3.11.3.tar.gz
+sha256  81eb91631dc97ad1efbc76019ef0f80fe90ca49ddf81546752d79989c3bfff3e  markdown-3.11.3.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index fb5926f13d..1aecbba812 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.11.2
+PYTHON_MARKDOWN_VERSION = 3.11.3
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f4/32/0b4d0297064244f04af4331b65de16237cc3cce07474171ee14222a28981
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/ca/eb/dc0fd6eff604bfb870b7fb68b90985a32caaf3c76f67736bbf7f438acd59
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
