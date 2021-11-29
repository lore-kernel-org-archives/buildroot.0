Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA194C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A1E81064;
	Mon, 29 Nov 2021 22:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0dzSjHEuZAr; Mon, 29 Nov 2021 22:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1CA80E29;
	Mon, 29 Nov 2021 22:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33AC61BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2375380E29
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQVePRF32Z5z for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E75180E25
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:12:36 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a9so39971955wrr.8
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BP8Fked90GDh3Rvjl60tC3uC5exD6jDvvlU7k1QcCIw=;
 b=Uqm9DQV723XXyoQeFtmC2xxvVydNAlY0zvJ+Kj4qVs11lGMDOd9+2SfmPpGtIKJhq9
 8astLgNAKO1Ej0J0G+rKLO9DpG2ZMdsy8BmYgVUXEopIuVQRKhpzenv2iEczGDqg/gEb
 2i44oJlu+0rPrShJqwTCt4HVjFo+pd3dCbrtFGDEMbrHIE63NtGAk9RBW1xrGWg/EAyk
 i1C+Q8ATERyFmzFOYOFUDu7rx5Yb1hnWDgdvxGw+UdD8afLV8QXH/ygER7qjEe2KpSCJ
 rpBYg3TN+O0T8XdrPCkMqkeJUVVMfNsfA0jDUxwDLpASzI6sYARilAfGaMvkT/AS5Mcc
 WSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BP8Fked90GDh3Rvjl60tC3uC5exD6jDvvlU7k1QcCIw=;
 b=PL4zWZRkpJxzEbxtoE/AvidnD0fGp1MnXW6fMdM2o2S08E+LWb5KgjjhA88yYVsHOD
 0LWRZXfyuu4ch3v6zexXBHNc5aqHahOabnXACx5nwTfZMOQzWTRuZNb1I14875JULj+R
 XyCnvB6XH9lu8bORXS18Q3L7+qiZk+gEBMN1kkU4O0Jdp0o5pGcc2aEYVegdgpROtNDC
 z7Gck8d3TAzz2KrFSL90zzme30fji/lnVaE+wW6yHMXxYgD+6yfEhLetbA3PGD/iwPJs
 UbM94U/m35Yd7txieJzmEd1756g5UC0+Nc+J0+6xF8GHu/gdKFXqa3e8gyap4AFrRQb7
 MIqg==
X-Gm-Message-State: AOAM530aTd8GCa6eHK9dCezPtmELMoVbVva20F5td7glrivITJOHV/h6
 BokbmVfxgFCTSj2iOwb9Y0cyFSe6S1w=
X-Google-Smtp-Source: ABdhPJzXyl4KLvE+fjnJP9Uw54iKJtZlBtUUX0UZrs+fEgQuwFamSqMHmi1ECKboQ8zq656zEcwMLA==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr37662748wrt.126.1638223954376; 
 Mon, 29 Nov 2021 14:12:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id r17sm581746wmq.11.2021.11.29.14.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:12:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:10:00 +0100
Message-Id: <20211129221000.2183298-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/datatables-fixedcolumns: drop
 spurious space
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
c0a0e9b710aff7d1fce1b277fd9c614a9892d9e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/datatables-fixedcolumns/datatables-fixedcolumns.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
index 3c744990ca..33174e106f 100644
--- a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
+++ b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
@@ -6,7 +6,7 @@
 
 DATATABLES_FIXEDCOLUMNS_VERSION = 3.3.0
 DATATABLES_FIXEDCOLUMNS_SITE = https://datatables.net/releases
-DATATABLES_FIXEDCOLUMNS_SOURCE =  FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION).zip
+DATATABLES_FIXEDCOLUMNS_SOURCE = FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION).zip
 DATATABLES_FIXEDCOLUMNS_LICENSE = MIT
 DATATABLES_FIXEDCOLUMNS_LICENSE_FILES = License.txt
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
