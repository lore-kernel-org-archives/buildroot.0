Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAF1C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F187681225;
	Mon, 24 Jun 2024 06:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ia2YNODzRc_m; Mon, 24 Jun 2024 06:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009A38177A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009A38177A;
	Mon, 24 Jun 2024 06:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC2901BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4AF28177A
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENcLGknRBhkH for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 857D681225
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 857D681225
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 857D681225
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:53:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5eR-1s4vVB2eRh-00Z2Xm
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 08:53:08 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:53:08 +0200
Message-ID: <20240624065308.12957-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:dfuj7AlT0gf/z2pg638gykTHRotwzVdxBH2A0qXPjmRS4Q60StD
 PMpfB4Kj9lF/F00G9ew2AIhpRtUC02Cw1X+jcN50o6vmrKY3ZakGTanz9GKYSwVGs3rXwlf
 Db6ZyqhLxXAoidW13v5HtUyi3y+Ds/POy3dUFzUjnti6XUSU5bDSF2O4DmLj8iDos4C2M/k
 eJ1cEoiqlzBLCtSXjGkSw==
UI-OutboundReport: notjunk:1;M01:P0:algjVLX8o4I=;RcHd2EDMnUl3r07nnwEx5LG2COA
 OYe2AjF7BcDZYpBtiZ1zdTOTtqB6asMC7UuuCH00yip26WC4dZOjziCLmnTJAyuATR/uBVKBz
 +k4OnbrW4OOOEMrY27mlX711GJ/lCAfl2FN3JKAEaU85WDit5D9y00MshlhlsMVRqJVLgxhSq
 wtyDG/fmOZCicyKlZnCwT/fffJXIOQ6hd66MRu1oxsA+obvUNwBSQXyq5d/Lp+KUtGA0gcWyV
 EwhKLjPGyqPGq0ZT2HGzXFcdkfT3GXN/PS+T30bwBtxmnmUwax+dHvfYXPZs4vs8aaL7JFgor
 IrVbEd1jBcV65TU9bmx5jwwwkf/aXjNA9O6LZrZgFH7tZijyVrmhv70s/DLxLc1VJyiJtevrU
 oGClFv4SGWJLu1HdEyWG9pdudi7n6mqZ3ocmriJw0Ggx5lDBqW7rOAJHyoJiQuRlkghjbi3rc
 R/AHIKqkZghR+Oyt1R9ajY/6OMNx4sjCxYLDM2z1t2RSNIHGfDt2sAvRSfhP45UmSPMfE7oPa
 8XJuV9K0B5dYogEj+Y9wDAk1z+aU+itcIZt77bE4nYI2zgWdNMuZHHiTeRuozH9NpPFMtSsc1
 f2Yq8406+66mt/ku0CASuWwRBjr2NZp7Q/pSH8DuQHrVWbBvvnyiB9PxHydapTU5CMVIXeHN+
 e5JwZLkTh9uwfy5Gu+O1MsWR+Qas3+Py3qjG7f+tUjSo3hY+fYdSecEMlXDn8tVEHeEM5o0NQ
 F1RkRVNmRUbiw51kqjsMbD0CD73tFKlgIJ2OS78zJ2gzrnZTY82/vmLg35B28L7mn2YuS3UZW
 mSO7Fo/X+kDur9UyNdERQ5/rTwXNF7WD0rEmupGfofmxo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719211988; x=1719816788; i=ps.report@gmx.net;
 bh=gfO460sz5OUVaEbN/9SDLhDg1++eYCvH0N6GWgH7Ocw=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nrHCWlg152AfMejIoyc/bU1MhdVzcAfLGS3FQydOtA5AhofWUSQJZxuOiNOe2br2
 3ZGqj+aSn4+6FEa/C1ENzrp0s4CbKBdg/zVWqFKM/gKQxZ3WOAhzQ16Hlj+iX3bTK
 q2VxDKviEPEottSB8mmALjsbV98OXyqkkDF3BscO75J+jzdayJjZMPyVBgD9lO09+
 hpcekaj8QChHpEbgQEFIrzbGkaBAyOIMAWvr+CejP0TnUA7+40cm0NJq1T6qPQArw
 W6sAMcY4JltEd+tGeGfYtsvvD6rwPqpaUE8LTLndh0kFPi6F0c/Np4hnkQUrL+Ny1
 6/03+/eSyr350Z8jrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=nrHCWlg1
Subject: [Buildroot] [PATCH v1] package/elfutils: bump version to 0.191
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1]

[1] https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/elfutils/elfutils.hash | 4 ++--
 package/elfutils/elfutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index e3cc67dc0e..94906427cf 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.189/sha512.sum
-sha512  93a877e34db93e5498581d0ab2d702b08c0d87e4cafd9cec9d6636dfa85a168095c305c11583a5b0fb79374dd93bc8d0e9ce6016e6c172764bcea12861605b71  elfutils-0.189.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.191/sha512.sum
+sha512  e22d85f25317a79b36d370347e50284c9120c86f9830f08791b7b6a7b4ad89b9bf4c7c71129133b8d193a0edffb2a2c17987b7e48428b9670aff5ce918777e04  elfutils-0.191.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 4d8cc43342..ed5c459e46 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.189
+ELFUTILS_VERSION = 0.191
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
