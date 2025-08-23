Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA5DCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 05:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2CB611E4;
	Sat, 23 Aug 2025 05:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZN39tH4hXTR; Sat, 23 Aug 2025 05:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E46E611D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E46E611D5;
	Sat, 23 Aug 2025 05:03:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA83E4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 05:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A653E40E76
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 05:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJPGM96FoWNr for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 05:03:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99A3D40E16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99A3D40E16
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99A3D40E16
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 05:03:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from thinkpad ([213.147.165.25]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNJg-1v3PYJ2Yzq-00WM29 for
 <buildroot@buildroot.org>; Sat, 23 Aug 2025 06:58:33 +0200
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 06:58:13 +0200
Message-ID: <20250823045814.256464-2-dalang@gmx.at>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:3w5wtp3/K412Ahsfl/GCD2w6SX547Ntn/mpofjKYSdqjlAWpcSw
 x3cVAPb7IwT72TMUoWjNlaJRAfTZfBomnk2PMD3ZEov90EwmMopzk535QiFac/hxwX5SEv8
 ff/6t0CgQ8ReVUjXNh+rDbkGAgd7V9GmJA9tlfD2vcfO2EsIpQO7vTR9XnpfbHLkyUB71Eq
 hFBPyLHz8ZzG4Q5/bRMLQ==
UI-OutboundReport: notjunk:1;M01:P0:H35KHXQfc0w=;AWi8H6lAyF9PkvCZ/S8IQUlWw2j
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1755925417; x=1756530217; i=dalang@gmx.at;
 bh=AkSy23o2QJF/udxT0Xi9zIsftbkaaG/nNTLYQIs/w2k=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hbxYB1B//kGGZjPWdWNDeI4niSFLSwcy7Qt+MXCecSchAlxlmQg5F2UuooosaH8v
 yeuPFaUWkZqdNsXiDUfXBcyAAHFoCT2hjpgAEHjScfw5VllLrFn/7OJ0r3Pyt5ABP
 LNe2da103R1o6JseceJV6ZmFR0leKuxvELazurlelPKfp38ASi8A6DrlWUJ4f30l/
 lKOj/BFfbP/bKddB5C596miUBLgr3suk49vtgpJMiLpHd4op6yj/LtCQ5SdxCJAxm
 uKyOHEeptjoQgNXrXnE8MeU798cAiDergYmE7ipRwI9ZSFjFDAnnIwboPsiOeeXeC
 PO0YszKSsox4s8AXiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=hbxYB1B/
Subject: [Buildroot] [PATCH] support/scripts/cve.py: handle missing nodes in
 cpe configurations
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent updates to the CPE database make the script fail with:

File "buildroot/support/scripts/cve.py", line 173, in each_cpe
    for node in nodes['nodes']:
                ~~~~~^^^^^^^^^
KeyError: 'nodes'

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/cve.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 1cbe24c02d..ba41762fa0 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -170,7 +170,7 @@ class CVE:
 
     def each_cpe(self):
         for nodes in self.nvd_cve.get('configurations', []):
-            for node in nodes['nodes']:
+            for node in nodes.get('nodes', []):
                 for cpe in self.parse_node(node):
                     yield cpe
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
