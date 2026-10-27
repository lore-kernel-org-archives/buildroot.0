Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2C606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bBcobKS1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=KNwx1lPv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE1D60613;
	Tue, 27 Oct 2026 14:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8SH_avegGna; Tue, 27 Oct 2026 14:31:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 85A4A60768
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793111500;
	b=pmHjxdHfDQ87CokNXIRGEd3zMzPqKtu9sgELhbaJZ6pchS8+DyLpv8HoIE0WQ46GloQh
	 U8HdY/JLpoXwOQBKkKuQk69a2CyJSt0KnJjLn/Hc+oHokrCnLu5UYIPupbgWrtuaOeTif
	 Jhd7bJjpbVP2kRHF2gucHeXDCRXPK0rfK6Ew4OhF1CpZtAbSlnRmjZLPYNT2iQXQVlWZM
	 vjLIFjZla3Eiw/4h7fclLspD5krAk4jjU96awwSz+AgwBLsxlyaMnVC/PbNUfHcHVka5p
	 W7fyp/UL8T/hndidV74FSYlG3EuRqOAXKdc4vo7lFcvKVaMEgTaNZyRVrxDpQZLKz1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793111500;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=rO8k4KK7aVpegeFTkEYQLjaa0K5z0YBvtdb5kaQ1TU8=;
	b=LZLgiXpiJHErwk98no/2hMhcOeqR/+fpqDIztmGTFMe1IcvTOK6w2BgQ62fn+Zps2X44
	 riSHWs6Ab6Oah/ujQKRFgmBEOstoJbAevwVMDL7wbWM9aqvwCLRrX6C1u0vm7r61B4pol
	 rZHTJeVTRrZLXI0ZrU/FiylHGKOI2zWwF7TzDmJ4H5C1Bq/xLS0rmKQVnFUw9mEx9QTB5
	 x+VxRLsfjLGJKUanszxwPbsqEod2e1ExtXCECKrde5+Bo4+YwGFffCDXzV+ubKsnWc8/e
	 EtsaSsulB3RSmRtMJQhUy0HfaYFNjTo+z36IVDyAXsmb/83IjdvKy+hy72IUTZQl5dg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=KNwx1lPv;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793111500;
	bh=rO8k4KK7aVpegeFTkEYQLjaa0K5z0YBvtdb5kaQ1TU8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bBcobKS19nZKcBGuJH0RFxbasYoR3d5dDmnaKFhx8LV0ViJ0LWszPHTZ4DvVKT6hb
	 GyafN5akhvjvW4t0BQrsDCJ+H80PDD9PZmBBXNdX4AtE6McjKArxFgZtirX0gBPNV2
	 9QZb6B/DGDZJHeT8fskEdQwK0aMappm3BOt6SEhay2PbfZ4w6T5p3LH/RrVsZHEagP
	 lzdnP5/HEnd2xK8EaOkBpiUnQLb8+7AK6xiO6JrAG6zq/ao6vOwtT7S+CblhZqwws4
	 EuDJHHNcZHj4ee8q7nKRdmLSEt6PRWNbUzC85EDh80hU0JKDKSG2yGDqhY9vrGkYmP
	 Pgf5DqeGWfdFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85A4A60768;
	Tue, 27 Oct 2026 14:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D8D93D9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F56260768
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8wOwazRktvk for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:31:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A1CB60613
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.155.132
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793111497;
 b=CNg4L6FIDWIBbRfzU4dk11SDrgHza3Jhvb5I5pkwEtQE1E8t7ZqRKmPB1Dlk1n3w6g1M
 ehJyAxAn8J/ByGsXvUDSYk7vxpsUIQ0eP9+MOAuSHG9fNhGQLfeN039jDOa24RcUldmxm
 ikdoJ3JDn6L7FM/Ba3tat09FSmHGzFDr+AoVAjLVw13sO7du+Pq+lV79g2roTwyJSnN2N
 WTPv3O1yGrrO0yFDHFy1xAru7R0g2egKKcBvzY2q8UsaxK+lPG8ZxZPOKjWEm6c9ThUkb
 OQ8M/D2ag0QtmZDkvHYd8DZICSGKADAsShVfgQMPdlK560uwuBOf1tF6AtWq78DC+LQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793111497;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=aRYfDtCJBELj8MBXOqMtHSSqBTiVqmiypae1chnchdE=;
 b=WJSqudpmoWNOdF9SrEC8OqlsZaYpJOxUlxBqoJsuzvMFqh5fT86UZuPv/RiZnedkRjw5
 JnzTr2+IMkM+GEoEPabqVrtsuIca0Ez27igOkeMZKqHTLWioMMiDVwUbHuiEPUhQmYyEh
 9MOz+VyIPglbFbXokM3BX3HfCS4LY2qB3KbXAxfRyOTRKgBbsEnfwhrcg4aXdrYkEaAul
 nZimDYr9nRJYjPRAMAWH6KBFuLYEasOMQ+1giUG4xR1Olr1jZLGLGugE7DFCLOPwKbQvW
 bO/oI7yN00Ryh4LwOz9r9BFKwBU5Lct3Fo79Xy/qWoOoWb6U7za6GTuRNuRBAQTgtQQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=KNwx1lPv; 
 arc=none smtp.remote-ip=62.149.155.132
X-Greylist: delayed 64 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 27 Oct 2026 14:31:36 UTC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KNwx1lPv
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A1CB60613
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:31:35 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LiC4xApDTgnmRLiC5xplR4; Tue, 27 Oct 2026 15:30:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793111429; bh=WZQm6ftdQPGN75jMXQ4DK/lwbhqx6ifJdzWH4adIz78=;
 h=From:To:Subject:Date:MIME-Version;
 b=KNwx1lPvj2bkF3zhEY4eCGNWCYa8cNp9RdJK/P/8koK0YwX2kmpu90IJNUeQOVqDe
 roabxghvUWbI/0v9kGDfTbaRJHXS7NLRFWCN0y8tI+dxDmJ6B59BDvLnpYoKXFiwC2
 7ANYFGwL4dFJxZ0Udn51T6MRFPNk3t38mw9u98NeMjUQGwBrqfjsm5WckTt8y6oP7/
 Fu4tX5BiTa6KyeF9KRnhyzKPt9e2r+WQLfiZrGahp2tPiOn/oNAVyrwJz1xndBQNmF
 RRy6VdSLOrsieQnDH0bayc/PWNiTPk3dq6uAPBU/H9WplQ9qPVDbdUojkuzWg56Jpr
 /7H1fy1VPttmg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 27 Oct 2026 15:30:28 +0100
Message-ID: <20261027143028.1515138-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEdDHnZtHeEoLYJZTCWW1Lfuh1CoVLl9iNwSxQYedhaxA9hjR3fS8IIDvuNVwVUdl2HCM+/xUCo6yFkrRoW79IgfvqVRxZdzQUP3gzQEUbWrf240FfCK
 WudNPfp2fCGmxu8BkMGuqK2GHszeEOB56Qdyo+RA/LZo0oYSPeWn8zhW0OIV3y0E102xK71TKqpszpRxW+AoRH7V/RIlg2XZIy0aE+/b4I1ehE1tMXBV0qdm
 fP6wuUTk0u6kSmyBz+o2GLCt0UoUaXF3eBG1xSYdG9s=
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2026-10-27 version
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

This version allows to build up to Linux version 7.2.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
