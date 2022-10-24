Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D21AECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 17:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0F04037A;
	Mon, 24 Oct 2022 17:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0F04037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwIT56q72ils; Mon, 24 Oct 2022 17:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 902004035D;
	Mon, 24 Oct 2022 17:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 902004035D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D44BA1BF391
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 17:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD35B4035B
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 17:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD35B4035B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcNR_04QoQHY for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 17:49:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE0954035D
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE0954035D
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 17:49:29 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OH9vms008728;
 Mon, 24 Oct 2022 10:49:29 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kcfs79tmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 10:49:28 -0700
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B10AFC00F4;
 Mon, 24 Oct 2022 17:49:26 +0000 (UTC)
Received: from de02arcdev2.internal.synopsys.com
 (de02arcdev2.internal.synopsys.com [10.225.41.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 19D09A005D;
 Mon, 24 Oct 2022 17:49:24 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 19:49:11 +0200
Message-Id: <20221024174911.75444-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-Proofpoint-GUID: BaOkTX_PlUqN4U9rhV-6flouuBPkRuic
X-Proofpoint-ORIG-GUID: BaOkTX_PlUqN4U9rhV-6flouuBPkRuic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_05,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=579 spamscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210240108
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id; s=pfptdkimsnps;
 bh=4JYGw+sWCImrE461LfPgU5Ii7xCjecKccrUcJfrO6Ac=;
 b=V0A4bFkG5IsBysUWlJXs4FYiRC9HYSA9gwCMed1ZPobzBN6kKQVi0iiuo8fnPZsWHwQB
 yegoeN0OO2P1Wrcg44B2eP98W0AwbYQdSGGvC0PW9zP26oNVLphBP5aY0musLuarPQhL
 LaRFbLvnlJ3d1gpLmbFuwmRqZkNZtKHa+AQhMpf365KbGoQK5KoeqDiAs8OZxAnGqcmX
 2dEVv8cVcG3bbb/FVjZuP9TpSvf9f5bxZ9RxEvqI2pgL2IIeXLAqSUDVNyouFTN0TP/P
 DWCpG7FKVVNMIWB/v/eZVyRVPgz5ZnvUW5gAJ/vhrTaG8e3cnwxVE9+cZwtSl2Vitqyd 8g== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1666633768; bh=8kIOV2KewVB1mtino14rX6gs9EUs5Nk9JotZnxprck4=;
 h=From:To:Cc:Subject:Date:From;
 b=jYeZX0BMsDNo/7w3lInWPbqBMat9/3iLmhwoFotED9xsdZoYj66eQmweL5/LXduE5
 fZUPnImwAbPBcKXEI+c2BpgGaMwpdne2j2YiIs0sv5YdCiGdgwUQ50WMYme3Lk/SQu
 ranMGlseAVctD5O3N2MLY5OzVnyGEL7n/sIM4j5qvjB/kkMCfq/3fiIRMsEG1ebFef
 GenzmL1dcuTMNhSvIHCh5I9hPU0clPZU4ntInRczLMJSp96+hs7DhtvsN/r1wsMLus
 5oUAK9j5BeArDtaI7jOISnC5n3P8FYPeDu6tS6cXyRto3kk8zPSMW9DCqtQAyIcuFw
 vV2JvIUbKtofQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=V0A4bFkG; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=jYeZX0BM
Subject: [Buildroot] [PATCH] package/numactl: point to target libs via
 LDFLAGS
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the commit a699a667bd64 ("package/numactl: add -latomic to numa.pc")
we opted-out from unconditional linking with "-latomic" and made it
a conditional based on real availability of __atomic_fetch_and_1()
in the toolchain. I.e. for many targets "-latomic" was not used
any longer.

And in those supposedly rare cases when libatomic was required it was
all OK until there's a LD_LIBRARY_PATH set with something where yet
another libatomic.so instance exists, especially if that's the one from
host (in my case I used a separately built host toolchain). Then we see:
---------------------->8-----------------------
/bin/sh ./libtool  --tag=CC   --mode=link .../buildroot/output/host/bin/arc32-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -Wl,-z,max-page-size=4096 -fPIC -std=gnu99    -o numastat numastat-numastat.o  -latomic

libtool: link: .../buildroot/output/host/bin/arc32-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wl,-z -Wl,max-page-size=4096 -fPIC -std=gnu99 -o numastat numastat-numastat.o  .../gcc-5.2.0/lib/../lib64/libatomic.so -pthread -Wl,-rpath -Wl,.../gcc-5.2.0/lib/../lib64 -Wl,-rpath -Wl,.../gcc-5.2.0/lib/../lib64
.../buildroot/output/host/lib/gcc/arc32-buildroot-linux-uclibc/12.2.1/../../../../arc32-buildroot-linux-uclibc/bin/ld: .../gcc-5.2.0/lib/../lib64/libatomic.so: error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
---------------------->8-----------------------

That happens because libtool of numactl adds contents of the aforementioned
LD_LIBRARY_PATH to its "$searchdirs" and then the first libatomic.so it
finds becomes the one used for linking. What's more our precios cross-built
libatomic.so never even gets considered because that first found libatomic.so
is used with full path, not as "-latomic" as otherwise it would have been used
without helpful libtool.

But with paths pointing to the staging location, these paths get added to
"$searchdirs" and so the right libatomic.so gets found, which solves our problem.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/numactl/numactl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index cf9c759693..58b304d6e1 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -10,6 +10,7 @@ NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README.md
 NUMACTL_INSTALL_STAGING = YES
 NUMACTL_AUTORECONF = YES
-NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
+NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		   LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib"
 
 $(eval $(autotools-package))
-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
