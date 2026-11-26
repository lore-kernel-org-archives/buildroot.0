Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076C606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bjpgVO+N
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F320409CA;
	Thu, 26 Nov 2026 19:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXCRnNZGKJ5o; Thu, 26 Nov 2026 19:25:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7323340902
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721104;
	b=eBw/HcGs6vEwqGihQtmrzMF1Mxvh8l7ki9VZq1qq+7R4yj55l0/6Pt4a/2AihbEH26Wh
	 p5KmjOi4NvzPM5yoS9lJ3lgsqaTfER3WTdqcyN7z7SZ4vIU5pdUHOomv7WTxGBHCxlY+c
	 LCRb84pONZQNXqyzFYkc6x/93T4yYmsU+bP2jdoweX7j2ExNDys4q8GJEWOX24xoP3bJ3
	 XFvGLJAbdIaauIpcyXYoLA3ORe1Pp3RsG3Yu1yE9w+0tYRayckMzFh0Qk49wJvqbL3r1l
	 elN7BvwhPHnRUzLs005lLqbhnAzq5oIhd+FsOBsj3OTTABjVcgrbX7k4tPHjSaExCpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721104;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=0FErtxWrX9/qSyGnnLC0EM54wOovmIQAOIQneUSk28Q=;
	b=ohAWMeTOrc7BUq52S1uY0cgxLwr5ic44tRNoqkVx8dN9p4CTEdetuUKTNb6oWHllFC4v
	 M0crByilGdCqJKZsV7VEEvPgXYGdXiyy9uT25BqTUCF3kRtkPnSW0FWemq9C/O3UkoEht
	 ovhJsRLjJOE0jPypMl/0NfaQl0wNwy5Y1T7BgFVCscRV72VmBRVtQ4KTnxxQD0CygnbkQ
	 0u4/p96SvT2x8k+4tAdMOXA7uY14oUNyGve6jpkQIXFi8eeIuWYIXXaZPHDPjG96lwawp
	 iW4UwjfKR49c/PCXaxh1MYjwi+ipFqg1O9QhVJ1Kc/2et37oHoNSKKmml1bbEs02kUA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721104;
	bh=0FErtxWrX9/qSyGnnLC0EM54wOovmIQAOIQneUSk28Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bjpgVO+N/cg95F8zZwoORl9aaWd4YPyZ2PuMr1TBP9EDy1Tkwfvc/GuoSslGBiOjU
	 hbv6JNrEPUU/ql2b/zdYNcQ1coDV8+Ab0OIKz8ygn6lbu8zPv4JjuTZ/W3Gv8YTtfz
	 yB0nhevxbkrgCVBiRhFcxeFogBei8VeFXziBHNVWrSVA+tpbxM9fG42/J98feWvTJv
	 6hpudREjl1oHDXy8FMGuKaJL2T2CBBaHXPnZOfmwQgcJOMHZmmYzgUMwGy3Yl7qgeJ
	 kt/QPNyZZLPvoVKhBQNPMygFLxIhRIvrLIUdtdbj8/jG3yJm39PorIwL8PchRYbzOp
	 X79XwKMN8jmMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7323340902;
	Thu, 26 Nov 2026 19:25:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7EA522B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE1C88111A
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfFMbxp1tebd for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D033810E5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D033810E5
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:24:58 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721097; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:ctbIL4+kIavGCQMCtHDftySdyWLq
 0HIkVNVkvi+8AqCjP7lb/Msr2nVDZCsoABrlNpr3jGZPNNDQqvCGoaZjSBwsEPfTYMgaPUa07EZ
 CMzHl9x89tlivz0B7EbIQMgqYX5rdk/vYWW67NBr/9o4PvgxYMG9UY6yDLQBqoIW7ASeNqaxsVe
 MNby0zlaOa//YzJe2stYZ7GH2BV42ANrRvRHkkeVsg55ynSay5r6qqVTWXgkhLdoRSLPELd3l9s
 qbC8KtdI5As0YDaM2foOSB0ZdRoue/LbueXd9MObIndi1EJSN5Pg65xP996/mE/cRO8T1skQNE2
 V5TtJ5AUoUuOsw==;
Message-Instance: m=1; h=sha256: i3tcZb9TTNF+/A4i+KroqPUlfiGysZgQLiQqEHFKBBM=:
 gbwdsLCwCfpjrg8vdwhb8T32GgcC39j4FaqH1RSCpQM=, sha512:
 5bQ/sa8n1xqwH8Egardr7OJSqQST3GR9ozJdfLDcpQ++vQeTb5i3zIxDlWvf9v05PaX8K2MMnSFr83HdO01Y+Q==:
 /xov6O9j3Vz1dFPKPJBo54JkrILSi74M8FfNreYhjzuVXFY5AyyZwNBAwAESOnFGTfhCf3lGBAqGb3FQ2HKTBQ==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fIW-1xZR2p0HWM-00CWE6; Thu, 26
 Nov 2026 20:24:57 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:28 +0100
Message-ID: <20261126192435.1826415-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iX6yDW3Olf6bzGPN3wwgwiZdgpNaoS2zodVz4u2b/vsujmCuhVI
 3wJcz3pXFCw6eaeY3YOUm3DSgj+yjaL+LdXUTlpYdnc4BRtReNLt2UJO2dHnAU1fef+odBV
 iBU/HGszRvYpO2zrNbmXN9aHfJxwm9UH3X8iPc22WqksLKqMvg7PoAJqpw7LPvGKjq+xFeu
 pU4K5jv5o+QamSY8nN8zQ==
UI-OutboundReport: notjunk:1;M01:P0:4dgBVL0PkNc=;EeTVrXD5G8rvrhGhAtgBh/y4lh/
 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
Subject: [Buildroot] [PATCH 03/10] fs/cpio: set NM_VERSION for Dracut if
 network-manager is enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

NM_VERSION is documented [1] as an environment variable to use with
--sysroot. The network-manager module uses it to determine the path
for NM plugin libraries.

[1] https://dracut-ng.github.io/dracut/man/dracut.8.html#_environment

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 fs/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 7647dda676..a87d4d7f9e 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -85,6 +85,7 @@ define ROOTFS_CPIO_CMD
 	)
 	export DRACUT_ARCH="$(ARCH)"
 	export DRACUT_INSTALL_PATH=$(BR2_SYSTEM_DEFAULT_PATH)
+	$(if $(BR2_PACKAGE_NETWORK_MANAGER),export NM_VERSION="$(NETWORK_MANAGER_VERSION)")
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
 		-c $(ROOTFS_CPIO_DIR)/empty-config \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
