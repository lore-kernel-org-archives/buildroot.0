Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1798C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E64C41568;
	Sat, 12 Aug 2023 19:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E64C41568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkrclKrBYbPT; Sat, 12 Aug 2023 19:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C16241571;
	Sat, 12 Aug 2023 19:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C16241571
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09E411BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D72F940500
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72F940500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZN5E7L4kj2jX for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:29:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C079540003
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C079540003
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M42jQ-1qUuIT1qc4-0001tR; Sat, 12 Aug 2023 21:29:13 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:28:31 +0200
Message-ID: <20230812192842.135682-3-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812192842.135682-1-dalang@gmx.at>
References: <20230812192842.135682-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:P7YPiV+ubaJxeXGxnd0lUaUzUpzsGPHdqfL/ErynH+61KfMBuZk
 DcButnVSBhG6S+M/GZK2i8Wp4uwroZKuucKci/cUL1nU3QAv03eH1Nnmm5VjkfUab6BOZSP
 sx+LivvaoAwHpefKfgO1B794n6fwr/XzUlfyt2nMFNQHVAeNKGCtJmwgke6ro4zLw6z38jx
 VXpUwPu68xpsEkgAf4I/A==
UI-OutboundReport: notjunk:1;M01:P0:fP5As+9Ufp4=;DrJ/DogGp/80StRUc3V3bXYQeE8
 OXFahtVwK30B+rZ2TNRfEKELv1b4TyZxfE4dhrjsQCqoIt+C8GSJsrPM9ddqnAOfzLTzbmEoC
 FFHlYP/o2HGWqU2K7QIZUwDAkw13oOfGxPUgrCfgomPDoLRArrE275FuDG92HYsxoWL3h5MVD
 4ba3aGyNGRiLIAOtPtuEvBm3H72GNkPF8TcsSEdaJiyoeZs8yVDY54xmsUQ6IhlrySA7WDPMm
 7mj2W76ng2DTDZ5k5sbLJb0iN/uVK82/DYbtrWteBuUXTWMoUZBx1sMyOMjg2a1J8v0xroDGV
 foqS/rmWP8AOkS14W13HRLzWcsM69hn0MZrqEyMI4bkQyB2UeecI64+OYx025Q3XI17SP4vG1
 2kquhlHCHH5a57gr9+J4IO6dR3eJ7HywRbYmGKIrr0wFvvQLlWFBeQuSTNZsWsjzyqCBUyZj1
 WAreDig/eXfppo9gjoI4Ogmzs0mYF4n8G7+b4YsSPextgnbDkVOIx5hXAQLHG9ZAi3KLKPkII
 VTxP1rs/CBKFlhLxXAF8MndK4k9MX+ILCenIppHSUJOJqcEWHeY1l/MtgacVFd1tBuOLKsfC2
 J4lXTkXvLcvpBZMUV6EavsjGbpfI/H8r7/zKMuPvGRhy0o6AAtTJH2QFdW9DmnQQAzG2lcGmK
 ODNC2niXlS7VdjnkY0PXRZxyjlErooFhr/qPcEYDC6Ir4gODlvRCdx9DUVAmbksHQv4XhuWvk
 lcuibqpQlm3AYnHtyoLf2gcLE/+pg5sQF9tQxVpCfiQMJst3FluhVI/H/VTsV2Mu/2JAjmTZC
 ZN7KiMXAFtoZNoNQzSlm/Bl84QcXVscg+yJ9i4oeGpQ/5PoWYeEoaZWksE6dxaQbGPrdJjHRd
 3h3vZBA59EfRu1BOk2hFM4M3u/iYsJzUMl48AxFSNfW/8L1DRgG2n8Gir4NVFTNBlSG49ORpt
 whxPHIXlyIf4cCI+a1T+JT8Z2u0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691868553; x=1692473353; i=dalang@gmx.at;
 bh=lCuBq1WzzdSACTzwrsa0a/VI5Bjn5FJWjh7AfxvOI6g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=a3vzad1zBIypM2hL1+uIgJwQ4KexeRkdgi655cZadB1wnneBmrCSR4Rr6MNP1MX3zi8l6//
 zoCdwxW+8OCgtIUz16OHoWto+KHvKkCCj+0QYP16YIhfenZoASPJiyDSHR346zSBruACHeG2K
 c8xUf5ARrsbnJQlERts62pCjF0VWQUyjuZysnjv/3JFkp8u7zQgHLiOt24DLlCulhDzWIR2s4
 ssPnG9vgiFv0e2OLyuMcEFiOOxGU04s7/hWjcYL1VJHr27qzMg7k9lYtx4ZaW3IwXWhVWK4DJ
 cpH7/RiUYtcDOLtEv1iNQAJ2g/R5Z/xoaSgJdSjG2rMvMq6OKZ7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=a3vzad1z
Subject: [Buildroot] [PATCH v3 3/8] support/scripts/pkg-stats: check all
 files for warnings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of only checking .mk and Config.in{,.host}, check
all files in a package directory.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v2 -> v3:
- new patch
---
 support/scripts/pkg-stats | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1ac538f5f9..c124b8a9cf 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -272,8 +272,7 @@ class Package:
         self.status['pkg-check'] = ("error", "Missing")
         for root, dirs, files in os.walk(pkgdir):
             for f in files:
-                if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
-                    cmd.append(os.path.join(root, f))
+                cmd.append(os.path.join(root, f))
         o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
         lines = o.splitlines()
         for line in lines:
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
