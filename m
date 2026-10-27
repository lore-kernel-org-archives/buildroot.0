Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D877606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GqAi5B4l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=e6uHLPu/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F69D607A6;
	Tue, 27 Oct 2026 14:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tA35jczfI7MO; Tue, 27 Oct 2026 14:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2532560793
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793112839;
	b=E8aYm2l7hZIWQBk7CfHSWd//VVq8or4uCCumka0q2eYVeTjyVJ8MlsDW5oUxnVWCOM0N
	 NcXSoy25RS5hZi/gN4LK4TFurdiXkXgp4lBwuuJVYINIruqW613+0HsSmTj0/CWHweZ+/
	 5hOFieU7j0ruTzH6hm5IAG7f2HfSRj9NRM/QsIYJye5d9ePnsgeNGHvxG+EsKLi3r+D8b
	 +lo+56WlPJNcASFUxmbKma7PgEWLDVv1UTcADhsgnBXOFiRDW3WPrQQo7Ka/HLmzmBMWp
	 JW7HjBdl6zYXd0ZYSmFObxvnCmlfhxuMuiX8zD8cqVGp1TqSSmC69ZfIBjJvheSc64g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793112839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=l1JsADSGA2OZrpcwyfRTx0+PXl2qSqb7dQiEK7I+Bqk=;
	b=kE+Rox601EqO8qg/jmEUZn8+h2J0vuDm3/w0sc6SSneDDGWV5S+HCw9gz9Zmjs4Br+Mt
	 8AD5+dwm/jnQ1cHiN5sXeTHJb7o+ORJc2yxiwl4NlT98q3xktIpAGWZXHLzJQf5vq/+gT
	 Jyv9sDuCr5RJUZAlpaAnjrCuPeJI8jpUP50EQgdWanYAJEHv6CiPOwSmIOLJANqIwDkhW
	 LZnXANDhbAVVsrBzXCWPaNplypG/sMGqlwu33mVGt7Qq1uwerqzTPeG18QQ1jTbCocePr
	 HZlL0+u1lG4IaXLcRaIgxurf24PqIAatnj9oMjIMW/1lvHNrGFNFzRjEFJ16Ia2us4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b="e6uHLPu/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793112839;
	bh=l1JsADSGA2OZrpcwyfRTx0+PXl2qSqb7dQiEK7I+Bqk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GqAi5B4lDxMVKS7ZgQniP5CE2J2H84Z4gvG5mIAnIxajIdPfUCU+EQZ3TedPPrVeV
	 UM4kr0eWXabHcIVp7i+/K0U2mXA8Y70sVzJSI2jIwfzZdZqNf4tLtsE9pw8SJuE4/c
	 2Vk3ccfzp0it02oB8dZdjbufGUxTrL2eMs8umDsW7x+EDJQE57nQdal/cpvVTBW7ZW
	 T+5ZdXRoKIMlKOdDHuBasmSKTN7kvzE3oKnQE6qzFToyGsP/U3AnHDKvrtOEzKGWdu
	 wHaxavug1DF2AspbDXspMjeYr9aYMtx3pBz0cHtExlxoNBGX25JKRGUEWJtjDyMyh6
	 R3ac4PuQt4lag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2532560793;
	Tue, 27 Oct 2026 14:53:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8AC4A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA4F060794
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-3tIXffxFUx for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:53:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DF5346064A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793112836;
 b=OYNEsBFk73vcu8Awn9CuORO3YDJqCmTXC9pVhSNBNSVACMZbwp+/7PR0ZrBCUq65d2iX
 qvASJXOXY+yY1a8v3FPqJC11/COo2dJvywfWFj8kBwrLfUIel36JKylPTlGIWzNihdqp3
 EPPFGXYPY0tLEUC5CzVqAJn+w0IsdCj07s/Tbpy2gYlRgbaOa2VWhRHUfxowqqBk4tRqw
 4ZqpWdnNZ7swDs0n6Ma0K4ntfueS9OyDepvSKD7INaTkembVn8qBJIzPVq1n93X83fTYf
 ZQx4MpFV+p+6i0kdSbvIhCdtTwexM+oy/dKL+tphPKefanv06jw+1XMnpN9b3TLdNtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793112836;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=ArmwKcXrq7E45lpnpPm9tHtzvv6BF7eqYJ1YKXU+65E=;
 b=qnRT8IjubryphWSbKuvsF91PaqMvi+otLRVrcFEoZrHx0eXlFh/zifJpK+cE2EDKPaGk
 sPrxu0w41FOECjxFH+GZ9jvutyx73l4Xu69Wjzt7uov1tXbJVhKu+P7T9zLOkxvj1AA5E
 W1heT9ddo4xjNpBgrfODY5ZVb45X6CL/nTlrryo+c3fWgepkpF16+ndhj2qOBXql/lCqT
 JPEI+GNV62JmWs4yh/sdVYH4nwumVe2T3Gpls/4eez2A3q6EdTpCeJK2E5Sry29RqxjZ3
 VpzmcLrC39vX/yfzNzwTlUImTJUiH0yhVyzeIXgLrvzYJRSGNL0qvpoKSYkbt0VCnEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b="e6uHLPu/"; 
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=e6uHLPu/
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF5346064A
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:54 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LiYhxeSyQtleFLiYixL1UF; Tue, 27 Oct 2026 15:53:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793112832; bh=yochg/hOXIK33I+2idJ/dFRBPAMJJe9igrMkplyKgHU=;
 h=From:To:Subject:Date:MIME-Version;
 b=e6uHLPu/QWMX6kAsTUMAd+0RGN1IFg7M8YlGViOoBV+EjBxtaM6j5AOI/Vfc7blF9
 VMhvo6MCPuOGIhfJu3gnIVAUevI+3S0JWduWamxTIYFxcRs7M2fhclejsVuDXh7dLY
 TN5JW/yfNXilr3dxyWjXEi3Fj00WUyjjh+acCQgJ8kiwnrh73GzPQQfavfNntaDjC8
 /sEA7GN8QfR3YXDBvR1le+Ajryfz+UdNy9lyMZOsRbMjNkEjf1OQwYt9TuCuXqy/K3
 D7gqh2qwekL2NCmmY7hgHVc8GoqMvnQI7UZP4hULNnMvIbQDx8kSjY4/Q1T6QKQNnN
 /vHfm7pSohh4w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 27 Oct 2026 15:53:49 +0100
Message-ID: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD3exo0Q76gDKh8viJGcyPbKnpAQhfhtffwObzzTe3xKkXDRDKFhwccsQXkHKsE23t3wxJEI80neMEZQCqYJn/GkwJLBSHhY2Zo2NNIHCdtk5Whtn7Kw
 k0OEyvtgHoLhXDee2F2DIB0c7UaP8ItugF5qcrsPZ+/uLF6RwVDeTCS4q7XkW0S4c812ZNCE9RDoeOLRy0wrcUG/OJ4fX0JxRwRw7mWqDFRobQFl2kABp0Ld
 3IkKMrZKhOKs/1VtxHwmTXnczVqAexPZZIhuOGhLwE7e/HeGOF+Kq+sT/mGRFtzhEJpIqAMATxJBo8OqUkUXEg==
Subject: [Buildroot] [PATCH v2] package/rtl8723bu: bump to 2026-10-27 version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This version allows to build up to Linux version 7.2 if -Wno-error is
passed to USER_EXTRA_CFLAGS. This is done because starting with gcc 14,
several C diagnostics which were previously warnings are errors by
default. In particular, -Wincompatible-pointer-types was changed to a
permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* rewritten commit log to describe the root cause of tweaking CFLAGS
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index e230485226..4b2b71ddb2 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  22d81a21318cdae23ab6a65bed7c24d7cc98e7d1afef7a200804761c72036019  rtl8723bu-ac3d2f564bdf6816f1e3a3384524dc1a966f78a3.tar.gz
+sha256  eaebe07d38931408c8f5dedb3a8c61e251862e0b8859b899d193f9d5cb77d748  rtl8723bu-8292ef94965fb61d3052ff2bf068fcd830e665c1.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index f1c4eda4ed..4175d02d52 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = ac3d2f564bdf6816f1e3a3384524dc1a966f78a3
+RTL8723BU_VERSION = 8292ef94965fb61d3052ff2bf068fcd830e665c1
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 RTL8723BU_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="-Wno-error"
 
 define RTL8723BU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
