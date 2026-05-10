Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EB6CD37AF
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C5584F82;
	Sun, 10 May 2026 08:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLkAMuuFidRl; Sun, 10 May 2026 08:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4974F8475F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778402757;
	bh=/zQ52ONtF8XUKEpQF0/ri4exz6tp2VdOhQlZpnzyElY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qS/06ADigoZBeXLOY0RLEpKRvegB3aSEu16HyvPxOGN58EYkLXUjrC14S08cjwSk2
	 WCZsjWMEJxRyVT+NVnD20YknTdfIKy1DcL0DmrgZSmn32OCFnAOOZxqqmnOHqKwti9
	 NZQJjbsuBqelkapLdPg9PUi83Y8eDjoNzIGNQW+RZHPFLTgPYvQwkIPoppUsIpLIdQ
	 o4tgXm7i/bKaXbeovybaw/1iAX7TesuXHXeudBW7AWB+7eZicmMiu4zJVJN51B2YbD
	 hOsOa6C0HrI1D73B4Weo2a7Ly1pbXGklOCylrTk8MhI7fpLqcNzCzJsYNtlT+25MBl
	 ncfEYWDq1RxCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4974F8475F;
	Sun, 10 May 2026 08:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FFF272
 for <buildroot@buildroot.org>; Sun, 10 May 2026 08:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 443C441F0F
 for <buildroot@buildroot.org>; Sun, 10 May 2026 08:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wiv-Yc_d1evx for <buildroot@buildroot.org>;
 Sun, 10 May 2026 08:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D92EB41F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92EB41F06
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D92EB41F06
 for <buildroot@buildroot.org>; Sun, 10 May 2026 08:45:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26r3-1wOThO0zs1-00FGNb; Sun, 10
 May 2026 10:45:51 +0200
To: buildroot@buildroot.org
Date: Sun, 10 May 2026 08:45:32 +0000
Message-ID: <20260510084532.21848-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:wwTVHCSEH91sQqox3frp2eBIPaa9t6EgX49vaj6PGqgN7wldtXC
 X2d7//vJaPl7oqqYeGo2GdNAzOxnWmQJI3pHvsm2AvS0a7qURQWTyt52bKQdPMwZOhBFO/L
 WCID0zfEaL71eDF1RhMvQOTHGmG8AnoSJho4+vd48feWImHYq/OIaIFSpVtVmFqdAprBFbJ
 P3uq6M72qtsW/rCf4KJOA==
UI-OutboundReport: notjunk:1;M01:P0:twY6Dw3iK8I=;wYsXCoUv97mWKOoC8kvzARNEhFP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1778402751; x=1779007551; i=and@gmx.li;
 bh=/+nuWz/zjFxQrU1xBH6Zxnd+VB1RvIwuXtunHHsXYcM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lWX/W6Kv3NgH56O5jeFUx9I+lq9mwkOmbItfWvj71ApoZ9TuV7AhGDDhs/X96149
 HfFvUOIBiDVJe/+vVslZ9YaPtoPiMzzCEHhTl8eZoDIR+nw78YwqXFfCVhL6+kJZe
 DW+K223+TVmq22Wpzl2QWFigcH5Z/U3y3VX6Dw1XnH1JeDRR2l6F0q36gGcqBs5rW
 h/AFeSFcnh86jGBBDcxz7J1AjOiLJexd6aE8WYjgJ7QhR/O3NHVNaORfisaC6wyH2
 pwiDUJdi3DICVkNqSwUlOWKzGX7BA5MDhYQ8Q9jTFvWjBxEMnKaeMOGWe9hSFyKF5
 IwqzKmt+jSDnigMa9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=lWX/W6Kv
Subject: [Buildroot] [PATCH 2/2] package/tpm2-totp: bump version to 0.3.0
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/tpm2-totp/tpm2-totp.hash | 2 +-
 package/tpm2-totp/tpm2-totp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-totp/tpm2-totp.hash b/package/tpm2-totp/tpm2-totp.hash
index f7cf06162c..54de933e8d 100644
--- a/package/tpm2-totp/tpm2-totp.hash
+++ b/package/tpm2-totp/tpm2-totp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0b2b63cc7ea74f5a6952f2cd689896c08f6b94ee6865f48af609f9a8ac247dc1  tpm2-totp-0.2.1.tar.gz
+sha256  1a8c83dc0d0dc58bd85a3fbfc9da6e39414c0d33f1a19886cde20f063f0c527b  tpm2-totp-0.3.0.tar.gz
 sha256  67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index 42607c0b73..1fd0a30d03 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOTP_VERSION = 0.2.1
+TPM2_TOTP_VERSION = 0.3.0
 TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
