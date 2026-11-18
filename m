Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B6606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DkKBj2s9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7728940A3F;
	Wed, 18 Nov 2026 15:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8AO5xugitTB; Wed, 18 Nov 2026 15:46:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7A3540A26
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795016775;
	b=sl1olNw3ppkbGfeSmxegN1xkst8sMcWAXrK31wk29x2BJJgJ54+DIOiNt5U5ZlbO0ZNY
	 38BClTWq+w1gbmo69rTuMma8VBuRp8xy5Q+SX/UA3ElOZuUT2qADZ+E3YkUWTx25Mesyq
	 D9X5YpzuunRkcbIhVpsP+Nwo3wcSBBBF/MRzJ3NekegdGms9kQTqMb8MqpIUn2AMknj2t
	 KDvTcgHI36e3Kr4yR5aYVqZU+XNNzYhHkFdGO3m3JwuIihCXM9eZjA50kXrR19EvRQBLb
	 Eah+JG9anFVV8Ymv5/quVcLPRQwDjvBTH52i+ZUy+zgYFWtrxhJQgM/vm9HKKw2frZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795016775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SXjipZI7mW2BruWuoEXvdJCwRUmgcuzh7L4LviTEmkk=;
	b=b1jOyRH69A+riGF0ia7L8cjWzrzv6kQSK/w1gw1a7tB3EHMcWDNFqP0lQFwkyh1td1cx
	 sRDSJzbR42iaZzPPdBDDVv6yJHW2lzuYZU9HJsn/8iOxClCf3pFo/XnmjPd73prwfJRme
	 0RAikphb782ID4scBFxFzhnt2TljIKUHdQV4vDUAed5i+WZ9YhwDnVH3ZylQpyZgLqilt
	 dPqKUy5uPSr5PJwjOsnR3MnoxcTbJlEbR2tnx7uDogjlCrQHbhNPZJUU4ChQUB0dBFKG5
	 cQc+6Frtgd8NTUqxpcskebzV+EYDINGZba0VyNOMgyQ47HPJ4ZHClkLtixxS1wU3qlg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795016775;
	bh=SXjipZI7mW2BruWuoEXvdJCwRUmgcuzh7L4LviTEmkk=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DkKBj2s9EIphWR6Noj8LqGvVcNt1aNsKW43WPK1o7bRfUinNBStGhjPbdd0wdCfeO
	 2LnIbxxNHdIPX40xa6rVm+Wx2av+V1SyVjrVo56DMIj+QQnFyixFmDTT0UG8ZYbqXo
	 zuZ4jxGX9xnO+GsqviBWKU9iH5bR5qyJR2k3Acr11bxRIuJ71nWkDlc81im1otW74/
	 8MoaebQZMPUavoe3DWaQ3uVTazWlGzfJ/1AUEKT28eqOsBxsAu2WwHjfvYsII+CZwv
	 O7gKA2ax91D6UyqqKrAHQ20YPNil7GV447KHpvalkEs4QmVYumBVwipj2XUcUJMAzI
	 DkDd+yFb9fBiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A3540A26;
	Wed, 18 Nov 2026 15:46:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2CE9977
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 15:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4CB38122B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 15:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIMwwEA14p7c for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 15:46:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4FD5B810A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FD5B810A1
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 15:46:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 27AAFC79A9F
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 15:46:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 47BFF5FE9B;
 Wed, 18 Nov 2026 15:46:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A40D811BC25BF; Wed, 18 Nov 2026 16:45:58 +0100 (CET)
Date: Wed, 18 Nov 2026 16:45:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-ubitests-v1-1-7f5c93a6259f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0ML3dKkzJLU4pJi3RTTFPPkVEPjZAtTAyWg8oKi1LTMCrBR0bG1tQA
 AsRqTWgAAAA==
X-Change-ID: 20261118-ubitests-d5d7ce13c850
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Brandon Maier <brandon.maier@collins.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/mtd: add ubitests installation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtd-utils provides a runubitests.sh that allows running an extensive
set of tests on UBI devices. This script isn't installed.

Add a new menuconfig entry to enable the script installation, along
with the test applications the script uses. Install them in the same
location as they would be when running a full 'make install'.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 package/mtd/Config.in |  2 ++
 package/mtd/mtd.mk    | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 1054106f81..3de34ed8e3 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -220,6 +220,8 @@ config BR2_PACKAGE_MTD_NANDPAGETEST
 config BR2_PACKAGE_MTD_NANDSUBPAGETEST
 	bool "nandsubpagetest"
 
+config BR2_PACKAGE_MTD_UBITESTS
+	bool "ubitests"
 endif
 
 comment "MTD test tools need a toolchain w/ threads"
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 2a625fccce..f26b20f146 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -159,6 +159,18 @@ define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
 		$(INSTALL) -D -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(notdir $(f))
 	)
+	$(if $(BR2_PACKAGE_MTD_UBITESTS), \
+		$(INSTALL) -D -m 0755 $(@D)/tests/ubi-tests/runubitests.sh $(TARGET_DIR)/usr/libexec/mtd-utils/runubitests.sh
+		$(INSTALL) -D -m 0755 $(@D)/mkvol_basic $(TARGET_DIR)/usr/libexec/mtd-utils/mkvol_basic
+		$(INSTALL) -D -m 0755 $(@D)/mkvol_bad $(TARGET_DIR)/usr/libexec/mtd-utils/mkvol_bad
+		$(INSTALL) -D -m 0755 $(@D)/mkvol_paral $(TARGET_DIR)/usr/libexec/mtd-utils/mkvol_paral
+		$(INSTALL) -D -m 0755 $(@D)/rsvol $(TARGET_DIR)/usr/libexec/mtd-utils/rsvol
+		$(INSTALL) -D -m 0755 $(@D)/io_basic $(TARGET_DIR)/usr/libexec/mtd-utils/io_basic
+		$(INSTALL) -D -m 0755 $(@D)/io_read $(TARGET_DIR)/usr/libexec/mtd-utils/io_read
+		$(INSTALL) -D -m 0755 $(@D)/io_update $(TARGET_DIR)/usr/libexec/mtd-utils/io_update
+		$(INSTALL) -D -m 0755 $(@D)/io_paral $(TARGET_DIR)/usr/libexec/mtd-utils/io_paral
+		$(INSTALL) -D -m 0755 $(@D)/volrefcnt $(TARGET_DIR)/usr/libexec/mtd-utils/volrefcnt
+	)
 endef
 
 # Those libraries are not installed by "make install", but are needed

---
base-commit: 1ae4f84ae1803a6b5043833f0137f961b2db516f
change-id: 20261118-ubitests-d5d7ce13c850

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
