Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37957D3E2BA
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 19:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6E6440874;
	Mon, 28 Oct 2024 19:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMNDMyLcBhfq; Mon, 28 Oct 2024 19:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D5040603
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6D5040603;
	Mon, 28 Oct 2024 19:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4E1D112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 860BF6081F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0E39OOmEYG32 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 19:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FA2C60782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FA2C60782
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FA2C60782
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:28:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 82F92B00548;
 Mon, 28 Oct 2024 20:28:38 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 28 Oct 2024 20:28:28 +0100
Message-ID: <20241028192828.12093-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730143719;
 bh=xdmqBborNILO5o5VAGpkT4PmF2PDUwUmwJNFITIcPs4=;
 h=From:To:Cc:Subject:Date:From;
 b=aXJtzkgMWzKRVr8bHKMloyPrxBDVxXsHbwbJyNx6NJ7iz3X1IUu6BZq3AeAVG7huv
 mG9OENXIlmeJQSrwVbaxQZ815TLomK/HdRi5ml9TunNb58nfmApMnARDS2eEk5EicA
 q2ew/jMv3bgBN3RWMsf2NhhmmwqRb3DyhcWtT4BzdLk3+Vk14o/jR5szEFZAmpK512
 q/dVkmtXV7MKTdjqkysz1WDCStY0Oqi7zMdg3c1fbHIo2tT6PQWtnctfUVU+QBe4Bb
 3ReDrgtCVet27BS3OdoPh4yBzvBUc1QnayXPa5v7fg4PDbdmofuM7gOJh9T6bz+C3u
 cofpo9/XSal1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aXJtzkgM
Subject: [Buildroot] [PATCH 1/1] package/oath-toolkit: libpskc needs
 host-libxml2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When compiling oath-toolkit with PSKC support, with:
BR2_PACKAGE_OATH_TOOLKIT=y
BR2_PACKAGE_OATH_TOOLKIT_PSKC=y

Build is failing on hosts without libxml2, with output:

    make[5]: Entering directory '/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas'
    create -noout \
	    --add "system" "urn:ietf:params:xml:ns:keyprov:pskc" \
		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/pskc-schema.xsd" \
	    --add "system" "http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd" \
		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/xmldsig-core-schema.xsd" \
	    --add "system" "http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd" \
		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/xenc-schema.xsd" \
	    tmp
    /bin/sh: line 1: create: command not found
    make[5]: [Makefile:1267: catalog-pskc.xml] Error 127 (ignored)

The build needs the "xmlcatalog" command, provided the host-libxml2
package. The previous error log does not show the "xmlcatalog" because
it is not found by autoconf, then substituted by an empty string (we
only see its arguments).

This commit fixes the issue by adding this missing dependency.

Fixes:
https://autobuild.buildroot.org/results/d22b8d9ba1f8a948125b4f9713720d070e208799/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/oath-toolkit/oath-toolkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
index b36cd47053..5e8fabb05b 100644
--- a/package/oath-toolkit/oath-toolkit.mk
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -29,7 +29,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OATH_TOOLKIT_PSKC),y)
 OATH_TOOLKIT_CONF_OPTS += --enable-pskc
-OATH_TOOLKIT_DEPENDENCIES += libxml2
+OATH_TOOLKIT_DEPENDENCIES += host-libxml2 libxml2
 else
 OATH_TOOLKIT_CONF_OPTS += --disable-pskc
 endif
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
