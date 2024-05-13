Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B65C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 09:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8A28328E;
	Mon, 13 May 2024 09:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO7H5DCpSZXU; Mon, 13 May 2024 09:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409B381E96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409B381E96;
	Mon, 13 May 2024 09:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F196B1BF239
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 09:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB249831F5
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 09:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjZNfSEjlJKm for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 09:19:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBEAF818D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBEAF818D7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBEAF818D7
 for <buildroot@busybox.net>; Mon, 13 May 2024 09:19:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1sL2Ya27LL-00Fxsy
 for <buildroot@busybox.net>; Mon, 13 May 2024 11:19:51 +0200
To: buildroot@busybox.net
Date: Mon, 13 May 2024 11:19:45 +0200
Message-ID: <20240513091950.30116-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:BVCoqkIEPgHlDQZBhrRVYuDNxbz2tv3iCYPzcFlBh3Aos5Bhlam
 RfvMUJ7GCHI3J+y4O3w2vPlGUJK5wpjZNVhAnb1n+m4UD3/GzaZuGsJYyOmWJ8nIrMkwkdt
 rBMvFHQdfArFoJVZib3R47mOvPfdkApY3eUxS9FeEyUecWYDayhWAG2MtOlD1aUmqpjumKm
 9hkNOOJfal+KS99gQAeaA==
UI-OutboundReport: notjunk:1;M01:P0:WwqaRxoSUIQ=;paLiA/M//We6+StC0n4IFBKWHdm
 rp3GrPXuE9KVlcC5NpNVaiALnPirJKcDm1/9JCz6+ICcAfIVfsz37xLy3sj6/AZZRVjN/ahKN
 5xkCZqkHhn15X6GUbnOKolFbrbmzZ18iC2gOaPIiiDdm761pCinJ3+/vSinZHJQpj8Vz8sZ1r
 GCCGt0gaY15k8Q737c0Ee2eVMlS2JTcA0p/CWJQ0txoZP95PxMHvx2KXkgB+vaIkZK/ZPpSXy
 nnpyBtuLyzl6nKi2WXxI4kNXvdpEqcI8EpIZw1MK/MKKbvTPrfqy/HQwf0MNUkvn9ooZkRWjc
 Cwjr9lzKuNwRK8IrNpXEJC4wvksPWNP2glkLgYcAcHv/8FxtscW2FjGe7s/DiXN/xfRDtr90L
 vqwQ9ybhtgFXDElPWllt1iSAc2n1gSVvR4UwoT/301GtXDduQIAAdyNo590Jg9bCXUg+Wk38X
 WBlvrxQqaz7EYGq0Ka/DzSLM+Gl3FwBUToinH8jCvKZBVgvq0ETetg/ZjIVafVp7Uo2SnyZ9P
 u4FnHiE/Cc3545ofTao3bhpzcfZv9/EBG+jec9Xr0GeZgIn4FUlZvvjfl9UobxuGrWiaB63TA
 vaAcz7JEQ1cvp4hkOmqSSf+jxWHfneGoeL/k0lPNEBurVTBCID9eNC2NhN5oZuY1lyTl124Ai
 gwdcP1pwZK5b0EDR7VCRAwjHrg8JD546s2WaDSrkmoTw7Pk1+tP8wQKqvuI6CI96niw1TDxv/
 D+O7wFJdg1QWa2Spu/vIWGUIUp8VGUhNTxmjdwi5bLlMsPSajYqX6baflymwDPxPEGyU0vncd
 qcnfUPGJcHRoEWHYbVWAR8FOm22JSlh/gaQWm4ETj8Ljw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715591991; x=1716196791; i=ps.report@gmx.net;
 bh=LWXJQpvJfdJZMcdB8POuGiZTnV+BuMjEzjsSR6fBanI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=biIv0KfXX/qKxp3fnLhQRiW00ThT5dyyAMZvt/ppWZ7bW7M/3LopM9OU11iB9bdi
 miA05miXVnTrGdByGlL/p1KYf2OvhV1YFX2Nr06ZIZPyAcQyTpbTUDx5PANbtiJ9Z
 hbWnnaIRUiEzDb0X9CaaWUcF0VR8ggBgwRO+rec5OwbdDG4Uumfa4oqhrncrzh8fB
 BuwK7jy+11HXDlPnSom6ciCY48FqKISWLk5ij3/Y27V/OjUpnp3bmF4vxi23o/Dri
 L6+HMQa5q9DSXX8jJUdGnqsYPd5bIhvK5IyZZQf4vDuAIruQgXdrxVq5Rf6Gd18Q+
 cT8ZfrmtZiKeKXJHeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=biIv0KfX
Subject: [Buildroot] [PATCH v2 1/4] Config.in: do not expand TOPDIR,
 BASE_DIR and CONFIG_DIR
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

- escape TOPDIR, BASE_DIR and CONFIG_DIR usage to force to not exapnd at
  configure time (but at make time), needed for upcoming kconfig update
  (see upstream commit [1])

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch (moved escape fixes from 'support/kconfig: reference environment
    variables directly (remove 'option env=')' to this extra/preliminary patch)
---
 Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index b5a94325c4..035900c971 100644
--- a/Config.in
+++ b/Config.in
@@ -197,7 +197,7 @@ config BR2_DEFCONFIG
 
 config BR2_DL_DIR
 	string "Download dir"
-	default "$(TOPDIR)/dl"
+	default "\$(TOPDIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
 	  If the Linux shell environment has defined the BR2_DL_DIR
@@ -211,7 +211,7 @@ config BR2_DL_DIR
 
 config BR2_HOST_DIR
 	string "Host dir"
-	default "$(BASE_DIR)/host"
+	default "\$(BASE_DIR)/host"
 	help
 	  Directory to store all the binary files that are built for the
 	  host. This includes the cross compilation toolchain when
@@ -669,7 +669,7 @@ endchoice
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
-	default "$(CONFIG_DIR)/local.mk"
+	default "\$(CONFIG_DIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains
 	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR, which
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
