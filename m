Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C4606A32C
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PIEGb7SV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEAFB60768;
	Tue, 27 Oct 2026 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2fGjz_rOf4l; Tue, 27 Oct 2026 17:06:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0AC346068F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793120780;
	b=LzVFS51nNCpSuuaSCsGpSk87aaMULmG7/dI6l9ZTQBSJbHevwtkCKuaLvPoLfvtSyjlK
	 /na0/10CJQGA5I1hF0aQBxcr4onmGm+8cABOx29/2xAIy+LyqRbUs0DnNNKQSJdl889se
	 yuI1s6OFroMdhG0p0hf3wJc5XBo24aYwJNygT5fZfYplXxuLvo/ul6ndm3tdqlM6CLY85
	 ZgGPXKs1neGXYZs0rMRQNVtCaHW3Nsxw/LQ/WFynLTgBZ8qCy4syoPIfxoFsxUIw0v6ss
	 wgI55ZPb7J1q5sEEKgCvPihUwZS9ALzgt+/rro0yl/aAe7qnO/zs0HYVzh8vlYo7UxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793120780;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=alphp5VfR6o6zJgGEiFf4YJbAanCJ5Vx1RN5swLRBB4=;
	b=SfU5il0YydEgqmMw6NaKJj4/zsYA0evZy/L32iLDtEXVykZp9K0EEclvuMzUxxPUfbG/
	 3XN5hLIMCyZDo1M5AdomdzvMUx7rV9+EnSVaQhyjMZuysAl+3eNaS3HzlARjNlZ6JoNzr
	 efIfnLpsKyTj8pR/Dly7sOCOGliXHijQZal80XwlJ/jRCw61t1e2WmpjWdgLzEShDLAL0
	 ihQw8ClX8Os5H018xuIZGxupAEWQzKl6pWIV9cTMj6ZpLOrkEs84ItaahlrkTw0BAvAeU
	 TDuJuAuq64VlqIk8/VCa6VOylZOr64QJYDoPXF6skoODio+cIK5orqyC0+et3j4oYyw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793120780;
	bh=alphp5VfR6o6zJgGEiFf4YJbAanCJ5Vx1RN5swLRBB4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PIEGb7SV8qs6A/ve3ND54gLFsQ85brTMF9D/pTe2YdS5Fe61YBbXu0dQNLANSXMV2
	 5OBl5r3O6JXNxsywQcvV5PYIz0op3t0GvJ+Q3za9HYY5NWCqhG1GSLd47HL+qoHItV
	 ICRqBKJdS9cdiC1rW2+3zUVTZGT+Yti5JZXC0VzoEog+f9r/k+faEJs1tUNBDQebP4
	 gbV5TYNucUoFOZMoTuOEZ93ZLNOXPCez9G3rgdvg3UA6cqHbQEeizAG1b0vI5wGvDY
	 8FXlkpv8KkDQ7BmuX3Hz4IZjN+kiBYt/zmP0FNWhlto4lepvxe1yAEidRkiDdCux+j
	 Nc0yGtKgqymww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC346068F;
	Tue, 27 Oct 2026 17:06:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B77C92F5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CCAC6068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id da9rnf3XhFhX for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 17:06:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 148D360613
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793120776;
 b=IpdXTBYAlPzq9mS64L6070LdWNjmc3Tq8iRyqdEbkViQr7+Oe0Zz4CPKZPE1KeFbyF89
 XIVaTknae534B/97hU8YzAsz0aWNphj2nvQ++zj7Q9NRuV9KY4/rCXOHhJzQJUgQzvBxD
 kiskExGuH5GndngRdykMUD+Qv2Wdm8steyDtaGF10zyY+YUIUIg04F3ixQPjO0v6l77JA
 UcxgBzPxujkb4omyYEHjFvscZAnKINYg5tX4+07s32ngag+lysUn3CXAv5wNG26KteN9c
 M3rHHY7ZWKMxalwkx4JYfvuF6AjTl/9MCpydlqb0693yaI2WslJAMrVfLgU8oV1M6BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793120776;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=42HSQaBgsuNwTkrlsKHkMJqFRWkBhfThJArSBupldtM=;
 b=dcFM6fWSBrDXT6ynCHsGiqIqIybpGQ86/hC6W4lvxCCzUaqehObwfOblcYzabaALt0PA
 Fd1WNMvmDJ8OnqT1IwbZvY3Z3EjYV24GaKDMkYO4BwhMtmHIKWEyIybtfYjEQPBrjEa8v
 4r8RvtRJnrjtHb5XrzuLB5jzfnc18inyi+gd85gIJdiIW9DTwrFQDPybreh8oBVHUmRv0
 qwDFnIw6cD52dOHPhik9ClBrQgekb0YCGCyyGXqdWyXBiFFTP9QIL417pF53tjuiyMJqA
 g0tP0F/Q8VQ/pYpMPwhFRf/PK07Ij7/l7ev9mnNNpxPqbA05DAwPnLLjDemw/61Y/Mw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VKC6zEWG; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 148D360613
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:06:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2BE9C1A1366;
 Tue, 27 Oct 2026 17:06:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECEA1603BD;
 Tue, 27 Oct 2026 17:06:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B14601032902F; Tue, 27 Oct 2026 18:06:04 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Oct 2026 18:06:00 +0100
Message-ID: <20261027170600.130042-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/drogon: add CPE information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See:

  https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:drogon:drogon

With this, cve-check properly reports CVE-2023-26137 and
CVE-2023-26138 as affecting the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/drogon/drogon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 8c51d16ac0..4772228960 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -10,6 +10,7 @@ DROGON_SITE_METHOD = git
 DROGON_GIT_SUBMODULES = YES
 DROGON_LICENSE = MIT
 DROGON_LICENSE_FILES = LICENSE
+DROGON_CPE_ID_VENDOR = drogon
 DROGON_INSTALL_STAGING = YES
 
 DROGON_DEPENDENCIES = jsoncpp util-linux zlib
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
